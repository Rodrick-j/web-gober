-- =====================================================
-- 08_rls_policies.sql
-- Row Level Security — Seguridad por filas
-- Cada secretaría solo ve y edita su propio contenido
-- EJECUTAR OCTAVO
-- =====================================================

-- Habilitar RLS en todas las tablas
ALTER TABLE secretarias       ENABLE ROW LEVEL SECURITY;
ALTER TABLE noticias          ENABLE ROW LEVEL SECURITY;
ALTER TABLE documentos        ENABLE ROW LEVEL SECURITY;
ALTER TABLE proyectos         ENABLE ROW LEVEL SECURITY;
ALTER TABLE galeria           ENABLE ROW LEVEL SECURITY;
ALTER TABLE usuarios_admin    ENABLE ROW LEVEL SECURITY;

-- =====================================================
-- FUNCIÓN HELPER: obtener el rol del usuario actual
-- =====================================================
CREATE OR REPLACE FUNCTION get_mi_rol()
RETURNS rol_admin AS $$
  SELECT rol FROM usuarios_admin
  WHERE auth_user_id = auth.uid()
  LIMIT 1;
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- FUNCIÓN HELPER: obtener la secretaría del usuario actual
CREATE OR REPLACE FUNCTION get_mi_secretaria_id()
RETURNS UUID AS $$
  SELECT secretaria_id FROM usuarios_admin
  WHERE auth_user_id = auth.uid()
  LIMIT 1;
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- =====================================================
-- POLÍTICAS: secretarias
-- =====================================================

-- Todos pueden VER secretarías activas (portal público)
CREATE POLICY "Lectura pública de secretarías activas"
  ON secretarias FOR SELECT
  USING (activo = true);

-- Admins autenticados pueden ver todas (incluso inactivas)
CREATE POLICY "Admin ve todas las secretarías"
  ON secretarias FOR SELECT
  TO authenticated
  USING (true);

-- Solo super_admin puede crear/editar/borrar secretarías
CREATE POLICY "Solo super_admin modifica secretarías"
  ON secretarias FOR ALL
  TO authenticated
  USING (get_mi_rol() = 'super_admin')
  WITH CHECK (get_mi_rol() = 'super_admin');

-- =====================================================
-- POLÍTICAS: noticias
-- =====================================================

-- Lectura pública: solo noticias publicadas
CREATE POLICY "Lectura pública de noticias publicadas"
  ON noticias FOR SELECT
  USING (estado = 'publicado' AND (fecha_expiracion IS NULL OR fecha_expiracion > NOW()));

-- Admin ve todo
CREATE POLICY "Admin ve todas las noticias"
  ON noticias FOR SELECT
  TO authenticated
  USING (
    get_mi_rol() = 'super_admin'
    OR secretaria_id = get_mi_secretaria_id()
  );

-- Admin inserta en su secretaría
CREATE POLICY "Admin crea noticias en su secretaría"
  ON noticias FOR INSERT
  TO authenticated
  WITH CHECK (
    get_mi_rol() = 'super_admin'
    OR secretaria_id = get_mi_secretaria_id()
  );

-- Admin edita solo sus noticias
CREATE POLICY "Admin edita noticias de su secretaría"
  ON noticias FOR UPDATE
  TO authenticated
  USING (
    get_mi_rol() = 'super_admin'
    OR secretaria_id = get_mi_secretaria_id()
  )
  WITH CHECK (
    get_mi_rol() = 'super_admin'
    OR secretaria_id = get_mi_secretaria_id()
  );

-- Admin elimina solo sus noticias
CREATE POLICY "Admin elimina noticias de su secretaría"
  ON noticias FOR DELETE
  TO authenticated
  USING (
    get_mi_rol() = 'super_admin'
    OR secretaria_id = get_mi_secretaria_id()
  );

-- =====================================================
-- POLÍTICAS: documentos (misma lógica)
-- =====================================================

CREATE POLICY "Lectura pública de documentos"
  ON documentos FOR SELECT
  USING (es_publico = true);

CREATE POLICY "Admin ve todos los documentos"
  ON documentos FOR SELECT
  TO authenticated
  USING (get_mi_rol() = 'super_admin' OR secretaria_id = get_mi_secretaria_id());

CREATE POLICY "Admin gestiona documentos de su secretaría"
  ON documentos FOR ALL
  TO authenticated
  USING (get_mi_rol() = 'super_admin' OR secretaria_id = get_mi_secretaria_id())
  WITH CHECK (get_mi_rol() = 'super_admin' OR secretaria_id = get_mi_secretaria_id());

-- =====================================================
-- POLÍTICAS: proyectos
-- =====================================================

CREATE POLICY "Lectura pública de proyectos"
  ON proyectos FOR SELECT
  USING (es_publico = true);

CREATE POLICY "Admin gestiona proyectos de su secretaría"
  ON proyectos FOR ALL
  TO authenticated
  USING (get_mi_rol() = 'super_admin' OR secretaria_id = get_mi_secretaria_id())
  WITH CHECK (get_mi_rol() = 'super_admin' OR secretaria_id = get_mi_secretaria_id());

-- =====================================================
-- POLÍTICAS: galeria
-- =====================================================

CREATE POLICY "Lectura pública de galería activa"
  ON galeria FOR SELECT
  USING (activo = true);

CREATE POLICY "Admin gestiona galería de su secretaría"
  ON galeria FOR ALL
  TO authenticated
  USING (get_mi_rol() = 'super_admin' OR secretaria_id = get_mi_secretaria_id())
  WITH CHECK (get_mi_rol() = 'super_admin' OR secretaria_id = get_mi_secretaria_id());

-- =====================================================
-- POLÍTICAS: usuarios_admin
-- =====================================================

-- Cada usuario puede ver su propio perfil
CREATE POLICY "Ver perfil propio"
  ON usuarios_admin FOR SELECT
  TO authenticated
  USING (auth_user_id = auth.uid() OR get_mi_rol() = 'super_admin');

-- Solo super_admin puede crear/modificar usuarios
CREATE POLICY "Solo super_admin gestiona usuarios"
  ON usuarios_admin FOR ALL
  TO authenticated
  USING (get_mi_rol() = 'super_admin')
  WITH CHECK (get_mi_rol() = 'super_admin');

-- Cada admin puede actualizar su propio perfil (nombre, avatar)
CREATE POLICY "Actualizar perfil propio"
  ON usuarios_admin FOR UPDATE
  TO authenticated
  USING (auth_user_id = auth.uid())
  WITH CHECK (auth_user_id = auth.uid() AND rol = (SELECT rol FROM usuarios_admin WHERE auth_user_id = auth.uid()));
