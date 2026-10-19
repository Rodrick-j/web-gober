const fs = require("fs");
const path = require("path");
const {
  AlignmentType,
  BorderStyle,
  Document,
  Footer,
  Header,
  HeadingLevel,
  ImageRun,
  LevelFormat,
  LineRuleType,
  PageBreak,
  PageNumber,
  Packer,
  Paragraph,
  ShadingType,
  Table,
  TableCell,
  TableLayoutType,
  TableRow,
  TextRun,
  VerticalAlign,
  WidthType,
} = require("docx");

const ROOT = path.resolve(__dirname, "..");
const OUTPUT = path.join(ROOT, "docs", "Informe_Proyectos_Web_Estadisticas_GADOR.docx");
const LOGO = path.join(ROOT, "public", "imagotipo_gador_2026.png");

const authorFlag = process.argv.indexOf("--autor");
const AUTHOR = authorFlag >= 0 && process.argv[authorFlag + 1]
  ? process.argv[authorFlag + 1]
  : "[NOMBRE COMPLETO — PENDIENTE DE CONFIRMACIÓN]";

const C = {
  red: "BE0F2C",
  darkRed: "7D0B1D",
  gold: "E6B422",
  charcoal: "25282B",
  slate: "50555A",
  muted: "68717A",
  light: "F3F5F7",
  lighter: "FAFAFB",
  border: "CDD2D8",
  white: "FFFFFF",
  warning: "FFF3CD",
  warningBorder: "E6B422",
  blue: "1F4E78",
  green: "2F6B4F",
};

const PAGE_WIDTH = 12240;
const PAGE_HEIGHT = 15840;
const CONTENT_WIDTH = 9120;
const noBorder = { style: BorderStyle.NONE, size: 0, color: C.white };
const lightBorder = { style: BorderStyle.SINGLE, size: 5, color: C.border };
const redBorder = { style: BorderStyle.SINGLE, size: 10, color: C.red };

const allBorders = (border = lightBorder) => ({
  top: border,
  bottom: border,
  left: border,
  right: border,
  insideHorizontal: border,
  insideVertical: border,
});

function run(text, opts = {}) {
  return new TextRun({
    text,
    font: opts.font || "Century Gothic",
    size: opts.size || 21,
    bold: Boolean(opts.bold),
    italics: Boolean(opts.italics),
    color: opts.color || C.charcoal,
    underline: opts.underline,
    highlight: opts.highlight,
    break: opts.break,
  });
}

function para(text, opts = {}) {
  const children = Array.isArray(text)
    ? text
    : [run(text, opts.run || {})];
  return new Paragraph({
    children,
    alignment: opts.alignment || AlignmentType.JUSTIFIED,
    spacing: opts.spacing || { after: 120, line: 276, lineRule: LineRuleType.AUTO },
    indent: opts.indent,
    keepNext: opts.keepNext,
    keepLines: opts.keepLines,
    pageBreakBefore: opts.pageBreakBefore,
    border: opts.border,
    shading: opts.shading,
  });
}

function heading(text, level = 1, opts = {}) {
  const map = {
    1: HeadingLevel.HEADING_1,
    2: HeadingLevel.HEADING_2,
    3: HeadingLevel.HEADING_3,
  };
  return new Paragraph({
    text,
    heading: map[level],
    alignment: opts.alignment || AlignmentType.LEFT,
    pageBreakBefore: Boolean(opts.pageBreakBefore),
    keepNext: true,
  });
}

function centeredTitle(text) {
  return new Paragraph({
    children: [run(text, { bold: true, size: 28, color: C.darkRed, underline: {} })],
    alignment: AlignmentType.CENTER,
    spacing: { before: 80, after: 220 },
    keepNext: true,
  });
}

function bullet(text, level = 0) {
  return new Paragraph({
    children: [run(text)],
    numbering: { reference: "gador-bullets", level },
    alignment: AlignmentType.JUSTIFIED,
    spacing: { after: 60, line: 260, lineRule: LineRuleType.AUTO },
  });
}

function numbered(text, level = 0) {
  return new Paragraph({
    children: [run(text)],
    numbering: { reference: "gador-decimal", level },
    alignment: AlignmentType.JUSTIFIED,
    spacing: { after: 65, line: 260, lineRule: LineRuleType.AUTO },
  });
}

function caption(text) {
  return new Paragraph({
    children: [run(text, { size: 17, italics: true, color: C.muted })],
    alignment: AlignmentType.CENTER,
    spacing: { before: 45, after: 130 },
    keepNext: true,
  });
}

function sourceNote(text) {
  return new Paragraph({
    children: [
      run("Fuente y alcance: ", { size: 16, bold: true, color: C.slate }),
      run(text, { size: 16, italics: true, color: C.slate }),
    ],
    alignment: AlignmentType.JUSTIFIED,
    spacing: { before: 35, after: 115, line: 225, lineRule: LineRuleType.AUTO },
    keepLines: true,
  });
}

function cellParagraph(text, opts = {}) {
  const parts = Array.isArray(text) ? text : [run(String(text), {
    size: opts.size || 18,
    bold: opts.bold,
    color: opts.color || C.charcoal,
    italics: opts.italics,
  })];
  return new Paragraph({
    children: parts,
    alignment: opts.alignment || AlignmentType.LEFT,
    spacing: { before: 25, after: 25, line: 230, lineRule: LineRuleType.AUTO },
    keepLines: true,
  });
}

function tableCell(content, width, opts = {}) {
  const children = Array.isArray(content)
    ? content
    : [cellParagraph(content, opts)];
  return new TableCell({
    children,
    width: { size: width, type: WidthType.DXA },
    verticalAlign: opts.verticalAlign || VerticalAlign.CENTER,
    shading: opts.fill ? { type: ShadingType.CLEAR, fill: opts.fill, color: "auto" } : undefined,
    borders: opts.borders || allBorders(),
    margins: { top: 85, bottom: 85, left: 105, right: 105 },
    columnSpan: opts.columnSpan,
  });
}

function dataTable(rows, widths = [2750, 6370]) {
  return new Table({
    width: { size: CONTENT_WIDTH, type: WidthType.DXA },
    columnWidths: widths,
    layout: TableLayoutType.FIXED,
    borders: allBorders(),
    rows: rows.map(([label, value], index) => new TableRow({
      cantSplit: true,
      children: [
        tableCell(label, widths[0], { bold: true, fill: index % 2 === 0 ? "E9ECEF" : "F4F5F6", color: C.darkRed }),
        tableCell(value, widths[1], { fill: index % 2 === 0 ? C.white : C.lighter }),
      ],
    })),
  });
}

