-- =====================================================
-- fix_titulos_documentos.sql
-- Corrección de errores tipográficos en títulos
-- Ejecutar en Supabase SQL Editor
-- =====================================================

-- ─────────────────────────────────────────────────────
-- LEY 242 — Falta espacio + "ADOLESCENT" truncado
-- ─────────────────────────────────────────────────────
UPDATE documentos
SET titulo = 'LEY DEPARTAMENTAL N° 242/2024 - DECLARATORIA DE PRIORIDAD DEPARTAMENTAL: PREVENCIÓN, RESGUARDO, SEGURIDAD Y PROTECCIÓN DE LOS NIÑOS, NIÑAS Y ADOLESCENTES'
WHERE numero = '242'
  AND tipo = 'ley_departamental'
  AND titulo ILIKE '%2024DECLARATORIA%';

-- ─────────────────────────────────────────────────────
-- LEY 240 — "LEY LEY", "DEPATAMENTAL", "DIFINITIVA", "TRATAMINETO"
-- ─────────────────────────────────────────────────────
UPDATE documentos
SET titulo = 'LEY DEPARTAMENTAL N° 240 - APROBACIÓN DE TRANSFERENCIA DEFINITIVA A TÍTULO GRATUITO ENTRE ENTIDADES PÚBLICAS DE LA PLANTA DE TRATAMIENTO DE AGUAS SERVIDAS DE LA PROVINCIA CERCADO'
WHERE numero = '240'
  AND tipo = 'ley_departamental'
  AND titulo ILIKE '%LEY LEY%TRATAMINETO%';

-- ─────────────────────────────────────────────────────
-- LEY 239 — "LEY LEY", "DEPATAMENTAL"
-- ─────────────────────────────────────────────────────
UPDATE documentos
SET titulo = 'LEY DEPARTAMENTAL N° 239 - DECLARATORIA DE PATRIMONIO CULTURAL MATERIAL DEL DEPARTAMENTO DE ORURO A LA VESTIMENTA E INDUMENTARIA ANCESTRAL, COMUNITARIA'
WHERE numero = '239'
  AND tipo = 'ley_departamental'
  AND titulo ILIKE '%LEY LEY%PATRIMONIO%';

-- ─────────────────────────────────────────────────────
-- LEY 238 — "LEY LEY" duplicado
-- ─────────────────────────────────────────────────────
UPDATE documentos
SET titulo = 'LEY DEPARTAMENTAL N° 238 - DECLARATORIA DE EMERGENCIA DEPARTAMENTAL POR CONTAMINACIÓN DEL LAGO URU URU'
WHERE numero = '238'
  AND tipo = 'ley_departamental'
  AND titulo ILIKE '%LEY LEY%URU URU%';

-- ─────────────────────────────────────────────────────
-- Corrección masiva de patrones comunes
-- ─────────────────────────────────────────────────────

-- "LEY LEY" → "LEY"
UPDATE documentos
SET titulo = REGEXP_REPLACE(titulo, '^LEY LEY\s+', 'LEY ', 'i')
WHERE titulo ~* '^LEY LEY\s+';

-- "DEPATAMENTAL" → "DEPARTAMENTAL"
UPDATE documentos
SET titulo = REPLACE(titulo, 'DEPATAMENTAL', 'DEPARTAMENTAL')
WHERE titulo LIKE '%DEPATAMENTAL%';

-- "DIFINITIVA" → "DEFINITIVA"
UPDATE documentos
SET titulo = REPLACE(titulo, 'DIFINITIVA', 'DEFINITIVA')
WHERE titulo LIKE '%DIFINITIVA%';

-- "TRATAMINETO" → "TRATAMIENTO"
UPDATE documentos
SET titulo = REPLACE(titulo, 'TRATAMINETO', 'TRATAMIENTO')
WHERE titulo LIKE '%TRATAMINETO%';

-- ─────────────────────────────────────────────────────
-- Verificación final
-- ─────────────────────────────────────────────────────
SELECT numero, titulo, fecha_publicacion
FROM documentos
WHERE tipo = 'ley_departamental'
ORDER BY fecha_publicacion DESC
LIMIT 20;
