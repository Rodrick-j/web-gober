const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');

const envFile = fs.readFileSync('.env.local', 'utf8');
const env = envFile.split('\n').reduce((acc, line) => {
  const [key, value] = line.split('=');
  if (key && value) acc[key.trim()] = value.trim();
  return acc;
}, {});

const supabaseUrl = env['NEXT_PUBLIC_SUPABASE_URL'];
const supabaseKey = env['SUPABASE_SERVICE_ROLE_KEY'] || env['NEXT_PUBLIC_SUPABASE_ANON_KEY'];

const supabase = createClient(supabaseUrl, supabaseKey);

async function fixData() {
  const { data: sec, error } = await supabase
    .from('secretarias')
    .select('id, slug, banner_url, secretario_foto_url')
    .eq('slug', 'secretaria-general')
    .single();

  if (error) {
    console.error('Error fetching:', error);
    return;
  }

  console.log('Current data:', sec);

  if (sec.banner_url) {
    const { error: updateError } = await supabase
      .from('secretarias')
      .update({
        secretario_foto_url: sec.banner_url,
        banner_url: null
      })
      .eq('slug', 'secretaria-general');

    if (updateError) {
      console.error('Error updating:', updateError);
    } else {
      console.log('Successfully moved image from banner to secretario_foto_url!');
    }
  } else {
    console.log('No banner_url to move.');
  }
}

fixData();