function matrixTable(headers, rows, widths, opts = {}) {
  const header = new TableRow({
    tableHeader: true,
    cantSplit: true,
    children: headers.map((h, i) => tableCell(h, widths[i], {
      bold: true,
      color: C.white,
      fill: opts.headerFill || C.darkRed,
      alignment: AlignmentType.CENTER,
      size: opts.headerSize || 17,
      borders: allBorders({ style: BorderStyle.SINGLE, size: 5, color: C.white }),
    })),
  });

  const body = rows.map((row, rowIndex) => new TableRow({
    cantSplit: Boolean(opts.cantSplit),
    children: row.map((value, colIndex) => tableCell(value, widths[colIndex], {
      fill: rowIndex % 2 === 0 ? C.white : C.light,
      size: opts.bodySize || 17,
      alignment: colIndex === 1 && opts.centerSecond ? AlignmentType.CENTER : AlignmentType.LEFT,
    })),
  }));

  return new Table({
    width: { size: widths.reduce((sum, n) => sum + n, 0), type: WidthType.DXA },
    columnWidths: widths,
    layout: TableLayoutType.FIXED,
    borders: allBorders(),
    rows: [header, ...body],
  });
}

function timelineTable(columns) {
  const widths = [3040, 3040, 3040];
  const maxTasks = Math.max(...columns.map((col) => col.tasks.length));
  const rows = [new TableRow({
    tableHeader: true,
    cantSplit: true,
    children: columns.map((col, index) => tableCell(col.title, widths[index], {
      fill: C.darkRed,
      bold: true,
      color: C.white,
      alignment: AlignmentType.CENTER,
      size: 17,
      borders: allBorders({ style: BorderStyle.SINGLE, size: 5, color: C.white }),
    })),
  })];

  for (let i = 0; i < maxTasks; i += 1) {
    rows.push(new TableRow({
      cantSplit: true,
      children: columns.map((col, index) => tableCell(col.tasks[i] || "", widths[index], {
        fill: i % 2 === 0 ? C.white : C.light,
        size: 16,
      })),
    }));
  }

  rows.push(new TableRow({
    cantSplit: true,
    children: columns.map((col, index) => tableCell([
      cellParagraph("RESULTADO ESPERADO", { bold: true, color: C.darkRed, alignment: AlignmentType.CENTER, size: 16 }),
      cellParagraph(col.result, { size: 16, alignment: AlignmentType.JUSTIFIED }),
    ], widths[index], { fill: "F8E6EA" })),
  }));

  return new Table({
    width: { size: CONTENT_WIDTH, type: WidthType.DXA },
    columnWidths: widths,
    layout: TableLayoutType.FIXED,
    borders: allBorders(),
    rows,
  });
}

function noteBox(title, text, kind = "warning") {
  const fill = kind === "info" ? "EAF2F8" : C.warning;
  const borderColor = kind === "info" ? C.blue : C.warningBorder;
  return new Table({
    width: { size: CONTENT_WIDTH, type: WidthType.DXA },
    columnWidths: [CONTENT_WIDTH],
    layout: TableLayoutType.FIXED,
    rows: [new TableRow({
      cantSplit: true,
      children: [tableCell([
        cellParagraph(title, { bold: true, color: kind === "info" ? C.blue : C.darkRed, size: 18 }),
        cellParagraph(text, { size: 17, alignment: AlignmentType.JUSTIFIED }),
      ], CONTENT_WIDTH, {
        fill,
        borders: allBorders({ style: BorderStyle.SINGLE, size: 9, color: borderColor }),
      })],
    })],
  });
}

function flowTable(boxes, colors) {
  const arrowWidth = 280;
  const boxWidth = Math.floor((CONTENT_WIDTH - arrowWidth * (boxes.length - 1)) / boxes.length);
  const widths = [];
  const cells = [];
  boxes.forEach((box, index) => {
    widths.push(boxWidth);
    cells.push(tableCell(box, boxWidth, {
      fill: colors[index] || C.light,
      bold: true,
      alignment: AlignmentType.CENTER,
      size: 16,
      borders: allBorders({ style: BorderStyle.SINGLE, size: 8, color: C.border }),
    }));
    if (index < boxes.length - 1) {
      widths.push(arrowWidth);
      cells.push(tableCell("→", arrowWidth, {
        bold: true,
        color: C.darkRed,
        alignment: AlignmentType.CENTER,
        size: 22,
        borders: allBorders(noBorder),
      }));
    }
  });
  return new Table({
    width: { size: widths.reduce((sum, n) => sum + n, 0), type: WidthType.DXA },
    columnWidths: widths,
    layout: TableLayoutType.FIXED,
    borders: allBorders(noBorder),
    rows: [new TableRow({ cantSplit: true, children: cells })],
  });
}

function spacer(after = 90) {
  return new Paragraph({ text: "", spacing: { after } });
}

function pageBreak() {
  return new Paragraph({ children: [new PageBreak()] });
}

function memoTable() {
  const labelWidth = 1000;
  const valueWidth = CONTENT_WIDTH - labelWidth;
  const rows = [
    ["A:", [
      cellParagraph("Ing. Reynaldo Jesús Flores Jaillita", { bold: true, size: 19 }),
      cellParagraph("ENCARGADO DEL ÁREA DE TECNOLOGÍAS DE LA INFORMACIÓN", { bold: true, size: 17, color: C.slate }),
    ]],
    ["De:", [
      cellParagraph(AUTHOR, { bold: true, size: 19, color: AUTHOR.startsWith("[") ? C.red : C.charcoal }),
      cellParagraph("Desarrollador de Software (CONSULTOR DE LÍNEA)", { bold: true, size: 17, color: C.slate }),
    ]],
    ["Ref.:", [cellParagraph("INFORME TÉCNICO DE PROYECTOS: PORTAL WEB INSTITUCIONAL Y MÓDULO DE DATOS, ESTADÍSTICAS Y SEGUIMIENTO POA", { bold: true, size: 18, color: C.darkRed })]],
    ["Fecha:", [cellParagraph("Oruro, 9 de octubre de 2026", { size: 18 })]],
  ];
  return new Table({
    width: { size: CONTENT_WIDTH, type: WidthType.DXA },
    columnWidths: [labelWidth, valueWidth],
    layout: TableLayoutType.FIXED,
    borders: {
      top: noBorder,
      bottom: redBorder,
      left: noBorder,
      right: noBorder,
      insideHorizontal: { style: BorderStyle.SINGLE, size: 3, color: "E2E5E8" },
      insideVertical: noBorder,
    },
    rows: rows.map(([label, value]) => new TableRow({
      cantSplit: true,
      children: [
        tableCell(label, labelWidth, { bold: true, color: C.darkRed, fill: C.white, borders: allBorders(noBorder), verticalAlign: VerticalAlign.TOP }),
        tableCell(value, valueWidth, { fill: C.white, borders: allBorders(noBorder), verticalAlign: VerticalAlign.TOP }),
      ],
    })),
  });
}

