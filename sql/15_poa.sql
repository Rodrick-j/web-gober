-- =====================================================
-- 15_poa.sql
-- Plan Operativo Anual (POA) - Datos del Excel ORURO
-- EJECUTAR DECIMOQUINTO en Supabase SQL Editor
-- =====================================================

-- Tabla principal de ítems del POA
CREATE TABLE IF NOT EXISTS poa_items (
  id                UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

  -- Clasificación presupuestaria (del Excel)
  municipio         TEXT NOT NULL,              -- Municipio / Provincia
  gestion           INTEGER DEFAULT 2025,       -- Año de gestión
  prg               TEXT NOT NULL,              -- Programa (ej: "01", "02")
  proyecto          TEXT NOT NULL DEFAULT '0000', -- Código de proyecto
  actividad         TEXT NOT NULL,              -- Código de actividad
  tipo              TEXT NOT NULL DEFAULT 'GASTO CORRIENTE' CHECK (tipo IN ('GASTO CORRIENTE', 'INVERSION')),
  descripcion       TEXT NOT NULL,              -- Descripción del ítem

  -- Financiero
  monto_programado  NUMERIC(15,2) DEFAULT 0,    -- Presupuesto programado (BOB)
  monto_ejecutado   NUMERIC(15,2) DEFAULT 0,    -- Ejecutado real (se puede actualizar)
  avance_fisico     NUMERIC(5,2)  DEFAULT 0,    -- % avance físico (0-100)

  -- Secretaría responsable (null = toda la gobernación / planificación)
  secretaria_id     UUID REFERENCES secretarias(id) ON DELETE SET NULL,

  -- Control
  es_publico        BOOLEAN DEFAULT true,
  created_at        TIMESTAMPTZ DEFAULT NOW(),
  updated_at        TIMESTAMPTZ DEFAULT NOW()
);

-- Índices para consultas frecuentes
CREATE INDEX IF NOT EXISTS idx_poa_gestion       ON poa_items(gestion);
CREATE INDEX IF NOT EXISTS idx_poa_municipio     ON poa_items(municipio);
CREATE INDEX IF NOT EXISTS idx_poa_tipo          ON poa_items(tipo);
CREATE INDEX IF NOT EXISTS idx_poa_secretaria    ON poa_items(secretaria_id);
CREATE INDEX IF NOT EXISTS idx_poa_prg_proyecto  ON poa_items(prg, proyecto, actividad);

-- Trigger para updated_at automático
DROP TRIGGER IF EXISTS trg_poa_items_updated_at ON poa_items;
CREATE TRIGGER trg_poa_items_updated_at
  BEFORE UPDATE ON poa_items
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Vista útil: resumen del POA por tipo y municipio
CREATE OR REPLACE VIEW poa_resumen_municipio AS
SELECT
  gestion,
  municipio,
  tipo,
  COUNT(*)                          AS cantidad_items,
  SUM(monto_programado)             AS total_programado,
  SUM(monto_ejecutado)              AS total_ejecutado,
  ROUND(
    CASE WHEN SUM(monto_programado) > 0
         THEN (SUM(monto_ejecutado) / SUM(monto_programado)) * 100
         ELSE 0
    END, 2
  )                                 AS porcentaje_ejecucion
FROM poa_items
WHERE es_publico = true
GROUP BY gestion, municipio, tipo
ORDER BY gestion DESC, municipio;

-- Vista útil: resumen global del POA
CREATE OR REPLACE VIEW poa_resumen_global AS
SELECT
  gestion,
  COUNT(*)                          AS total_items,
  SUM(CASE WHEN tipo = 'INVERSION' THEN monto_programado ELSE 0 END) AS total_inversion_programado,
  SUM(CASE WHEN tipo = 'INVERSION' THEN monto_ejecutado  ELSE 0 END) AS total_inversion_ejecutado,
  SUM(CASE WHEN tipo = 'GASTO CORRIENTE' THEN monto_programado ELSE 0 END) AS total_corriente_programado,
  SUM(CASE WHEN tipo = 'GASTO CORRIENTE' THEN monto_ejecutado  ELSE 0 END) AS total_corriente_ejecutado,
  SUM(monto_programado)             AS total_programado,
  SUM(monto_ejecutado)              AS total_ejecutado
FROM poa_items
WHERE es_publico = true
GROUP BY gestion
ORDER BY gestion DESC;

-- RLS: habilitar seguridad a nivel de fila
ALTER TABLE poa_items ENABLE ROW LEVEL SECURITY;

-- Política: público solo ve ítems públicos
DROP POLICY IF EXISTS "poa_items_select_public" ON poa_items;
CREATE POLICY "poa_items_select_public"
  ON poa_items FOR SELECT
  USING (es_publico = true);

-- Política: admins autenticados ven TODO (incluyendo no públicos)
DROP POLICY IF EXISTS "poa_items_select_admin" ON poa_items;
CREATE POLICY "poa_items_select_admin"
  ON poa_items FOR SELECT
  TO authenticated
  USING (true);

DROP POLICY IF EXISTS "poa_items_insert_admin" ON poa_items;
CREATE POLICY "poa_items_insert_admin"
  ON poa_items FOR INSERT
  TO authenticated
  WITH CHECK (true);

DROP POLICY IF EXISTS "poa_items_update_admin" ON poa_items;
CREATE POLICY "poa_items_update_admin"
  ON poa_items FOR UPDATE
  TO authenticated
  USING (true);

DROP POLICY IF EXISTS "poa_items_delete_admin" ON poa_items;
CREATE POLICY "poa_items_delete_admin"
  ON poa_items FOR DELETE
  TO authenticated
  USING (true);

-- GRANTS: dar acceso a las vistas y tabla a los roles de Supabase
GRANT SELECT ON poa_resumen_municipio TO anon, authenticated;
GRANT SELECT ON poa_resumen_global    TO anon, authenticated;
GRANT ALL    ON poa_items             TO authenticated;
GRANT SELECT ON poa_items             TO anon;

