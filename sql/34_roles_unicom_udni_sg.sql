-- =====================================================
-- 34_roles_unicom_udni_sg.sql
-- Nuevos roles del panel + tabla de organigramas por secretaría.
--   unicom             → Noticias, Carrusel, Videos de YouTube
--   secretaria_general → Gaceta Oficial
--   udni               → Organigramas de las 10 secretarías
-- EJECUTAR EN EL SQL EDITOR (cada bloque por separado si da error de transacción)
-- =====================================================

-- 1) Nuevos valores del enum (ADD VALUE no puede usarse en la misma transacción)
ALTER TYPE rol_admin ADD VALUE IF NOT EXISTS 'unicom';
ALTER TYPE rol_admin ADD VALUE IF NOT EXISTS 'secretaria_general';
ALTER TYPE rol_admin ADD VALUE IF NOT EXISTS 'udni';
