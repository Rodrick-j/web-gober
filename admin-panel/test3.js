import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
// Use SERVICE ROLE KEY to bypass RLS, or test with ANON to see if RLS blocks it.
const supabaseAnon = createClient(supabaseUrl, process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY);
const supabaseAdmin = createClient(supabaseUrl, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function test() {
  console.log('Testing Upsert with ANON (should fail if no active session):');
  const rows = [
    { clave: 'ticker_noticias', valor: { velocidad_segundos: 42, mensajes: [] } }
  ];
  const anonRes = await supabaseAnon.from('configuracion_global').upsert(rows, { onConflict: 'clave' });
  console.log('ANON Error:', anonRes.error?.message);

  console.log('Testing Upsert with ADMIN (bypasses RLS):');
  const adminRes = await supabaseAdmin.from('configuracion_global').upsert(rows, { onConflict: 'clave' });
  console.log('ADMIN Error:', adminRes.error?.message);
}
test();
