-- =====================================================
-- 05_proyectos.sql
-- Proyectos de inversión y obras por secretaría
-- EJECUTAR QUINTO
-- =====================================================

CREATE TYPE estado_proyecto AS ENUM (
  'planificacion',
  'licitacion',
  'en_ejecucion',
  'paralizado',
  'completado',
  'cancelado'
);

CREATE TABLE IF NOT EXISTS proyectos (
  id                  UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  secretaria_id       UUID NOT NULL REFERENCES secretarias(id) ON DELETE CASCADE,
  
  -- Información del proyecto
  nombre              TEXT NOT NULL,
  codigo              TEXT,                          -- Código interno de referencia
  descripcion         TEXT,
  objetivo            TEXT,
  beneficiarios       TEXT,                          -- "80,000 habitantes de Challapata"
  ubicacion           TEXT,                          -- Municipio / Provincia
  
  -- Financiero
  presupuesto_total   NUMERIC(15,2),                 -- En bolivianos (BOB)
  presupuesto_ejecutado NUMERIC(15,2) DEFAULT 0,
  fuente_financiamiento TEXT,                        -- "Recursos propios", "Banco Mundial", etc.
  
  -- Estado y fechas
  estado              estado_proyecto DEFAULT 'planificacion',
  avance_porcentaje   INTEGER DEFAULT 0 CHECK (avance_porcentaje BETWEEN 0 AND 100),
  fecha_inicio        DATE,
  fecha_fin_planificada DATE,
  fecha_fin_real      DATE,
  
  -- Media
  imagen_url          TEXT,                          -- Cloudinary
  galeria_urls        TEXT[],
  
  -- Visibilidad
  es_destacado        BOOLEAN DEFAULT false,
  es_publico          BOOLEAN DEFAULT true,
  
  created_at          TIMESTAMPTZ DEFAULT NOW(),
  updated_at          TIMESTAMPTZ DEFAULT NOW()
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_proyectos_secretaria ON proyectos(secretaria_id);
CREATE INDEX IF NOT EXISTS idx_proyectos_estado ON proyectos(estado);
CREATE INDEX IF NOT EXISTS idx_proyectos_destacado ON proyectos(es_destacado) WHERE es_destacado = true;

-- Trigger updated_at
CREATE TRIGGER trg_proyectos_updated_at
  BEFORE UPDATE ON proyectos
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
