# 📂 SQL — Gobernación Departamental de Oruro
# Ejecutar en Supabase → SQL Editor, en este orden exacto:

## ⚠️ ORDEN DE EJECUCIÓN OBLIGATORIO

| Nº | Archivo | Qué hace | Obligatorio |
|----|---------|----------|-------------|
| 01 | `01_extensions.sql` | Habilita UUID y búsqueda de texto | ✅ Sí |
| 02 | `02_secretarias.sql` | Crea tabla de las 10 secretarías | ✅ Sí |
| 03 | `03_noticias.sql` | Crea tabla de noticias | ✅ Sí |
| 04 | `04_documentos.sql` | Crea tabla de Gaceta Oficial / PDFs | ✅ Sí |
| 05 | `05_proyectos.sql` | Crea tabla de proyectos de inversión | ✅ Sí |
| 06 | `06_galeria.sql` | Crea tabla de galería (imágenes + YouTube) | ✅ Sí |
| 07 | `07_usuarios_admin.sql` | Crea tabla de usuarios del panel admin | ✅ Sí |
| 08 | `08_rls_policies.sql` | Seguridad — cada secretaría ve solo sus datos | ✅ Sí |
| 09 | `09_seed_secretarias.sql` | Inserta las 10 secretarías reales | ✅ Sí |
| 10 | `10_seed_noticias_ejemplo.sql` | Inserta 5 noticias de prueba | 🟡 Opcional |
| 11 | `11_storage_buckets.sql` | Crea los buckets de archivos | ✅ Sí |
| 12 | `12_views_utiles.sql` | Crea vistas para consultas rápidas | 🟡 Recomendado |
| 13–23 | `13_*.sql` … `23_*.sql` | Carrusel, gaceta, config global, POA, estadísticas, docs institución, limpiezas, alcaldes | ✅ Sí (según iteraciones previas) |

## 🏛️ Cumplimiento RM 067/2025 (Contenidos Mínimos Web Institucional)

Ejecutar en orden, **después** de los anteriores. Requieren que existan `usuarios_admin` y `configuracion_global`.

| Nº | Archivo | Qué hace |
|----|---------|----------|
| 24 | `24_contenido_institucional.sql` | Bloques editables: misión, visión, valores, objetivos, reseña, memoria, unidad de transparencia, organigrama |
| 25 | `25_publicaciones.sql` | Publicaciones, boletines, revistas, artículos, investigación, campañas |
| 26 | `26_solicitudes_ciudadanas.sql` | Formulario de Solicitud de Información + registro de respuestas (bandeja admin) |
| 27 | `27_contrataciones_proveedores.sql` | Convocatorias (TdR / bienes y servicios / empleo) + Lista de Proveedores |
| 28 | `28_autoridades.sql` | Nómina de autoridades (hasta directores) con foto y biografía |
| 29 | `29_seed_config_rm067.sql` | Enlaces al Observatorio/SITPRECO S2+ y campos fax/WhatsApp/call center |

Verificación:
```sql
SELECT clave FROM contenido_institucional;                       -- 9 filas
SELECT clave FROM configuracion_global
  WHERE clave IN ('enlaces_transparencia','contacto_oficial');   -- 2 filas
```

## 📋 Cómo ejecutar en Supabase:

1. Ve a **https://supabase.com** → inicia sesión
2. Abre tu proyecto → menú lateral **"SQL Editor"**
3. Haz clic en **"New query"**
4. Copia y pega el contenido del archivo `01_extensions.sql`
5. Haz clic en **"Run"** (▶)
6. Repite para cada archivo en orden

## ✅ Verificación final:

Después del paso 09, ejecuta esto para confirmar:
```sql
SELECT nombre_corto, slug, icono FROM secretarias ORDER BY orden;
```
Deberías ver las 10 secretarías listadas.
