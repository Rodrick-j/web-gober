const BASE_URL = '/documentos/transparencia/rendicion-cuentas';

const documentos = [
  ['Rendición inicial', 'Rendición Pública de Cuentas Inicial 2021', '2021-01-01', 'rendicion-publica-cuentas-inicial-2021.pdf'],
  ['Rendición final', 'Rendición Pública de Cuentas Final 2022', '2023-02-24', 'rendicion-publica-cuentas-final-2022.pdf'],
  ['Informe final', 'Informe de Rendición de Cuentas Final 2023', '2023-12-31', 'informe-rendicion-cuentas-final-2023.pdf'],
  ['Rendición inicial', 'Rendición Pública de Cuentas Inicial 2024', '2024-04-19', 'rendicion-cuentas-inicial-2024.pdf'],
  ['Rendición inicial', 'Rendición Pública de Cuentas Inicial 2025', '2025-04-30', 'rendicion-cuentas-inicial-2025.pdf'],
  ['Rendición final', 'Rendición Pública de Cuentas Final 2025', '2025-12-31', 'rendicion-publica-cuentas-final-2025.pdf'],
];

export function getDocumentosRendicionCuentas() {
  return documentos.map(([numero_documento, titulo, fecha_publicacion, archivo], index) => ({
    id: `rendicion-cuentas-${index + 1}`,
    anio: Number(fecha_publicacion.slice(0, 4)),
    numero_documento,
    titulo,
    fecha_publicacion,
    archivo_pdf_url: `${BASE_URL}/${archivo}`,
  }));
}
