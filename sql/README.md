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
