require('dotenv').config({ path: '.env.local' });
const { createClient } = require('@supabase/supabase-js');

const URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!URL || !KEY) {
  console.error('Missing env vars');
  process.exit(1);
}

const supabase = createClient(URL, KEY);

async function main() {
  const { data, error } = await supabase
    .from('configuracion_global')
    .select('valor')
    .eq('clave', 'redes_sociales')
    .single();

  if (error) {
    console.error('Error fetching:', error);
    return;
  }

  const newValor = {
    ...data.valor,
    tiktok: 'https://www.tiktok.com/@gobiernodeunidad',
    youtube: 'https://www.youtube.com/@Gobernaci%C3%B3ndeOruro'
  };

  const { error: updateError } = await supabase
    .from('configuracion_global')
    .update({ valor: newValor })
    .eq('clave', 'redes_sociales');

  if (updateError) {
    console.error('Error updating:', updateError);
  } else {
    console.log('Database updated successfully');
  }
}

main();
