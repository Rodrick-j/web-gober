const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'http://localhost:54321';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

const supabase = createClient(supabaseUrl, supabaseKey);

const dirPath = path.join(__dirname, '../public/documentos/auditorias');

async function main() {
  const files = fs.readdirSync(dirPath).filter(f => f.endsWith('.pdf'));
  
  const insertData = [];

  for (const file of files) {
    let tipo = 'auditoria_sedeges'; // default
    
    // Determine type by filename
    if (file.toLowerCase().includes('sedes')) {
      tipo = 'auditoria_sedes';
    } else if (file.toLowerCase().includes('paa') || file.toLowerCase().includes('scan') || file.toLowerCase().includes('resumenejecutivo2024')) {
      tipo = 'auditoria_sedcam';
    }

    // Clean filename
    let cleanName = file.replace(/ AUDITORIA INTERNA S\.E\.D\.E\.G\.E\.S\./, '').replace(/_/g, '-').replace(/ /g, '-').toLowerCase();
    
    // Rename file
    const oldPath = path.join(dirPath, file);
    const newPath = path.join(dirPath, cleanName);
    if (oldPath !== newPath) {
      fs.renameSync(oldPath, newPath);
    }
    
    // Determine title
    let title = file.replace(/-/g, ' ').replace(/_/g, ' ').replace(/\.pdf$/i, '').replace(/ AUDITORIA INTERNA S\.E\.D\.E\.G\.E\.S\./i, '').trim();

    insertData.push({
      tipo: tipo,
      titulo: title,
      gestion: 2024,
      fecha_publicacion: new Date().toISOString(),
      archivo_url: `/documentos/auditorias/${cleanName}`,
      es_publico: true
    });
  }

  console.log('Inserting into supabase:', insertData.length, 'records');

  const { data, error } = await supabase
    .from('transparencia_documentos')
    .insert(insertData)
    .select();

  if (error) {
    console.error('Error inserting:', error);
  } else {
    console.log('Successfully inserted', data.length, 'records');
  }
}

main().catch(console.error);
