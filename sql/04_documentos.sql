-- =====================================================
-- 04_documentos.sql
-- Gaceta Oficial: Leyes, Decretos y Resoluciones
-- EJECUTAR CUARTO
-- =====================================================

CREATE TYPE tipo_documento AS ENUM (
  'ley_departamental',
  'decreto_departamental',
  'decreto_ejecutivo',
  'resolucion_administrativa',
  'resolucion_secretarial',
  'convenio',
  'contrato',
  'otro'
);

CREATE TYPE estado_documento AS ENUM (
  'vigente',
  'derogado',
  'modificado',
  'suspendido'
);

CREATE TABLE IF NOT EXISTS documentos (
  id                  UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  secretaria_id       UUID REFERENCES secretarias(id) ON DELETE SET NULL,
  
  -- Identificación del documento
  tipo                tipo_documento NOT NULL,
  numero              TEXT NOT NULL,                -- "N°290", "EJ-042", "165-B/2026"
  titulo              TEXT NOT NULL,
  descripcion         TEXT,
  
  -- Archivo
  archivo_url         TEXT,                         -- Supabase Storage URL (PDF)
  archivo_nombre      TEXT,                         -- Nombre original del archivo
  archivo_tamano_kb   INTEGER,                      -- Tamaño en KB
  paginas             INTEGER,                      -- Número de páginas del PDF
  
  -- Clasificación
  estado_doc          estado_documento DEFAULT 'vigente',
  es_gaceta_oficial   BOOLEAN DEFAULT false,         -- Aparece en sección Gaceta
  fecha_publicacion   DATE NOT NULL,
  fecha_vigencia      DATE,                         -- Desde cuándo entra en vigencia
  
  -- Relacionados
  deroga_a            UUID[],                        -- IDs de documentos derogados por este
  modifica_a          UUID[],                        -- IDs de documentos modificados
  
  -- Visibilidad
  es_publico          BOOLEAN DEFAULT true,
  vistas              INTEGER DEFAULT 0,
  descargas           INTEGER DEFAULT 0,
  
  -- SEO
  tags                TEXT[],
  
  created_at          TIMESTAMPTZ DEFAULT NOW(),
  updated_at          TIMESTAMPTZ DEFAULT NOW()
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_documentos_tipo ON documentos(tipo);
CREATE INDEX IF NOT EXISTS idx_documentos_secretaria ON documentos(secretaria_id);
CREATE INDEX IF NOT EXISTS idx_documentos_fecha ON documentos(fecha_publicacion DESC);
CREATE INDEX IF NOT EXISTS idx_documentos_gaceta ON documentos(es_gaceta_oficial) WHERE es_gaceta_oficial = true;
CREATE INDEX IF NOT EXISTS idx_documentos_numero ON documentos(numero);

-- FTS
CREATE INDEX IF NOT EXISTS idx_documentos_fts ON documentos
  USING GIN(to_tsvector('spanish', coalesce(titulo,'') || ' ' || coalesce(descripcion,'')));

-- Trigger updated_at
CREATE TRIGGER trg_documentos_updated_at
  BEFORE UPDATE ON documentos
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
