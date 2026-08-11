import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';
import WebSocket from 'ws';
globalThis.WebSocket = WebSocket;

const env = readFileSync('.env.local', 'utf-8')
  .split('\n')
  .filter(line => line.includes('='))
  .reduce((acc, line) => {
    const [key, ...val] = line.split('=');
    acc[key.trim()] = val.join('=').trim().replace(/^"|"$/g, '');
    return acc;
  }, {});

const supabase = createClient(
  env.NEXT_PUBLIC_SUPABASE_URL,
  env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function check() {
  const { data, error } = await supabase.from('secretarias').select('nombre, slug');
  if (data) {
    console.log("SECRETARIAS:", data);
  }
}
check();
