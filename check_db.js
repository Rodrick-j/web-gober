require('dotenv').config({ path: 'c:\\Users\\HP\\web-gober\\.env.local' });
const { createClient } = require('@supabase/supabase-js');
const url = process.env.NEXT_PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || process.env.SUPABASE_ANON_KEY;
const supabase = createClient(url, key);

async function check() {
  const { data, error } = await supabase.from('poa_documents').select('*');
  console.log("DATA:", data);
  if (error) console.error("ERROR:", error);
}
check();
