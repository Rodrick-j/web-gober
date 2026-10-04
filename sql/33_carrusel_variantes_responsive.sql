-- =====================================================
-- 33_carrusel_variantes_responsive.sql
-- Tablet image variant and schema synchronization
-- =====================================================

ALTER TABLE public.banners_inicio
  ADD COLUMN IF NOT EXISTS imagen_movil_url TEXT,
  ADD COLUMN IF NOT EXISTS imagen_tablet_url TEXT,
  ADD COLUMN IF NOT EXISTS animacion_texto TEXT DEFAULT 'fade-in',
  ADD COLUMN IF NOT EXISTS animacion_carrusel TEXT DEFAULT 'creative';

COMMENT ON COLUMN public.banners_inicio.imagen_tablet_url IS
  'Optional vertical banner URL used on portrait tablets between 769px and 1100px.';

-- Hace que PostgREST reconozca inmediatamente la nueva columna en Supabase.
NOTIFY pgrst, 'reload schema';
