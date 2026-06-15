-- =====================================================
-- 13_carrusel_inicio.sql
-- Tabla para los banners principales del Home (Hero Slider)
-- =====================================================

CREATE TABLE IF NOT EXISTS banners_inicio (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  titulo          TEXT,                          -- Opcional, para accesibilidad o texto flotante
  imagen_url      TEXT NOT NULL,                 -- URL de la imagen en Supabase Storage
  enlace_url      TEXT,                          -- Opcional, si al hacer clic debe llevar a una noticia o página
  orden           INTEGER DEFAULT 0,             -- 1 sale primero, 2 después, etc.
  activo          BOOLEAN DEFAULT true,          -- Para ocultar sin borrar
  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Índices
CREATE INDEX IF NOT EXISTS idx_banners_activo ON banners_inicio(activo);
CREATE INDEX IF NOT EXISTS idx_banners_orden ON banners_inicio(orden);

-- Trigger para updated_at
CREATE TRIGGER trg_banners_updated_at
  BEFORE UPDATE ON banners_inicio
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Políticas RLS (Row Level Security)
ALTER TABLE banners_inicio ENABLE ROW LEVEL SECURITY;

-- Lectura pública
CREATE POLICY "Lectura pública de banners"
  ON banners_inicio FOR SELECT
  USING (true);

-- Modificación solo para super_admin (o admins en general, ajusta según necesites)
CREATE POLICY "Admins gestionan banners"
  ON banners_inicio FOR ALL
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios_admin 
      WHERE auth_user_id = auth.uid() AND activo = true
    )
  );
