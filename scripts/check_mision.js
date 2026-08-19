require('dotenv').config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function check() {
  const res = await fetch(`${supabaseUrl}/rest/v1/secretarias?select=slug,nombre,mision,vision`, {
    headers: {
      'apikey': supabaseKey,
      'Authorization': `Bearer ${supabaseKey}`
    }
  });
  
  const data = await res.json();
  const missing = data.filter(s => !s.mision || !s.vision);
  console.log('Total secretarias:', data.length);
  console.log('Faltan mision/vision en:', missing.length);
  missing.forEach(s => {
    console.log(`- ${s.nombre} (${s.slug})`);
  });
}

check();
