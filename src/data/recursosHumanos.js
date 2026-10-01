export const RECURSOS_HUMANOS_SECCIONES = {
  'nomina-autoridades': {
    titulo: 'Nómina de autoridades',
    descripcion: 'Nóminas oficiales de las autoridades del Gobierno Autónomo Departamental de Oruro.',
    icono: '👔',
    documentos: [
      ['2022', 'Nómina de Autoridades', '2022-01-01', 'nomina-autoridades-2022.pdf'],
      ['2021', 'Nómina de Autoridades GADOR', '2021-01-01', 'nomina-autoridades-gador-2021.pdf'],
    ],
  },
  'nomina-personal-dependiente': {
    titulo: 'Nómina del personal dependiente',
    descripcion: 'Nóminas y planillas oficiales del personal dependiente de la institución.',
    icono: '👥',
    documentos: [
      ['2021', 'Nómina del Personal Dependiente GADOR', '2021-01-01', 'nomina-personal-dependiente-2021.pdf'],
      ['Personal eventual', 'Nómina del Personal Eventual', '2026-01-01', 'nomina-personal-eventual.pdf'],
      ['Personal regular', 'Nómina del Personal Regular', '2026-01-01', 'nomina-personal-regular.pdf'],
      ['Personal regular', 'Nómina del Personal Regular — versión complementaria', '2026-01-01', 'nomina-personal-regular-version-2.pdf'],
      ['Planilla', 'Planilla de Personal Regular', '2026-01-01', 'planilla-personal-regular.pdf'],
    ],
  },
  'perfil-cargos': {
    titulo: 'Términos de referencia y perfil de cargos',
    descripcion: 'Manuales de descripción de cargos para las unidades organizacionales.',
    icono: '💼',
    documentos: [
      ['MDC-SDAJ', 'Manual de Descripción de Cargos — SDAJ', '2026-01-01', 'mdc-sdaj.pdf'],
      ['MDC-SDPD', 'Manual de Descripción de Cargos — SDPD', '2026-01-01', 'mdc-sdpd.pdf'],
      ['MDC-SDMAAyMT', 'Manual de Descripción de Cargos — SDMAAyMT', '2026-01-01', 'mdc-sdmaaymt.pdf'],
      ['MDC-SDCyT', 'Manual de Descripción de Cargos — SDCyT', '2026-01-01', 'mdc-sdcyt.pdf'],
      ['MDC-SDDPI', 'Manual de Descripción de Cargos — SDDPI', '2026-01-01', 'mdc-sddpi.pdf'],
      ['MDC-SDMM', 'Manual de Descripción de Cargos — SDMM', '2026-01-01', 'mdc-sdmm.pdf'],
      ['MDC-SDMyM', 'Manual de Descripción de Cargos — SDMyM', '2026-01-01', 'mdc-sdmym.pdf'],
      ['MDC-SDDSySA', 'Manual de Descripción de Cargos — SDDSySA', '2026-01-01', 'mdc-sddsysa.pdf'],
      ['MDC-SDDSySA', 'Manual de Descripción de Cargos — SDDSySA — versión complementaria', '2026-01-01', 'mdc-sddsysa-version-1.pdf'],
    ],
  },
};

export function getDocumentosRecursosHumanos(tipo) {
  const seccion = RECURSOS_HUMANOS_SECCIONES[tipo];

  if (!seccion) return null;

  return {
    ...seccion,
    documentos: seccion.documentos.map(([numero_documento, titulo, fecha_publicacion, archivo], index) => ({
      id: `${tipo}-${index + 1}`,
      anio: Number(fecha_publicacion.slice(0, 4)),
      numero_documento,
      titulo,
      fecha_publicacion,
      archivo_pdf_url: `/documentos/recursos-humanos/${tipo}/${archivo}`,
    })),
  };
}
