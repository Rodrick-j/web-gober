// =====================================================
// lib/supabase/public.js
// Cliente Supabase PÚBLICO puro (sin cookies ni estado)
// Especial para páginas estáticas
// =====================================================
import { createClient as createSupabaseClient } from '@supabase/supabase-js';

let supabaseInstance = null;

export function createClient() {
  if (supabaseInstance) return supabaseInstance;
  
  supabaseInstance = createSupabaseClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  );
  
  return supabaseInstance;
}
