-- =====================================================
-- 01_extensions.sql
-- Habilitar extensiones necesarias de PostgreSQL
-- EJECUTAR PRIMERO
-- =====================================================

-- UUID para IDs únicos automáticos
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Para búsqueda de texto completo en español
CREATE EXTENSION IF NOT EXISTS "unaccent";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";
