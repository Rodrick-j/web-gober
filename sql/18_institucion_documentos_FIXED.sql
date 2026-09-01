-- Tabla para Documentos de Institución (Información Financiera, RRHH, etc.)
CREATE TABLE public.institucion_documentos (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    categoria VARCHAR(100) NOT NULL, -- Ej: 'informacion-financiera', 'recursos-humanos', 'contrataciones', etc.
    descripcion TEXT,
    archivo_url VARCHAR(1024) NOT NULL, -- URL del PDF
    fecha_publicacion DATE DEFAULT CURRENT_DATE,
    creado_en TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    creado_por UUID REFERENCES auth.users(id),
    activo BOOLEAN DEFAULT true
);

-- Políticas RLS para la tabla
ALTER TABLE public.institucion_documentos ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Documentos de institución visibles para todos" 
ON public.institucion_documentos FOR SELECT 
USING (activo = true);

CREATE POLICY "Solo administradores pueden modificar documentos de institución" 
ON public.institucion_documentos FOR ALL 
USING (
    EXISTS (
        SELECT 1 FROM public.usuarios_admin 
        WHERE id = auth.uid() AND (rol = 'super_admin' OR rol = 'secretaria_admin')
    )
);

-- Crear Storage Bucket para los PDFs si no existe
INSERT INTO storage.buckets (id, name, public) 
VALUES ('institucion_pdfs', 'institucion_pdfs', true)
ON CONFLICT (id) DO NOTHING;

-- Políticas Storage para institucion_pdfs
CREATE POLICY "PDFs de institución visibles para todos"
ON storage.objects FOR SELECT
USING (bucket_id = 'institucion_pdfs');

CREATE POLICY "Solo administradores pueden subir PDFs de institución"
ON storage.objects FOR INSERT
WITH CHECK (
    bucket_id = 'institucion_pdfs' AND 
    EXISTS (
        SELECT 1 FROM public.usuarios_admin 
        WHERE id = auth.uid() AND (rol = 'super_admin' OR rol = 'secretaria_admin')
    )
);

CREATE POLICY "Solo administradores pueden actualizar PDFs de institución"
ON storage.objects FOR UPDATE
USING (
    bucket_id = 'institucion_pdfs' AND 
    EXISTS (
        SELECT 1 FROM public.usuarios_admin 
        WHERE id = auth.uid() AND (rol = 'super_admin' OR rol = 'secretaria_admin')
    )
);

CREATE POLICY "Solo administradores pueden eliminar PDFs de institución"
ON storage.objects FOR DELETE
USING (
    bucket_id = 'institucion_pdfs' AND 
    EXISTS (
        SELECT 1 FROM public.usuarios_admin 
        WHERE id = auth.uid() AND (rol = 'super_admin' OR rol = 'secretaria_admin')
    )
);
