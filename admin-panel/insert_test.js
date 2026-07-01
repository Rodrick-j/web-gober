const { createClient } = require('@supabase/supabase-js');
const supabase = createClient(
  'https://ldkafdekjogkoqnqajij.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxka2FmZGVram9na29xbnFhamlqIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MTI5MzYxOCwiZXhwIjoyMDk2ODY5NjE4fQ.63xEkU_qFHDyWeQBdf5j3T4qPzX5e3D22ubp5jgAAYU'
);

async function check() {
  const { data: sec } = await supabase.from('secretarias').select('id, slug').like('slug', '%planificacion%').single();
  console.log("SEC:", sec);
  
  if (sec) {
    const { error } = await supabase.from('poa_documents').insert({
      secretaria_id: sec.id,
      nombre: 'Documento de Prueba 2025',
      archivo_url: 'https://example.com/test.pdf',
      gestion: 2025,
      tamano_mb: 1.5
    });
    console.log("INSERT ERROR:", error);
  }
}
check();
