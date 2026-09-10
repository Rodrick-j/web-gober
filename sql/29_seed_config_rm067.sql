-- =====================================================
-- 29_seed_config_rm067.sql
-- Configuración global para cumplimiento RM 067/2025:
--   * enlaces_transparencia  -> redirecciones oficiales al Observatorio / SITPRECO S2+ (ítems 17, 19)
--   * contacto_oficial       -> añade fax, whatsapp, call_center (ítem 46) SIN pisar lo existente
-- EJECUTAR VIGESIMONOVENO en Supabase SQL Editor
-- =====================================================

-- La tabla ya existe en producción; se garantiza su forma por si se ejecuta en un entorno limpio.
CREATE TABLE IF NOT EXISTS configuracion_global (
  clave       TEXT PRIMARY KEY,
  valor       JSONB NOT NULL DEFAULT '{}'::jsonb,
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE configuracion_global ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "config_select_public" ON configuracion_global;
CREATE POLICY "config_select_public"
  ON configuracion_global FOR SELECT USING (true);

DROP POLICY IF EXISTS "config_write_admin" ON configuracion_global;
CREATE POLICY "config_write_admin"
  ON configuracion_global FOR ALL TO authenticated USING (true) WITH CHECK (true);

GRANT ALL    ON configuracion_global TO authenticated;
GRANT SELECT ON configuracion_global TO anon;

-- ── Enlaces oficiales de transparencia (Observatorio Ciudadano / SITPRECO S2+) ──
INSERT INTO configuracion_global (clave, valor) VALUES
  ('enlaces_transparencia', jsonb_build_object(
     'observatorio_url', 'https://observatorio.gob.bo/#/',
     'sitpreco_url',     'https://observatorio.gob.bo/#/',
     'rpc_url',          'https://observatorio.gob.bo/#/'
  ))
ON CONFLICT (clave) DO UPDATE
  -- se conservan los valores ya configurados; solo se rellenan las claves faltantes
  SET valor = jsonb_build_object(
        'observatorio_url', 'https://observatorio.gob.bo/#/',
        'sitpreco_url',     'https://observatorio.gob.bo/#/',
        'rpc_url',          'https://observatorio.gob.bo/#/'
      ) || configuracion_global.valor;

-- ── contacto_oficial: añade fax / whatsapp / call_center manteniendo lo existente ──
INSERT INTO configuracion_global (clave, valor) VALUES
  ('contacto_oficial', jsonb_build_object(
     'fax', '', 'whatsapp', '', 'call_center', ''
  ))
ON CONFLICT (clave) DO UPDATE
  SET valor = jsonb_build_object('fax', '', 'whatsapp', '', 'call_center', '')
              || configuracion_global.valor;
