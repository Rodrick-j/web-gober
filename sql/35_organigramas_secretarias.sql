-- =====================================================
-- 35_organigramas_secretarias.sql
-- Organigrama (imagen o PDF) de cada secretaría. Lo administra la UDNI.
-- Ejecutar DESPUÉS de 34_roles_unicom_udni_sg.sql
-- =====================================================

-- Helper (se crea aquí por si 17_seguridad_rls.sql nunca se ejecutó)
CREATE OR REPLACE FUNCTION es_admin_activo()
RETURNS boolean AS $$
  SELECT EXISTS (
    SELECT 1 FROM usuarios_admin
    WHERE auth_user_id = auth.uid()
      AND activo = true
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

REVOKE ALL ON FUNCTION es_admin_activo() FROM public;
GRANT EXECUTE ON FUNCTION es_admin_activo() TO anon, authenticated;

CREATE TABLE IF NOT EXISTS organigramas_secretarias (
  secretaria_id UUID PRIMARY KEY REFERENCES secretarias(id) ON DELETE CASCADE,
  archivo_url   TEXT NOT NULL,
  updated_by    UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  updated_at    TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE organigramas_secretarias ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "organigramas_select_public" ON organigramas_secretarias;
CREATE POLICY "organigramas_select_public"
  ON organigramas_secretarias FOR SELECT USING (true);

DROP POLICY IF EXISTS "organigramas_write_admin" ON organigramas_secretarias;
CREATE POLICY "organigramas_write_admin"
  ON organigramas_secretarias FOR ALL TO authenticated
  USING (es_admin_activo())
  WITH CHECK (es_admin_activo());

GRANT SELECT ON organigramas_secretarias TO anon;
GRANT ALL    ON organigramas_secretarias TO authenticated;