function buildHeader() {
  const logoBuffer = fs.readFileSync(LOGO);
  return new Header({
    children: [
      new Paragraph({
        children: [new ImageRun({
          data: logoBuffer,
          transformation: { width: 285, height: 79 },
          type: "png",
        })],
        alignment: AlignmentType.CENTER,
        spacing: { after: 35 },
        border: { bottom: { style: BorderStyle.SINGLE, size: 12, color: C.red } },
      }),
    ],
  });
}

function buildFooter() {
  return new Footer({
    children: [
      new Paragraph({
        children: [
          run("GOBIERNO AUTÓNOMO DEPARTAMENTAL DE ORURO", { size: 15, bold: true, color: C.darkRed }),
        ],
        alignment: AlignmentType.CENTER,
        border: { top: { style: BorderStyle.SINGLE, size: 10, color: C.red } },
        spacing: { before: 55, after: 15 },
      }),
      new Table({
        width: { size: CONTENT_WIDTH, type: WidthType.DXA },
        columnWidths: [7000, 2120],
        layout: TableLayoutType.FIXED,
        borders: allBorders(noBorder),
        rows: [new TableRow({
          cantSplit: true,
          children: [
            tableCell([
              new Paragraph({
                children: [run("Plaza 10 de Febrero, Presidente Montes entre Bolívar y Adolfo Mier · ¡Gobierno de Unidad!", { size: 13, color: C.slate })],
                alignment: AlignmentType.LEFT,
                spacing: { after: 0 },
              }),
            ], 7000, { borders: allBorders(noBorder) }),
            tableCell([
              new Paragraph({
                children: [
                  run("Página ", { size: 13, color: C.slate }),
                  new TextRun({ children: [PageNumber.CURRENT], font: "Century Gothic", size: 13, color: C.slate }),
                  run(" de ", { size: 13, color: C.slate }),
                  new TextRun({ children: [PageNumber.TOTAL_PAGES], font: "Century Gothic", size: 13, color: C.slate }),
                ],
                alignment: AlignmentType.RIGHT,
                spacing: { after: 0 },
              }),
            ], 2120, { borders: allBorders(noBorder) }),
          ],
        })],
      }),
    ],
  });
}

const children = [];

children.push(
  centeredTitle("PROYECTOS A DESARROLLAR"),
  memoTable(),
  spacer(150),
  heading("ANTECEDENTES", 1),
  para("En atención al esquema institucional de proyectos del Área de Tecnologías de la Información, el presente informe formula dos iniciativas con un horizonte de consolidación de tres meses. Ambas se enmarcan en programación y desarrollo web y responden a necesidades verificables de publicación institucional, administración de contenidos, gobierno de datos y seguimiento de la gestión pública."),
  para("La revisión del repositorio local demuestra que existe una base tecnológica desarrollada: un portal público, un panel administrativo independiente, esquemas de base de datos, autenticación, almacenamiento documental, módulos de transparencia, noticias, Gaceta Oficial, contrataciones, solicitudes ciudadanas, indicadores y seguimiento al POA. Por ello, la propuesta no consiste en rehacer el sistema, sino en consolidarlo, validar sus fuentes, cerrar brechas, documentarlo y prepararlo para una operación institucional controlada."),
  para("Los dos proyectos priorizados son: (1) Consolidación del Portal Web Institucional del Gobierno Autónomo Departamental de Oruro; y (2) Consolidación del Módulo Integrado de Datos, Estadísticas y Seguimiento al Plan Operativo Anual. El cronograma de cada proyecto conserva la estructura de tres meses solicitada en el documento de referencia."),
  noteBox(
    "CRITERIO DE VERIFICACIÓN",
    "Las cifras de este informe describen únicamente el código y los archivos auditados el 9 de octubre de 2026. No se tuvo acceso verificable a la base remota de Supabase ni a analítica de tráfico; por tanto, no se atribuyen usuarios, visitas, impacto, satisfacción ni cifras oficiales de ejecución que no estén sustentadas.",
    "info",
  ),
  spacer(90),
  heading("PROYECTOS ÁREA PROGRAMACIÓN Y DESARROLLO WEB", 1),
  para("Se propone trabajar sobre la solución existente mediante diagnóstico, normalización, integración, pruebas, seguridad, documentación y transferencia a los responsables institucionales."),
  pageBreak(),
);

