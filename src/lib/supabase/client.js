// =====================================================
// lib/supabase/client.js
// Cliente Supabase para el NAVEGADOR (componentes client-side)
// =====================================================
import { createBrowserClient } from '@supabase/ssr';

export function createClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://placeholder.supabase.co';
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'placeholder';
  return createBrowserClient(url, key, {
    auth: {
      persistSession: true,
      autoRefreshToken: false,
      detectSessionInUrl: true
    }
  });
}
