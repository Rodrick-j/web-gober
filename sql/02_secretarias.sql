-- =====================================================
-- 02_secretarias.sql
-- Tabla principal de las 10 Secretarías Departamentales
-- EJECUTAR SEGUNDO
-- =====================================================

CREATE TABLE IF NOT EXISTS secretarias (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nombre          TEXT NOT NULL,
  nombre_corto    TEXT,                        -- "Sec. General", "Cultura y Turismo", etc.
  slug            TEXT UNIQUE NOT NULL,         -- "secretaria-general", "cultura-turismo"
  descripcion     TEXT,
  mision          TEXT,
  vision          TEXT,
  
  -- Secretario/a a cargo
  secretario_nombre    TEXT,
  secretario_cargo     TEXT DEFAULT 'Secretario/a Departamental',
  secretario_foto_url  TEXT,
  secretario_bio       TEXT,
  
  -- Identidad visual
  banner_url      TEXT,
  logo_url        TEXT,
  color_acento    TEXT DEFAULT '#8B0000',       -- Color hex para identificar la secretaría
  icono           TEXT DEFAULT '🏛️',
  
  -- Contacto
  telefono        TEXT,
  email           TEXT,
  direccion       TEXT,
  horario         TEXT DEFAULT 'Lunes a Viernes: 8:00 - 16:00',
  
  -- Control
  orden           INTEGER DEFAULT 0,            -- Para controlar el orden de aparición
  activo          BOOLEAN DEFAULT true,
  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_secretarias_slug ON secretarias(slug);
CREATE INDEX IF NOT EXISTS idx_secretarias_activo ON secretarias(activo);

-- Trigger para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_secretarias_updated_at
  BEFORE UPDATE ON secretarias
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
