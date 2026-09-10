// =====================================================
// lib/supabase/client.js
// Cliente Supabase para el NAVEGADOR (componentes client-side)
// =====================================================
import { createBrowserClient } from '@supabase/ssr';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_ANON_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

let clienteSinConfigurar = null;

// Sin credenciales no tiene sentido salir a la red: cada consulta terminaba en
// ERR_NAME_NOT_RESOLVED contra un host inexistente y el canal realtime reintentaba
// el WebSocket en bucle. Este cliente responde 503 en local, no abre sockets y
// avisa una sola vez qué falta configurar.
function getClienteSinConfigurar() {
  if (clienteSinConfigurar) return clienteSinConfigurar;

  console.error(
    '[Supabase] Faltan NEXT_PUBLIC_SUPABASE_URL y/o NEXT_PUBLIC_SUPABASE_ANON_KEY. ' +
    'Definilas en admin-panel/.env.local y reiniciá el servidor de desarrollo. ' +
    'Mientras tanto las consultas del navegador quedan deshabilitadas.'
  );

  const client = createBrowserClient(
    'http://localhost/supabase-no-configurado',
    'sin-configurar',
    {
      isSingleton: false,
      auth: { persistSession: false, autoRefreshToken: false, detectSessionInUrl: false },
      global: {
        fetch: async () => new Response(
          JSON.stringify({ message: 'Supabase no está configurado en este entorno.' }),
          { status: 503, headers: { 'Content-Type': 'application/json' } }
        ),
      },
    }
  );

  const canalInerte = {
    on: () => canalInerte,
    subscribe: () => canalInerte,
    unsubscribe: async () => 'ok',
  };
  client.channel = () => canalInerte;
  client.removeChannel = async () => 'ok';

  clienteSinConfigurar = client;
  return client;
}

export function createClient() {
  if (!SUPABASE_URL || !SUPABASE_ANON_KEY) {
    return getClienteSinConfigurar();
  }

  return createBrowserClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
    auth: {
      persistSession: true,
      autoRefreshToken: false,
      detectSessionInUrl: true
    }
  });
}
