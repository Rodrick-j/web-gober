const { createClient } = require('@supabase/supabase-js');
const supabase = createClient(
  'https://ldkafdekjogkoqnqajij.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxka2FmZGVram9na29xbnFhamlqIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MTI5MzYxOCwiZXhwIjoyMDk2ODY5NjE4fQ.63xEkU_qFHDyWeQBdf5j3T4qPzX5e3D22ubp5jgAAYU'
);

async function check() {
  const { data, error } = await supabase.from('poa_documents').select('*');
  console.log("DATA:", data);
  if (error) console.error("ERROR:", error);
}
check();
