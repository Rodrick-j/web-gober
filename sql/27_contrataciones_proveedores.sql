-- =====================================================
-- 27_contrataciones_proveedores.sql
-- Contrataciones y oportunidades de empleo + Lista de Proveedores.
-- Cumplimiento RM 067/2025 — bloque Contrataciones (ítems 37 TdR, 38 Convocatorias, 39 Proveedores)
-- EJECUTAR VIGESIMOSEPTIMO en Supabase SQL Editor
-- =====================================================

-- ── Convocatorias: Términos de Referencia, adquisición de bienes/servicios, empleo ──
CREATE TABLE IF NOT EXISTS convocatorias (
  id                UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

  tipo              TEXT NOT NULL DEFAULT 'bienes_servicios'
                      CHECK (tipo IN ('tdr','bienes_servicios','empleo')),

  titulo            TEXT NOT NULL,
  codigo            TEXT,                          -- código de proceso / CUCE
  descripcion       TEXT,
  archivo_url       TEXT,                          -- pliego / TdR en PDF

  fecha_publicacion DATE DEFAULT CURRENT_DATE,
  fecha_limite      DATE,

  estado            TEXT NOT NULL DEFAULT 'vigente'
                      CHECK (estado IN ('vigente','cerrada','adjudicada','desierta')),

  activo            BOOLEAN DEFAULT true,
  created_at        TIMESTAMPTZ DEFAULT NOW(),
  updated_at        TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_convocatorias_tipo   ON convocatorias(tipo);
CREATE INDEX IF NOT EXISTS idx_convocatorias_estado ON convocatorias(estado);
CREATE INDEX IF NOT EXISTS idx_convocatorias_fecha  ON convocatorias(fecha_publicacion DESC);

DROP TRIGGER IF EXISTS trg_convocatorias_updated_at ON convocatorias;
CREATE TRIGGER trg_convocatorias_updated_at
  BEFORE UPDATE ON convocatorias
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ── Lista de Proveedores ──
CREATE TABLE IF NOT EXISTS proveedores (
  id                  UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nombre              TEXT NOT NULL,
  nit                 TEXT,
  contacto            TEXT,                        -- teléfono / correo / persona de contacto
  rubro               TEXT,
  productos_servicios TEXT,
  condiciones_pago    TEXT,
  activo              BOOLEAN DEFAULT true,
  created_at          TIMESTAMPTZ DEFAULT NOW(),
  updated_at          TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_proveedores_activo ON proveedores(activo) WHERE activo = true;
CREATE INDEX IF NOT EXISTS idx_proveedores_rubro  ON proveedores(rubro);

DROP TRIGGER IF EXISTS trg_proveedores_updated_at ON proveedores;
CREATE TRIGGER trg_proveedores_updated_at
  BEFORE UPDATE ON proveedores
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- =====================================================
-- RLS (patrón estándar: lectura pública de activos, escritura autenticada)
-- =====================================================
ALTER TABLE convocatorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE proveedores   ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "convocatorias_select_public" ON convocatorias;
CREATE POLICY "convocatorias_select_public"
  ON convocatorias FOR SELECT USING (activo = true);

DROP POLICY IF EXISTS "convocatorias_write_admin" ON convocatorias;
CREATE POLICY "convocatorias_write_admin"
  ON convocatorias FOR ALL TO authenticated USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "proveedores_select_public" ON proveedores;
CREATE POLICY "proveedores_select_public"
  ON proveedores FOR SELECT USING (activo = true);

DROP POLICY IF EXISTS "proveedores_write_admin" ON proveedores;
CREATE POLICY "proveedores_write_admin"
  ON proveedores FOR ALL TO authenticated USING (true) WITH CHECK (true);

GRANT ALL    ON convocatorias TO authenticated;
GRANT SELECT ON convocatorias TO anon;
GRANT ALL    ON proveedores   TO authenticated;
GRANT SELECT ON proveedores   TO anon;
