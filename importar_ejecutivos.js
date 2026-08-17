require('dotenv').config({ path: './admin-panel/.env.local' });
const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');
const W3CWebSocket = require('ws');

// ── CONFIGURACIÓN ──────────────────────────────────────────────────
const SUPABASE_URL  = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SERVICE_KEY   = process.env.SUPABASE_SERVICE_ROLE_KEY;
const BUCKET        = 'documentos-pdf';
const BASE_DIR      = 'C:\\gaceta\\DECRETOS\\DECRETOS DEPARTAMENTALES\\3-Decretos Ejecutivos Departamentales';

function extraerMetadata(filePath) {
  const fileName = path.basename(filePath);
  const sinExt = fileName.replace(/\.pdf$/i, '');
  
  // Buscar número: "Decreto 80"
  const matchNum = sinExt.match(/(?:N[°º\s]*\.?\s*|DEPARTAMENTAL\s+|EJECUTIVO\s+|LEY\s+|DECRETO\s+)(\d+)/i);
  const numero = matchNum ? matchNum[1] : null;
  
  // Detectar año en la carpeta (ej. "Gestion 2015")
  const matchAnioCarpeta = filePath.match(/gestion\s+(20[12]\d)/i);
  const matchAnio = sinExt.match(/\b(20[12]\d)\b/);

  let anio = null;
  if (matchAnioCarpeta) {
    anio = matchAnioCarpeta[1];
  } else if (matchAnio) {
    anio = matchAnio[1];
  }

  return { numero, anio };
}

function listarPDFs(dir) {
  const archivos = [];
  if (!fs.existsSync(dir)) return archivos;
  
  const items = fs.readdirSync(dir, { withFileTypes: true });
  for (const item of items) {
    const fullPath = path.join(dir, item.name);
    if (item.isDirectory()) {
      archivos.push(...listarPDFs(fullPath));
    } else if (item.name.toLowerCase().endsWith('.pdf')) {
      archivos.push(fullPath);
    }
  }
  return archivos;
}

function sanitizarNombre(fileName) {
  return fileName
    .normalize("NFD").replace(/[\u0300-\u036f]/g, "")
    .replace(/[^a-zA-Z0-9.\-]/g, '_')
    .replace(/_+/g, '_');
}

async function main() {
  if (!SUPABASE_URL || !SERVICE_KEY) {
    console.error('❌ Faltan variables de entorno.');
    process.exit(1);
  }

  const supabase = createClient(SUPABASE_URL, SERVICE_KEY, {
    auth: { persistSession: false },
    realtime: { transport: W3CWebSocket }
  });

  const todosLosPDFs = listarPDFs(BASE_DIR);
  console.log(`\n📁 Encontrados: ${todosLosPDFs.length} PDFs en ${BASE_DIR}\n`);

  let ok = 0, errores = 0;
  const errLog = [];

  for (let i = 0; i < todosLosPDFs.length; i++) {
    const filePath = todosLosPDFs[i];
    const fileName = path.basename(filePath);
    const { numero, anio } = extraerMetadata(filePath);
    const tipo = 'decreto_ejecutivo';
    
    const progress = `[${i + 1}/${todosLosPDFs.length}]`;
    
    try {
      const fileBuffer = fs.readFileSync(filePath);
      const safeName = sanitizarNombre(fileName);
      const storagePath = `documentos/${tipo}/${safeName}`;
      
      const { error: uploadErr } = await supabase.storage
        .from(BUCKET)
        .upload(storagePath, fileBuffer, {
          contentType: 'application/pdf',
          upsert: true,
        });

      if (uploadErr) throw new Error(`Storage: ${uploadErr.message}`);

      const publicUrl = `${SUPABASE_URL}/storage/v1/object/public/${BUCKET}/${storagePath}`;

      // Construir fecha secuencial
      let fechaPublicacion;
      if (anio && numero && !isNaN(parseInt(numero))) {
        const d = new Date(`${anio}-01-01T12:00:00Z`);
        d.setDate(d.getDate() + parseInt(numero) - 1);
        fechaPublicacion = d.toISOString().split('T')[0];
      } else if (anio) {
        fechaPublicacion = `${anio}-01-01`;
      } else {
        fechaPublicacion = new Date().toISOString().split('T')[0];
      }

      const { error: insertErr } = await supabase
        .from('documentos')
        .insert({
          tipo,
          numero: numero || 'S/N',
          titulo: fileName.replace(/\.pdf$/i, '').trim(),
          archivo_url: publicUrl,
          es_publico: true,
          es_gaceta_oficial: true,
          fecha_publicacion: fechaPublicacion,
        });

      if (insertErr && !insertErr.message.includes('duplicate')) {
        throw new Error(`BD: ${insertErr.message}`);
      }

      ok++;
      console.log(`✅ ${progress} N°${numero || '?'} | ${fechaPublicacion} | ${fileName}`);
      
    } catch (err) {
      errores++;
      console.error(`❌ ${progress} ${fileName} → ${err.message}`);
      errLog.push({ file: filePath, error: err.message });
    }

    await new Promise(r => setTimeout(r, 50));
  }

  console.log(`\n✅ Subidos: ${ok} | ❌ Errores: ${errores}`);
}

main();