// PROYECTO 1
children.push(
  heading("PORTAL WEB INSTITUCIONAL DEL GOBIERNO AUTÓNOMO DEPARTAMENTAL DE ORURO", 1),
  heading("DATOS GENERALES", 2),
  dataTable([
    ["Nombre del proyecto", "Consolidación del Portal Web Institucional del Gobierno Autónomo Departamental de Oruro"],
    ["Área responsable", "Área de Tecnologías de la Información"],
    ["Áreas beneficiarias", "Despacho, secretarías departamentales, unidades administrativas, Transparencia, Comunicación Social y ciudadanía"],
    ["Duración", "3 meses"],
    ["Tipo de intervención", "Consolidación, integración, validación, documentación e implementación controlada"],
    ["Plataforma", "Portal y panel administrativo en Next.js 16.3.8 / React 19.2.4, con Supabase, PostgreSQL, autenticación, almacenamiento y componentes especializados"],
  ]),
  spacer(),
  heading("SITUACIÓN ACTUAL", 2),
  para("El repositorio contiene dos aplicaciones Next.js separadas. La aplicación raíz presta el portal público; la aplicación ubicada en admin-panel presta la administración y se integra bajo la ruta /admin mediante reglas de reescritura. La separación evita mezclar las interfaces ciudadanas con las operaciones internas y facilita administrar permisos, despliegues y responsabilidades."),
  para("El portal público incluye información institucional, secretarías, noticias, Gaceta Oficial, transparencia, auditoría, contrataciones, publicaciones, trámites, autoridades, recursos humanos, desarrollo organizacional, información financiera, datos estadísticos y seguimiento al POA. La página de inicio consulta banners, configuración, secretarías, noticias, documentos y comunicados; varias rutas utilizan revalidación de sesenta segundos."),
  para("El panel administrativo incorpora gestión de noticias, carrusel, publicaciones, solicitudes, Gaceta, transparencia, POA, secretarías, estadísticas, contenido institucional, autoridades, contrataciones, documentos, usuarios y configuración. El acceso se apoya en Supabase Auth, perfiles administrativos y roles de superadministración o administración por secretaría."),
  para("La solución dispone de validación de cargas, saneamiento de contenido enriquecido, cabeceras HTTP de seguridad y políticas de seguridad a nivel de fila. Estas capacidades existen en el código, pero su aplicación efectiva debe comprobarse en la base y en el despliegue de producción."),
  matrixTable(
    ["Indicador técnico", "Resultado", "Interpretación"],
    [
      ["Aplicaciones web", "2", "Portal público y panel administrativo"],
      ["Archivos de página pública", "27", "Las rutas dinámicas pueden producir más URL"],
      ["Archivos de página administrativa", "28", "Listados, creación, edición y configuración"],
      ["Endpoints API administrativos", "5", "Usuarios, noticias, POA, archivos y secretarías"],
      ["Componentes públicos JS/JSX", "47", "Componentes reutilizables del portal"],
      ["Archivos SQL", "40", "Esquemas, vistas, políticas, correcciones y datos iniciales"],
      ["Páginas generadas en compilación", "67", "Compilación de producción completada localmente"],
      ["Recursos en public", "167", "Incluye 83 PDF, 55 imágenes y 21 videos"],
    ],
    [3000, 1400, 4720],
    { centerSecond: true },
  ),
  sourceNote("inventario local de archivos, rutas y salida de next build. Son métricas del repositorio, no analítica de usuarios ni prueba de contenido vigente en producción."),
  para("La línea base muestra una solución amplia, aunque todavía necesita consolidación. Algunas rutas existen sin estar visibles en la navegación; varios módulos combinan datos de Supabase con archivos locales; hay documentos de distintas gestiones; y la matriz interna de cumplimiento aclara que disponer de un mecanismo de publicación no equivale a tener contenido oficial cargado y actualizado."),
  para("La compilación de producción terminó correctamente. No obstante, las consultas externas a Supabase no pudieron verificarse desde el entorno aislado. El análisis estático dirigido a los directorios de código fuente registró observaciones pendientes que deben incorporarse a la deuda técnica antes de la entrega definitiva."),
  noteBox(
    "HALLAZGOS QUE NO DEBEN PRESENTARSE COMO FUNCIONES TERMINADAS",
    "El formulario visual de contacto no persiste envíos; los seis trámites locales usan enlaces de formulario vacíos; existen rutas ocultas o no enlazadas; y una ruta de información financiera dirige a una categoría no implementada. Estas brechas deben corregirse o comunicarse de forma explícita.",
  ),
  spacer(),
  heading("OBJETIVO GENERAL", 2),
  para("Consolidar e implementar el Portal Web Institucional del Gobierno Autónomo Departamental de Oruro, integrando publicación ciudadana, administración de contenidos, autenticación, base de datos, almacenamiento y controles de seguridad, para brindar información organizada, accesible, actualizable y verificable."),
  heading("OBJETIVOS ESPECÍFICOS", 2),
  ...[
    "Validar la arquitectura, configuración y rutas de las dos aplicaciones.",
    "Consolidar la navegación y habilitar únicamente secciones con contenido aprobado.",
    "Verificar la integración con Supabase Auth, PostgreSQL y almacenamiento.",
    "Revisar roles, permisos y políticas de seguridad a nivel de fila.",
    "Normalizar títulos, categorías, periodos, responsables y estados de publicación.",
    "Validar noticias, Gaceta, transparencia, secretarías, autoridades y contrataciones.",
    "Comprobar formularios, cargas, descargas, buscadores y filtros.",
    "Corregir incidencias de calidad, enlaces, responsividad y accesibilidad básica.",
    "Definir responsables y periodicidad de actualización por tipo de contenido.",
    "Entregar manuales, documentación técnica, pruebas y capacitación.",
  ].map((item) => bullet(item)),
  heading("ALCANCE", 2),
  heading("Portal público institucional", 3),
  para("Comprende la página principal y las rutas de institución, secretarías, noticias, Gaceta Oficial, transparencia, auditoría, contrataciones, publicaciones, trámites, autoridades, recursos humanos, desarrollo organizacional, información financiera, datos y estadísticas, seguimiento al POA, búsqueda global y contenidos multimedia."),
  ...[
    "Revisión de menús, rutas, títulos, metadatos y estados vacíos.",
    "Validación de enlaces internos, documentos, imágenes, videos y redes sociales.",
    "Control de visibilidad para evitar publicar secciones incompletas.",
    "Pruebas en escritorio, tableta y teléfono.",
  ].map((item) => bullet(item)),
  heading("Gestión de contenido y panel administrativo", 3),
  para("Incluye los flujos de creación, edición, ordenamiento, publicación y eliminación de contenido, así como la gestión de usuarios, roles, secretarías, solicitudes y configuración. Se revisarán validaciones, mensajes de error, confirmaciones, permisos por ámbito y trazabilidad mínima."),
  heading("Transparencia, documentación y atención ciudadana", 3),
  para("Cada contenido deberá contar, cuando corresponda, con título oficial, categoría, gestión, fecha, unidad responsable, archivo, estado de visibilidad y fecha de actualización. La matriz interna de mecanismos servirá como lista de control técnica, pero el contenido será validado por la unidad competente antes de declararse vigente."),
  heading("Seguridad, despliegue y continuidad", 3),
  para("Se verificará el uso de credenciales, políticas RLS, límites de carga, saneamiento de HTML, cabeceras HTTP, copias de seguridad, recuperación, registro de incidencias y separación de funciones. Toda migración se ejecutará con respaldo y procedimiento de reversión."),
  heading("Experiencia de usuario, accesibilidad y rendimiento", 3),
  para("Las pruebas abarcarán navegación con teclado, contraste, etiquetas, textos alternativos, tablas adaptables, menús móviles, mensajes comprensibles, peso de recursos, comportamiento con conexión lenta y respuesta ante fallos de servicios externos."),
  heading("Seguimiento de incidencias", 3),
  para("Las observaciones se registrarán con identificador, ruta, evidencia, severidad, responsable, estado y criterio de aceptación. El cierre de cada incidencia requerirá una prueba reproducible y la actualización de la documentación correspondiente."),
  heading("ARQUITECTURA TECNOLÓGICA IMPLEMENTADA", 2),
  flowTable(
    ["PORTAL PÚBLICO\nNext.js", "SUPABASE\nPostgreSQL · Auth · Storage", "PANEL ADMINISTRATIVO\nNext.js"],
    ["EAF2F8", "F8E6EA", "EEF6F1"],
  ),
  caption("Figura 1. Arquitectura lógica verificada en el repositorio."),
  matrixTable(
    ["Capa", "Componente", "Función"],
    [
      ["Presentación pública", "Aplicación Next.js raíz", "Consulta y publicación ciudadana"],
      ["Administración", "Aplicación admin-panel", "Gestión interna de contenidos, datos y usuarios"],
      ["Persistencia", "Supabase / PostgreSQL", "Tablas, vistas, relaciones y políticas"],
      ["Identidad", "Supabase Auth + usuarios_admin", "Sesiones, perfiles y roles"],
      ["Archivos", "Buckets de imágenes y documentos", "Recursos gráficos y PDF"],
      ["Analítica", "Nivo, tablas y vistas SQL", "Indicadores y resúmenes"],
      ["Territorio", "Leaflet, GeoJSON y componentes propios", "Mapas e información geográfica"],
    ],
    [1900, 2600, 4620],
  ),
  sourceNote("package.json, next.config.mjs, src/lib/supabase, admin-panel/src/lib y estructura de componentes."),
  heading("DESARROLLO EN 3 MESES", 2),
  timelineTable([
    {
      title: "Mes 1 – Diagnóstico y diseño",
      tasks: [
        "Inventario de rutas públicas y administrativas.",
        "Revisión de dependencias y configuración.",
        "Validación de tablas, vistas, buckets y RLS.",
        "Diagnóstico de roles y permisos.",
        "Inventario de documentos y recursos.",
        "Identificación de páginas ocultas o incompletas.",
        "Definición de responsables por contenido.",
        "Matriz de riesgos y criterios de aceptación.",
        "Plan de pruebas, respaldo y publicación.",
      ],
      result: "Diagnóstico verificable, brechas priorizadas, responsables definidos y plan de consolidación aprobado.",
    },
    {
      title: "Mes 2 – Integración y corrección",
      tasks: [
        "Corrección de errores funcionales priorizados.",
        "Consolidación de navegación y enlaces.",
        "Validación de consultas a Supabase.",
        "Aplicación controlada de migraciones aprobadas.",
        "Normalización de categorías, títulos y fechas.",
        "Carga piloto de contenido validado.",
        "Ajustes responsivos y de accesibilidad.",
        "Preparación de manuales preliminares.",
        "Pruebas parciales con usuarios designados.",
      ],
      result: "Portal y panel integrados, permisos revisados y versión candidata disponible para validación.",
    },
    {
      title: "Mes 3 – Pruebas e implementación",
      tasks: [
        "Pruebas funcionales integrales.",
        "Pruebas de permisos y seguridad.",
        "Pruebas en dispositivos y navegadores.",
        "Validación de formularios, búsquedas y filtros.",
        "Verificación de documentos y descargas.",
        "Prueba de respaldo y recuperación.",
        "Corrección de incidencias de cierre.",
        "Capacitación a administradores.",
        "Implementación controlada y acta de entrega.",
      ],
      result: "Portal consolidado, probado, documentado y habilitado para operación institucional controlada.",
    },
  ]),
  heading("ENTREGABLE", 2),
  ...[
    "Portal Web Institucional consolidado.",
    "Panel administrativo integrado y verificado.",
    "Inventario de rutas, componentes, tablas, vistas y recursos.",
    "Matriz de contenidos, responsables y periodicidad.",
    "Navegación pública revisada y organizada.",
    "Módulos institucionales validados.",
    "Roles, permisos y políticas de seguridad verificados.",
    "Registro de incidencias y correcciones.",
    "Plan de respaldo, recuperación y mantenimiento.",
    "Lista de pruebas funcionales, responsivas, de accesibilidad y seguridad.",
    "Contenido piloto validado por las áreas responsables.",
    "Manual de administración de contenidos.",
    "Manual de usuario.",
    "Documentación técnica de arquitectura e instalación.",
    "Capacitación a administradores designados.",
    "Informe final de implementación, limitaciones y recomendaciones.",
  ].map((item) => numbered(item)),
  heading("BENEFICIOS ESPERADOS", 2),
  ...[
    "Centralización de la información institucional.",
    "Actualización de contenidos sin modificar directamente el código.",
    "Separación clara entre consulta ciudadana y administración interna.",
    "Mejor organización y trazabilidad documental.",
    "Fortalecimiento de la transparencia y de la atención ciudadana.",
    "Mayor control sobre contenidos visibles y responsables de publicación.",
    "Mejora de la seguridad en accesos, cargas y archivos.",
    "Experiencia consistente en equipos de escritorio y móviles.",
    "Reducción del riesgo de publicar pruebas como información oficial.",
    "Base documentada para operación y mantenimiento continuo.",
  ].map((item) => bullet(item)),
  heading("CONCLUSIONES Y RECOMENDACIONES", 2),
  para("La auditoría confirma que el Gobierno Autónomo Departamental de Oruro dispone de una base tecnológica amplia para su portal. La alternativa razonable es consolidar el desarrollo existente, verificar su entorno remoto, corregir brechas y completar la carga de contenido oficial, no iniciar una solución paralela desde cero."),
  para("Se recomienda publicar únicamente secciones validadas, designar responsables por tipo de contenido, comprobar las migraciones y políticas de seguridad, ejecutar respaldos antes de cambios y mantener un ciclo permanente de actualización, monitoreo y revisión. La existencia del código demuestra capacidad técnica; no sustituye la aprobación sustantiva de cada dato por la unidad competente."),
  pageBreak(),
);

