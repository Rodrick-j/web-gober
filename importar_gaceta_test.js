/**
 * TEST: importar_gaceta_test.js
 * Prueba con los primeros 3 PDFs de LEYES DEPARTAMENTALES
 * sin insertar en BD — solo verifica que sube a Storage.
 */
require('dotenv').config({ path: './admin-panel/.env.local' });
const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SERVICE_KEY  = process.env.SUPABASE_SERVICE_ROLE_KEY;
const BUCKET       = 'documentos-pdf';
const TEST_DIR     = 'C:\\gaceta\\GACETA\\LEYES DEPARTAMENTALES';

function extraerMetadata(fileName) {
  const sinExt = fileName.replace(/\.pdf$/i, '');
  const matchNum = sinExt.match(/N[°º\s]*\.?\s*(\d+)/i);
  const numero = matchNum ? matchNum[1] : null;
  const matchAnio = sinExt.match(/\b(20[12]\d)\b/);
  const matchAnio2 = sinExt.match(/-(\d{2})(?:\s|$|\.)/);
  let anio = null;
  if (matchAnio) anio = matchAnio[1];
  else if (matchAnio2) { const yr = parseInt(matchAnio2[1]); anio = yr >= 10 ? `20${yr}` : null; }
  const titulo = sinExt.replace(/N[°º]\s*\d+[-–\s]*/i, '').replace(/^\s*[-–]\s*/, '').trim();
  return { numero, anio, titulo };
}

function sanitizarNombre(fileName) {
  return fileName
    .normalize("NFD").replace(/[\u0300-\u036f]/g, "") // Quitar acentos
    .replace(/[^a-zA-Z0-9.\-]/g, '_') // Reemplazar caracteres raros por '_'
    .replace(/_+/g, '_'); // Evitar guiones bajos múltiples
}

const W3CWebSocket = require('ws');

async function test() {
  console.log('SUPABASE_URL:', SUPABASE_URL ? '✅ OK' : '❌ FALTA');
  console.log('SERVICE_KEY:', SERVICE_KEY ? '✅ OK' : '❌ FALTA');

  const supabase = createClient(SUPABASE_URL, SERVICE_KEY, {
    auth: { persistSession: false },
    realtime: { transport: W3CWebSocket }
  });

  // Crear bucket si no existe
  await supabase.storage.createBucket(BUCKET, { public: true });

  // Listar PDFs recursivamente
  function getPDFs(dir) {
    const result = [];
    for (const item of fs.readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, item.name);
      if (item.isDirectory()) result.push(...getPDFs(full));
      else if (item.name.toLowerCase().endsWith('.pdf')) result.push(full);
    }
    return result;
  }

  const files = getPDFs(TEST_DIR).slice(0, 3);

  for (const filePath of files) {
    const fileName = path.basename(filePath);
    const { numero, anio, titulo } = extraerMetadata(fileName);
    console.log(`\n📄 Archivo: ${fileName}`);
    console.log(`   Número: ${numero || '?'} | Año: ${anio || '?'}`);
    console.log(`   Título: ${titulo.substring(0, 60)}`);

    const fileBuffer = fs.readFileSync(filePath);
    const safeName = sanitizarNombre(fileName);
    const storagePath = `documentos/ley_departamental/${safeName}`;

    const { error } = await supabase.storage
      .from(BUCKET)
      .upload(storagePath, fileBuffer, { contentType: 'application/pdf', upsert: true });

    if (error) {
      console.log(`   ❌ Error Storage: ${error.message}`);
    } else {
      const url = `${SUPABASE_URL}/storage/v1/object/public/${BUCKET}/${storagePath}`;
      console.log(`   ✅ Subido OK → ${url.substring(0, 80)}...`);
    }
  }
  console.log('\n✅ TEST completado');
}

test().catch(console.error);
