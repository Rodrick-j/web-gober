# Cumplimiento — Resolución Ministerial N° 067/2025

**Lineamientos de los Contenidos Mínimos de los Portales y/o Páginas Web Institucionales** (código `VTILCC-L01`, v1).
Emitida por el Ministerio de Justicia y Transparencia Institucional el 16 de mayo de 2025.
Seguimiento **semestral** por el Viceministerio de Transparencia (VTILCC) vía sistema **SITPRECO S2+**.
Puntuación por ítem: **Publicación (0/1) + Plazo (0/1)** → promedio → %.
Escala: 90–100 % Excelente · 75–89 % Bueno · 50–74 % Regular · <50 % Deficiente.

> **Importante:** este proyecto entrega el **mecanismo de publicación** de cada contenido.
> La *publicación efectiva* depende de que cada área responsable cargue el documento o el texto
> desde el panel administrativo (`admin-panel`). Un ítem marcado ✅ significa "hay dónde publicarlo";
> pasa a contar en SITPRECO cuando el contenido real está cargado.

## Cómo cargar cada contenido

| Contenido | Dónde se carga (admin) | Dónde se ve (web) |
|---|---|---|
| Misión, Visión, Valores, Objetivos, Reseña, Memoria | **Contenido Institucional** | `/institucion/historia-institucion` |
| Organigrama oficial | **Contenido Institucional** → "Organigrama Institucional" | `/institucion/organigrama` |
| Unidad de Transparencia / Atención a la Ciudadanía | **Contenido Institucional** | `/transparencia/unidad` |
| Documentos por categoría (plan estratégico, presupuesto, MOF, MPP, normativa, escala salarial…) | **Docs. Institución** (elegir categoría) | `/institucion/<categoria>` |
| Nómina de autoridades (foto + biografía) | **Autoridades** | `/institucion/autoridades` |
| Publicaciones, boletines, revistas, artículos, investigación, campañas | **Publicaciones** | `/publicaciones` |
| Convocatorias (TdR, bienes y servicios, empleo) y proveedores | **Contrataciones** | `/contrataciones` |
| Solicitudes de información y su respuesta | **Solicitudes Ciudadanas** (bandeja) | Formulario: `/transparencia/solicitud-informacion` |
| Indicadores / KPIs por secretaría | **Secretarías → Estadísticas** | `/datos-estadisticas` |
| Ejecución del POA e informes de seguimiento | Módulo **POA** + Docs. Institución (`seguimiento-poa`) | `/institucion/seguimiento-poa` |
| Teléfono, fax, WhatsApp, call center, correo, dirección | **Configuración Global** → "Contacto Oficial" | Home → Contáctanos · Footer |
| Enlaces al Observatorio / SITPRECO S2+ | **Configuración Global** (`enlaces_transparencia`) o SQL `29_seed_config_rm067.sql` | `/transparencia` |

## Estado de los 47 ítems (tras Fases 1–3)

Leyenda: ✅ mecanismo listo · 🟡 parcial · ❌ pendiente

### Bloque 1 · Institucional y de Gestión
| # | Ítem | Estado | Ubicación |
|---|---|---|---|
| 1 | Misión | ✅ | `contenido_institucional.mision` → `/institucion/historia-institucion` |
| 2 | Visión | ✅ | `contenido_institucional.vision` |
| 3 | Valores y Principios | ✅ | `contenido_institucional.valores_principios` |
| 4 | Reseña Histórica | ✅ | `contenido_institucional.resena_historica` (fallback: timeline) |
| 5 | Memoria Institucional / Informe de Gestión | ✅ | `contenido_institucional.memoria_institucional` (texto + PDF) |
| 6 | Objetivos Institucionales | ✅ | `contenido_institucional.objetivos_institucionales` |

### Bloque 2 · Plan Estratégico y POA
| # | Ítem | Estado | Ubicación |
|---|---|---|---|
| 7 | Plan Estratégico | ✅ | cat. `plan-estrategico` → `/institucion/plan-estrategico` |
| 8 | Programación Operativa Anual (POA) | ✅ | Módulo POA (`/admin/poa`, vistas por secretaría) |
| 9 | Seguimiento y Evaluación al POA | ✅ | `/institucion/seguimiento-poa` (ejecución en vivo + informes cat. `seguimiento-poa`) |
| 10 | Flujos de Procesos | ✅ | cat. `flujos-procesos` |

### Bloque 3 · Información Financiera
| # | Ítem | Estado | Ubicación |
|---|---|---|---|
| 11 | Presupuesto Institucional | ✅ | cat. `presupuesto` → `/institucion/presupuesto` |
| 12 | Ejecución Presupuestaria | ✅ | cat. `ejecucion-presupuestaria` + `/institucion/seguimiento-poa` |
| 13 | Programas y Proyectos de Inversión | ✅ | tabla `proyectos` + POA (INVERSION) |
| 14 | Fuentes de Financiamiento | ✅ | cat. `fuentes-financiamiento` |
| 15 | Auditorías | ✅ | `/auditoria` + `transparencia/[tipo]` |