// PROYECTO 2
children.push(
  heading("MÓDULO INTEGRADO DE DATOS, ESTADÍSTICAS Y SEGUIMIENTO POA", 1),
  heading("DATOS GENERALES", 2),
  dataTable([
    ["Nombre del proyecto", "Consolidación del Módulo Integrado de Datos, Estadísticas y Seguimiento al Plan Operativo Anual"],
    ["Área responsable", "Área de Tecnologías de la Información, en coordinación con Planificación y las unidades generadoras de datos"],
    ["Áreas beneficiarias", "Planificación, Administración y Finanzas, secretarías, Despacho, Transparencia y ciudadanía"],
    ["Duración", "3 meses"],
    ["Tipo de intervención", "Integración de módulos, normalización de fuentes, validación de datos y publicación controlada"],
    ["Plataforma", "Next.js, React, Supabase/PostgreSQL, vistas SQL, importación de Excel, archivos JSON, Nivo y mapas"],
  ]),
  spacer(),
  heading("SITUACIÓN ACTUAL", 2),
  para("La ruta /datos-estadisticas consulta la tabla estadisticas_secretarias y agrupa indicadores públicos por secretaría. El panel administrativo permite crear, modificar, eliminar y ordenar indicadores con título, valor, unidad, periodo, descripción, icono y visibilidad."),
  para("La estructura es funcional, pero el valor y el periodo se almacenan como texto y el esquema no registra de forma explícita fuente, fórmula, denominador, frecuencia, fecha de corte o responsable de validación. El número actual de indicadores no pudo comprobarse porque la base remota no estuvo disponible; cuando la consulta queda vacía, la página informa que los datos están en actualización."),
  para("Para el POA coexisten varios circuitos. La ruta pública de seguimiento utiliza un archivo JSON local; otro componente consulta tablas y vistas de Supabase; existe un importador de Excel; y hay archivos alternos de planificación, presupuestos municipales y programas 2026. Esta coexistencia demuestra capacidad técnica, pero impide afirmar que todas las vistas comparten la misma versión del dato."),
  matrixTable(
    ["Fuente local", "Volumen verificado", "Observación de calidad"],
    [
      ["municipalitiesBudgets.json", "35 municipios · 3.238 filas", "Sin fuente, año, versión ni fecha de corte en el archivo"],
      ["planificacion.json", "3.266 filas", "Contiene jerarquías, etiquetas inconsistentes y diferencias con el otro archivo"],
      ["programasProyectos2026.json", "118 registros", "32 programas y 86 proyectos; sin fuente o fecha de corte"],
      ["costos_construccion.json", "96 productos · 6.336 valores", "Serie mensual 2021–junio 2026; sin metodología declarada"],
      ["estadisticas_secretarias", "Cantidad no verificada", "Fuente dinámica en Supabase; no accesible durante la revisión"],
      ["Geoportal POA", "Prototipo", "Incluye registros sintéticos; se excluye como evidencia oficial"],
    ],
    [2750, 1800, 4570],
    { centerSecond: true },
  ),
  sourceNote("conteos calculados sobre los archivos del repositorio. No constituyen estadísticas oficiales ni datos en tiempo real."),
  heading("Resumen interno del archivo programasProyectos2026.json", 3),
  matrixTable(
    ["Medida calculada", "Resultado"],
    [
      ["Registros", "118"],
      ["Programas", "32"],
      ["Proyectos", "86"],
      ["Unidades ejecutoras", "10"],
      ["Presupuesto vigente agregado", "Bs 403.934.101,75"],
      ["Ejecución agregada", "Bs 29.071.706,98"],
      ["Ejecución ponderada", "7,1971 %"],
      ["Registros con ejecución igual a cero", "55"],
    ],
    [6000, 3120],
    { centerSecond: true, headerFill: C.blue },
  ),
  sourceNote("suma interna del JSON auditado. El archivo no documenta fuente primaria ni fecha de corte, por lo que estos valores no deben difundirse como ejecución certificada."),
  noteBox(
    "RIESGO PRIORITARIO",
    "El geoportal genera datos sintéticos para municipios sin listas específicas y los presenta con rótulos que pueden interpretarse como oficiales. Las gráficas de ejemplo y los datos ficticios de componentes no montados también deben excluirse. Ninguno de esos valores se utiliza como evidencia en este informe.",
  ),
  spacer(),
  heading("OBJETIVO GENERAL", 2),
  para("Consolidar un módulo integrado para registrar, validar, procesar, consultar y publicar indicadores institucionales y seguimiento al POA, mediante fuentes identificadas, periodos definidos y controles que garanticen trazabilidad, consistencia y aprobación institucional."),
  heading("OBJETIVOS ESPECÍFICOS", 2),
  ...[
    "Inventariar y conciliar las fuentes estadísticas y presupuestarias existentes.",
    "Definir una fuente oficial y un responsable para cada conjunto de datos.",
    "Incorporar fuente, fecha de corte, periodicidad, método y validación.",
    "Estandarizar tipos de valor, unidades y reglas de presentación.",
    "Fortalecer la importación de Excel con previsualización, control y reversión.",
    "Mantener historial de cargas, responsables y archivos de origen.",
    "Consolidar resúmenes globales, municipales, sectoriales y por gestión.",
    "Publicar únicamente registros aprobados y distinguir datos provisionales.",
    "Retirar o identificar inequívocamente los datos de demostración.",
    "Documentar el modelo, capacitar responsables y establecer un protocolo de actualización.",
  ].map((item) => bullet(item)),
  heading("FUNCIONAMIENTO PROPUESTO", 2),
  flowTable(
    ["REGISTRO O IMPORTACIÓN", "VALIDACIÓN TÉCNICA", "APROBACIÓN INSTITUCIONAL", "FUENTE CANÓNICA", "PUBLICACIÓN Y SEGUIMIENTO"],
    ["EAF2F8", "F4F5F6", "FFF3CD", "F8E6EA", "EEF6F1"],
  ),
  caption("Figura 2. Flujo propuesto de gobierno y publicación de datos."),
  para("La carga no producirá publicación automática. Los registros atravesarán, como mínimo, los estados de borrador, en revisión, aprobado, publicado u observado. Los archivos locales se tratarán como fuentes de migración, respaldo o histórico; una vez conciliados, la vista pública no consumirá dos versiones incompatibles del mismo indicador."),
  heading("MÓDULO DE DATOS Y ESTADÍSTICAS INSTITUCIONALES", 2),
  heading("Información general", 3),
  para("Cada indicador registrará código, título, descripción, secretaría responsable, categoría temática, periodo, fecha de corte y frecuencia de actualización. Estos campos permitirán saber qué representa el valor y quién responde por su vigencia."),
  heading("Información estadística", 3),
  para("El valor se clasificará como cantidad, porcentaje, moneda, tasa, índice o texto. Cuando corresponda, incluirá denominador, unidad, fórmula, desagregación territorial, valor anterior y meta aprobada. La presentación redondeará de forma consistente sin alterar el dato almacenado."),
  heading("Seguimiento", 3),
  para("El módulo permitirá filtrar por secretaría, periodo y categoría; ordenar indicadores; mostrar la última actualización; controlar visibilidad; consultar historial y exportar únicamente información autorizada."),
  heading("Evidencia", 3),
  para("Cada indicador deberá vincularse con su fuente institucional, documento o sistema de origen, método de cálculo, responsable de elaboración, responsable de validación y observaciones metodológicas. Sin estos elementos, el indicador permanecerá en revisión."),
  heading("MÓDULO DE SEGUIMIENTO Y EVALUACIÓN AL POA", 2),
  para("El POA consolidará gestión, municipio, unidad ejecutora, programa, proyecto, actividad, tipo, descripción, monto programado, monto ejecutado, avance físico, estado y fecha de corte. La carga por Excel incorporará validación de columnas, previsualización, detección de duplicados, comparación con datos existentes, aprobación y registro del lote."),
  ...[
    "Consulta del resumen global y por municipio.",
    "Separación entre inversión y gasto corriente.",
    "Filtros por gestión, secretaría, municipio y tipo.",
    "Cálculo documentado de ejecución financiera y avance físico.",
    "Publicación exclusiva de registros aprobados.",
    "Mensaje claro cuando no exista información para el filtro seleccionado.",
  ].map((item) => bullet(item)),
  heading("MÓDULO DE ADMINISTRACIÓN, VALIDACIÓN Y PUBLICACIÓN", 2),
  para("Tecnologías de la Información administrará la plataforma, los accesos, respaldos y soporte. Planificación validará la estructura y seguimiento del POA; Administración y Finanzas validará los datos financieros de su competencia; cada secretaría responderá por sus indicadores; y Transparencia podrá verificar publicación y actualización. El sistema registrará quién cargó, revisó y autorizó cada publicación."),
  matrixTable(
    ["Capa", "Situación identificada", "Acción de consolidación"],
    [
      ["Indicadores", "CRUD por secretaría", "Añadir fuente, fecha de corte, método y aprobación"],
      ["Importación POA", "Sustitución por gestión/ámbito", "Previsualización, respaldo, validación y reversión"],
      ["Persistencia", "Tablas y vistas Supabase", "Confirmar esquema remoto y aplicar migraciones controladas"],
      ["Datos locales", "Varios JSON", "Conciliar, migrar o clasificar como histórico"],
      ["Visualización", "Varias vistas públicas", "Conectar cada vista a una fuente identificada"],
      ["Seguridad", "Auth, perfiles y RLS", "Probar accesos por rol y unidad"],
      ["Historial", "Fechas básicas", "Registrar lote, archivo, usuario y aprobación"],
      ["Documentación", "Dispersa en código y SQL", "Crear catálogo, diccionario y protocolo de actualización"],
    ],
    [1700, 3300, 4120],
  ),
  heading("DESARROLLO EN 3 MESES", 2),
  timelineTable([
    {
      title: "Mes 1 – Diagnóstico y gobierno de datos",
      tasks: [
        "Inventario de tablas, vistas, JSON y componentes.",
        "Identificación de responsables por dato.",
        "Comparación de fuentes locales.",
        "Revisión de indicadores y POA.",
        "Verificación de vistas y fórmulas.",
        "Identificación de datos sintéticos.",
        "Catálogo de indicadores y diccionario POA.",
        "Definición de estados y criterios de aceptación.",
      ],
      result: "Fuentes inventariadas, responsables definidos, brechas documentadas y protocolo de validación aprobado.",
    },
    {
      title: "Mes 2 – Integración y consolidación",
      tasks: [
        "Ajuste de metadatos de indicadores.",
        "Fortalecimiento del importador de Excel.",
        "Previsualización y reporte de errores.",
        "Registro de lotes y archivos de origen.",
        "Consolidación de resúmenes.",
        "Integración de vistas públicas.",
        "Separación de datos oficiales y prototipos.",
        "Pruebas parciales con áreas responsables.",
      ],
      result: "Indicadores y POA integrados sobre una fuente definida y disponibles para validación institucional.",
    },
    {
      title: "Mes 3 – Validación e implementación",
      tasks: [
        "Pruebas integrales de indicadores y POA.",
        "Conciliación con documentos responsables.",
        "Pruebas de carga, rechazo y reversión.",
        "Pruebas de roles y publicación.",
        "Validación de resúmenes y porcentajes.",
        "Retiro de datos de demostración.",
        "Carga inicial aprobada.",
        "Capacitación, manuales y acta de conformidad.",
      ],
      result: "Módulo integrado, datos iniciales validados, publicación controlada y responsables capacitados.",
    },
  ]),
  heading("ENTREGABLE", 2),
  ...[
    "Inventario de fuentes y archivos locales.",
    "Matriz de responsables institucionales.",
    "Catálogo de indicadores.",
    "Diccionario de datos del POA.",
    "Modelo consolidado de estadísticas.",
    "Modelo consolidado de seguimiento al POA.",
    "Importador de Excel con previsualización y reporte de errores.",
    "Registro de cargas y archivos de origen.",
    "Resúmenes global, municipal y por tipo.",
    "Panel de indicadores por secretaría.",
    "Filtros por gestión, periodo, secretaría, municipio y tipo.",
    "Control de validación y visibilidad.",
    "Rutas públicas conectadas con fuentes definidas.",
    "Separación de datos oficiales y de demostración.",
    "Protocolo de actualización y publicación.",
    "Manuales, documentación técnica, pruebas y capacitación.",
  ].map((item) => numbered(item)),
  heading("BENEFICIOS ESPERADOS", 2),
  ...[
    "Fuente institucional identificada para cada dato.",
    "Reducción de duplicidades y contradicciones.",
    "Trazabilidad de cargas, revisiones y publicaciones.",
    "Identificación visible de fuente y fecha de corte.",
    "Mayor control de importaciones y sustituciones.",
    "Consulta por gestión, municipio, secretaría y tipo.",
    "Integración del avance físico y financiero.",
    "Publicación de indicadores con contexto metodológico.",
    "Mejor coordinación entre áreas productoras de información.",
    "Base confiable para futuros tableros y reportes.",
  ].map((item) => bullet(item)),
  heading("CONCLUSIONES Y RECOMENDACIONES", 2),
  para("El repositorio contiene los componentes fundamentales para un módulo integrado: tablas, vistas, formularios, importación desde Excel, paneles, filtros y archivos presupuestarios. La principal brecha no es tecnológica, sino de gobierno: coexisten varias fuentes, algunas carecen de metadatos y determinados componentes incorporan datos demostrativos."),
  para("Se recomienda definir una fuente canónica institucional, conciliar o archivar los JSON, incorporar fuente y fecha de corte, fortalecer la importación con respaldo y aprobación, y retirar los datos sintéticos de toda vista oficial. Tecnologías de la Información debe garantizar la plataforma; la exactitud y autorización del dato corresponde a las unidades competentes."),
  pageBreak(),
);

