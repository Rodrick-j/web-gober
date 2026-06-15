-- =====================================================
-- 03_noticias.sql
-- Tabla de noticias por secretaría
-- EJECUTAR TERCERO
-- =====================================================

CREATE TYPE estado_noticia AS ENUM ('borrador', 'publicado', 'archivado');
CREATE TYPE categoria_noticia AS ENUM (
  'institucional',
  'infraestructura',
  'educacion',
  'salud',
  'economia',
  'cultura',
  'medio_ambiente',
  'social',
  'juridico',
  'mineria',
  'planificacion',
  'general'
);

CREATE TABLE IF NOT EXISTS noticias (
  id                  UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  secretaria_id       UUID REFERENCES secretarias(id) ON DELETE CASCADE,
  
  -- Contenido
  titulo              TEXT NOT NULL,
  slug                TEXT UNIQUE NOT NULL,          -- URL amigable auto-generada
  resumen             TEXT,                          -- Párrafo corto para la portada
  contenido           TEXT,                          -- Cuerpo completo (HTML o Markdown)
  
  -- Media
  imagen_portada_url  TEXT,                          -- Cloudinary URL
  imagen_alt          TEXT,
  galeria_urls        TEXT[],                        -- Array de URLs de imágenes adicionales
  video_youtube_url   TEXT,                          -- Link de YouTube (opcional)
  
  -- Clasificación
  categoria           categoria_noticia DEFAULT 'general',
  tags                TEXT[],                        -- ["carnaval", "cultura", "turismo"]
  
  -- Estado y publicación
  estado              estado_noticia DEFAULT 'borrador',
  es_destacada        BOOLEAN DEFAULT false,          -- Aparece en la portada
  es_urgente          BOOLEAN DEFAULT false,          -- Ticker de noticias EN VIVO
  fecha_publicacion   TIMESTAMPTZ,                   -- NULL = se publica al cambiar estado
  fecha_expiracion    TIMESTAMPTZ,                   -- NULL = no expira
  
  -- SEO
  meta_titulo         TEXT,
  meta_descripcion    TEXT,
  
  -- Métricas
  vistas              INTEGER DEFAULT 0,
  
  -- Autoría
  autor_id            UUID,                          -- Referencia a usuarios_admin
  autor_nombre        TEXT,                          -- Nombre para mostrar
  
  created_at          TIMESTAMPTZ DEFAULT NOW(),
  updated_at          TIMESTAMPTZ DEFAULT NOW()
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_noticias_secretaria ON noticias(secretaria_id);
CREATE INDEX IF NOT EXISTS idx_noticias_estado ON noticias(estado);
CREATE INDEX IF NOT EXISTS idx_noticias_fecha ON noticias(fecha_publicacion DESC);
CREATE INDEX IF NOT EXISTS idx_noticias_destacada ON noticias(es_destacada) WHERE es_destacada = true;
CREATE INDEX IF NOT EXISTS idx_noticias_slug ON noticias(slug);

-- Búsqueda de texto completo
CREATE INDEX IF NOT EXISTS idx_noticias_fts ON noticias
  USING GIN(to_tsvector('spanish', coalesce(titulo,'') || ' ' || coalesce(resumen,'') || ' ' || coalesce(contenido,'')));

-- Trigger updated_at
CREATE TRIGGER trg_noticias_updated_at
  BEFORE UPDATE ON noticias
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
