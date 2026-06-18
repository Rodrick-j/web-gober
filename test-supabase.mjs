import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error("Missing Supabase credentials");
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function testConnection() {
  console.log("Conectando a Supabase...");
  const { data, error } = await supabase.from('secretarias').select('*').limit(5);
  
  if (error) {
    console.error("Error al conectar o consultar:", error.message);
  } else {
    console.log("¡Conexión exitosa!");
    console.log("Datos de la tabla 'secretarias' (hasta 5):", data);
  }
}

testConnection();