// ANEXO DE EVIDENCIA
children.push(
  heading("ANEXO TÉCNICO — FUENTES DE VERIFICACIÓN Y LÍMITES", 1),
  para("La documentación se elaboró mediante revisión local del repositorio, conteo de archivos y registros, lectura de componentes, esquemas SQL y una compilación de producción. No se consultó la base de datos remota ni se accedió a analítica web."),
  matrixTable(
    ["Evidencia", "Uso en el informe"],
    [
      ["package.json y admin-panel/package.json", "Versiones, dependencias y separación de aplicaciones"],
      ["src/app y admin-panel/src/app/admin", "Inventario de páginas y funciones"],
      ["admin-panel/src/app/api", "Inventario de endpoints administrativos"],
      ["src/app/(public)/datos-estadisticas/page.js", "Consulta y publicación de indicadores"],
      ["sql/15_poa.sql y sql/16_estadisticas_secretarias.sql", "Modelo de POA e indicadores"],
      ["admin-panel/src/app/api/poa/import/route.js", "Proceso de importación de Excel"],
      ["BudgetDashboard.jsx y PoaDbView.jsx", "Coexistencia de fuentes locales y base de datos"],
      ["municipalitiesBudgets.json, planificacion.json y programasProyectos2026.json", "Inventario cuantitativo local"],
      ["src/data/costos_construccion.json", "Serie local de precios de materiales"],
      ["GeoportalPoa.jsx", "Identificación y exclusión de datos sintéticos"],
      ["next.config.mjs, auth.js, proxy.js y scripts RLS", "Arquitectura y controles de seguridad"],
      ["docs/cumplimiento-rm-067-2025.md", "Matriz interna y límites del cumplimiento técnico"],
    ],
    [3900, 5220],
  ),
  spacer(),
  heading("Resultado de verificación técnica", 2),
  ...[
    "La compilación de producción finalizó correctamente y generó 67 páginas.",
    "Las consultas remotas fallaron por restricción de red del entorno de revisión; no se asumieron valores de producción.",
    "El análisis estático acotado a src y admin-panel/src registró 82 errores y 34 advertencias en 43 archivos; constituyen deuda técnica, no prueba de indisponibilidad total.",
    "No existe integración de analítica web que permita afirmar visitas, usuarios, conversiones o satisfacción.",
    "Los valores de ejemplo, datos ficticios y registros sintéticos fueron excluidos de las conclusiones estadísticas.",
  ].map((item) => bullet(item)),
  noteBox(
    "CAMPO PENDIENTE",
    AUTHOR.startsWith("[")
      ? "El remitente no fue identificado de forma verificable en el documento modelo ni en el repositorio. Debe reemplazarse el campo de nombre antes de la firma; se dejó visible para evitar atribuir una identidad inventada."
      : `El documento fue generado con el nombre de remitente confirmado: ${AUTHOR}.`,
    "info",
  ),
  new Paragraph({
    children: [run("\u200B", { size: 2, color: C.white })],
    spacing: { before: 0, after: 0, line: 20, lineRule: LineRuleType.EXACT },
  }),
);

