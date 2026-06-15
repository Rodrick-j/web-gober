-- =====================================================
-- 07_usuarios_admin.sql
-- Perfiles de administradores del sistema
-- EJECUTAR SÉPTIMO
-- Nota: Supabase crea la tabla auth.users automáticamente.
--       Esta tabla extiende esa con roles y permisos.
-- =====================================================

CREATE TYPE rol_admin AS ENUM ('super_admin', 'secretaria_admin');

CREATE TABLE IF NOT EXISTS usuarios_admin (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  
  -- Vinculación con Supabase Auth
  auth_user_id    UUID UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
  
  -- Información personal
  nombre          TEXT NOT NULL,
  apellido        TEXT,
  email           TEXT NOT NULL UNIQUE,
  cargo           TEXT,                              -- "Jefe de Prensa", "Técnico TI"
  avatar_url      TEXT,
  telefono        TEXT,
  
  -- Permisos
  rol             rol_admin NOT NULL DEFAULT 'secretaria_admin',
  secretaria_id   UUID REFERENCES secretarias(id) ON DELETE SET NULL,
  -- Si secretaria_id es NULL y rol = 'super_admin' → acceso total
  -- Si secretaria_id está definido → solo accede a esa secretaría
  
  -- Estado
  activo          BOOLEAN DEFAULT true,
  last_login      TIMESTAMPTZ,
  
  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_usuarios_auth ON usuarios_admin(auth_user_id);
CREATE INDEX IF NOT EXISTS idx_usuarios_secretaria ON usuarios_admin(secretaria_id);
CREATE INDEX IF NOT EXISTS idx_usuarios_rol ON usuarios_admin(rol);

-- Trigger updated_at
CREATE TRIGGER trg_usuarios_updated_at
  BEFORE UPDATE ON usuarios_admin
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- =====================================================
-- Función: Registrar último acceso automáticamente
-- =====================================================
CREATE OR REPLACE FUNCTION registrar_ultimo_login(user_auth_id UUID)
RETURNS VOID AS $$
BEGIN
  UPDATE usuarios_admin
  SET last_login = NOW()
  WHERE auth_user_id = user_auth_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
