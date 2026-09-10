-- =====================================================
-- 28_autoridades.sql
-- Nómina de Autoridades (hasta directores generales) con foto y biografía.
-- Cumplimiento RM 067/2025 — bloque Recursos Humanos (ítem 31 Nómina de Autoridades)
-- Complementa a la tabla `secretarias` (que ya guarda a los secretarios) y a
-- `GovernorSection` (gobernador/a).
-- EJECUTAR VIGESIMOCTAVO en Supabase SQL Editor
-- =====================================================

CREATE TABLE IF NOT EXISTS autoridades (
  id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

  nombre        TEXT NOT NULL,
  cargo         TEXT NOT NULL,
  nivel         TEXT NOT NULL DEFAULT 'director'
                  CHECK (nivel IN ('maxima','secretario','director','jefe','otro')),
  unidad        TEXT,                              -- Secretaría / Dirección a la que pertenece
  foto_url      TEXT,
  bio           TEXT,
  email         TEXT,
  telefono      TEXT,

  orden         INTEGER DEFAULT 0,
  activo        BOOLEAN DEFAULT true,

  created_at    TIMESTAMPTZ DEFAULT NOW(),
  updated_at    TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_autoridades_nivel  ON autoridades(nivel);
CREATE INDEX IF NOT EXISTS idx_autoridades_orden  ON autoridades(orden);
CREATE INDEX IF NOT EXISTS idx_autoridades_activo ON autoridades(activo) WHERE activo = true;

DROP TRIGGER IF EXISTS trg_autoridades_updated_at ON autoridades;
CREATE TRIGGER trg_autoridades_updated_at
  BEFORE UPDATE ON autoridades
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- =====================================================
-- RLS
-- =====================================================
ALTER TABLE autoridades ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "autoridades_select_public" ON autoridades;
CREATE POLICY "autoridades_select_public"
  ON autoridades FOR SELECT USING (activo = true);

DROP POLICY IF EXISTS "autoridades_write_admin" ON autoridades;
CREATE POLICY "autoridades_write_admin"
  ON autoridades FOR ALL TO authenticated USING (true) WITH CHECK (true);

GRANT ALL    ON autoridades TO authenticated;
GRANT SELECT ON autoridades TO anon;
