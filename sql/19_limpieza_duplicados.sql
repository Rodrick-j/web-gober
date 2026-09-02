-- =====================================================
-- DIAGNÓSTICO Y LIMPIEZA DE DUPLICADOS
-- Ejecutar bloque por bloque en Supabase SQL Editor
-- =====================================================


-- ─────────────────────────────────────────────────────
-- BLOQUE 1: VER TODOS LOS DUPLICADOS CON DETALLE
-- Muestra cada versión del mismo documento para
-- que puedas identificar cuál título y PDF es correcto
-- ─────────────────────────────────────────────────────
SELECT
  d.tipo,
  d.numero,
  d.id,
  d.titulo,
  d.descripcion,
  d.fecha_publicacion::DATE AS fecha,
  CASE
    WHEN d.archivo_url IS NULL OR d.archivo_url = '' OR d.archivo_url = '#'
    THEN '❌ Sin PDF'
    ELSE '✅ ' || RIGHT(d.archivo_url, 50)
  END AS pdf_url,
  d.created_at::DATE AS fecha_carga
FROM documentos d
INNER JOIN (
  SELECT tipo, numero
  FROM documentos
  WHERE es_publico = TRUE
  GROUP BY tipo, numero
  HAVING COUNT(*) > 1
) dup ON d.tipo = dup.tipo AND d.numero = dup.numero
WHERE d.es_publico = TRUE
ORDER BY d.tipo, d.numero, d.created_at DESC;


-- ─────────────────────────────────────────────────────
-- BLOQUE 2: CONTAR CUÁNTOS DUPLICADOS EXACTOS HAY
-- ─────────────────────────────────────────────────────
SELECT
  tipo,
  numero,
  titulo,
  COUNT(*) AS copias
FROM documentos
WHERE es_publico = TRUE
GROUP BY tipo, numero, titulo
HAVING COUNT(*) > 1
ORDER BY copias DESC, tipo, numero;


-- ─────────────────────────────────────────────────────
-- BLOQUE 3: BACKUP ANTES DE BORRAR
-- ─────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS documentos_backup_antes_limpieza AS
SELECT * FROM documentos;

-- Verificar que el backup está completo:
SELECT COUNT(*) AS total_backup FROM documentos_backup_antes_limpieza;
SELECT COUNT(*) AS total_original FROM documentos;


-- ─────────────────────────────────────────────────────
-- BLOQUE 4: LIMPIEZA — BORRAR DUPLICADOS
-- Conserva la copia con PDF real y más reciente
-- ─────────────────────────────────────────────────────
DELETE FROM documentos
WHERE id IN (
  SELECT id FROM (
    SELECT
      id,
      ROW_NUMBER() OVER (
        PARTITION BY tipo, numero, titulo
        ORDER BY
          CASE WHEN archivo_url IS NOT NULL AND archivo_url != '' AND archivo_url != '#' THEN 0 ELSE 1 END,
          created_at DESC
      ) AS rn
    FROM documentos
  ) ranked
  WHERE rn > 1
);

-- Verificar cuántos quedaron:
SELECT tipo, COUNT(*) AS total
FROM documentos
GROUP BY tipo
ORDER BY tipo;


-- ─────────────────────────────────────────────────────
-- BLOQUE 5: VER CONFLICTOS RESTANTES
-- Mismo número pero títulos distintos
-- ─────────────────────────────────────────────────────
SELECT
  tipo,
  numero,
  COUNT(*) AS versiones,
  STRING_AGG(titulo, ' || ') AS titulos_distintos,
  STRING_AGG(
    CASE WHEN archivo_url IS NOT NULL AND archivo_url != '' AND archivo_url != '#'
    THEN '✅' ELSE '❌' END,
  ' | ') AS pdfs
FROM documentos
WHERE es_publico = TRUE
GROUP BY tipo, numero
HAVING COUNT(*) > 1
ORDER BY tipo, numero;


-- ─────────────────────────────────────────────────────
-- BLOQUE 6: REPORTE FINAL
-- ─────────────────────────────────────────────────────
SELECT
  tipo,
  numero,
  titulo,
  fecha_publicacion::DATE AS fecha,
  CASE
    WHEN archivo_url IS NOT NULL AND archivo_url NOT IN ('', '#')
    THEN '✅ PDF OK'
    ELSE '❌ Sin PDF — REQUIERE ATENCIÓN'
  END AS estado_pdf
FROM documentos
WHERE es_publico = TRUE
ORDER BY tipo, fecha_publicacion DESC;
