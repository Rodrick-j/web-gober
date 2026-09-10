/**
 * crear_admin.js — crea (o repara) un usuario administrador del panel.
 *
 * Requiere en .env.local (raíz del proyecto):
 *   NEXT_PUBLIC_SUPABASE_URL
 *   SUPABASE_SERVICE_ROLE_KEY   ← Supabase Dashboard → Project Settings → API → service_role
 *
 * Uso:
 *   node scripts/crear_admin.js correo@dominio.com "MiContraseña123" "Nombre Apellido"
 *
 * Qué hace:
 *   1) Crea el usuario en Supabase Auth (email ya confirmado). Si ya existe, lo reutiliza.
 *   2) Inserta / actualiza la fila en public.usuarios_admin con rol = 'super_admin', activo = true.
 */
require('dotenv').config({ path: '.env.local' });

const URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

const [email, password, nombreCompleto] = process.argv.slice(2);

if (!URL || !KEY) {
  console.error('❌ Falta NEXT_PUBLIC_SUPABASE_URL o SUPABASE_SERVICE_ROLE_KEY en .env.local');
  process.exit(1);
}
if (!email || !password) {
  console.error('Uso: node scripts/crear_admin.js <email> <password> "<Nombre Apellido>"');
  process.exit(1);
}

const h = { apikey: KEY, Authorization: `Bearer ${KEY}`, 'Content-Type': 'application/json' };
const [nombre, ...restoApellido] = (nombreCompleto || 'Administrador').split(' ');
const apellido = restoApellido.join(' ') || null;

async function main() {
  // 1) ¿Existe ya el usuario en Auth?
  let userId;
  const list = await fetch(`${URL}/auth/v1/admin/users?page=1&per_page=200`, { headers: h }).then((r) => r.json());
  const existente = (list.users || []).find((u) => (u.email || '').toLowerCase() === email.toLowerCase());

  if (existente) {
    userId = existente.id;
    console.log(`ℹ️  El usuario ya existía en Auth (${userId}). Actualizando contraseña…`);
    const upd = await fetch(`${URL}/auth/v1/admin/users/${userId}`, {
      method: 'PUT',
      headers: h,
      body: JSON.stringify({ password, email_confirm: true }),
    });
    if (!upd.ok) console.warn('⚠️  No se pudo actualizar la contraseña:', await upd.text());
  } else {
    const created = await fetch(`${URL}/auth/v1/admin/users`, {
      method: 'POST',
      headers: h,
      body: JSON.stringify({ email, password, email_confirm: true }),
    });
    const body = await created.json();
    if (!created.ok) {
      console.error('❌ No se pudo crear el usuario en Auth:', body);
      process.exit(1);
    }
    userId = body.id;
    console.log(`✅ Usuario creado en Auth: ${userId}`);
  }

  // 2) Fila en usuarios_admin (upsert por auth_user_id)
  const perfil = {
    auth_user_id: userId,
    nombre,
    apellido,
    email: email.toLowerCase(),
    cargo: 'Administrador del Sistema',
    rol: 'super_admin',
    secretaria_id: null,
    activo: true,
  };

  const up = await fetch(`${URL}/rest/v1/usuarios_admin?on_conflict=auth_user_id`, {
    method: 'POST',
    headers: { ...h, Prefer: 'resolution=merge-duplicates,return=representation' },
    body: JSON.stringify(perfil),
  });
  const upBody = await up.text();
  if (!up.ok) {
    console.error('❌ No se pudo crear/actualizar usuarios_admin:', upBody);
    process.exit(1);
  }

  console.log('✅ Perfil en usuarios_admin listo (rol: super_admin, activo: true).');
  console.log('\n👉 Ya puedes iniciar sesión en http://localhost:3001/admin/login');
  console.log(`   Correo:      ${email}`);
  console.log(`   Contraseña:  ${password}`);
}

main().catch((e) => { console.error(e); process.exit(1); });
