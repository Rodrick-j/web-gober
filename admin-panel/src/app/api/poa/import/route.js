import { createClient } from '@/lib/supabase/server';
import { verifyAdminSession } from '@/lib/auth';
import { NextResponse } from 'next/server';
import * as XLSX from 'xlsx';

// ─── helpers ─────────────────────────────────────────────────────────────────
function parseMonto(val) {
  if (val === undefined || val === null || val === '') return 0;
  if (typeof val === 'number') return val;
  if (typeof val === 'string') return Number(val.replace(/,/g, '')) || 0;
  return 0;
}

// ─── POST /api/poa/import ─────────────────────────────────────────────────────
export async function POST(request) {
  try {
    // Auth check — debe ser un administrador activo (no basta con estar logueado)
    const session = await verifyAdminSession();
    if (!session) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }
    const supabase = await createClient();

    // Parse multipart form
    const formData = await request.formData();
    const file = formData.get('file');
    const gestion = parseInt(formData.get('gestion') || '2025', 10);
    const secretariaId = formData.get('secretaria_id') || null;

    if (!file || typeof file === 'string') {
      return NextResponse.json({ error: 'No se recibió archivo' }, { status: 400 });
    }

    // Read Excel buffer
    const arrayBuffer = await file.arrayBuffer();
    const buffer = Buffer.from(arrayBuffer);
    const wb = XLSX.read(buffer, { type: 'buffer' });

    // Try "ORURO" sheet first, otherwise use first sheet
    const sheetName = wb.SheetNames.includes('ORURO') ? 'ORURO' : wb.SheetNames[0];
    const sheet = wb.Sheets[sheetName];
    const data = XLSX.utils.sheet_to_json(sheet, { header: 1 });

    // Skip header row
    const rows = data.slice(1).filter(row => row && row.length > 0);

    const items = [];
    for (const row of rows) {
      const municipio  = row[0];
      const prg        = row[1];
      const proyecto   = row[2];
      const actividad  = row[4];
      const descripcion = String(row[5] || '');
      const monto      = row[15];

      // Skip TOTAL GENERAL rows
      if (descripcion.toUpperCase().includes('TOTAL GENERAL')) continue;

      // Skip rows without prg
      if (prg === undefined || prg === null || prg === '') continue;

      const prgStr  = String(prg).padStart(2, '0');
      let proyClean = String(proyecto || '').replace(/\s/g, '');
      if (proyClean === '0' || proyClean === '000') proyClean = '0000';
      const actStr  = String(actividad !== undefined && actividad !== null ? actividad : 0).padStart(3, '0');
      const tipo    = proyClean !== '0000' ? 'INVERSION' : 'GASTO CORRIENTE';

      items.push({
        municipio:        String(municipio || ''),
        gestion,
        prg:              prgStr,
        proyecto:         proyClean,
        actividad:        actStr,
        tipo,
        descripcion:      descripcion || 'Sin descripción',
        monto_programado: parseMonto(monto),
        monto_ejecutado:  0,
        avance_fisico:    0,
        secretaria_id:    secretariaId || null,
        es_publico:       true,
      });
    }

    if (items.length === 0) {
      return NextResponse.json({ error: 'El archivo no contiene filas válidas' }, { status: 400 });
    }

    // Delete existing items for this gestion + secretaria before re-inserting
    let deleteQ = supabase.from('poa_items').delete().eq('gestion', gestion);
    if (secretariaId) deleteQ = deleteQ.eq('secretaria_id', secretariaId);
    else deleteQ = deleteQ.is('secretaria_id', null);
    await deleteQ;

    // Batch insert in chunks of 500
    const CHUNK = 500;
    let totalInserted = 0;
    for (let i = 0; i < items.length; i += CHUNK) {
      const chunk = items.slice(i, i + CHUNK);
      const { error: insertErr } = await supabase.from('poa_items').insert(chunk);
      if (insertErr) {
        return NextResponse.json({ error: 'Error al insertar: ' + insertErr.message }, { status: 500 });
      }
      totalInserted += chunk.length;
    }

    return NextResponse.json({ imported: totalInserted, gestion, sheet: sheetName });

  } catch (err) {
    console.error('[poa/import]', err);
    return NextResponse.json({ error: err.message || 'Error interno' }, { status: 500 });
  }
}
