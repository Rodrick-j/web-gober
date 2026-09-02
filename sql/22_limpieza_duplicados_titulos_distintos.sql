-- =====================================================
-- LIMPIEZA DUPLICADOS CON TÍTULOS DISTINTOS
-- Para registros como Ley 237 y 203 que siguen duplicados
-- porque tienen títulos levemente diferentes
-- Ejecutar en Supabase SQL Editor
-- =====================================================

-- PASO 1: Ver los duplicados que quedaron (mismo numero, títulos distintos)
SELECT
  tipo,
  numero,
  COUNT(*) AS copias,
  STRING_AGG(id::TEXT, ' | ') AS ids,
  STRING_AGG(LEFT(titulo, 60), ' || ') AS titulos_resumidos,
  STRING_AGG(
    CASE WHEN archivo_url IS NOT NULL AND archivo_url NOT IN ('', '#')
    THEN '✅' ELSE '❌' END,
  ' | ') AS tiene_pdf
FROM documentos
WHERE es_publico = TRUE
GROUP BY tipo, numero
HAVING COUNT(*) > 1
ORDER BY tipo, numero;


-- PASO 2: BORRAR DUPLICADOS (mismo tipo+numero, distintos títulos)
-- Conserva el más reciente con PDF; borra los demás
DELETE FROM documentos
WHERE id IN (
  SELECT id FROM (
    SELECT
      id,
      ROW_NUMBER() OVER (
        PARTITION BY tipo, numero
        ORDER BY
          -- Primero el que tiene PDF real
          CASE
            WHEN archivo_url IS NOT NULL
             AND archivo_url NOT IN ('', '#')
            THEN 0 ELSE 1
          END,
          -- Luego el más reciente
          created_at DESC
      ) AS rn
    FROM documentos
    WHERE es_publico = TRUE
  ) ranked
  WHERE rn > 1
);


-- PASO 3: Verificar que ya no hay duplicados
SELECT
  tipo,
  COUNT(*) AS total_documentos
FROM documentos
WHERE es_publico = TRUE
GROUP BY tipo
ORDER BY tipo;

-- Confirmar que no quedan duplicados:
SELECT
  tipo, numero, COUNT(*) AS copias
FROM documentos
WHERE es_publico = TRUE
GROUP BY tipo, numero
HAVING COUNT(*) > 1
ORDER BY tipo, numero;
-- Si esta query no devuelve filas, ¡todo limpio! ✅
