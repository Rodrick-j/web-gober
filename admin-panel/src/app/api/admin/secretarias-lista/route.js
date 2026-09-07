import { NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

// API rápida para listar secretarías (usada por formularios client-side)
export async function GET() {
  try {
    const supabase = await createClient();
    const { data: secretarias } = await supabase
      .from('secretarias')
      .select('id, nombre_corto, icono')
      .eq('activo', true)
      .order('orden');
    return NextResponse.json({ secretarias: secretarias || [] });
  } catch {
    return NextResponse.json({ secretarias: [] });
  }
}
