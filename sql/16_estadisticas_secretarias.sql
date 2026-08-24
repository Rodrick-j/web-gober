-- =====================================================
-- 16_estadisticas_secretarias.sql
-- Estadísticas/KPIs personalizados por Secretaría
-- EJECUTAR DECIMOSEXTO en Supabase SQL Editor
-- =====================================================

CREATE TABLE IF NOT EXISTS estadisticas_secretarias (
  id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  secretaria_id UUID NOT NULL REFERENCES secretarias(id) ON DELETE CASCADE,

  -- El indicador
  titulo        TEXT NOT NULL,       -- Ej: "Obras entregadas"
  valor         TEXT NOT NULL,       -- Ej: "142" o "85%" (texto para flexibilidad)
  unidad        TEXT,                -- Ej: "proyectos", "km", "%", "beneficiarios"
  icono         TEXT DEFAULT '📊',   -- Emoji o código de ícono
  descripcion   TEXT,                -- Descripción corta del indicador
  color         TEXT DEFAULT '#8B0000', -- Color de acento

  -- Período
  periodo       TEXT DEFAULT '2025', -- Ej: "2025", "Enero 2025", "Q1 2025"

  -- Orden y visibilidad
  orden         INTEGER DEFAULT 0,
  es_publico    BOOLEAN DEFAULT true,

  created_at    TIMESTAMPTZ DEFAULT NOW(),
  updated_at    TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_estadisticas_secretaria ON estadisticas_secretarias(secretaria_id);
CREATE INDEX IF NOT EXISTS idx_estadisticas_orden      ON estadisticas_secretarias(secretaria_id, orden);

-- Trigger updated_at
DROP TRIGGER IF EXISTS trg_estadisticas_updated_at ON estadisticas_secretarias;
CREATE TRIGGER trg_estadisticas_updated_at
  BEFORE UPDATE ON estadisticas_secretarias
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- RLS
ALTER TABLE estadisticas_secretarias ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "estadisticas_select_public" ON estadisticas_secretarias;
CREATE POLICY "estadisticas_select_public"
  ON estadisticas_secretarias FOR SELECT
  USING (es_publico = true);

DROP POLICY IF EXISTS "estadisticas_insert_admin" ON estadisticas_secretarias;
CREATE POLICY "estadisticas_insert_admin"
  ON estadisticas_secretarias FOR INSERT
  TO authenticated
  WITH CHECK (true);

DROP POLICY IF EXISTS "estadisticas_update_admin" ON estadisticas_secretarias;
CREATE POLICY "estadisticas_update_admin"
  ON estadisticas_secretarias FOR UPDATE
  TO authenticated
  USING (true);

DROP POLICY IF EXISTS "estadisticas_delete_admin" ON estadisticas_secretarias;
CREATE POLICY "estadisticas_delete_admin"
  ON estadisticas_secretarias FOR DELETE
  TO authenticated
  USING (true);

-- GRANTS
GRANT ALL    ON estadisticas_secretarias TO authenticated;
GRANT SELECT ON estadisticas_secretarias TO anon;

