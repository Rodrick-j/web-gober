-- =====================================================
-- 26_solicitudes_ciudadanas.sql
-- Solicitudes de Información Pública y registro de respuestas enviadas.
-- Cumplimiento RM 067/2025 — bloque Transparencia (ítem 18) y
-- bloque Medios de Contacto (ítems 43 "encargado de contestar" y 44 "registro de respuestas").
-- EJECUTAR VIGESIMOSEXTO en Supabase SQL Editor
-- =====================================================

CREATE TABLE IF NOT EXISTS solicitudes_ciudadanas (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

  tipo            TEXT NOT NULL DEFAULT 'solicitud_informacion'
                    CHECK (tipo IN ('solicitud_informacion','consulta','reclamo','sugerencia')),

  -- Datos del solicitante
  nombre          TEXT NOT NULL,
  documento_id    TEXT,                            -- CI / NIT (opcional)
  email           TEXT,
  telefono        TEXT,

  -- Contenido de la solicitud
  asunto          TEXT NOT NULL,
  detalle         TEXT NOT NULL,

  -- Gestión interna (registro de respuestas enviadas)
  estado          TEXT NOT NULL DEFAULT 'recibida'
                    CHECK (estado IN ('recibida','en_proceso','respondida','rechazada')),
  encargado       TEXT,                            -- nombre del servidor público responsable
  respuesta       TEXT,                            -- texto de la respuesta enviada
  respondido_por  UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  respondido_en   TIMESTAMPTZ,

  -- anti-spam / trazabilidad
  origen          TEXT DEFAULT 'web',

  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_solicitudes_estado ON solicitudes_ciudadanas(estado);
CREATE INDEX IF NOT EXISTS idx_solicitudes_tipo   ON solicitudes_ciudadanas(tipo);
CREATE INDEX IF NOT EXISTS idx_solicitudes_fecha  ON solicitudes_ciudadanas(created_at DESC);

DROP TRIGGER IF EXISTS trg_solicitudes_updated_at ON solicitudes_ciudadanas;
CREATE TRIGGER trg_solicitudes_updated_at
  BEFORE UPDATE ON solicitudes_ciudadanas
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- =====================================================
-- RLS
--  - Cualquiera (anon) puede CREAR una solicitud desde el formulario web.
--  - Solo administradores autenticados pueden LEER / GESTIONAR (contienen datos personales).
-- =====================================================
ALTER TABLE solicitudes_ciudadanas ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "solicitudes_insert_publico" ON solicitudes_ciudadanas;
CREATE POLICY "solicitudes_insert_publico"
  ON solicitudes_ciudadanas FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

DROP POLICY IF EXISTS "solicitudes_select_admin" ON solicitudes_ciudadanas;
CREATE POLICY "solicitudes_select_admin"
  ON solicitudes_ciudadanas FOR SELECT
  TO authenticated
  USING (true);

DROP POLICY IF EXISTS "solicitudes_update_admin" ON solicitudes_ciudadanas;
CREATE POLICY "solicitudes_update_admin"
  ON solicitudes_ciudadanas FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

DROP POLICY IF EXISTS "solicitudes_delete_admin" ON solicitudes_ciudadanas;
CREATE POLICY "solicitudes_delete_admin"
  ON solicitudes_ciudadanas FOR DELETE
  TO authenticated
  USING (true);

-- GRANTS. anon solo puede insertar, nunca leer
GRANT INSERT ON solicitudes_ciudadanas TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON solicitudes_ciudadanas TO authenticated;
