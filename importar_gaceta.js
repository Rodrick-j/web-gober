/**
 * importar_gaceta.js
 * 
 * Importa masivamente los PDFs de C:\gaceta\GACETA a Supabase Storage
 * y registra cada documento en la tabla `documentos`.
 * 
 * Uso: node importar_gaceta.js
 * 
 * Requisitos: npm install @supabase/supabase-js dotenv
 */

require('dotenv').config({ path: './admin-panel/.env.local' });
const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

// ── CONFIGURACIÓN ──────────────────────────────────────────────────
const SUPABASE_URL  = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SERVICE_KEY   = process.env.SUPABASE_SERVICE_ROLE_KEY;
const BUCKET        = 'documentos-pdf';
const BASE_DIR      = 'C:\\gaceta\\DECRETOS\\DECRETOS DEPARTAMENTALES\\2-Decretos Departamentales';

// Mapa de carpetas → tipo en BD
const CARPETA_TIPO = {
  'LEYES DEPARTAMENTALES':    'ley_departamental',
  'DECRETOS DEPARTAMENTALES': 'decreto_departamental',
  '2-Decretos Departamentales':'decreto_departamental',
  '3-Decretos Ejecutivos Departamentales': 'decreto_ejecutivo',
  'Resolución Admnistrativa 2026': 'resolucion_administrativa',
  'Resoluci_n Admnistrativa 2026': 'resolucion_administrativa',
};

// ── HELPERS ────────────────────────────────────────────────────────

/**
 * Extrae número y año del nombre de archivo.
 * Ejemplos:
 *   "Decreto Departamental N° 1 - 2010.pdf"     → { numero: "1", anio: "2010" }
 *   "LEY DEPARTAMENTAL N°241-24 ..."             → { numero: "241", anio: "2024" }
 *   "LEY N° 36 -PRIORIDAD..."                   → { numero: "36",  anio: null }
 */
function extraerMetadata(filePath) {
  const fileName = path.basename(filePath);
  const sinExt = fileName.replace(/\.pdf$/i, '');
  // Buscar número: "N° 123", "Nro 123", "01" al lado de una palabra
  const matchNum = sinExt.match(/(?:N[°º\s]*\.?\s*|DEPARTAMENTAL\s+|EJECUTIVO\s+|LEY\s+)(\d+)/i);
  const numero = matchNum ? matchNum[1] : 'S/N';
  const matchAnio = sinExt.match(/\b(20[12]\d)\b/);
  // También detectar año de 2 dígitos al final "-24" → 2024
  const matchAnio2 = sinExt.match(/-(\d{2})(?:\s|$|\.)/);
  // Detectar año en la carpeta (ej. "Gestion 2015")
  const matchAnioCarpeta = filePath.match(/gestion\s+(20[12]\d)/i);

  let anio = null;
  if (matchAnioCarpeta) {
    anio = matchAnioCarpeta[1];
  } else if (matchAnio) {
    anio = matchAnio[1];
  } else if (matchAnio2) {
    const yr = parseInt(matchAnio2[1]);
    anio = yr >= 10 ? `20${yr}` : null;
  }

  return { numero, anio };
}

/**
 * Determina el tipo desde la ruta del archivo.
 */
function detectarTipo(filePath) {
  const partes = filePath.split(path.sep);
  for (const parte of partes.reverse()) {
    const tipo = CARPETA_TIPO[parte];
    if (tipo) return tipo;
    // Detección por nombre de carpeta con palabras clave
    const p = parte.toLowerCase();
    if (p.includes('ejecutivo')) return 'decreto_ejecutivo';
    if (p.includes('departamental') && p.includes('decreto')) return 'decreto_departamental';
    if (p.includes('ley')) return 'ley_departamental';
    if (p.includes('resoluc')) return 'resolucion_administrativa';
  }
  return 'otro';
}

/**
 * Lista todos los PDFs recursivamente desde una carpeta.
 */
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

const W3CWebSocket = require('ws');

