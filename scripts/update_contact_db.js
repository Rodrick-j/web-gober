require('dotenv').config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function updateConfig() {
  const res = await fetch(`${supabaseUrl}/rest/v1/configuracion_global?clave=eq.contacto_oficial`, {
    headers: {
      'apikey': supabaseKey,
      'Authorization': `Bearer ${supabaseKey}`
    }
  });
  const data = await res.json();
  if (data && data.length > 0) {
    let valor = data[0].valor;
    valor.direccion = "Calle Presidente Montes, entre Bolívar y Adolfo Mier, Oruro";
    
    const patchRes = await fetch(`${supabaseUrl}/rest/v1/configuracion_global?clave=eq.contacto_oficial`, {
      method: 'PATCH',
      headers: {
        'apikey': supabaseKey,
        'Authorization': `Bearer ${supabaseKey}`,
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
      },
      body: JSON.stringify({ valor })
    });
    console.log('Update status:', patchRes.ok);
  }
}

updateConfig();
