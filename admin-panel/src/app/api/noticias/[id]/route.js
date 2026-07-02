import { createClient } from '@/lib/supabase/server';
import { NextResponse } from 'next/server';
import { verifyAdminSession } from '@/lib/auth';

export async function DELETE(request, { params }) {
  try {
    const session = await verifyAdminSession();
    if (!session) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    const supabase = await createClient();
    const { id } = params;

    let query = supabase.from('noticias').delete().eq('id', id);
    if (session.perfil.rol !== 'super_admin') {
      query = query.eq('secretaria_id', session.perfil.secretaria_id);
    }

    const { error } = await query;
    if (error) throw error;

    return NextResponse.json({ success: true });
  } catch (err) {
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}

export async function PATCH(request, { params }) {
  try {
    const session = await verifyAdminSession();
    if (!session) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    const supabase = await createClient();
    const { id } = params;
    const body = await request.json();

    let query = supabase
      .from('noticias')
      .update({ estado: body.estado })
      .eq('id', id);

    if (session.perfil.rol !== 'super_admin') {
      query = query.eq('secretaria_id', session.perfil.secretaria_id);
    }

    const { error } = await query;
    if (error) throw error;

    return NextResponse.json({ success: true });
  } catch (err) {
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}
