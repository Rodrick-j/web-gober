export const categoriasTramites = [
  { id: 'todas', label: 'Todas las Categorías', icono: '📂' },
  { id: 'mineria', label: 'Minería y Metalurgia', icono: '⛏️' },
  { id: 'medio_ambiente', label: 'Medio Ambiente y Agua', icono: '🌿' },
  { id: 'personeria', label: 'Personería Jurídica', icono: '📜' },
  { id: 'salud', label: 'Desarrollo Social y Salud', icono: '🏥' },
  { id: 'infraestructura', label: 'Infraestructura Vial', icono: '🛣️' },
  { id: 'turismo', label: 'Cultura y Turismo', icono: '🎭' },
];

export const catalogoTramites = [
  {
    id: 'tram-001',
    codigo: 'OR-MIN-001',
    titulo: 'Certificado de Cumplimiento de Regalía Minera (CCRM)',
    categoria: 'mineria',
    secretaria: 'Secretaría Departamental de Minería y Metalurgia',
    resumen: 'Documento obligatorio para acreditar el pago y aporte de regalías por explotación y comercialización de minerales en Oruro.',
    tiempoEstimado: '48 Horas hábiles',
    costo: '50 Bs.',
    modalidad: 'Presencial / Semipresencial',
    horario: 'Lunes a Viernes de 08:30 a 16:30',
    ubicación: 'Edificio Central Gobernación - 2do Piso, Oficina de Minería',
    marcoLegal: 'Ley Nº 535 de Minería y Metalurgia',
    requisitos: [
      'Carta de solicitud dirigida al Secretario Departamental de Minería.',
      'Formulario M-03 de liquidación y pago de regalía minera debidamente sellado.',
      'Copia simple del NIM (Número de Identificación Minera).',
      'Fotocopia de Cédula de Identidad del representante legal o titular.',
      'Comprobante de depósito bancario en la cuenta fiscal de la Gobernación.'
    ],
    pasos: [
      'Presentar la carpeta en ventanilla única de la Secretaría de Minería.',
      'Verificación en el sistema informático de control de regalías.',
      'Firma y sello por el Director de Control y Fiscalización Minera.',
      'Recojo del Certificado Oficial en ventanilla de entrega.'
    ],
    formularioUrl: '#'
  },
  {
    id: 'tram-002',
    codigo: 'OR-AMB-104',
    titulo: 'Otorgación de Licencia Ambiental (Categoría III y IV)',
    categoria: 'medio_ambiente',
    secretaria: 'Secretaría Departamental de Medio Ambiente, Agua y Madre Tierra',
    resumen: 'Declaratoria de Impacto Ambiental (DIA) y Certificado de Dispensación para proyectos industriales, agropecuarios o de infraestructura.',
    tiempoEstimado: '15 Días hábiles',
    costo: 'Gratuito (Sujección a arancel de revisión técnica)',
    modalidad: 'Presencial',
    horario: 'Lunes a Viernes de 08:30 a 14:30',
    ubicación: 'Calle Velasco Galvarro entre Ayacucho y Junín - Edificio Medio Ambiente',
    marcoLegal: 'Ley Nº 1333 de Medio Ambiente y Reglamentos',
    requisitos: [
      'Memorial de solicitud firmado por el representante legal y abogado.',
      'Documento de Información Ambiental (DIA) o PPM-PASA en 2 ejemplares impresos y digital.',
      'RENCA vigente del consultor ambiental que elabora el documento.',
      'Derecho propietario del predio o contrato de arrendamiento debidamente notariado.',
      'Plano de ubicación georreferenciado (UTM WGS-84).'
    ],
    pasos: [
      'Ingreso por Secretaría General para designación de técnico evaluador.',
      'Revisión técnica y legal por la Unidad de Prevención y Control Ambiental.',
      'Inspección técnica al sitio del proyecto en Oruro.',
      'Emisión de Resolución Administrativa y Licencia Ambiental.'
    ],
    formularioUrl: '#'
  },
  {
    id: 'tram-003',
    codigo: 'OR-PER-201',
    titulo: 'Reconocimiento de Personería Jurídica (Asociaciones y Fundaciones)',
    categoria: 'personeria',
    secretaria: 'Secretaría Departamental de Asuntos Jurídicos',
    resumen: 'Otorgación de personalidad jurídica departamental para organizaciones sociales, gremiales, deportivas, fundaciones y ONG sin fines de lucro.',
    tiempoEstimado: '20 Días hábiles',
    costo: '350 Bs. (Arancel departamental)',
    modalidad: 'Presencial',
    horario: 'Lunes a Viernes de 08:30 a 16:30',
    ubicación: 'Palacio de la Gobernación - Plaza 10 de Febrero, Planta Baja',
    marcoLegal: 'Ley Departamental Nº 145/2018 y Código Civil Boliviano',
    requisitos: [
      'Memorial dirigido al Gobernador Departamental solicitando personería.',
      'Acta de Fundación y Elección del Directorio en original notariado.',
      'Estatuto Orgánico y Reglamento Interno (3 copias firmadas en cada foja).',
      'Nómina de socios con número de Cédula de Identidad y firmas.',
      'Certificado de homonimia emitido por la Gobernación.'
    ],
    pasos: [
      'Revisión de cumplimiento de requisitos formales por Asuntos Jurídicos.',
      'Informe legal de procedencia o pliego de observaciones.',
      'Firma de Resolución Administrativa por el Gobernador de Oruro.',
      'Protocolización ante la Notaría de Gobierno y publicación oficial.'
    ],
    formularioUrl: '#'
  },
  {
    id: 'tram-004',
    codigo: 'OR-SAL-305',
    titulo: 'Apertura y Acreditación de Servicios de Salud Privados',
    categoria: 'salud',
    secretaria: 'Servicio Departamental de Salud (SEDES Oruro)',
    resumen: 'Autorización sanitaria de funcionamiento para clínicas, consultorios médicos, odontológicos, laboratorios y farmacias en el departamento.',
    tiempoEstimado: '10 Días hábiles',
    costo: 'Según arancel del SEDES (Cat. Consultorio: 500 Bs)',
    modalidad: 'Presencial',
    horario: 'Lunes a Viernes de 08:30 a 14:00',
    ubicación: 'SEDES Oruro - Calle San jinés y Potosí',
    marcoLegal: 'Código de Salud de la República y Resoluciones Ministeriales',
    requisitos: [
      'Formulario de solicitud de apertura sanitaria SEDES.',
      'Título en provisión nacional del profesional responsable (fotocopia legalizada).',
      'Matrícula profesional vigente del Ministerio de Salud.',
      'Plano arquitectónico con flujo sanitario aprobado por el colegio respectivo.',
      'Inventario de equipos médicos e instrumental.'
    ],
    pasos: [
      'Presentación en Unidad de Calidad y Acreditación del SEDES.',
      'Inspección ocular sanitaria al establecimiento por comisión médica.',
      'Informe favorable de bioseguridad y equipamiento.',
      'Entrega de Resolución de Apertura y Certificado Mural.'
    ],
    formularioUrl: '#'
  },
  {
    id: 'tram-005',
    codigo: 'OR-INF-402',
    titulo: 'Permiso de Tránsito para Maquinaria y Carga Pesada',
    categoria: 'infraestructura',
    secretaria: 'Secretaría Departamental de Obras Públicas e Infraestructura',
    resumen: 'Autorización especial para circulación de camiones de alto tonelaje o maquinaria sobre la Red Vial Departamental de Oruro.',
    tiempoEstimado: '24 Horas',
    costo: '100 Bs.',
    modalidad: 'En línea / Ventanilla',
    horario: 'Lunes a Viernes de 08:30 a 16:30',
    ubicación: 'Campamento de Obras Públicas - Zona Sur',
    marcoLegal: 'Ley General de Transportes',
    requisitos: [
      'Formulario técnico de especificaciones de peso y dimensiones por eje.',
      'SOAT vigente del vehículo motriz y remolque.',
      'RUAT del vehículo.',
      'Licencia de conducir del operador (Categoría C o T).'
    ],
    pasos: [
      'Declaración de ruta departamental y pesaje en balanza.',
      'Verificación de puentes y galibo en el tramo solicitado.',
      'Emisión digital de boleta de tránsito departamental.'
    ],
    formularioUrl: '#'
  },
  {
    id: 'tram-006',
    codigo: 'OR-TUR-509',
    titulo: 'Registro Departamental de Prestadores de Servicios Turísticos',
    categoria: 'turismo',
    secretaria: 'Secretaría Departamental de Cultura y Turismo',
    resumen: 'Licencia turística obligatoria para agencias de viaje, operadoras de turismo aventura y establecimientos de hospedaje en Oruro.',
    tiempoEstimado: '7 Días hábiles',
    costo: '250 Bs.',
    modalidad: 'Presencial',
    horario: 'Lunes a Viernes de 08:30 a 16:00',
    ubicación: 'Casa de la Cultura - Calle Soria Galvarro y Ayacucho',
    marcoLegal: 'Ley Nº 292 General de Turismo "Bolivia Te Espera"',
    requisitos: [
      'Formulario oficial de categorización turística.',
      'NIT de la empresa u operador turístico.',
      'Registro de Comercio FUNDEMPRESA/SEPREC actualizado.',
      'Póliza de seguro de accidentes para pasajeros (operadoras de aventura).'
    ],
    pasos: [
      'Revisión documental en la Dirección de Turismo.',
      'Verificación de estándares de calidad en oficinas/vehículos.',
      'Inscripción en el Catálogo Turístico Oficial de Oruro.'
    ],
    formularioUrl: '#'
  }
];

export const estadisticasTramites = [
  { valor: '+50', etiqueta: 'Trámites Digitalizados' },
  { valor: '100%', etiqueta: 'Respaldo Jurídico Oficial' },
  { valor: '24/7', etiqueta: 'Acceso a Requisitos' },
  { valor: '-40%', etiqueta: 'Tiempo de Espera Reducido' }
];
