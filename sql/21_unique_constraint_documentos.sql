-- =====================================================
-- agregar_unique_constraint.sql
-- Previene duplicados a nivel de base de datos
-- Ejecutar DESPUÉS de limpiar duplicados existentes
-- =====================================================

-- PASO 1: Verificar constraints existentes
SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'documentos';

-- PASO 2: Limpiar duplicados antes de agregar constraint
DELETE FROM documentos
WHERE id IN (
  SELECT id FROM (
    SELECT
      id,
      ROW_NUMBER() OVER (
        PARTITION BY tipo, numero
        ORDER BY
          CASE
            WHEN archivo_url IS NOT NULL
             AND archivo_url != ''
             AND archivo_url != '#'
            THEN 0 ELSE 1
          END,
          created_at DESC
      ) AS rn
    FROM documentos
  ) ranked
  WHERE rn > 1
);

SELECT tipo, COUNT(*) AS total FROM documentos GROUP BY tipo ORDER BY tipo;

-- PASO 3: Agregar UNIQUE constraint
ALTER TABLE documentos
  ADD CONSTRAINT documentos_tipo_numero_unique
  UNIQUE (tipo, numero);

-- PASO 4: Verificar
SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'documentos';
