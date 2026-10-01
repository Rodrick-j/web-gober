export const DESARROLLO_ORGANIZACIONAL_SECCIONES = {
  'reglamentos-vigentes': {
    titulo: 'Reglamentos vigentes',
    descripcion: 'Normativa interna y reglamentos institucionales vigentes.',
    icono: '⚖️',
    documentos: [
      ['R.A.D.O. 288/2026', 'Reglamento Específico del Sistema de Administración de Bienes y Servicios (RE-SABS)', 're-sabs-rado-288-2026.pdf'],
      ['Reglamento', 'Reglamento Interno de Personal', 'reglamento-interno-de-personal.pdf'],
      ['Reglamento', 'Reglamento Interno para Pasantías, Trabajos Dirigidos y Modalidades de Graduación', 'reglamento-pasantias-y-modalidades-de-graduacion.pdf'],
      ['Reglamento', 'Reglamento Interno para la Contratación de Personal Eventual', 'reglamento-contratacion-personal-eventual.pdf'],
      ['Reglamento', 'Reglamento para el Uso de Ambientes, Equipos, Muebles y Enseres', 'reglamento-uso-de-ambientes-y-bienes.pdf'],
    ],
  },
  'manual-funciones': {
    titulo: 'Manual de funciones',
    descripcion: 'Manuales de Organización de Funciones de las unidades institucionales.',
    icono: '📚',
    documentos: [
      ['MOF', 'Manual de Organización de Funciones — Dirección Superior', 'mof-direccion-superior.pdf'],
      ['MOF', 'Manual de Organización de Funciones — Dirección de Unidades GAD Oruro', 'mof-direccion-de-unidades.pdf'],
      ['MOF-SG', 'Manual de Organización de Funciones — Secretaría General', 'mof-secretaria-general.pdf'],
      ['MOF-SDAFP', 'Manual de Organización de Funciones — SDAFP', 'mof-sdafp.pdf'],
      ['MOF-SDAJ', 'Manual de Organización de Funciones — SDAJ', 'mof-sdaj.pdf'],
      ['MOF-SDMAAyMT', 'Manual de Organización de Funciones — SDMAAyMT', 'mof-sdmaaymt.pdf'],
      ['MOF-SDCYT', 'Manual de Organización de Funciones — SDCYT', 'mof-sdcyt.pdf'],
      ['MOF-SDOP', 'Manual de Organización de Funciones — SDOP', 'mof-sdop.pdf'],
      ['MOF-SDDPI', 'Manual de Organización de Funciones — SDDPI', 'mof-sddpi.pdf'],
      ['MOF-SDMyM', 'Manual de Organización de Funciones — SDMyM', 'mof-sdmym.pdf'],
      ['MOF-SDDSySA', 'Manual de Organización de Funciones — SDDSySA', 'mof-sddsysa.pdf'],
    ],
  },
  'flujos-procesos': {
    titulo: 'Flujos de procesos',
    descripcion: 'Manuales, procedimientos y procesos operativos institucionales.',
    icono: '🔀',
    documentos: [
      ['Manual', 'Manual de Procesos y Procedimientos para la Emisión de Preventivo y Certificación Presupuestaria', 'manual-emision-de-preventivo-y-certificacion.pdf'],
      ['Manual', 'Manual de Procedimiento para el Control Oportuno de Declaración Jurada de Bienes y Rentas', 'manual-control-declaracion-jurada.pdf'],
      ['Manual', 'Manual de Procesos y Procedimientos de la Unidad de Comunicación Social', 'manual-unidad-comunicacion-social.pdf'],
      ['Manual', 'Manual de Procesos y Procedimientos de la Unidad de Comunicación Social — versión actualizada', 'manual-unidad-comunicacion-social-version-actualizada.pdf'],
      ['Manual', 'Manual de Procesos y Procedimientos para la Administración de Almacenes', 'manual-administracion-de-almacenes.pdf'],
    ],
  },
};

export function getDocumentosDesarrolloOrganizacional(tipo) {
  const seccion = DESARROLLO_ORGANIZACIONAL_SECCIONES[tipo];

  if (!seccion) return null;

  return {
    ...seccion,
    documentos: seccion.documentos.map(([numero_documento, titulo, archivo], index) => ({
      id: `${tipo}-${index + 1}`,
      anio: archivo.includes('2021') ? 2021 : 2026,
      numero_documento,
      titulo,
      fecha_publicacion: archivo.includes('2021') ? '2021-01-01' : '2026-01-01',
      archivo_pdf_url: `/documentos/desarrollo-organizacional/${tipo}/${archivo}`,
    })),
  };
}
