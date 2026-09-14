-- =====================================================
-- 14_configuracion_global.sql
-- Tabla central de configuración dinámica del portal.
-- Almacena pares clave/valor en JSONB para que el
-- front‑end los lea sin necesidad de un deploy.
-- EJECUTAR DECIMOCUARTO en Supabase SQL Editor
-- =====================================================

-- ── Tabla principal ──────────────────────────────────
CREATE TABLE IF NOT EXISTS configuracion_global (
  clave       TEXT PRIMARY KEY,
  valor       JSONB NOT NULL DEFAULT '{}'::jsonb,
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Actualizar updated_at automáticamente en cada cambio
CREATE OR REPLACE FUNCTION _set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_configuracion_global_updated_at ON configuracion_global;
CREATE TRIGGER trg_configuracion_global_updated_at
  BEFORE UPDATE ON configuracion_global
  FOR EACH ROW EXECUTE FUNCTION _set_updated_at();

-- ── Seguridad Row Level Security ─────────────────────
ALTER TABLE configuracion_global ENABLE ROW LEVEL SECURITY;

-- Lectura pública (anon y authenticated)
DROP POLICY IF EXISTS "config_select_public" ON configuracion_global;
CREATE POLICY "config_select_public"
  ON configuracion_global FOR SELECT USING (true);

-- Escritura solo para usuarios autenticados (admin)
DROP POLICY IF EXISTS "config_write_admin" ON configuracion_global;
CREATE POLICY "config_write_admin"
  ON configuracion_global FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

GRANT ALL    ON configuracion_global TO authenticated;
GRANT SELECT ON configuracion_global TO anon;

-- ── Datos iniciales ───────────────────────────────────
INSERT INTO configuracion_global (clave, valor) VALUES
  ('ticker_noticias',  '{"velocidad_segundos": 60, "mensajes": []}'::jsonb),
  ('redes_sociales',   '{"facebook": "", "twitter": "", "youtube": "", "instagram": "", "tiktok": ""}'::jsonb),
  ('comunicado_popup', '{"activo": false, "imagen_url": "", "enlace": ""}'::jsonb),
  ('video_inicio',     '{"urls": []}'::jsonb),
  ('contacto_oficial', '{"direccion": "", "telefono": "", "call_center": "", "fax": "", "whatsapp": "", "email": "", "latitud": null, "longitud": null}'::jsonb),
  ('enlaces_transparencia', '{"observatorio_url": "", "sitpreco_url": "", "rpc_url": ""}'::jsonb)
ON CONFLICT (clave) DO NOTHING;
