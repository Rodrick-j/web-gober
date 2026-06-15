-- =====================================================
-- 11_storage_buckets.sql
-- Configuración de buckets de almacenamiento
-- EJECUTAR UNDÉCIMO
-- En Supabase: Dashboard → Storage → New Bucket
-- O ejecuta esto en el SQL Editor
-- =====================================================

-- Bucket para documentos PDF (privado — requiere autenticación para subir)
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'documentos-pdf',
  'documentos-pdf',
  true,                                    -- Público para descarga
  10485760,                                -- Máximo 10 MB por PDF
  ARRAY['application/pdf']
) ON CONFLICT (id) DO NOTHING;

-- Bucket para imágenes de secretarías (banners, fotos de secretarios)
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'imagenes',
  'imagenes',
  true,                                    -- Público para mostrar en la web
  5242880,                                 -- Máximo 5 MB
  ARRAY['image/jpeg', 'image/png', 'image/webp', 'image/gif']
) ON CONFLICT (id) DO NOTHING;

-- =====================================================
-- POLÍTICAS DE STORAGE
-- =====================================================

-- PDFs: cualquiera puede descargar
CREATE POLICY "Descarga pública de PDFs"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'documentos-pdf');

-- PDFs: solo admins autenticados pueden subir
CREATE POLICY "Solo admins suben PDFs"
  ON storage.objects FOR INSERT
  TO authenticated
  WITH CHECK (
    bucket_id = 'documentos-pdf'
    AND EXISTS (
      SELECT 1 FROM usuarios_admin
      WHERE auth_user_id = auth.uid() AND activo = true
    )
  );

-- PDFs: solo admins pueden eliminar
CREATE POLICY "Solo admins eliminan PDFs"
  ON storage.objects FOR DELETE
  TO authenticated
  USING (
    bucket_id = 'documentos-pdf'
    AND EXISTS (
      SELECT 1 FROM usuarios_admin
      WHERE auth_user_id = auth.uid() AND activo = true
    )
  );

-- Imágenes: lectura pública
CREATE POLICY "Lectura pública de imágenes"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'imagenes');

-- Imágenes: solo admins suben
CREATE POLICY "Solo admins suben imágenes"
  ON storage.objects FOR INSERT
  TO authenticated
  WITH CHECK (
    bucket_id = 'imagenes'
    AND EXISTS (
      SELECT 1 FROM usuarios_admin
      WHERE auth_user_id = auth.uid() AND activo = true
    )
  );
