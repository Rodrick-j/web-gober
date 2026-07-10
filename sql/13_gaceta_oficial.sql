                -- =====================================================
-- 13_gaceta_oficial.sql
-- Tabla para el Portal Normativo (Gaceta Oficial)
-- =====================================================

CREATE TYPE tipo_gaceta AS ENUM (
  'leyes',
  'decretos-departamentales',
  'decretos-ejecutivos',
  'resoluciones'
);

CREATE TABLE IF NOT EXISTS gaceta_oficial (
  id                  UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tipo                tipo_gaceta NOT NULL,
  
  numero_documento    TEXT NOT NULL,               -- e.g., "Ley Nº 045/2026"
  anio                INTEGER NOT NULL,            -- e.g., 2026
  titulo              TEXT NOT NULL,               -- e.g., "Ley Departamental de Cultura"
  descripcion         TEXT,                        -- Resumen opcional
  
  fecha_publicacion   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  archivo_pdf_url     TEXT,                        -- Link to Supabase Storage / Cloudinary
  
  -- Estado y publicación
  estado              TEXT DEFAULT 'publicado',
  
  -- Auditoría
  created_at          TIMESTAMPTZ DEFAULT NOW(),
  updated_at          TIMESTAMPTZ DEFAULT NOW()
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_gaceta_tipo ON gaceta_oficial(tipo);
CREATE INDEX IF NOT EXISTS idx_gaceta_anio ON gaceta_oficial(anio DESC);
CREATE INDEX IF NOT EXISTS idx_gaceta_fecha ON gaceta_oficial(fecha_publicacion DESC);

-- Búsqueda Full-Text
CREATE INDEX IF NOT EXISTS idx_gaceta_fts ON gaceta_oficial
  USING GIN(to_tsvector('spanish', coalesce(numero_documento,'') || ' ' || coalesce(titulo,'') || ' ' || coalesce(descripcion,'')));

-- Triggers
CREATE TRIGGER trg_gaceta_updated_at
  BEFORE UPDATE ON gaceta_oficial
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Insertar Datos de Prueba (Seed)
INSERT INTO gaceta_oficial (tipo, numero_documento, anio, titulo, descripcion, fecha_publicacion, archivo_pdf_url)
VALUES 
  ('leyes', 'Ley Nº 045', 2026, 'Ley de Promoción del Turismo Departamental', 'Fomento y regulación de las actividades turísticas en Oruro.', '2026-05-10', '#'),
  ('leyes', 'Ley Nº 044', 2026, 'Ley de Protección del Medio Ambiente', 'Medidas para preservar la cuenca del lago Poopó.', '2026-03-22', '#'),
  ('leyes', 'Ley Nº 043', 2025, 'Ley del Deporte Orureño', 'Incentivos para deportistas destacados a nivel internacional.', '2025-11-15', '#'),
  ('leyes', 'Ley Nº 042', 2025, 'Ley de Presupuesto 2026', 'Aprobación del presupuesto general del departamento.', '2025-10-01', '#'),
  ('leyes', 'Ley Nº 041', 2024, 'Ley de Fomento a la Quinua', 'Protección de los productores de Quinua Real.', '2024-08-10', '#'),
  
  ('decretos-departamentales', 'Dec. Dep. 012/2026', 2026, 'Reglamento de Transporte Interprovincial', 'Regulación de tarifas y rutas.', '2026-04-05', '#'),
  ('decretos-departamentales', 'Dec. Dep. 011/2026', 2026, 'Emergencia Sanitaria', 'Declaración de alerta por brote estacional.', '2026-02-18', '#'),
  
  ('decretos-ejecutivos', 'Dec. Eje. 008', 2026, 'Designación de Secretarios', 'Nombramiento de gabinete.', '2026-05-05', '#'),
  
  ('resoluciones', 'Res. Adm. 088/2026', 2026, 'Aprobación de Planimetría', 'Distrito 4 de la capital.', '2026-06-01', '#')
ON CONFLICT DO NOTHING;
