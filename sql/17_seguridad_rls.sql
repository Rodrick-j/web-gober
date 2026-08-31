-- =====================================================
-- 17_seguridad_rls.sql
-- Correcciones de seguridad — Auditoría 2026-08-31
--
-- Ejecutar en Supabase → SQL Editor DESPUÉS de haber
-- rotado la service_role key y la anon key.
--
-- Es idempotente: se puede ejecutar varias veces sin romper nada.
-- =====================================================

-- -----------------------------------------------------
-- Helper: ¿el usuario actual es un administrador activo?
-- (mismo patrón SECURITY DEFINER que get_mi_rol / get_mi_secretaria_id)
-- -----------------------------------------------------
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


-- =====================================================
-- 1. gaceta_oficial  —  CRÍTICO: la tabla NO tenía RLS
--    (con los grants por defecto de Supabase, la anon key
--     pública podía INSERT/UPDATE/DELETE normativa)
-- =====================================================
DO $$
BEGIN
  IF to_regclass('public.gaceta_oficial') IS NOT NULL THEN
    EXECUTE 'ALTER TABLE gaceta_oficial ENABLE ROW LEVEL SECURITY';

    EXECUTE 'DROP POLICY IF EXISTS "gaceta_select_public" ON gaceta_oficial';
    EXECUTE 'DROP POLICY IF EXISTS "gaceta_write_admin"   ON gaceta_oficial';

    EXECUTE $p$
      CREATE POLICY "gaceta_select_public"
        ON gaceta_oficial FOR SELECT
        USING (estado = 'publicado' OR es_admin_activo())
    $p$;

    EXECUTE $p$
      CREATE POLICY "gaceta_write_admin"
        ON gaceta_oficial FOR ALL
        TO authenticated
        USING (es_admin_activo())
        WITH CHECK (es_admin_activo())
    $p$;
  END IF;
END $$;


-- =====================================================
-- 2. configuracion_global  —  RLS desconocida
--    (redes sociales, ticker, contacto oficial → defacement)
-- =====================================================
DO $$
BEGIN
  IF to_regclass('public.configuracion_global') IS NOT NULL THEN
    EXECUTE 'ALTER TABLE configuracion_global ENABLE ROW LEVEL SECURITY';

    EXECUTE 'DROP POLICY IF EXISTS "config_select_public" ON configuracion_global';
    EXECUTE 'DROP POLICY IF EXISTS "config_write_admin"   ON configuracion_global';

    EXECUTE 'CREATE POLICY "config_select_public" ON configuracion_global FOR SELECT USING (true)';

    EXECUTE $p$
      CREATE POLICY "config_write_admin"
        ON configuracion_global FOR ALL
        TO authenticated
        USING (es_admin_activo())
        WITH CHECK (es_admin_activo())
    $p$;
  END IF;
END $$;


-- =====================================================
-- 3. transparencia_documentos  —  RLS desconocida
-- =====================================================
DO $$
BEGIN
  IF to_regclass('public.transparencia_documentos') IS NOT NULL THEN
    EXECUTE 'ALTER TABLE transparencia_documentos ENABLE ROW LEVEL SECURITY';

    EXECUTE 'DROP POLICY IF EXISTS "transp_select_public" ON transparencia_documentos';
    EXECUTE 'DROP POLICY IF EXISTS "transp_write_admin"   ON transparencia_documentos';

    EXECUTE $p$
      CREATE POLICY "transp_select_public"
        ON transparencia_documentos FOR SELECT
        USING (es_publico = true OR es_admin_activo())
    $p$;

    EXECUTE $p$
      CREATE POLICY "transp_write_admin"
        ON transparencia_documentos FOR ALL
        TO authenticated
        USING (es_admin_activo())
        WITH CHECK (es_admin_activo())
    $p$;
  END IF;
END $$;


-- =====================================================
-- 4. poa_items  —  escritura estaba abierta a CUALQUIER
--    usuario autenticado (WITH CHECK (true)); ahora solo admins.
-- =====================================================
DROP POLICY IF EXISTS "poa_items_select_admin" ON poa_items;
DROP POLICY IF EXISTS "poa_items_insert_admin" ON poa_items;
DROP POLICY IF EXISTS "poa_items_update_admin" ON poa_items;
DROP POLICY IF EXISTS "poa_items_delete_admin" ON poa_items;
DROP POLICY IF EXISTS "poa_items_write_admin"  ON poa_items;

-- (se conserva "poa_items_select_public" con es_publico = true)
CREATE POLICY "poa_items_select_admin"
  ON poa_items FOR SELECT
  TO authenticated
  USING (es_admin_activo());

CREATE POLICY "poa_items_write_admin"
  ON poa_items FOR ALL
  TO authenticated
  USING (es_admin_activo())
  WITH CHECK (es_admin_activo());


-- =====================================================
-- 5. estadisticas_secretarias  —  mismo problema que poa_items
-- =====================================================
DROP POLICY IF EXISTS "estadisticas_insert_admin" ON estadisticas_secretarias;
DROP POLICY IF EXISTS "estadisticas_update_admin" ON estadisticas_secretarias;
DROP POLICY IF EXISTS "estadisticas_delete_admin" ON estadisticas_secretarias;
DROP POLICY IF EXISTS "estadisticas_write_admin"  ON estadisticas_secretarias;

-- (se conserva "estadisticas_select_public" con es_publico = true)
CREATE POLICY "estadisticas_write_admin"
  ON estadisticas_secretarias FOR ALL
  TO authenticated
  USING (es_admin_activo())
  WITH CHECK (es_admin_activo());


-- =====================================================
-- 6. banners_inicio  —  endurecer: exigía solo "admin activo".
--    Se mantiene, pero se re-crea con el helper para consistencia.
-- =====================================================
DO $$
BEGIN
  IF to_regclass('public.banners_inicio') IS NOT NULL THEN
    EXECUTE 'DROP POLICY IF EXISTS "Admins gestionan banners" ON banners_inicio';
    EXECUTE 'DROP POLICY IF EXISTS "banners_write_admin"      ON banners_inicio';
    EXECUTE $p$
      CREATE POLICY "banners_write_admin"
        ON banners_inicio FOR ALL
        TO authenticated
        USING (es_admin_activo())
        WITH CHECK (es_admin_activo())
    $p$;
  END IF;
END $$;


-- =====================================================
-- 7. Verificación rápida — tablas del esquema `public`
--    que quedan SIN RLS (revisar el resultado tras ejecutar)
-- =====================================================
-- SELECT tablename
-- FROM pg_tables
-- WHERE schemaname = 'public'
--   AND tablename NOT IN (
--     SELECT tablename FROM pg_tables t
--     JOIN pg_class c ON c.relname = t.tablename
--     WHERE c.relrowsecurity = true
--   );
