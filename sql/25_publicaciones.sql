-- =====================================================
-- 25_publicaciones.sql
-- Publicaciones institucionales: publicaciones, boletines, revistas,
-- artículos, banco de trabajos de investigación, campañas y actividades.
-- Cumplimiento RM 067/2025 — bloque Comunicación (ítems 24 a 29)
-- EJECUTAR VIGESIMOQUINTO en Supabase SQL Editor
-- =====================================================

CREATE TABLE IF NOT EXISTS publicaciones (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

  tipo            TEXT NOT NULL DEFAULT 'publicacion'
                    CHECK (tipo IN ('publicacion','boletin','revista','articulo','investigacion','campania')),

  titulo          TEXT NOT NULL,
  descripcion     TEXT,
  archivo_url     TEXT,                            -- PDF (documentos-pdf)
  imagen_url      TEXT,                            -- portada opcional (imagenes)
  enlace_externo  TEXT,                            -- si el contenido vive fuera del portal

  fecha           DATE DEFAULT CURRENT_DATE,       -- fecha de la publicación (orden cronológico)
  autor           TEXT,

  es_destacada    BOOLEAN DEFAULT false,
  activo          BOOLEAN DEFAULT true,

  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_publicaciones_tipo   ON publicaciones(tipo);
CREATE INDEX IF NOT EXISTS idx_publicaciones_fecha  ON publicaciones(fecha DESC);
CREATE INDEX IF NOT EXISTS idx_publicaciones_activo ON publicaciones(activo) WHERE activo = true;

DROP TRIGGER IF EXISTS trg_publicaciones_updated_at ON publicaciones;
CREATE TRIGGER trg_publicaciones_updated_at
  BEFORE UPDATE ON publicaciones
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- =====================================================
-- RLS
-- =====================================================
ALTER TABLE publicaciones ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "publicaciones_select_public" ON publicaciones;
CREATE POLICY "publicaciones_select_public"
  ON publicaciones FOR SELECT
  USING (activo = true);

DROP POLICY IF EXISTS "publicaciones_write_admin" ON publicaciones;
CREATE POLICY "publicaciones_write_admin"
  ON publicaciones FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

GRANT ALL    ON publicaciones TO authenticated;
GRANT SELECT ON publicaciones TO anon;
