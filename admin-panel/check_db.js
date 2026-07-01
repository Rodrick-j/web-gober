const { createClient } = require('@supabase/supabase-js');
const supabase = createClient(
  'https://ldkafdekjogkoqnqajij.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxka2FmZGVram9na29xbnFhamlqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODEyOTM2MTgsImV4cCI6MjA5Njg2OTYxOH0.MeQPfSDNExVm1hFAkBs6bBJD_cBR3ODzg0rYyV4xtS4'
);

async function check() {
  const { data, error } = await supabase.from('poa_documents').select('*');
  console.log("DATA:", data);
  if (error) console.error("ERROR:", error);
}
check();