const doc = new Document({
  creator: AUTHOR,
  title: "Informe técnico de proyectos web y estadísticas — GADOR",
  subject: "Consolidación del Portal Web Institucional y del Módulo de Datos, Estadísticas y Seguimiento POA",
  description: "Documento técnico elaborado a partir de una auditoría local del repositorio web-gober.",
  keywords: "GADOR, portal web, estadísticas, POA, Supabase, Next.js",
  lastModifiedBy: "Área de Tecnologías de la Información",
  styles: {
    default: {
      document: {
        run: { font: "Century Gothic", size: 21, color: C.charcoal },
        paragraph: { spacing: { after: 120, line: 276, lineRule: LineRuleType.AUTO } },
      },
    },
    paragraphStyles: [
      {
        id: "Heading1",
        name: "Heading 1",
        basedOn: "Normal",
        next: "Normal",
        quickFormat: true,
        run: { font: "Century Gothic", size: 27, bold: true, color: C.darkRed, allCaps: true },
        paragraph: { spacing: { before: 240, after: 120 }, keepNext: true, outlineLevel: 0 },
      },
      {
        id: "Heading2",
        name: "Heading 2",
        basedOn: "Normal",
        next: "Normal",
        quickFormat: true,
        run: { font: "Century Gothic", size: 23, bold: true, color: C.red, allCaps: true },
        paragraph: {
          spacing: { before: 190, after: 85 },
          keepNext: true,
          outlineLevel: 1,
          border: { bottom: { style: BorderStyle.SINGLE, size: 5, color: "E3A0AE" } },
        },
      },
      {
        id: "Heading3",
        name: "Heading 3",
        basedOn: "Normal",
        next: "Normal",
        quickFormat: true,
        run: { font: "Century Gothic", size: 21, bold: true, color: C.blue },
        paragraph: { spacing: { before: 140, after: 55 }, keepNext: true, outlineLevel: 2 },
      },
    ],
  },
  numbering: {
    config: [
      {
        reference: "gador-bullets",
        levels: [
          {
            level: 0,
            format: LevelFormat.BULLET,
            text: "•",
            alignment: AlignmentType.LEFT,
            style: { paragraph: { indent: { left: 520, hanging: 250 } }, run: { font: "Century Gothic", color: C.red } },
          },
          {
            level: 1,
            format: LevelFormat.BULLET,
            text: "–",
            alignment: AlignmentType.LEFT,
            style: { paragraph: { indent: { left: 900, hanging: 250 } }, run: { font: "Century Gothic", color: C.slate } },
          },
        ],
      },
      {
        reference: "gador-decimal",
        levels: [
          {
            level: 0,
            format: LevelFormat.DECIMAL,
            text: "%1.",
            alignment: AlignmentType.LEFT,
            style: { paragraph: { indent: { left: 560, hanging: 300 } }, run: { font: "Century Gothic", bold: true, color: C.darkRed } },
          },
        ],
      },
    ],
  },
  sections: [
    {
      properties: {
        page: {
          size: { width: PAGE_WIDTH, height: PAGE_HEIGHT },
          margin: {
            top: 1540,
            right: 1417,
            bottom: 1220,
            left: 1701,
            header: 260,
            footer: 330,
          },
        },
      },
      headers: { default: buildHeader() },
      footers: { default: buildFooter() },
      children,
    },
  ],
});

Packer.toBuffer(doc)
  .then((buffer) => {
    fs.writeFileSync(OUTPUT, buffer);
    process.stdout.write(`${OUTPUT}\n`);
  })
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
