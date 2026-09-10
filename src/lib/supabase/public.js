// =====================================================
// lib/supabase/public.js
// Cliente Supabase PÚBLICO puro (sin cookies ni estado)
// Especial para páginas estáticas
// =====================================================
import { createClient as createSupabaseClient } from '@supabase/supabase-js';

let supabaseInstance = null;

export function createClient() {
  if (supabaseInstance) return supabaseInstance;

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  // Mensaje explícito: el error nativo ("supabaseUrl is required") no dice dónde definirlas.
  if (!url || !key) {
    throw new Error(
      '[Supabase] Faltan NEXT_PUBLIC_SUPABASE_URL y/o NEXT_PUBLIC_SUPABASE_ANON_KEY. ' +
      'Definilas en .env.local (raíz del proyecto) y reiniciá el servidor de desarrollo.'
    );
  }

  supabaseInstance = createSupabaseClient(url, key);

  return supabaseInstance;
}
