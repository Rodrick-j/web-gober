-- =====================================================
-- 06_galeria.sql
-- Galería multimedia por secretaría
-- EJECUTAR SEXTO
-- =====================================================

CREATE TYPE tipo_media AS ENUM ('imagen', 'video_youtube');

CREATE TABLE IF NOT EXISTS galeria (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  secretaria_id   UUID NOT NULL REFERENCES secretarias(id) ON DELETE CASCADE,
  
  -- Tipo de media
  tipo            tipo_media NOT NULL,
  
  -- Si es imagen (Cloudinary)
  imagen_url      TEXT,                              -- URL completa de Cloudinary
  imagen_ancho    INTEGER,
  imagen_alto     INTEGER,
  
  -- Si es video (YouTube)
  youtube_url     TEXT,                              -- URL del video de YouTube
  youtube_id      TEXT,                              -- ID del video (para embed)
  duracion        TEXT,                              -- "3:45", "1:22:00"
  
  -- Metadata
  titulo          TEXT NOT NULL,
  descripcion     TEXT,
  evento          TEXT,                              -- "Inauguración Hospital", "Carnaval 2026"
  fecha_evento    DATE,
  
  -- Control
  orden           INTEGER DEFAULT 0,
  es_destacado    BOOLEAN DEFAULT false,
  activo          BOOLEAN DEFAULT true,
  
  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_galeria_secretaria ON galeria(secretaria_id);
CREATE INDEX IF NOT EXISTS idx_galeria_tipo ON galeria(tipo);
CREATE INDEX IF NOT EXISTS idx_galeria_destacado ON galeria(es_destacado) WHERE es_destacado = true;
CREATE INDEX IF NOT EXISTS idx_galeria_orden ON galeria(orden ASC);

-- Trigger updated_at
CREATE TRIGGER trg_galeria_updated_at
  BEFORE UPDATE ON galeria
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
