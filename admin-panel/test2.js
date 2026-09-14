import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

function withTimeout(request, milliseconds, message) {
  return new Promise((resolve, reject) => {
    const timeoutId = setTimeout(() => reject(new Error(message)), milliseconds);

    Promise.resolve(request).then(
      (result) => {
        clearTimeout(timeoutId);
        resolve(result);
      },
      (error) => {
        clearTimeout(timeoutId);
        reject(error);
      },
    );
  });
}

async function test() {
  try {
    const request = supabase.from('configuracion_global').select('clave, valor');
    console.log('Request is promise?', request instanceof Promise);
    console.log('Request has then?', typeof request.then);
    
    const { data, error } = await withTimeout(
      request,
      5000,
      'Timeout'
    );
    console.log('Data:', data);
    console.log('Error:', error);
  } catch (e) {
    console.error('Exception:', e);
  }
}
test();
