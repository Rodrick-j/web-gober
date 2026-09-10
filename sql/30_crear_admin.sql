-- =====================================================
-- 30_crear_admin.sql
-- Alta de un usuario administrador del panel (PLANTILLA — NO EJECUTAR TAL CUAL).
--
-- ⚠️ Debes REEMPLAZAR 'PEGA-AQUI-EL-USER-UID' por el UID real del usuario de Auth,
--    y ajustar nombre / apellido / email. Si lo corres sin editar, Postgres falla con
--    "invalid input syntax for type uuid".
--
-- Nota: el primer super_admin (stardflores@gmail.com) ya fue creado con
--       `node scripts/crear_admin.js`. Este archivo queda solo como referencia para
--       dar de alta más administradores manualmente desde el SQL Editor.
--
-- PASO 1 (Dashboard): Supabase → Authentication → Users → "Add user"
--   Email:            stardflores@gmail.com   (o el que corresponda)
--   Password:         (defínela)
--   Auto Confirm User: ✅  (marcar)
--   → copia el "User UID" que aparece en la fila creada.
--
-- PASO 2 (SQL Editor): reemplaza los valores y ejecuta este bloque.
-- =====================================================

INSERT INTO public.usuarios_admin
  (auth_user_id, nombre, apellido, email, cargo, rol, secretaria_id, activo)
VALUES
  (
    'PEGA-AQUI-EL-USER-UID',           -- UID del usuario creado en Authentication
    'Nombre',                          -- nombre
    'Apellido',                        -- apellido
    'stardflores@gmail.com',           -- debe coincidir con el email del usuario de Auth
    'Administrador del Sistema',       -- cargo
    'super_admin',                     -- rol: 'super_admin' = acceso total
    NULL,                              -- secretaria_id: NULL para super_admin
    true                              -- activo
  )
ON CONFLICT (auth_user_id) DO UPDATE
  SET rol = 'super_admin',
      activo = true,
      email = EXCLUDED.email,
      nombre = EXCLUDED.nombre,
      apellido = EXCLUDED.apellido;

-- Verificación:
SELECT u.email, u.nombre, u.rol, u.activo, u.auth_user_id
FROM public.usuarios_admin u
ORDER BY u.created_at DESC;

-- =====================================================
-- Para dar de alta administradores de una sola secretaría:
--   rol = 'secretaria_admin' y secretaria_id = (SELECT id FROM secretarias WHERE slug = '...')
-- =====================================================
