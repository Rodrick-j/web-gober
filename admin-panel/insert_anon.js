const { createClient } = require('@supabase/supabase-js');
const supabase = createClient(
  'https://ldkafdekjogkoqnqajij.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxka2FmZGVram9na29xbnFhamlqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODEyOTM2MTgsImV4cCI6MjA5Njg2OTYxOH0.MeQPfSDNExVm1hFAkBs6bBJD_cBR3ODzg0rYyV4xtS4'
);

async function check() {
  const { data: sec } = await supabase.from('secretarias').select('id, slug').like('slug', '%planificacion%').single();
  
  if (sec) {
    const { data, error } = await supabase.from('poa_documents').insert({
      secretaria_id: sec.id,
      nombre: 'Anon Test 2025',
      archivo_url: 'https://example.com/test.pdf',
      gestion: 2025,
      tamano_mb: 1.5
    }).select();
    console.log("INSERT RESPONSE:", data, "ERROR:", error);
  }
}
check();