// ── MAIN ───────────────────────────────────────────────────────────
async function main() {
  if (!SUPABASE_URL || !SERVICE_KEY) {
    console.error('❌ Faltan variables de entorno. Verifica admin-panel/.env.local');
    process.exit(1);
  }

  const supabase = createClient(SUPABASE_URL, SERVICE_KEY, {
    auth: { persistSession: false },
    realtime: { transport: W3CWebSocket }
  });

  // Crear bucket si no existe
  const { error: bucketErr } = await supabase.storage.createBucket(BUCKET, { public: true });
  if (bucketErr && !bucketErr.message.includes('already exists')) {
    console.warn('⚠️  Bucket:', bucketErr.message);
  }

  // Listar todos los PDFs
  const todosLosPDFs = listarPDFs(BASE_DIR);
  console.log(`\n📁 Encontrados: ${todosLosPDFs.length} PDFs en ${BASE_DIR}\n`);

  let ok = 0, errores = 0, omitidos = 0;
  const errLog = [];

  for (let i = 0; i < todosLosPDFs.length; i++) {
    const filePath = todosLosPDFs[i];
    const fileName = path.basename(filePath);
    const { numero, anio } = extraerMetadata(filePath);
    const tipo = detectarTipo(filePath);
    
    const progress = `[${i + 1}/${todosLosPDFs.length}]`;
    
    try {
      // Subir a Supabase Storage
      const fileBuffer = fs.readFileSync(filePath);
      const safeName = sanitizarNombre(fileName);
      const storagePath = `documentos/${tipo}/${safeName}`;
      
      const { error: uploadErr } = await supabase.storage
        .from(BUCKET)
        .upload(storagePath, fileBuffer, {
          contentType: 'application/pdf',
          upsert: true, // sobreescribir si ya existe
        });

      if (uploadErr) throw new Error(`Storage: ${uploadErr.message}`);

      // URL pública
      const publicUrl = `${SUPABASE_URL}/storage/v1/object/public/${BUCKET}/${storagePath}`;

      // Construir fecha de publicación (1 de enero del año detectado, o hoy)
      const fechaPublicacion = anio
        ? `${anio}-01-01`
        : new Date().toISOString().split('T')[0];

      // Insertar en BD (ignorar duplicados por título+tipo)
      const { error: insertErr } = await supabase
        .from('documentos')
        .insert({
          tipo,
          numero: numero,
          titulo: fileName.replace(/\.pdf$/i, '').replace(/(?:N[°º\s]*\.?\s*|DEPARTAMENTAL\s+|EJECUTIVO\s+|LEY\s+)\d+\s*[-–\s]*/i, '').trim(),
          archivo_url: publicUrl,
          es_publico: true,
          es_gaceta_oficial: true,
          fecha_publicacion: fechaPublicacion,
        });

      if (insertErr && !insertErr.message.includes('duplicate')) {
        throw new Error(`BD: ${insertErr.message}`);
      }

      ok++;
      console.log(`✅ ${progress} ${tipo} | N°${numero || '?'} | ${anio || '?'} | ${fileName.substring(0, 50)}...`);
      
    } catch (err) {
      errores++;
      const msg = `❌ ${progress} ${fileName} → ${err.message}`;
      console.error(msg);
      errLog.push({ file: filePath, error: err.message });
    }

    // Pausa pequeña para no saturar la API (50ms entre archivos)
    await new Promise(r => setTimeout(r, 50));
  }

  // ── RESUMEN ──
  console.log('\n' + '═'.repeat(60));
  console.log(`✅ Subidos correctamente: ${ok}`);
  console.log(`❌ Con errores:          ${errores}`);
  console.log(`⏭️  Omitidos:             ${omitidos}`);
  console.log('═'.repeat(60));

  if (errLog.length > 0) {
    fs.writeFileSync('importar_errores.json', JSON.stringify(errLog, null, 2));
    console.log('\n📄 Errores guardados en: importar_errores.json');
  }

  console.log('\n🎉 ¡Importación completada!');
}

main().catch(err => {
  console.error('Error fatal:', err);
  process.exit(1);
});
