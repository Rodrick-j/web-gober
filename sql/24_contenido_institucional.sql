-- =====================================================
-- 24_contenido_institucional.sql
-- Bloques de contenido institucional editables (singleton por clave)
-- Cumplimiento RM 067/2025 — Lineamientos de Contenidos Mínimos (VTILCC-L01)
-- Cubre: Misión, Visión, Valores y Principios, Objetivos Institucionales,
--        Reseña Histórica, Memoria Institucional, Unidad de Transparencia,
--        Encargado de mensajes, Organigrama (archivo oficial).
-- EJECUTAR VIGESIMOCUARTO en Supabase SQL Editor
-- =====================================================

CREATE TABLE IF NOT EXISTS contenido_institucional (
  clave           TEXT PRIMARY KEY,               -- 'mision', 'vision', 'valores_principios', ...
  titulo          TEXT,                           -- Título visible de la sección
  cuerpo          TEXT,                           -- Contenido HTML (RichTextEditor)
  archivo_url     TEXT,                           -- PDF / imagen opcional (organigrama, memoria)
  extra           JSONB DEFAULT '{}'::jsonb,      -- Campos sueltos (contacto, responsable, etc.)
  actualizado_en  TIMESTAMPTZ DEFAULT NOW(),
  actualizado_por UUID REFERENCES auth.users(id) ON DELETE SET NULL
);

-- Trigger: mantener actualizado_en
CREATE OR REPLACE FUNCTION touch_contenido_institucional()
RETURNS TRIGGER AS $$
BEGIN
  NEW.actualizado_en = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_contenido_institucional_touch ON contenido_institucional;
CREATE TRIGGER trg_contenido_institucional_touch
  BEFORE UPDATE ON contenido_institucional
  FOR EACH ROW EXECUTE FUNCTION touch_contenido_institucional();

-- =====================================================
-- Filas semilla (una por bloque exigido). ON CONFLICT DO NOTHING para ser
-- re-ejecutable sin pisar contenido ya editado desde el panel.
-- =====================================================
INSERT INTO contenido_institucional (clave, titulo, cuerpo) VALUES
  ('mision', 'Misión',
   '<p>Promover, estimular y coordinar la construcción colectiva del desarrollo productivo, humano, social, económico, territorial, y la protección de los principios derechos y deberes para mejorar el bienestar y calidad de vida de la población, suministrando a los sectores, mediante la ejecución de proyectos y programas de una manera oportuna, eficiente, equitativa y con calidad según competencias que determine la ley con el uso eficiente y transparente de los recursos públicos en alianza con la iniciativa privada, facilitando nuevos procesos productivos.</p>'),
  ('vision', 'Visión',
   '<p>Gobierno Autónomo Departamental de Oruro, una entidad pública autónoma con identidad propia, que planifica, inicia, ejecuta políticas, planes, programas y proyectos promoviendo la construcción colectiva del desarrollo productivo, económico, social, comunitario y territorial del departamento de Oruro articulando el desarrollo con alianzas estratégicas institucionales.</p>'),
  ('valores_principios', 'Valores y Principios',
   '<p>Complete desde el panel administrativo los valores y principios institucionales del Gobierno Autónomo Departamental de Oruro.</p>'),
  ('objetivos_institucionales', 'Objetivos Institucionales',
   '<p>Complete desde el panel administrativo los objetivos institucionales, redactados en infinitivo y medibles en el tiempo, en concordancia con el Plan Estratégico Institucional.</p>'),
  ('resena_historica', 'Reseña Histórica',
   '<p>Complete desde el panel administrativo la reseña histórica de la institución: hitos de cambio y evolución orgánica y funcional.</p>'),
  ('memoria_institucional', 'Memoria Institucional / Informe de Gestión',
   '<p>Publique la Memoria Institucional o Informe de Gestión con resultados, ejecución presupuestaria y logros estratégicos. Adjunte el documento oficial.</p>'),
  ('unidad_transparencia', 'Unidad de Transparencia y Lucha Contra la Corrupción',
   '<p>La Unidad de Transparencia y Lucha Contra la Corrupción (UTLCC), en el marco de la Ley N° 974, es responsable de gestionar las denuncias por actos de corrupción y de llevar adelante las políticas de transparencia institucional.</p><p>Complete desde el panel: responsable, datos de contacto, ubicación y funciones.</p>'),
  ('encargado_mensajes', 'Atención a la Ciudadanía',
   '<p>Complete desde el panel el nombre y datos del o los responsables de recibir y contestar los mensajes, llamadas y consultas de la ciudadanía.</p>'),
  ('organigrama_archivo', 'Organigrama Institucional',
   '<p>Suba desde el panel el organigrama oficial aprobado (imagen o PDF).</p>')
ON CONFLICT (clave) DO NOTHING;

-- =====================================================
-- RLS
-- =====================================================
ALTER TABLE contenido_institucional ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "contenido_inst_select_public" ON contenido_institucional;
CREATE POLICY "contenido_inst_select_public"
  ON contenido_institucional FOR SELECT
  USING (true);

DROP POLICY IF EXISTS "contenido_inst_write_admin" ON contenido_institucional;
CREATE POLICY "contenido_inst_write_admin"
  ON contenido_institucional FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- GRANTS
GRANT ALL    ON contenido_institucional TO authenticated;
GRANT SELECT ON contenido_institucional TO anon;
