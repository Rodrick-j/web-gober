import { NextResponse } from 'next/server';
import { verifyAdminSession } from '@/lib/auth';
import { createClient } from '@/lib/supabase/server';
import { createClient as createAdminClient } from '@supabase/supabase-js';

export async function POST(request) {
  try {
    // Verificar que el solicitante sea super_admin
    const session = await verifyAdminSession();
    if (!session || session.perfil.rol !== 'super_admin') {
      return NextResponse.json({ error: 'No autorizado. Solo el Super Administrador puede crear usuarios.' }, { status: 403 });
    }

    const body = await request.json();
    const { nombre, apellido, email, cargo, telefono, rol, secretaria_id } = body;

    if (!nombre || !email || !rol) {
      return NextResponse.json({ error: 'Nombre, email y rol son obligatorios.' }, { status: 400 });
    }

    if (rol === 'secretaria_admin' && !secretaria_id) {
      return NextResponse.json({ error: 'Debes asignar una secretaría al usuario con rol Admin de Secretaría.' }, { status: 400 });
    }

    // Verificar service role key
    const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
    const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;

    if (!serviceKey || !supabaseUrl) {
      return NextResponse.json({ error: 'SUPABASE_SERVICE_ROLE_KEY no configurada en variables de entorno.' }, { status: 500 });
    }

    // Crear cliente admin con service role key
    const supabaseAdmin = createAdminClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    // Invitar al usuario vía Supabase Auth
    const { data: authData, error: inviteError } = await supabaseAdmin.auth.admin.inviteUserByEmail(email, {
      redirectTo: `${process.env.NEXT_PUBLIC_SITE_URL || 'http://localhost:3001'}/admin/login`,
      data: { nombre, apellido },
    });

    if (inviteError) {
      // Si el usuario ya existe en auth, buscar su UUID
      if (inviteError.message?.includes('already registered') || inviteError.code === 'email_exists') {
        const { data: existingUsers } = await supabaseAdmin.auth.admin.listUsers();
        const existingUser = existingUsers?.users?.find(u => u.email === email);
        if (!existingUser) {
          return NextResponse.json({ error: `El email ya está registrado pero no se pudo recuperar. Error: ${inviteError.message}` }, { status: 400 });
        }
        // Crear perfil en usuarios_admin con el auth_user_id existente
        const supabase = await createClient();
        const { error: profileError } = await supabase.from('usuarios_admin').insert({
          auth_user_id: existingUser.id,
          nombre, apellido: apellido || null, email,
          cargo: cargo || null, telefono: telefono || null,
          rol, secretaria_id: rol === 'super_admin' ? null : (secretaria_id || null),
          activo: true,
        });
        if (profileError) {
          if (profileError.code === '23505') {
            return NextResponse.json({ error: 'Este email ya tiene un perfil de administrador registrado.' }, { status: 409 });
          }
          throw profileError;
        }
        return NextResponse.json({ ok: true, message: 'Perfil creado para usuario existente en Auth.' });
      }
      throw inviteError;
    }

    // Crear perfil en usuarios_admin
    const supabase = await createClient();
    const { error: profileError } = await supabase.from('usuarios_admin').insert({
      auth_user_id: authData.user.id,
      nombre, apellido: apellido || null, email,
      cargo: cargo || null, telefono: telefono || null,
      rol, secretaria_id: rol === 'super_admin' ? null : (secretaria_id || null),
      activo: true,
    });

    if (profileError) {
      // Rollback: eliminar el usuario de auth si falló la creación del perfil
      await supabaseAdmin.auth.admin.deleteUser(authData.user.id).catch(() => {});
      throw profileError;
    }

    return NextResponse.json({ ok: true, message: `Invitación enviada a ${email}` });

  } catch (error) {
    console.error('[API /admin/usuarios/invite]', error);
    return NextResponse.json({ error: error.message || 'Error interno del servidor' }, { status: 500 });
  }
}