### Bloque 4 · Transparencia y Lucha Contra la Corrupción
| # | Ítem | Estado | Ubicación |
|---|---|---|---|
| 16 | Unidad de Transparencia y LCC | ✅ | `/transparencia/unidad` (contenido editable) |
| 17 | Gestión de Denuncia de actos de corrupción | ✅ | `/transparencia` → redirección a SITPRECO S2+ / `observatorio.gob.bo` |
| 18 | Solicitud de Información | ✅ | `/transparencia/solicitud-informacion` + bandeja `/admin/solicitudes` |
| 19 | Rendición Pública de Cuentas | ✅ | `/transparencia/rendicion_cuentas` + redirección al Observatorio |

### Bloque 5 · Comunicación
| # | Ítem | Estado | Ubicación |
|---|---|---|---|
| 20 | Notas de Prensa | ✅ | Módulo Noticias |
| 21 | Galería Multimedia | ✅ | Módulo Galería |
| 22 | Página de Datos y Estadísticas | ✅ | `/datos-estadisticas` (KPIs por secretaría) |
| 23 | Información Estadística | ✅ | `/datos-estadisticas` + `/institucion/seguimiento-poa` |
| 24 | Publicaciones | ✅ | `publicaciones.tipo = publicacion` → `/publicaciones` |
| 25 | Boletines | ✅ | `publicaciones.tipo = boletin` |
| 26 | Revistas | ✅ | `publicaciones.tipo = revista` |
| 27 | Artículos | ✅ | `publicaciones.tipo = articulo` |
| 28 | Banco de Trabajos de Investigación | ✅ | `publicaciones.tipo = investigacion` |
| 29 | Campañas y Actividades | ✅ | `publicaciones.tipo = campania` + `/transparencia/actividades` |

### Bloque 6 · Recursos Humanos y Contrataciones
| # | Ítem | Estado | Ubicación |
|---|---|---|---|
| 30 | Organigrama | ✅ | `contenido_institucional.organigrama_archivo` → `/institucion/organigrama` |
| 31 | Nómina de Autoridades | ✅ | tabla `autoridades` → `/institucion/autoridades` (+ secretarios en `secretarias`) |
| 32 | Nómina de Servidores Públicos | ✅ | cat. `nomina-servidores` |
| 33 | Escala Salarial | ✅ | cat. `escala-salarial` → `/institucion/escala-salarial` |
| 34 | Manual de Organización de Funciones (MOF) | ✅ | cat. `mof` |
| 35 | Manual de Procesos y Procedimientos (MPP) | ✅ | cat. `mpp` |
| 36 | Plan Operativo Anual Individual (POAI) | ✅ | cat. `poai` |
| 37 | Términos de Referencia | ✅ | `convocatorias.tipo = tdr` → `/contrataciones` |
| 38 | Convocatoria de Bienes y Servicios | ✅ | `convocatorias.tipo = bienes_servicios` → `/contrataciones` |
| 39 | Lista de Proveedores | ✅ | tabla `proveedores` → `/contrataciones` |

### Bloque 7 · Marco Normativo
| # | Ítem | Estado | Ubicación |
|---|---|---|---|
| 40 | Normativa Nacional | ✅ | cat. `normativa-nacional` (y `marco-normativo`) |
| 41 | Normativa Internacional | ✅ | cat. `normativa-internacional` |
| 42 | Reglamentos Vigentes | ✅ | cat. `reglamentos-vigentes` (+ Gaceta Oficial) |

### Bloque 8 · Medios de Contacto
| # | Ítem | Estado | Ubicación |
|---|---|---|---|
| 43 | Encargados de recibir/contestar mensajes | ✅ | `contenido_institucional.encargado_mensajes` + campo "encargado" en `/admin/solicitudes` |
| 44 | Registro de respuestas enviadas | ✅ | `/admin/solicitudes` (respuesta / respondido_por / respondido_en) |
| 45 | Dirección y Ubicación en Mapa de Google | ✅ | `LocationSection` + `configuracion_global.contacto_oficial` |
| 46 | Teléfono, call center, fax y WhatsApp | ✅ | `configuracion_global.contacto_oficial` (Configuración Global) |
| 47 | Correo Electrónico y URLs | ✅ | `contacto_oficial.email` + `redes_sociales` |

## Resumen

**47 de 47 ítems** con mecanismo de publicación disponible en el portal y el panel administrativo.
Falta la **carga del contenido real** por cada área responsable y el registro del cumplimiento
semestral en SITPRECO S2+.

## Migraciones SQL de esta iniciativa

Ejecutar en Supabase SQL Editor, en orden: `sql/24_contenido_institucional.sql` … `sql/29_seed_config_rm067.sql`.
Las tablas `publicaciones`, `autoridades`, `convocatorias` y `proveedores` se crean en `sql/25`, `sql/28` y `sql/27`.
Ver `sql/README.md`.

## Pendientes menores (mejoras, no bloquean SITPRECO)

- Poblar `/datos-estadisticas` requiere que las secretarías carguen sus KPIs (módulo Estadísticas ya existente).
- El `seguimiento-poa` en vivo depende de que `poa_items` tenga `monto_ejecutado` / `avance_fisico` actualizados.
- Revisar textos legales del pie de página (Privacidad / Términos) si la institución define una política formal.
