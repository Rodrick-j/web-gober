// =====================================================
// DATOS DE LOS 35 MUNICIPIOS DEL DEPARTAMENTO DE ORURO
// =====================================================

// Datos verificados y entregados para iniciar la actualización por provincias.
// Las demás fichas pueden adoptar la misma estructura de forma gradual.
const PROVINCIA_CARANGAS = {
  nombre: 'Provincia Carangas',
  poblacionTotal: '19.000',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Corque', slug: 'corque', rol: 'Primera Sección Municipal y capital provincial', poblacion: '16.020' },
    { nombre: 'Choquecota', slug: 'choquecota', rol: 'Segunda Sección Municipal', poblacion: '2.980' },
  ],
  superficie: 'Aproximadamente 3.700 km² (referencia provincial)',
  ubicacion: 'Zona central-occidental del Departamento de Oruro, en pleno Altiplano Central boliviano.',
  limites: 'Para la ficha de Corque: al norte con Nor Carangas (Huayllamarca); al este con Saucarí (Toledo); al sur con Sur Carangas y Nor Lípez; y al oeste con Choquecota y la Provincia Sabaya.',
  relieve: 'Planicies áridas, serranías moderadas y la cuenca de los ríos Barras y Lauca.',
  clima: 'Frío y seco de alta montaña, propio del altiplano, con heladas durante el invierno.',
};

const PROVINCIA_LADISLAO_CABRERA = {
  nombre: 'Provincia Ladislao Cabrera',
  poblacionTotal: '19.131',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Salinas de Garci Mendoza', slug: 'salinas-de-garci-mendoza', rol: 'Primera Sección Municipal · GAIOCSA', poblacion: '15.934' },
    { nombre: 'Pampa Aullagas', slug: 'pampa-aullagas', rol: 'Segunda Sección Municipal', poblacion: '3.197' },
  ],
  superficie: '6.533 km²',
  ubicacion: 'Región sur del Departamento de Oruro, en el altiplano boliviano.',
  relieve: 'Territorio altoandino vinculado a la producción de quinua real, a los paisajes del sur orureño y al entorno del volcán Thunupa.',
  altitudPromedio: '3.740 m',
};

const PROVINCIA_NOR_CARANGAS = {
  nombre: 'Provincia Nor Carangas',
  poblacionTotal: '5.980',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Santiago de Huayllamarca', slug: 'huayllamarca', rol: 'Única Sección Municipal y capital provincial', poblacion: '5.980' },
  ],
  ubicacion: 'Zona norte del altiplano orureño. Santiago de Huayllamarca es el único municipio que integra la Provincia Nor Carangas.',
  relieve: 'El territorio se organiza en tres distritos municipales que reúnen cantones, markas y ayllus originarios.',
};

const PROVINCIA_PANTALEON_DALENCE = {
  nombre: 'Provincia Pantaleón Dalence',
  poblacionTotal: '26.238',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Huanuni', slug: 'huanuni', rol: 'Primera Sección Municipal y capital provincial', poblacion: '20.142' },
    { nombre: 'Machacamarca', slug: 'machacamarca', rol: 'Segunda Sección Municipal', poblacion: '6.096' },
  ],
  ubicacion: 'Altiplano central de Oruro, entre territorios mineros, ferroviarios y comunidades originarias.',
  relieve: 'Huanuni presenta un relieve montañoso dominado por el cerro Posokoni; Machacamarca se abre a la llanura altiplánica cercana al Lago Uru Uru.',
};

const PROVINCIA_SABAYA = {
  nombre: 'Provincia Sabaya',
  poblacionTotal: '19.276',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Sabaya', slug: 'sabaya', rol: 'Primera Sección Municipal', poblacion: '15.504' },
    { nombre: 'Coipasa', slug: 'coipasa', rol: 'Segunda Sección Municipal', poblacion: '1.406' },
    { nombre: 'Chipaya', slug: 'chipaya', rol: 'Tercera Sección Municipal', poblacion: '2.366' },
  ],
  ubicacion: 'Occidente del Departamento de Oruro, en el altiplano cercano a salares, planicies y rutas fronterizas.',
  relieve: 'Planicies altas de clima frío y seco, donde conviven territorios aymaras, urus y actividades de crianza y agricultura andina.',
};

const PROVINCIA_SAJAMA = {
  nombre: 'Provincia Sajama',
  poblacionTotal: '11.948',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Curahuara de Carangas', slug: 'curahuara-de-carangas', rol: 'Primera Sección Municipal', poblacion: '6.671' },
    { nombre: 'Turco', slug: 'turco', rol: 'Segunda Sección Municipal · Turco Marka', poblacion: '5.277' },
  ],
  ubicacion: 'Noreste del Departamento de Oruro, en el ecosistema altoandino de la antigua Confederación Jacha Carangas.',
  relieve: 'Paisaje de gran altura, superior a los 4.000 metros en amplios sectores, vinculado al pastoreo de llamas y alpacas.',
};

const PROVINCIA_SAUCARI = {
  nombre: 'Provincia Saucarí',
  poblacionTotal: '12.115',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Toledo', slug: 'toledo', rol: 'Única Sección Municipal y capital provincial', poblacion: '12.115' },
  ],
  ubicacion: 'Zona central del Departamento de Oruro, con conexión a Cercado, Nor Carangas, Carangas, Sur Carangas y Poopó.',
  relieve: 'Territorio de altiplano que en su extremo sureste se vincula con la cuenca del Lago Poopó.',
};

const PROVINCIA_SEBASTIAN_PAGADOR = {
  nombre: 'Provincia Sebastián Pagador',
  poblacionTotal: '13.502',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Santiago de Huari', slug: 'huari', rol: 'Única Sección Municipal y capital provincial', poblacion: '13.502' },
  ],
  ubicacion: 'Parte oriental del Departamento de Oruro; Santiago de Huari se sitúa aproximadamente a 140 km al sur de la ciudad de Oruro.',
  relieve: 'Serranías, piedemonte y llanuras fluvio-lacustres próximas al Lago Poopó, con áreas agrícolas y de pastoreo.',
};

const PROVINCIA_SUR_CARANGAS = {
  nombre: 'Provincia Sur Carangas',
  poblacionTotal: '5.500',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Santiago de Andamarca', slug: 'santiago-de-andamarca', rol: 'Primera Sección Municipal · 3 distritos', poblacion: '3.000' },
    { nombre: 'Belén de Andamarca', slug: 'belen-de-andamarca', rol: 'Segunda Sección Municipal · 4 distritos', poblacion: '2.500' },
  ],
  ubicacion: 'Altiplano sur-occidental de Oruro, heredero del territorio histórico de la gran provincia de Carangas.',
  relieve: 'Territorios altoandinos de comunidades y distritos con costumbres, creencias y autoridades propias.',
};

const PROVINCIA_TOMAS_BARRON = {
  nombre: 'Provincia Tomás Barrón',
  poblacionTotal: '5.443',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Eucaliptus', slug: 'eucaliptus', rol: 'Única Sección Municipal y capital provincial', poblacion: '5.443' },
  ],
  ubicacion: 'Norte del Departamento de Oruro, con límites hacia Aroma y Gualberto Villarroel en La Paz, Cercado y La Joya.',
  relieve: 'Territorio de 356 km² próximo al río Desaguadero, dedicado a la vida comunitaria, agricultura y ganadería altoandina.',
};

const PROVINCIA_POOPO = {
  nombre: 'Provincia Poopó',
  poblacionTotal: '16.986',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Poopó', slug: 'poopo', rol: 'Capital provincial', poblacion: '9.189' },
    { nombre: 'Pazña', slug: 'pazna', rol: 'Sección Municipal', poblacion: '4.251' },
    { nombre: 'Antequera', slug: 'antequera', rol: 'Sección Municipal', poblacion: '3.666' },
  ],
  superficie: '3.061 km²',
  ubicacion: 'Al sur de Oruro, entre las provincias Cercado, Pantaleón Dalence, Eduardo Abaroa, Saucarí y Sur Carangas.',
  relieve: 'Ribera del Lago Poopó, llanuras de altiplano, zonas mineras y paisajes cordilleranos hacia el este.',
};

const PROVINCIA_EDUARDO_ABAROA = {
  nombre: 'Provincia Eduardo Abaroa',
  poblacionTotal: '40.532',
  anoCenso: 2024,
  municipios: [
    { nombre: 'Challapata', slug: 'challapata', rol: 'Primera Sección Municipal y capital provincial · 9 distritos', poblacion: '35.427' },
    { nombre: 'Santuario de Quillacas', slug: 'santuario-de-quillacas', rol: 'Segunda Sección Municipal · 2 distritos', poblacion: '5.105' },
  ],
  ubicacion: 'Sureste del Departamento de Oruro, entre el Lago Poopó, el Departamento de Potosí y las provincias Sebastián Pagador y Ladislao Cabrera.',
  relieve: 'Planicies del altiplano, laderas de la cordillera Azanaque, áreas rurales y sistemas hídricos locales.',
};

const PROVINCIA_LITORAL = {
  nombre: 'Provincia Litoral',
  poblacionTotal: '806',
  anoCenso: 'último censo',
  notaPoblacion: 'El material recibido consigna 806 habitantes como dato general; falta la desagregación por municipio.',
  municipios: [
    { nombre: 'Huachacalla', slug: 'huachacalla', rol: 'Primera Sección Municipal', poblacion: 'N/D' },
    { nombre: 'Escara', slug: 'escara', rol: 'Segunda Sección Municipal', poblacion: 'N/D' },
    { nombre: 'Cruz de Machacamarca', slug: 'cruz-de-machacamarca', rol: 'Tercera Sección Municipal', poblacion: 'N/D' },
    { nombre: 'Yunguyo de Litoral', slug: 'yunguyo-de-litoral', rol: 'Cuarta Sección Municipal', poblacion: 'N/D' },
    { nombre: 'Esmeralda', slug: 'esmeralda', rol: 'Quinta Sección Municipal', poblacion: 'N/D' },
  ],
  ubicacion: 'Occidente de Oruro, en comunidades del altiplano con actividad ganadera, cultivos andinos y vínculos fronterizos.',
  relieve: 'Clima frío y seco, amplias planicies y vegetación propia del altiplano.',
};

const municipiosBase = [
  // ─── ORURO (capital) ───────────────────────────────
  {
    slug: 'oruro',
    nombre: 'Oruro',
    gentilicio: 'Orureño/a',
    descripcion: 'Capital del Departamento de Oruro, reconocida mundialmente por su Carnaval declarado Patrimonio Cultural Inmaterial de la Humanidad por la UNESCO. Centro histórico, cultural y minero de Bolivia.',
    esCapital: true,
    poblacion: '302,643',
    anoCenso: 2012,
    rankingDep: '1°',
    altitud: 3697,
    lat: -17.9667,
    lng: -67.1167,
    latStr: "17° 58' 0'' Sur",
    lngStr: "67° 7' 0'' Oeste",
    codigo: '040101',
    provincia: 'Cercado',
    alcalde: 'Ivan Quispe Gutierrez',
    direccion: 'Plaza 10 de Febrero, Acera Sur',
    telefono: '67202855',
    web: 'oruro.org.bo',
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza', dist: 'Local' },
      { nombre: 'Aerop. Internacional Jorge Wilstermann', dist: '116.7 km' },
      { nombre: 'Aerop. Internacional de El Alto', dist: '198.1 km' },
    ],
    vecinos: [
      { nombre: 'Soracachi', dist: '23.7 km' }, { nombre: 'Machacamarca', dist: '25 km' },
      { nombre: 'Poopó', dist: '27 km' }, { nombre: 'Caracollo', dist: '36.8 km' },
      { nombre: 'Toledo', dist: '40.5 km' }, { nombre: 'El Choro', dist: '43.7 km' },
      { nombre: 'Huanuni', dist: '46 km' },
    ],
    distancias: [
      { nombre: 'Quillacollo', km: '109 km', closest: true }, { nombre: 'Cochabamba', km: '120 km' },
      { nombre: 'Sacaba', km: '130 km' }, { nombre: 'El Alto', km: '197 km' },
      { nombre: 'Sucre', km: '230 km' }, { nombre: 'Potosí', km: '231 km' },
      { nombre: 'Santa Cruz', km: '416 km' }, { nombre: 'Trinidad', km: '422 km' },
    ],
    idiomas: [
      { lang: 'Aymara', name: 'Ururu' }, { lang: 'Quechua', name: 'Uru Uru suyu' },
      { lang: 'Japonés', name: 'オルロ' }, { lang: 'Ruso', name: 'Оруро' },
      { lang: 'Chino', name: '奥鲁罗省' }, { lang: 'Coreano', name: '오루로' },
    ],
  },

  // ─── CHALLAPATA ────────────────────────────────────
  {
    slug: 'challapata',
    nombre: 'Challapata',
    gentilicio: 'Challapateño/a',
    descripcion: 'Municipio localizado en la Provincia Eduardo Abaroa, importante centro comercial y de tránsito en el altiplano sur del Departamento de Oruro.',
    esCapital: false,
    poblacion: '28,304',
    anoCenso: 2012,
    rankingDep: '2°',
    altitud: 3718,
    lat: -18.9,
    lng: -66.7667,
    latStr: "18° 54' 0'' Sur",
    lngStr: "66° 46' 0'' Oeste",
    codigo: '040201',
    provincia: 'Eduardo Abaroa',
    alcalde: 'Maximo Dionicio Herrera Choque',
    direccion: 'Plaza Eduardo Avaroa, Esq. Av. Mariano Baptista',
    telefono: '72341451',
    web: 'challapata.gob.bo',
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza', dist: '109.4 km' },
      { nombre: 'Aerop. Capitão Nicolas Rojas', dist: '130.9 km' },
      { nombre: 'Aerop. Internacional Juana Azurduy de Padilla', dist: '156 km' },
    ],
    vecinos: [
      { nombre: 'Huari', dist: '12.5 km' }, { nombre: 'Urmiri', dist: '37.6 km' },
      { nombre: 'Pazña', dist: '37.7 km' }, { nombre: 'Santuario de Quillacas', dist: '41.7 km' },
      { nombre: 'Pampa Aullagas', dist: '44 km' }, { nombre: 'Antequera', dist: '47.7 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '110 km', closest: true }, { nombre: 'Sucre', km: '160 km' },
      { nombre: 'Potosí', km: '131 km' }, { nombre: 'Cochabamba', km: '180 km' },
      { nombre: 'Quillacollo', km: '175 km' }, { nombre: 'Santa Cruz', km: '397 km' },
      { nombre: 'El Alto', km: '305 km' }, { nombre: 'Tarija', km: '362 km' },
    ],
    idiomas: [{ lang: 'Chino', name: '查亞帕塔' }],
  },

  // ─── HUANUNI ───────────────────────────────────────
  {
    slug: 'huanuni',
    nombre: 'Huanuni',
    gentilicio: 'Huanuneño/a',
    descripcion: 'Municipio minero de la Provincia Pantaleón Dalence, famoso por sus yacimientos de estaño. Uno de los centros mineros más importantes de Bolivia y del Departamento de Oruro.',
    esCapital: false,
    poblacion: '24,677',
    anoCenso: 2012,
    rankingDep: '3°',
    altitud: 3951,
    lat: -18.29,
    lng: -66.8381,
    latStr: "18° 17' 24'' Sur",
    lngStr: "66° 50' 17'' Oeste",
    codigo: '040701',
    provincia: 'Pantaleón Dalence',
    alcalde: 'Lily Rossemary Ardaya Claure',
    direccion: 'Plaza Principal Fermín López',
    telefono: '72308728',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza', dist: '44.3 km' },
      { nombre: 'Aerop. Internacional Jorge Wilstermann', dist: '119.5 km' },
      { nombre: 'Aerop. Internacional Juana Azurduy de Padilla', dist: '181.8 km' },
    ],
    vecinos: [
      { nombre: 'Antequera', dist: '21 km' }, { nombre: 'Machacamarca', dist: '23.3 km' },
      { nombre: 'Poopó', dist: '26.2 km' }, { nombre: 'Llallagua', dist: '29.8 km' },
      { nombre: 'El Choro', dist: '30.2 km' }, { nombre: 'Urmiri', dist: '32.5 km' },
      { nombre: 'Pazña', dist: '35.1 km' }, { nombre: 'Oruro', dist: '46 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '47 km', closest: true }, { nombre: 'Cochabamba', km: '123 km' },
      { nombre: 'Potosí', km: '184 km' }, { nombre: 'Sucre', km: '187 km' },
      { nombre: 'El Alto', km: '244 km' }, { nombre: 'Santa Cruz', km: '389 km' },
      { nombre: 'Trinidad', km: '437 km' }, { nombre: 'Tarija', km: '423 km' },
    ],
    idiomas: [{ lang: 'Japonés', name: 'ワヌニ' }, { lang: 'Chino', name: '瓦努尼' }],
  },

  // ─── CARACOLLO ─────────────────────────────────────
  {
    slug: 'caracollo',
    nombre: 'Caracollo',
    gentilicio: 'Caracolleño/a',
    descripcion: 'Municipio de la Provincia Cercado, ubicado en el corredor principal de la carretera La Paz-Oruro. Importante nodo de comunicaciones y comercio del altiplano boliviano.',
    esCapital: false,
    poblacion: '13,582',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3780,
    lat: -17.6503,
    lng: -67.2183,
    latStr: "17° 39' Sur",
    lngStr: "67° 13' Oeste",
    codigo: '040102',
    provincia: 'Cercado',
    alcalde: 'Juan Carlos Pinaya Uñoja',
    direccion: 'Plaza Principal de Caracollo',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza', dist: '37 km' },
      { nombre: 'Aerop. Internacional de El Alto', dist: '170 km' },
    ],
    vecinos: [
      { nombre: 'Oruro', dist: '36.8 km' }, { nombre: 'Toledo', dist: '38 km' },
      { nombre: 'El Choro', dist: '40 km' }, { nombre: 'Soracachi', dist: '45 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '37 km', closest: true }, { nombre: 'La Paz', km: '170 km' },
      { nombre: 'Cochabamba', km: '130 km' }, { nombre: 'Potosí', km: '270 km' },
    ],
    idiomas: [],
  },

  // ─── HUARI ─────────────────────────────────────────
  {
    slug: 'huari',
    nombre: 'Huari',
    gentilicio: 'Huareño/a',
    descripcion: 'Capital de la Provincia Eduardo Abaroa, famosa por la cerveza Huari, una de las más consumidas en Bolivia. Centro agropecuario e industrial del sur del departamento.',
    esCapital: false,
    poblacion: '11,750',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3680,
    lat: -18.9933,
    lng: -66.8417,
    latStr: "18° 59' Sur",
    lngStr: "66° 50' Oeste",
    codigo: '040202',
    provincia: 'Eduardo Abaroa',
    alcalde: 'Jorge Edgar Lopez Ocsa',
    direccion: 'Plaza Principal de Huari',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aerop. Capitão Nicolas Rojas (Potosí)', dist: '120 km' },
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '130 km' },
    ],
    vecinos: [
      { nombre: 'Challapata', dist: '12.5 km' }, { nombre: 'Pazña', dist: '30 km' },
      { nombre: 'Poopó', dist: '45 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '120 km', closest: true }, { nombre: 'Potosí', km: '115 km' },
      { nombre: 'Cochabamba', km: '200 km' }, { nombre: 'Sucre', km: '175 km' },
    ],
    idiomas: [],
  },

  // ─── TOTORA (ORURO) ────────────────────────────────
  {
    slug: 'totora',
    nombre: 'Totora',
    gentilicio: 'Totoreño/a',
    descripcion: 'Municipio de la Provincia Cercado, localizado al norte del departamento de Oruro. Comunidad agrícola del altiplano boliviano con rica tradición cultural aymara.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3800,
    lat: -17.3,
    lng: -67.4,
    latStr: "17° 18' Sur",
    lngStr: "67° 24' Oeste",
    codigo: '040103',
    provincia: 'Cercado',
    alcalde: 'Marcos Condori',
    direccion: 'Plaza Principal de Totora',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '60 km' },
    ],
    vecinos: [
      { nombre: 'Caracollo', dist: '30 km' }, { nombre: 'Toledo', dist: '25 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '55 km', closest: true }, { nombre: 'La Paz', km: '200 km' },
    ],
    idiomas: [],
  },

  // ─── SALINAS DE GARCI MENDOZA ──────────────────────
  {
    slug: 'salinas-de-garci-mendoza',
    nombre: 'Salinas de Garci Mendoza',
    gentilicio: 'Salinero/a',
    descripcion: 'Primera Sección Municipal de la Provincia Ladislao Cabrera. Salinas preserva una profunda herencia aymara, ritualidad andina y una identidad cultural ligada al huayño salineño, la quinua real y el entorno del volcán Thunupa.',
    esCapital: false,
    poblacion: '15.934',
    anoCenso: 2024,
    rankingDep: 'N/D',
    altitud: 3740,
    lat: -19.6333,
    lng: -67.6667,
    latStr: "19° 38' Sur",
    lngStr: "67° 40' Oeste",
    codigo: '040801',
    provincia: 'Ladislao Cabrera',
    alcalde: 'Ing. Braulio Canaviri García',
    direccion: 'Plaza Principal de Salinas de Garci Mendoza',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '220 km' },
    ],
    vecinos: [
      { nombre: 'Pampa Aullagas', dist: '45 km' }, { nombre: 'Coipasa', dist: '80 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '220 km', closest: true }, { nombre: 'Uyuni', km: '130 km' },
    ],
    idiomas: [],
    provinciaFicha: PROVINCIA_LADISLAO_CABRERA,
    autoridades: [
      { cargo: 'Subgobernación de Ladislao Cabrera', detalle: 'Ing. Grover Carvajal Encinas.' },
      { cargo: 'Qulqi Kamachi – GAIOCSA Salinas', detalle: 'Ing. Braulio Canaviri García.' },
    ],
    cultura: [
      {
        icono: '♫',
        titulo: 'Capital del Huayño Salineño',
        texto: 'El huayño salineño, reconocido como Patrimonio Cultural Inmaterial del Estado Plurinacional de Bolivia, expresa la memoria musical más representativa del territorio.',
      },
      {
        icono: '◌',
        titulo: 'Ritualidad andina',
        texto: 'La herencia aymara mantiene prácticas comunitarias y rituales vinculados a la tierra, los ciclos productivos y el volcán Thunupa.',
      },
      {
        icono: '♬',
        titulo: 'Música de siembra y cosecha',
        texto: 'Sikus y zampoñas acompañan las épocas agrícolas, enlazando la producción de la quinua con la celebración colectiva.',
      },
    ],
    gastronomia: [
      { icono: '◈', titulo: 'Phisara', texto: 'Quinua cocida con papa y queso, acompañada tradicionalmente con chicharrón de llama.' },
      { icono: '◈', titulo: 'Pito de quinua', texto: 'Harina tostada de quinua, valorada por su alto aporte energético.' },
      { icono: '◈', titulo: 'Sabores de camélidos y papa nativa', texto: 'El charque y el chicharrón de llama se integran a sopas y segundos con variedades locales de papa.' },
    ],
    normativa: [
      { titulo: 'Ley Departamental N.º 155 (2018)', texto: 'Declara a Salinas como Capital del Huayño Salineño y reconoce su valor cultural y musical.' },
      { titulo: 'Ley Departamental N.º 101/2015', texto: 'Declara zona de emergencia ante los efectos e incendios registrados en el cerro Thunupa.' },
      { titulo: 'Ley Departamental N.º 59 (2013)', texto: 'Declara prioridad e interés departamental la promoción y difusión del paso del Rally Dakar 2014 por Salinas.' },
    ],
    territorio: {
      superficie: '5.591 km²',
      superficieEtiqueta: 'Superficie municipal',
      ubicacion: PROVINCIA_LADISLAO_CABRERA.ubicacion,
      relieve: PROVINCIA_LADISLAO_CABRERA.relieve,
      organizacion: 'Primera Sección Municipal · GAIOCSA',
      organizacionCorta: 'Primera sección',
    },
  },

  // ─── TOLEDO ────────────────────────────────────────
  {
    slug: 'toledo',
    nombre: 'Toledo',
    gentilicio: 'Toledano/a',
    descripcion: 'Municipio de la Provincia Saucarí. Localidad agrícola y ganadera del altiplano orureño, conocida por sus tradiciones culturales y festividades patronales.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3710,
    lat: -17.9667,
    lng: -67.4167,
    latStr: "17° 58' Sur",
    lngStr: "67° 25' Oeste",
    codigo: '040501',
    provincia: 'Saucarí',
    alcalde: 'Noel Gonzales Ayala',
    direccion: 'Plaza Principal de Toledo',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '43 km' },
    ],
    vecinos: [
      { nombre: 'Oruro', dist: '40.5 km' }, { nombre: 'Caracollo', dist: '38 km' },
      { nombre: 'El Choro', dist: '30 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '41 km', closest: true }, { nombre: 'Cochabamba', km: '155 km' },
    ],
    idiomas: [],
  },

  // ─── CORQUE ────────────────────────────────────────
  {
    slug: 'corque',
    nombre: 'Corque',
    gentilicio: 'Corqueño/a',
    descripcion: 'Capital de la ancestral Marka Carangas y Primera Sección Municipal de la Provincia Carangas. Corque destaca por sus paisajes altiplánicos, serranías y arquitectura colonial característica.',
    esCapital: false,
    poblacion: '16.020',
    anoCenso: 2024,
    rankingDep: 'N/D',
    altitud: 3770,
    lat: -18.35,
    lng: -67.8833,
    latStr: "18° 21' Sur",
    lngStr: "67° 53' Oeste",
    codigo: '040301',
    provincia: 'Carangas',
    alcalde: 'Autoridad municipal en ejercicio',
    direccion: 'Plaza Principal de Corque',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '110 km' },
    ],
    vecinos: [
      { nombre: 'Turco', dist: '45 km' }, { nombre: 'Curahuara de Carangas', dist: '50 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '110 km', closest: true }, { nombre: 'La Paz', km: '250 km' },
    ],
    idiomas: [],
    provinciaFicha: PROVINCIA_CARANGAS,
    autoridades: [
      { cargo: 'Alcalde Municipal', detalle: 'Órgano Ejecutivo del Gobierno Autónomo Municipal de Corque.' },
      { cargo: 'Concejo Municipal', detalle: 'Órgano Legislativo compuesto por 5 concejales municipales.' },
      { cargo: 'Autoridades Originarias', detalle: 'Mallku de la Marka Corque y autoridades de los ayllus locales.' },
    ],
    cultura: [
      {
        titulo: 'Marka Carangas y ayllus',
        texto: 'Mantiene la estructura originaria Jacha Carangas, organizada en ayllus como Mitawmarini, Collana y Payrumani, guiados por Mallkus y Mama T’allas.',
        icono: '✦',
      },
      {
        titulo: 'Música y danza',
        texto: 'En sus festividades sobresalen expresiones del altiplano como la tarqueada, zampoñada y chovena regional.',
        icono: '♫',
      },
      {
        titulo: 'Patrimonio arquitectónico',
        texto: 'El Templo de San Juan Bautista de Corque, de los siglos XVI y XVII, resalta por sus retablos y su torre colonial.',
        icono: '⌂',
      },
    ],
    territorio: {
      superficie: PROVINCIA_CARANGAS.superficie,
      ubicacion: PROVINCIA_CARANGAS.ubicacion,
      limites: PROVINCIA_CARANGAS.limites,
      relieve: PROVINCIA_CARANGAS.relieve,
      clima: PROVINCIA_CARANGAS.clima,
    },
    media: [
      {
        src: '/images/municipios/corque/escudo-corque.png',
        alt: 'Escudo del Gobierno Autónomo Municipal de Corque',
        titulo: 'Gobierno Autónomo Municipal de Corque',
        tipo: 'escudo',
      },
      {
        src: '/images/municipios/corque/lugar-corque.png',
        alt: 'Templo de San Juan Bautista de Corque',
        titulo: 'Templo de San Juan Bautista',
        tipo: 'turismo',
      },
    ],
  },

  // ─── EL CHORO ──────────────────────────────────────
  {
    slug: 'el-choro',
    nombre: 'El Choro',
    gentilicio: 'Choreño/a',
    descripcion: 'Municipio de la Provincia Cercado, comunidad agrícola aymara al norte del Departamento de Oruro. Conocido por sus tradiciones y actividades pecuarias en el altiplano.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3720,
    lat: -17.8,
    lng: -67.3,
    latStr: "17° 48' Sur",
    lngStr: "67° 18' Oeste",
    codigo: '040104',
    provincia: 'Cercado',
    alcalde: 'Vladimir Eleuterio Apaza Mamani',
    direccion: 'Plaza Principal de El Choro',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '46 km' },
    ],
    vecinos: [
      { nombre: 'Oruro', dist: '43.7 km' }, { nombre: 'Caracollo', dist: '40 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '44 km', closest: true }, { nombre: 'Cochabamba', km: '145 km' },
    ],
    idiomas: [],
  },

  // ─── SABAYA ────────────────────────────────────────
  {
    slug: 'sabaya',
    nombre: 'Sabaya',
    gentilicio: 'Sabayeño/a',
    descripcion: 'Municipio de la Provincia Sabaya, en el extremo occidental del Departamento de Oruro. Región de alta biodiversidad con acceso a las reservas naturales del altiplano chileno-boliviano.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3700,
    lat: -19.0,
    lng: -68.4,
    latStr: "19° 0' Sur",
    lngStr: "68° 24' Oeste",
    codigo: '040901',
    provincia: 'Sabaya',
    alcalde: 'Gregorio Atora Zegarra',
    direccion: 'Plaza Principal de Sabaya',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '310 km' },
    ],
    vecinos: [
      { nombre: 'Chipaya', dist: '60 km' }, { nombre: 'Coipasa', dist: '50 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '310 km', closest: true }, { nombre: 'Iquique (Chile)', km: '240 km' },
    ],
    idiomas: [],
  },

  // ─── POOPÓ ─────────────────────────────────────────
  {
    slug: 'poopo',
    nombre: 'Poopó',
    gentilicio: 'Poopeño/a',
    descripcion: 'Municipio de la Provincia Poopó, ubicado a orillas del histórico Lago Poopó. Centro minero y pesquero del altiplano central del Departamento de Oruro.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3720,
    lat: -18.3667,
    lng: -66.95,
    latStr: "18° 22' Sur",
    lngStr: "66° 57' Oeste",
    codigo: '040301',
    provincia: 'Poopó',
    alcalde: 'Nicanor Lopez Choque',
    direccion: 'Plaza Principal de Poopó',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '30 km' },
    ],
    vecinos: [
      { nombre: 'Oruro', dist: '27 km' }, { nombre: 'Machacamarca', dist: '20 km' },
      { nombre: 'Antequera', dist: '25 km' }, { nombre: 'Huanuni', dist: '26 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '27 km', closest: true }, { nombre: 'Cochabamba', km: '150 km' },
    ],
    idiomas: [],
  },

  // ─── PAZÑA ─────────────────────────────────────────
  {
    slug: 'pazna',
    nombre: 'Pazña',
    gentilicio: 'Pazñeño/a',
    descripcion: 'Municipio de la Provincia Poopó, conocido por su tradición minera y sus comunidades indígenas. Localidad de gran riqueza cultural en el altiplano central de Oruro.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3700,
    lat: -18.5833,
    lng: -66.9333,
    latStr: "18° 35' Sur",
    lngStr: "66° 56' Oeste",
    codigo: '040302',
    provincia: 'Poopó',
    alcalde: 'Diony Achacollo Velasquez',
    direccion: 'Plaza Principal de Pazña',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '70 km' },
    ],
    vecinos: [
      { nombre: 'Huanuni', dist: '35 km' }, { nombre: 'Challapata', dist: '37.7 km' },
      { nombre: 'Poopó', dist: '20 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '65 km', closest: true }, { nombre: 'Potosí', km: '150 km' },
    ],
    idiomas: [],
  },

  // ─── HUAYLLAMARCA ──────────────────────────────────
  {
    slug: 'huayllamarca',
    nombre: 'Santiago de Huayllamarca',
    gentilicio: 'Huayllamarcano/a',
    descripcion: 'Capital y única Sección Municipal de la Provincia Nor Carangas. Santiago de Huayllamarca resguarda una identidad aymara viva, organizada en ayllus y celebrada mediante música, danzas y devoción patronal.',
    esCapital: false,
    poblacion: '5.980',
    anoCenso: 2024,
    rankingDep: 'N/D',
    altitud: 3760,
    lat: -17.9,
    lng: -68.0,
    latStr: "17° 54' Sur",
    lngStr: "68° 0' Oeste",
    codigo: '041601',
    provincia: 'Nor Carangas',
    alcalde: 'Alcaldía Municipal de Santiago de Huayllamarca',
    direccion: 'Plaza Principal de Huayllamarca',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '180 km' },
    ],
    vecinos: [
      { nombre: 'Corque', dist: 'N/D' }, { nombre: 'Cruz de Huayllamarca', dist: 'N/D' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '180 km', closest: true }, { nombre: 'La Paz', km: '220 km' },
    ],
    idiomas: [],
    provinciaFicha: PROVINCIA_NOR_CARANGAS,
    autoridades: [
      { cargo: 'Alcaldía Municipal', detalle: 'Órgano ejecutivo del municipio de Santiago de Huayllamarca.' },
      { cargo: 'Concejo Municipal', detalle: 'Instancia legislativa y de fiscalización municipal.' },
      { cargo: 'Autoridades originarias', detalle: 'Machaqas, Awatiris y Sullka Awatiris acompañan la organización comunitaria de los ayllus.' },
    ],
    cultura: [
      {
        icono: '✦',
        titulo: 'Nación aymara y ayllus',
        texto: 'La vida comunitaria se sostiene en los ayllus originarios, donde memoria, territorio y autoridades ancestrales se encuentran.',
      },
      {
        icono: '♫',
        titulo: 'Tarqueada y música autóctona',
        texto: 'La tarqueada expresa la sonoridad propia de la región y acompaña encuentros culturales de profundo arraigo local.',
      },
      {
        icono: '✺',
        titulo: 'Fe y danza patronal',
        texto: 'La devoción a Tata Santiago Apóstol y San Felipe se celebra con danzas pesadas, entre ellas la morenada.',
      },
    ],
    normativa: [
      { titulo: 'Ley Nacional N.º 1188 (26 de septiembre de 1990)', texto: 'Crea la Provincia Nor Carangas y establece a Santiago de Huayllamarca como su sección capital.' },
      { titulo: 'Ley Departamental N.º 241 (28 de diciembre de 2023)', texto: 'Incorpora a la Red Vial Departamental los tramos que conectan a la región con la Cruz de Huayllamarca y poblaciones aledañas, para su mantenimiento público.' },
    ],
    territorio: {
      ubicacion: PROVINCIA_NOR_CARANGAS.ubicacion,
      relieve: PROVINCIA_NOR_CARANGAS.relieve,
      organizacion: 'Tres distritos municipales con cantones, markas y ayllus',
      organizacionCorta: '3 distritos',
    },
    media: [
      {
        src: '/images/municipios/huayllamarca/escudo-nor-carangas.png',
        alt: 'Escudo de la Provincia Nor Carangas',
        titulo: 'Emblema territorial de Nor Carangas',
        tipo: 'escudo',
      },
      {
        src: '/images/municipios/huayllamarca/lugar-nor-carangas.png',
        alt: 'Paisaje representativo de Nor Carangas',
        titulo: 'Paisaje de la Provincia Nor Carangas',
        tipo: 'turismo',
      },
    ],
  },

  // ─── EUCALIPTUS ────────────────────────────────────
  {
    slug: 'eucaliptus',
    nombre: 'Eucaliptus',
    gentilicio: 'Eucalipteño/a',
    descripcion: 'Municipio de la Provincia Cercado, localidad agrícola al norte del Departamento de Oruro. Comunidad conocida por sus cultivos y actividades ganaderas.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3750,
    lat: -17.5,
    lng: -67.1,
    latStr: "17° 30' Sur",
    lngStr: "67° 6' Oeste",
    codigo: '040105',
    provincia: 'Cercado',
    alcalde: 'Limbert Pacheco Inca',
    direccion: 'Plaza Principal de Eucaliptus',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '55 km' },
    ],
    vecinos: [
      { nombre: 'Caracollo', dist: '35 km' }, { nombre: 'Oruro', dist: '55 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '55 km', closest: true }, { nombre: 'La Paz', km: '200 km' },
    ],
    idiomas: [],
  },

  // ─── SANTIAGO DE ANDAMARCA ─────────────────────────
  {
    slug: 'santiago-de-andamarca',
    nombre: 'Santiago de Andamarca',
    gentilicio: 'Andamarcano/a',
    descripcion: 'Municipio de la Provincia Sud Carangas, en el altiplano sur-occidental del Departamento de Oruro. Comunidad con fuerte identidad indígena y tradición cultural andina.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3820,
    lat: -18.9,
    lng: -67.4,
    latStr: "18° 54' Sur",
    lngStr: "67° 24' Oeste",
    codigo: '040801',
    provincia: 'Sud Carangas',
    alcalde: 'Ramos Quispe',
    direccion: 'Plaza Principal de Santiago de Andamarca',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '180 km' },
    ],
    vecinos: [
      { nombre: 'Turco', dist: '60 km' }, { nombre: 'Corque', dist: '70 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '180 km', closest: true }, { nombre: 'Uyuni', km: '220 km' },
    ],
    idiomas: [],
  },

  // ─── TURCO ─────────────────────────────────────────
  {
    slug: 'turco',
    nombre: 'Turco',
    gentilicio: 'Turqueño/a',
    descripcion: 'Municipio de la Provincia Sajama, en el altiplano occidental de Oruro. Localidad próxima al Parque Nacional Sajama y al volcán activo más alto del mundo.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3740,
    lat: -18.1667,
    lng: -68.1833,
    latStr: "18° 10' Sur",
    lngStr: "68° 11' Oeste",
    codigo: '041002',
    provincia: 'Sajama',
    alcalde: 'Grover Perez Marca',
    direccion: 'Plaza Principal de Turco',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '220 km' },
    ],
    vecinos: [
      { nombre: 'Corque', dist: '45 km' }, { nombre: 'Huayllamarca', dist: '50 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '220 km', closest: true }, { nombre: 'La Paz', km: '250 km' },
    ],
    idiomas: [],
  },

  // ─── MACHACAMARCA ──────────────────────────────────
  {
    slug: 'machacamarca',
    nombre: 'Machacamarca',
    gentilicio: 'Machacamarcano/a',
    descripcion: 'Municipio de la Provincia Pantaleón Dalence, importante nodo ferroviario histórico del altiplano boliviano. Localidad con fuerte historia vinculada al ferrocarril.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3660,
    lat: -18.1667,
    lng: -66.85,
    latStr: "18° 10' Sur",
    lngStr: "66° 51' Oeste",
    codigo: '040702',
    provincia: 'Pantaleón Dalence',
    alcalde: 'Gary Erick Yucra Arce',
    direccion: 'Plaza Principal de Machacamarca',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '26 km' },
    ],
    vecinos: [
      { nombre: 'Oruro', dist: '25 km' }, { nombre: 'Poopó', dist: '20 km' },
      { nombre: 'Huanuni', dist: '23 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '25 km', closest: true }, { nombre: 'Cochabamba', km: '145 km' },
    ],
    idiomas: [],
  },

  // ─── ESCARA ────────────────────────────────────────
  {
    slug: 'escara',
    nombre: 'Escara',
    gentilicio: 'Escareño/a',
    descripcion: 'Municipio de la Provincia Litoral del Departamento de Oruro. Localidad del altiplano occidental con economía basada en la ganadería de camélidos y agricultura.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3800,
    lat: -18.45,
    lng: -67.95,
    latStr: "18° 27' Sur",
    lngStr: "67° 57' Oeste",
    codigo: '040502',
    provincia: 'Litoral',
    alcalde: 'Remberto Condori Copa',
    direccion: 'Plaza Principal de Escara',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '160 km' },
    ],
    vecinos: [
      { nombre: 'Corque', dist: '40 km' }, { nombre: 'Carangas', dist: '30 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '160 km', closest: true }, { nombre: 'La Paz', km: '280 km' },
    ],
    idiomas: [],
  },

  // ─── CURAHUARA DE CARANGAS ─────────────────────────
  {
    slug: 'curahuara-de-carangas',
    nombre: 'Curahuara de Carangas',
    gentilicio: 'Curahuareño/a',
    descripcion: 'Municipio de la Provincia Sajama, puerta de acceso al Parque Nacional Sajama. Destino turístico por su cercanía al Volcán Sajama (6,542 m), el más alto de Bolivia.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3850,
    lat: -18.0,
    lng: -68.45,
    latStr: "18° 0' Sur",
    lngStr: "68° 27' Oeste",
    codigo: '041003',
    provincia: 'Sajama',
    alcalde: 'Lalo Alconz Sarmiento',
    direccion: 'Plaza Principal de Curahuara de Carangas',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aerop. Internacional de El Alto (La Paz)', dist: '170 km' },
    ],
    vecinos: [
      { nombre: 'Turco', dist: '50 km' }, { nombre: 'Huayllamarca', dist: '60 km' },
    ],
    distancias: [
      { nombre: 'La Paz', km: '170 km', closest: true }, { nombre: 'Oruro', km: '280 km' },
    ],
    idiomas: [],
  },

  // ─── SANTUARIO DE QUILLACAS ────────────────────────
  {
    slug: 'santuario-de-quillacas',
    nombre: 'Santuario de Quillacas',
    gentilicio: 'Quillacano/a',
    descripcion: 'Municipio de la Provincia Eduardo Abaroa, famoso por el Santuario de la Virgen de Quillacas, uno de los más importantes centros de peregrinación del altiplano boliviano.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3680,
    lat: -19.25,
    lng: -66.8667,
    latStr: "19° 15' Sur",
    lngStr: "66° 52' Oeste",
    codigo: '040203',
    provincia: 'Eduardo Abaroa',
    alcalde: 'Nilton Huaylla Callahuara',
    direccion: 'Plaza Principal de Quillacas',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '160 km' },
    ],
    vecinos: [
      { nombre: 'Challapata', dist: '41.7 km' }, { nombre: 'Pampa Aullagas', dist: '30 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '160 km', closest: true }, { nombre: 'Potosí', km: '180 km' },
    ],
    idiomas: [],
  },

  // ─── ANTEQUERA ─────────────────────────────────────
  {
    slug: 'antequera',
    nombre: 'Antequera',
    gentilicio: 'Antequerano/a',
    descripcion: 'Municipio de la Provincia Poopó, localidad minera del altiplano central de Oruro. Comunidad con larga tradición en la explotación de recursos minerales del subsuelo boliviano.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3720,
    lat: -18.35,
    lng: -66.8,
    latStr: "18° 21' Sur",
    lngStr: "66° 48' Oeste",
    codigo: '040303',
    provincia: 'Poopó',
    alcalde: 'Adela Aviza Fuertes',
    direccion: 'Plaza Principal de Antequera',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '50 km' },
    ],
    vecinos: [
      { nombre: 'Huanuni', dist: '21 km' }, { nombre: 'Machacamarca', dist: '25 km' },
      { nombre: 'Poopó', dist: '25 km' }, { nombre: 'Challapata', dist: '47.7 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '50 km', closest: true }, { nombre: 'Cochabamba', km: '150 km' },
    ],
    idiomas: [],
  },

  // ─── PAMPA AULLAGAS ────────────────────────────────
  {
    slug: 'pampa-aullagas',
    nombre: 'Pampa Aullagas',
    gentilicio: 'Aullagueño/a',
    descripcion: 'Segunda Sección Municipal de la Provincia Ladislao Cabrera. Pampa Aullagas forma parte del altiplano sur orureño y comparte una identidad aymara marcada por la quinua real, los rituales andinos y la música comunitaria.',
    esCapital: false,
    poblacion: '3.197',
    anoCenso: 2024,
    rankingDep: 'N/D',
    altitud: 3700,
    lat: -19.3833,
    lng: -66.8333,
    latStr: "19° 23' Sur",
    lngStr: "66° 50' Oeste",
    codigo: '040802',
    provincia: 'Ladislao Cabrera',
    alcalde: 'Abg. Luciano Cari Condori',
    direccion: 'Plaza Principal de Pampa Aullagas',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '195 km' },
    ],
    vecinos: [
      { nombre: 'Challapata', dist: '44 km' }, { nombre: 'Santuario de Quillacas', dist: '30 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '195 km', closest: true }, { nombre: 'Uyuni', km: '120 km' },
    ],
    idiomas: [],
    provinciaFicha: PROVINCIA_LADISLAO_CABRERA,
    autoridades: [
      { cargo: 'Subgobernación de Ladislao Cabrera', detalle: 'Ing. Grover Carvajal Encinas.' },
      { cargo: 'Honorable Gobierno Municipal de Pampa Aullagas', detalle: 'Abg. Luciano Cari Condori.' },
    ],
    cultura: [
      {
        icono: '◌',
        titulo: 'Memoria aymara y andina',
        texto: 'La comunidad conserva saberes y rituales ligados al suelo, la producción andina y el horizonte cultural del volcán Thunupa.',
      },
      {
        icono: '♫',
        titulo: 'Sikus, zampoñas y comunidad',
        texto: 'Los instrumentos de viento acompañan los tiempos de siembra y cosecha, reforzando los vínculos de trabajo colectivo.',
      },
      {
        icono: '✦',
        titulo: 'Herencia de la quinua real',
        texto: 'El territorio forma parte de una tradición productiva milenaria donde la quinua y la papa nativa nutren la vida cotidiana.',
      },
    ],
    gastronomia: [
      { icono: '◈', titulo: 'Phisara', texto: 'Preparación de quinua cocida con papa y queso, servida junto al chicharrón de llama.' },
      { icono: '◈', titulo: 'Pito de quinua', texto: 'Harina de quinua tostada, nutritiva y tradicional en la alimentación altoandina.' },
      { icono: '◈', titulo: 'Charque, llama y papa nativa', texto: 'Productos locales que protagonizan almuerzos comunitarios y encuentros festivos.' },
    ],
    normativa: [
      { titulo: 'Ley N.º 534', texto: 'Crea la Segunda Sección de la Provincia Ladislao Cabrera con Pampa Aullagas y sus respectivos ayllus.' },
    ],
    territorio: {
      superficie: '916,26 km²',
      superficieEtiqueta: 'Superficie municipal',
      ubicacion: PROVINCIA_LADISLAO_CABRERA.ubicacion,
      relieve: PROVINCIA_LADISLAO_CABRERA.relieve,
      organizacion: 'Segunda Sección Municipal de Ladislao Cabrera',
      organizacionCorta: 'Segunda sección',
    },
    media: [
      {
        src: '/images/municipios/pampa-aullagas/escudo-pampa-aullagas.png',
        alt: 'Escudo del Gobierno Autónomo Municipal de Pampa Aullagas',
        titulo: 'Emblema de Pampa Aullagas',
        tipo: 'escudo',
      },
      {
        src: '/images/municipios/pampa-aullagas/lugar-pampa-aullagas.png',
        alt: 'Paisaje representativo de Pampa Aullagas',
        titulo: 'Paisaje de Pampa Aullagas',
        tipo: 'turismo',
      },
    ],
  },

  // ─── CRUZ DE MACHACAMARCA ──────────────────────────
  {
    slug: 'cruz-de-machacamarca',
    nombre: 'Cruz de Machacamarca',
    gentilicio: 'Crucino/a',
    descripcion: 'Municipio de la Provincia Poopó, pequeña localidad en el altiplano central del Departamento de Oruro. Comunidad agrícola con acceso a vías férreas históricas.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3680,
    lat: -18.23,
    lng: -66.8667,
    latStr: "18° 14' Sur",
    lngStr: "66° 52' Oeste",
    codigo: '040304',
    provincia: 'Poopó',
    alcalde: 'Javier Adhemir Kussy Ramirez',
    direccion: 'Plaza Principal de Cruz de Machacamarca',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '30 km' },
    ],
    vecinos: [
      { nombre: 'Machacamarca', dist: '10 km' }, { nombre: 'Poopó', dist: '15 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '30 km', closest: true }, { nombre: 'Cochabamba', km: '150 km' },
    ],
    idiomas: [],
  },

  // ─── HUACHACALLA ───────────────────────────────────
  {
    slug: 'huachacalla',
    nombre: 'Huachacalla',
    gentilicio: 'Huachacalleño/a',
    descripcion: 'Municipio de la Provincia Sabaya, en el altiplano occidental del Departamento de Oruro. Localidad cerca del Salar de Coipasa, rica en recursos naturales y fauna altiplánica.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3680,
    lat: -18.8,
    lng: -68.2333,
    latStr: "18° 48' Sur",
    lngStr: "68° 14' Oeste",
    codigo: '040902',
    provincia: 'Sabaya',
    alcalde: 'Isidora Irma Alconz Flores',
    direccion: 'Plaza Principal de Huachacalla',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '300 km' },
    ],
    vecinos: [
      { nombre: 'Sabaya', dist: '55 km' }, { nombre: 'Coipasa', dist: '40 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '300 km', closest: true }, { nombre: 'Iquique (Chile)', km: '260 km' },
    ],
    idiomas: [],
  },

  // ─── COIPASA ───────────────────────────────────────
  {
    slug: 'coipasa',
    nombre: 'Coipasa',
    gentilicio: 'Coipaseño/a',
    descripcion: 'Municipio de la Provincia Sabaya, ubicado junto al Salar de Coipasa. Región con ecosistemas únicos de humedales y salares, hogar de flamencos y otras aves migratorias.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3670,
    lat: -19.3,
    lng: -68.1167,
    latStr: "19° 18' Sur",
    lngStr: "68° 7' Oeste",
    codigo: '040903',
    provincia: 'Sabaya',
    alcalde: 'Willson Franz Perez Choque',
    direccion: 'Plaza Principal de Coipasa',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '340 km' },
    ],
    vecinos: [
      { nombre: 'Sabaya', dist: '50 km' }, { nombre: 'Huachacalla', dist: '40 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '340 km', closest: true }, { nombre: 'Uyuni', km: '150 km' },
    ],
    idiomas: [],
  },

  // ─── CARANGAS ──────────────────────────────────────
  {
    slug: 'carangas',
    nombre: 'Carangas',
    gentilicio: 'Carangeño/a',
    descripcion: 'Tercera Sección Municipal de la Provincia Puerto de Mejillones, en el altiplano occidental del Departamento de Oruro. Conserva una importante herencia cultural andina y vocación agropecuaria.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3760,
    lat: -18.55,
    lng: -67.7833,
    latStr: "18° 33' Sur",
    lngStr: "67° 47' Oeste",
    codigo: '041503',
    provincia: 'Puerto de Mejillones',
    alcalde: 'Osvaldo Choque Viza',
    direccion: 'Plaza Principal de Carangas',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '160 km' },
    ],
    vecinos: [
      { nombre: 'Corque', dist: '40 km' }, { nombre: 'Escara', dist: '30 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '160 km', closest: true }, { nombre: 'La Paz', km: '290 km' },
    ],
    idiomas: [],
  },

  // ─── CHIPAYA ───────────────────────────────────────
  {
    slug: 'chipaya',
    nombre: 'Chipaya',
    gentilicio: 'Chipaya',
    descripcion: 'Municipio de la Provincia Sabaya, hogar del pueblo Chipaya, una de las etnias más antiguas de América. Los Chipayas poseen una cultura, idioma y arquitectura únicos en el mundo.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3660,
    lat: -19.0833,
    lng: -68.25,
    latStr: "19° 5' Sur",
    lngStr: "68° 15' Oeste",
    codigo: '040904',
    provincia: 'Sabaya',
    alcalde: 'Flora Mamani',
    direccion: 'Plaza Principal de Chipaya',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '330 km' },
    ],
    vecinos: [
      { nombre: 'Sabaya', dist: '60 km' }, { nombre: 'Coipasa', dist: '45 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '330 km', closest: true }, { nombre: 'Iquique (Chile)', dist: '250 km' },
    ],
    idiomas: [{ lang: 'Chipaya (propio)', name: 'Chipaya' }],
  },

  // ─── TODOS SANTOS ──────────────────────────────────
  {
    slug: 'todos-santos',
    nombre: 'Todos Santos',
    gentilicio: 'Santino/a',
    descripcion: 'Municipio de la Provincia Sud Carangas, en el altiplano sur-occidental del Departamento de Oruro. Localidad de tradición pastoril con paisajes únicos del altiplano andino.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3850,
    lat: -19.15,
    lng: -67.65,
    latStr: "19° 9' Sur",
    lngStr: "67° 39' Oeste",
    codigo: '040802',
    provincia: 'Sud Carangas',
    alcalde: 'Florentino Sandoval Colque',
    direccion: 'Plaza Principal de Todos Santos',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '200 km' },
    ],
    vecinos: [
      { nombre: 'Santiago de Andamarca', dist: '35 km' }, { nombre: 'Corque', dist: '60 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '200 km', closest: true }, { nombre: 'Uyuni', km: '250 km' },
    ],
    idiomas: [],
  },

  // ─── SORACACHI ─────────────────────────────────────
  {
    slug: 'soracachi',
    nombre: 'Soracachi',
    gentilicio: 'Soracacheño/a',
    descripcion: 'Municipio de la Provincia Cercado, vecino inmediato a la ciudad de Oruro. Comunidad agrícola del altiplano central con estrecha relación económica y cultural con la capital departamental.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3700,
    lat: -17.85,
    lng: -67.0167,
    latStr: "17° 51' Sur",
    lngStr: "67° 1' Oeste",
    codigo: '040106',
    provincia: 'Cercado',
    alcalde: 'Willy Raul Montecinos Condori',
    direccion: 'Plaza Principal de Soracachi',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [
      { nombre: 'Aeropuerto Juan Mendoza (Oruro)', dist: '25 km' },
    ],
    vecinos: [
      { nombre: 'Oruro', dist: '23.7 km' }, { nombre: 'Machacamarca', dist: '20 km' },
      { nombre: 'El Choro', dist: '25 km' },
    ],
    distancias: [
      { nombre: 'Oruro', km: '24 km', closest: true }, { nombre: 'Cochabamba', km: '135 km' },
    ],
    idiomas: [],
  },

  // ─── CHOQUECOTA ────────────────────────────────────
  {
    slug: 'choquecota',
    nombre: 'Choquecota',
    gentilicio: 'Choquecoteño/a',
    descripcion: 'Segunda Sección Municipal de la Provincia Carangas, situada en el Altiplano Central del Departamento de Oruro. Forma parte del territorio histórico y cultural de la Marka Carangas.',
    esCapital: false,
    poblacion: '2.980',
    anoCenso: 2024,
    rankingDep: 'N/D',
    altitud: 3800,
    lat: -18.0,
    lng: -68.0,
    latStr: "18° 0' 0'' Sur",
    lngStr: "68° 0' 0'' Oeste",
    codigo: '040302',
    provincia: 'Carangas',
    alcalde: 'Autoridad municipal en ejercicio',
    direccion: 'N/D',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [],
    vecinos: [],
    distancias: [],
    idiomas: [],
    provinciaFicha: PROVINCIA_CARANGAS,
    autoridades: [
      { cargo: 'Alcaldía Municipal', detalle: 'Órgano Ejecutivo del Gobierno Autónomo Municipal de Choquecota.' },
      { cargo: 'Concejo Municipal', detalle: 'Órgano Legislativo municipal encargado de la normativa y fiscalización local.' },
      { cargo: 'Autoridades Originarias', detalle: 'Autoridades de las comunidades y ayllus que preservan la organización originaria del territorio.' },
    ],
    cultura: [
      {
        titulo: 'Identidad carangueña',
        texto: 'Choquecota integra el territorio histórico de Carangas y comparte la tradición comunitaria y altiplánica de la provincia.',
        icono: '✦',
      },
      {
        titulo: 'Paisaje de altura',
        texto: 'Su entorno combina planicies de altura y serranías, rasgos característicos del occidente orureño.',
        icono: '△',
      },
    ],
    territorio: {
      superficie: PROVINCIA_CARANGAS.superficie,
      ubicacion: PROVINCIA_CARANGAS.ubicacion,
      relieve: PROVINCIA_CARANGAS.relieve,
      clima: PROVINCIA_CARANGAS.clima,
    },
    media: [
      {
        src: '/images/municipios/choquecota/escudo-choquecota.png',
        alt: 'Escudo del Gobierno Autónomo Municipal de Choquecota',
        titulo: 'Gobierno Autónomo Municipal de Choquecota',
        tipo: 'escudo',
      },
      {
        src: '/images/municipios/choquecota/lugar-choquecota.png',
        alt: 'Paisaje y patrimonio de Choquecota',
        titulo: 'Paisaje y patrimonio de Choquecota',
        tipo: 'turismo',
      },
    ],
  },

  // ─── YUNGUYO DE LITORAL ────────────────────────────
  {
    slug: 'yunguyo-de-litoral',
    nombre: 'Yunguyo de Litoral',
    gentilicio: 'Yunguyeño/a',
    descripcion: 'Municipio perteneciente a la Provincia Litoral del departamento de Oruro.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3750,
    lat: -18.9,
    lng: -68.2,
    latStr: "18° 54' 0'' Sur",
    lngStr: "68° 12' 0'' Oeste",
    codigo: '040504',
    provincia: 'Litoral',
    alcalde: 'Hugo Ramos',
    direccion: 'N/D',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [],
    vecinos: [],
    distancias: [],
    idiomas: [],
  },

  // ─── ESMERALDA ─────────────────────────────────────
  {
    slug: 'esmeralda',
    nombre: 'Esmeralda',
    gentilicio: 'Esmeraldeño/a',
    descripcion: 'Municipio perteneciente a la Provincia Litoral del departamento de Oruro.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3700,
    lat: -18.8,
    lng: -68.1,
    latStr: "18° 48' 0'' Sur",
    lngStr: "68° 6' 0'' Oeste",
    codigo: '040505',
    provincia: 'Litoral',
    alcalde: 'Elias Contreras Arce',
    direccion: 'N/D',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [],
    vecinos: [],
    distancias: [],
    idiomas: [],
  },

  // ─── BELÉN DE ANDAMARCA ────────────────────────────
  {
    slug: 'belen-de-andamarca',
    nombre: 'Belén de Andamarca',
    gentilicio: 'Andamarqueño/a',
    descripcion: 'Municipio perteneciente a la Provincia Sur Carangas del departamento de Oruro.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3750,
    lat: -18.5,
    lng: -67.5,
    latStr: "18° 30' 0'' Sur",
    lngStr: "67° 30' 0'' Oeste",
    codigo: '041202',
    provincia: 'Sur Carangas',
    alcalde: 'Oscar Choque Marca',
    direccion: 'N/D',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [],
    vecinos: [],
    distancias: [],
    idiomas: [],
  },

  // ─── LA RIVERA ─────────────────────────────────────
  {
    slug: 'la-rivera',
    nombre: 'La Rivera',
    gentilicio: 'Rivereño/a',
    descripcion: 'Municipio perteneciente a la Provincia Puerto de Mejillones del departamento de Oruro.',
    esCapital: false,
    poblacion: 'N/D',
    anoCenso: 2012,
    rankingDep: 'N/D',
    altitud: 3700,
    lat: -18.7,
    lng: -68.4,
    latStr: "18° 42' 0'' Sur",
    lngStr: "68° 24' 0'' Oeste",
    codigo: '041501',
    provincia: 'Puerto de Mejillones',
    alcalde: 'Benjamin David Aguilar Gonzales',
    direccion: 'N/D',
    telefono: 'N/D',
    web: null,
    ciudadesHermanadas: [],
    aeropuertos: [],
    vecinos: [],
    distancias: [],
    idiomas: [],
  },];

const CONTENIDO_PANTALEON = {
  cultura: [
    { icono: '⛏', titulo: 'Memoria minera y sindical', texto: 'El trabajo del estaño, la organización obrera y la mística del subsuelo forman parte esencial de la identidad provincial.' },
    { icono: '◌', titulo: 'Ayllus y saberes originarios', texto: 'Comunidades quechuas y aymaras preservan rituales andinos, tejidos, música autóctona y formas comunitarias de organización.' },
    { icono: '✦', titulo: 'Huella ferroviaria', texto: 'Las rutas, talleres y estaciones ferroviarias guardan una memoria técnica que conecta a la provincia con la historia de Bolivia.' },
  ],
  normativa: [
    { titulo: 'Ley Nacional N.º 1471 (2022)', texto: 'Establece la delimitación territorial interna entre Huanuni y Machacamarca.' },
  ],
};

const CONTENIDO_SABAYA = {
  cultura: [
    { icono: '◌', titulo: 'Ayllus y herencia aymara', texto: 'Los ayllus Collana, Canaza, Zacari y Comujo sostienen usos, costumbres y formas comunitarias del altiplano.' },
    { icono: '✦', titulo: 'Memoria Uru y andina', texto: 'Las raíces prehispánicas de los pueblos urus y las tradiciones aymaras se encuentran en la vida ritual del territorio.' },
    { icono: '⌁', titulo: 'Vida de frontera', texto: 'La ritualidad andina convive con el comercio fronterizo y la producción de las comunidades altoandinas.' },
  ],
  gastronomia: [
    { icono: '◈', titulo: 'Phisara', texto: 'Preparación tradicional de quinua que acompaña los encuentros familiares y comunitarios.' },
    { icono: '◈', titulo: 'Ají picante y mukuna', texto: 'Sabores altoandinos elaborados con productos locales y técnicas transmitidas entre generaciones.' },
    { icono: '◈', titulo: 'Lagua', texto: 'Sopa nutritiva de la región, ligada a la alimentación cotidiana del altiplano.' },
  ],
  normativa: [
    { titulo: 'Normativa municipal autónoma', texto: 'La provincia se rige por las leyes y ordenanzas emitidas por los gobiernos municipales y sus concejos.' },
  ],
};

const CONTENIDO_SAJAMA = {
  cultura: [
    { icono: '♫', titulo: 'Tarqueada y jachasico', texto: 'Expresiones musicales que mantienen viva la riqueza cultural de las comunidades altoandinas.' },
    { icono: '◌', titulo: 'Jacha Carangas', texto: 'La identidad aymara se enlaza con la memoria de la antigua Confederación Jacha Carangas.' },
    { icono: '⌁', titulo: 'Ayni y crianza de camélidos', texto: 'El calendario agrícola y ritual organiza una vida colectiva vinculada al pastoreo de llamas y alpacas.' },
  ],
  gastronomia: [
    { icono: '◈', titulo: 'Charquekán', texto: 'Carne de llama deshidratada acompañada de productos propios del altiplano.' },
    { icono: '◈', titulo: 'Wathia', texto: 'Preparación ancestral en horno de tierra, ligada a los ciclos agrícolas.' },
    { icono: '◈', titulo: 'Chicharrón', texto: 'Plato tradicional que acompaña fiestas y reuniones comunitarias.' },
  ],
  normativa: [
    { titulo: 'Ley N.º 073 de Deslinde Jurisdiccional', texto: 'Reconoce y protege el sistema jurídico consuetudinario de las autoridades originarias.' },
    { titulo: 'Principios de gobierno originario', texto: 'Chacha-Warmi, Thakhi, Muyuña y el servicio por consenso orientan la complementariedad, trayectoria, rotación y decisión comunitaria.' },
  ],
};

const CONTENIDO_SUR_CARANGAS = {
  cultura: [
    { icono: '◌', titulo: 'Herencia de Jacha Carangas', texto: 'La provincia comparte una historia cultural ligada al antiguo territorio de Carangas.' },
    { icono: '✦', titulo: 'Ponchos, aguayos y distritos', texto: 'La vestimenta y las prácticas de sus siete distritos expresan identidades y creencias propias.' },
    { icono: '⌁', titulo: 'Comunidad y autoridades', texto: 'Cada distrito conserva su cuerpo de autoridades y formas particulares de organización territorial.' },
  ],
  gastronomia: [
    { icono: '◈', titulo: 'Pichu jarapi kanka', texto: 'Churrasco de llama propio de las actividades ganaderas de la provincia.' },
    { icono: '◈', titulo: 'Phisara con kanka', texto: 'Quinua y asado de llama en una preparación de profundo arraigo altoandino.' },
    { icono: '◈', titulo: 'Mukuna y qarwa chhuchullu', texto: 'Sabores de quinua y preparaciones tradicionales de llama.' },
  ],
  normativa: [
    { titulo: 'Autonomía y normas municipales', texto: 'La provincia se rige por la normativa del Estado Plurinacional, del Departamento de Oruro y las disposiciones de cada concejo municipal.' },
  ],
};

const CONTENIDO_POOPO = {
  cultura: [
    { icono: '◌', titulo: 'Pueblo Uru Murato', texto: 'La gente del agua conserva memoria, cosmovisión y tradiciones vinculadas a la ribera del Lago Poopó.' },
    { icono: '♫', titulo: 'Música y celebraciones', texto: 'Bandas, fiestas patronales, carnaval y la tradición de serenamiento en Pajchantiri animan la vida cultural.' },
    { icono: '✦', titulo: 'Patrimonio y artesanía', texto: 'Tejidos de lana, arte rupestre de Incapinta y templos coloniales resguardan la memoria provincial.' },
  ],
  normativa: [
    { titulo: 'Ley de creación provincial (16 de octubre de 1903)', texto: 'Consolida la creación de la Provincia Poopó durante la presidencia del General José Manuel Pando.' },
    { titulo: 'Marco autonómico municipal', texto: 'Los municipios se rigen por la Constitución, la Ley de Autonomías y sus propias leyes municipales.' },
  ],
};

const CONTENIDO_EDUARDO_ABAROA = {
  cultura: [
    { icono: '◌', titulo: 'Herencia andina viva', texto: 'Aymara, quechua y castellano conviven con formas comunitarias, ch’allas y respeto a la Pachamama.' },
    { icono: '✦', titulo: 'Fiesta, santuario y espiritualidad', texto: 'Las celebraciones religiosas y la tradición del pueblo quillaca son parte del patrimonio de la provincia.' },
    { icono: '⌁', titulo: 'Paisaje productivo', texto: 'La vida rural combina agricultura, ganadería, rutas de intercambio y la relación con cerros tutelares.' },
  ],
  normativa: [
    { titulo: 'Ley N.º 031 y Ley N.º 482', texto: 'Marco nacional de autonomías y gobiernos autónomos municipales aplicable en la provincia.' },
  ],
};

const CONTENIDO_LITORAL = {
  cultura: [
    { icono: '◌', titulo: 'Usos y costumbres del altiplano', texto: 'La organización comunitaria aymara sostiene valores, lengua y prácticas colectivas de las comunidades.' },
    { icono: '✦', titulo: 'Jacha Carangas y sincretismo', texto: 'Las celebraciones de la Pachamama, carnavales y festividades religiosas enlazan tradición andina y catolicismo.' },
    { icono: '⌁', titulo: 'Economía de la tierra', texto: 'La crianza de llamas y ovejas, junto a la quinua, papa y cebada, conforma la base productiva local.' },
  ],
  gastronomia: [
    { icono: '◈', titulo: 'Productos altoandinos', texto: 'Quinua, papa, cebada, charque y productos de la tierra forman parte de la alimentación tradicional.' },
  ],
  normativa: [
    { titulo: 'Ley N.º 350 (1967) y D.S. N.º 24076 (1995)', texto: 'Referencias normativas vinculadas a la creación e inclusión territorial de Yunguyo del Litoral.' },
    { titulo: 'Creación de la quinta sección municipal', texto: 'El material entregado registra la creación de Esmeralda el 20 de noviembre de 1968; falta confirmar el número de la ley.' },
  ],
};

const FICHAS_PROFESIONALES = {
  huanuni: {
    descripcion: 'Primera Sección Municipal y capital de Pantaleón Dalence. Huanuni es corazón de la minería del estaño, del movimiento obrero boliviano y de los saberes del Ayllu Bombo.',
    poblacion: '20.142', anoCenso: 2024, altitud: 3957, provincia: 'Pantaleón Dalence', provinciaFicha: PROVINCIA_PANTALEON_DALENCE,
    ...CONTENIDO_PANTALEON,
    gastronomia: [
      { icono: '◈', titulo: 'Wathia del Ayllu Bombo', texto: 'Carnes y tubérculos se cocinan en un horno de tierra; esta tradición inspira la Feria Departamental de la Wathia.' },
      { icono: '◈', titulo: 'Tostada de cordero', texto: 'Costillar o pierna de cordero crocante, acompañado de papa, arroz y ensalada.' },
    ],
    territorio: { superficie: '1.061 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: 'Capital de Pantaleón Dalence, en el altiplano central de Oruro.', relieve: 'Topografía montañosa, accidentada y pedregosa dominada por el cerro Posokoni.', organizacion: 'Primera Sección Municipal y capital provincial', organizacionCorta: 'Primera sección' },
  },
  machacamarca: {
    descripcion: 'Segunda Sección Municipal de Pantaleón Dalence y Capital Ferroviaria de Bolivia. Su identidad une la ingeniería del tren, la memoria de Sora Sora y la vida comunitaria andina.',
    poblacion: '6.096', anoCenso: 2024, altitud: 3700, provincia: 'Pantaleón Dalence', provinciaFicha: PROVINCIA_PANTALEON_DALENCE,
    ...CONTENIDO_PANTALEON,
    cultura: [
      { icono: '♜', titulo: 'Capital ferroviaria', texto: 'La herencia de los trabajadores del tren pervive en las maestranzas, estaciones y el Museo Ferroviario.' },
      { icono: '◌', titulo: 'Raíces quechuas y aymaras', texto: 'Las comunidades originarias mantienen rituales de la tierra y del agua cerca del área lacustre.' },
      { icono: '✦', titulo: 'Sora Sora y memoria histórica', texto: 'La presencia de Sora Sora y los antiguos ingenios vincula al municipio con la historia colonial y minera.' },
    ],
    gastronomia: [
      { icono: '◈', titulo: 'Charquekán orureño', texto: 'Charque de llama con mote, papa, huevo duro y queso criollo.' },
      { icono: '◈', titulo: 'Chicharrón de llama', texto: 'Preparación popular servida fresca con mote y llajua.' },
      { icono: '◈', titulo: 'Chairo', texto: 'Caldo de chuño, chalona y hortalizas ideal para el clima de altura.' },
    ],
    normativa: [...CONTENIDO_PANTALEON.normativa, { titulo: 'Patrimonio ferroviario', texto: 'Resoluciones departamentales protegen reliquias como la locomotora a vapor Luzmilla y promueven el turismo regional.' }],
    territorio: { superficie: '189 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: 'Llanura altiplánica próxima a la ribera sureste del Lago Uru Uru, sobre la carretera y vía férrea hacia Poopó.', relieve: 'Relieve predominantemente plano y de valor estratégico para la conexión ferroviaria.', organizacion: 'Segunda Sección Municipal', organizacionCorta: 'Segunda sección' },
  },
  sabaya: {
    descripcion: 'Primera Sección Municipal de la Provincia Sabaya, territorio de usos y costumbres aymaras, memoria Uru y vida comunitaria del occidente orureño.',
    poblacion: '15.504', anoCenso: 2024, provincia: 'Sabaya', provinciaFicha: PROVINCIA_SABAYA, ...CONTENIDO_SABAYA,
    territorio: { superficie: '3.718 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: PROVINCIA_SABAYA.ubicacion, relieve: PROVINCIA_SABAYA.relieve, organizacion: 'Primera Sección Municipal', organizacionCorta: 'Primera sección' },
  },
  coipasa: {
    descripcion: 'Segunda Sección Municipal de Sabaya, parte del paisaje altoandino de salares, comunidades aymaras y producción tradicional.',
    poblacion: '1.406', anoCenso: 2024, provincia: 'Sabaya', provinciaFicha: PROVINCIA_SABAYA, ...CONTENIDO_SABAYA,
    territorio: { superficie: '1.519 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: PROVINCIA_SABAYA.ubicacion, relieve: PROVINCIA_SABAYA.relieve, organizacion: 'Segunda Sección Municipal', organizacionCorta: 'Segunda sección' },
  },
  chipaya: {
    descripcion: 'Tercera Sección Municipal de Sabaya, hogar de una comunidad con una identidad cultural singular dentro del altiplano orureño.',
    poblacion: '2.366', anoCenso: 2024, provincia: 'Sabaya', provinciaFicha: PROVINCIA_SABAYA, ...CONTENIDO_SABAYA,
    territorio: { superficie: '919 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: PROVINCIA_SABAYA.ubicacion, relieve: PROVINCIA_SABAYA.relieve, organizacion: 'Tercera Sección Municipal', organizacionCorta: 'Tercera sección' },
  },
  'curahuara-de-carangas': {
    descripcion: 'Primera Sección Municipal de Sajama, integrada al territorio cultural de Jacha Carangas y a la vida altoandina de pastoreo y reciprocidad.',
    poblacion: '6.671', anoCenso: 2024, provincia: 'Sajama', provinciaFicha: PROVINCIA_SAJAMA, ...CONTENIDO_SAJAMA,
    territorio: { ubicacion: PROVINCIA_SAJAMA.ubicacion, relieve: PROVINCIA_SAJAMA.relieve, organizacion: 'Primera Sección Municipal con autoridades originarias', organizacionCorta: 'Primera sección' },
  },
  turco: {
    descripcion: 'Segunda Sección Municipal de Sajama, conocida como Turco Marka y articulada por una cultura aymara de comunidad, pastoreo y ritualidad agrícola.',
    poblacion: '5.277', anoCenso: 2024, provincia: 'Sajama', provinciaFicha: PROVINCIA_SAJAMA, ...CONTENIDO_SAJAMA,
    territorio: { ubicacion: PROVINCIA_SAJAMA.ubicacion, relieve: PROVINCIA_SAJAMA.relieve, organizacion: 'Segunda Sección Municipal · Turco Marka', organizacionCorta: 'Segunda sección' },
  },
  toledo: {
    descripcion: 'Único municipio y capital de Saucarí. Toledo reúne herencia aymara, quechua y castellana, templos coloniales y una vida ganadera propia del altiplano central.',
    poblacion: '12.115', anoCenso: 2024, provincia: 'Saucarí', provinciaFicha: PROVINCIA_SAUCARI,
    cultura: [
      { icono: '◌', titulo: 'Herencia lingüística', texto: 'Aymara, castellano y quechua conviven en la vida cotidiana del municipio.' },
      { icono: '✦', titulo: 'Templos y capillas coloniales', texto: 'El Templo de San Agustín y las capillas de Copacabana, Culluri, Untavi y Tres Cruces forman parte de su patrimonio.' },
      { icono: '♫', titulo: 'Fiesta de San Agustín', texto: 'Cada 28 de agosto la población celebra a su patrono con devoción y encuentro comunitario.' },
    ],
    gastronomia: [
      { icono: '◈', titulo: 'Chicharrón de llama', texto: 'Carne frita de llama con mote, huevo duro, papa y phisara.' },
      { icono: '◈', titulo: 'Brazuelo de cordero', texto: 'Pieza de cordero horneada o dorada con papa, arroz, chuño y ensalada.' },
    ],
    normativa: [
      { titulo: 'Ley N.º 262 (23 de noviembre de 1963)', texto: 'Crea la Provincia Saucarí durante el gobierno de Víctor Paz Estenssoro.' },
      { titulo: 'Carta Orgánica Municipal de Toledo', texto: 'Se complementa con leyes departamentales relativas a la cuenca del Desaguadero y al desarrollo agropecuario.' },
    ],
    territorio: { superficie: '1.671 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: PROVINCIA_SAUCARI.ubicacion, relieve: PROVINCIA_SAUCARI.relieve, organizacion: 'Única Sección Municipal y capital provincial', organizacionCorta: 'Única sección' },
  },
  huari: {
    nombre: 'Santiago de Huari',
    descripcion: 'Capital y única Sección Municipal de Sebastián Pagador. Santiago de Huari reúne saberes aymaras, quechuas y uru, música andina, medicina tradicional y una fuerte vida comunitaria.',
    poblacion: '13.502', anoCenso: 2024, provincia: 'Sebastián Pagador', provinciaFicha: PROVINCIA_SEBASTIAN_PAGADOR,
    cultura: [
      { icono: '◌', titulo: 'Aymara, quechua y Uru Murato', texto: 'Ayllus, comunidades y una tradición multilingüe sostienen la identidad intercultural de Huari.' },
      { icono: '♫', titulo: 'Música y fiestas', texto: 'Tarqas, waku, pinquillos, zampoñas y sikus acompañan San Sebastián, la Anata, Santa Vera Cruz y otras celebraciones.' },
      { icono: '✦', titulo: 'Medicina ancestral Jampi', texto: 'La Feria de Medicina Tradicional y Ancestral transmite conocimientos sobre plantas y tratamientos de generación en generación.' },
    ],
    gastronomia: [
      { icono: '◈', titulo: 'Chicharrón de llama', texto: 'Carne de llama dorada, servida con papa, chuño, mote y llajua.' },
      { icono: '◈', titulo: 'Wathia', texto: 'Papas y otros productos se cocinan en horno de tierra durante la época de cosecha.' },
      { icono: '◈', titulo: 'Kanka', texto: 'Asado comunitario de cordero o llama, acompañado por productos nativos del altiplano.' },
    ],
    normativa: [
      { titulo: 'Ley N.º 1566 (2024)', texto: 'Declara patrimonio cultural inmaterial del Estado Plurinacional de Bolivia a la Feria del Jampi de Huari.' },
      { titulo: 'Ley N.º 1378 (2021)', texto: 'Declara patrimonio cultural material inmueble del Estado Plurinacional a la Iglesia Colonial de San Pedro de Condo.' },
      { titulo: 'Ley Departamental N.º 58 (2013)', texto: 'Declara como red departamental el camino Cruce Chotocollo–Lagunillas–Phutina.' },
    ],
    territorio: { superficie: '1.972 km²', superficieEtiqueta: 'Superficie provincial', ubicacion: PROVINCIA_SEBASTIAN_PAGADOR.ubicacion, relieve: PROVINCIA_SEBASTIAN_PAGADOR.relieve, clima: 'Semiárido, de estepa y con invierno seco.', organizacion: 'Única Sección Municipal y capital provincial', organizacionCorta: 'Única sección' },
  },
  'santiago-de-andamarca': {
    descripcion: 'Primera Sección Municipal de Sur Carangas. Santiago de Andamarca reúne tres distritos y una identidad cultural heredera del Suyu Jacha Carangas.',
    poblacion: '3.000', anoCenso: 2024, provincia: 'Sur Carangas', provinciaFicha: PROVINCIA_SUR_CARANGAS, ...CONTENIDO_SUR_CARANGAS,
    territorio: { ubicacion: PROVINCIA_SUR_CARANGAS.ubicacion, relieve: PROVINCIA_SUR_CARANGAS.relieve, organizacion: 'Primera Sección Municipal · 3 distritos', organizacionCorta: '3 distritos' },
  },
  'belen-de-andamarca': {
    descripcion: 'Segunda Sección Municipal de Sur Carangas. Belén de Andamarca articula cuatro distritos con prácticas comunitarias y un patrimonio cultural altoandino propio.',
    poblacion: '2.500', anoCenso: 2024, provincia: 'Sur Carangas', provinciaFicha: PROVINCIA_SUR_CARANGAS, ...CONTENIDO_SUR_CARANGAS,
    territorio: { ubicacion: PROVINCIA_SUR_CARANGAS.ubicacion, relieve: PROVINCIA_SUR_CARANGAS.relieve, organizacion: 'Segunda Sección Municipal · 4 distritos', organizacionCorta: '4 distritos' },
  },
  eucaliptus: {
    descripcion: 'Único municipio y capital de Tomás Barrón. Eucaliptus combina lengua aymara y castellana, vestimenta tradicional, trabajo colectivo, ganadería y devoción comunitaria.',
    poblacion: '5.443', anoCenso: 2024, provincia: 'Tomás Barrón', provinciaFicha: PROVINCIA_TOMAS_BARRON,
    cultura: [
      { icono: '◌', titulo: 'Vestimenta y comunidad', texto: 'El respeto a las autoridades originarias, el trabajo colectivo y la vestimenta andina son parte de la vida cotidiana.' },
      { icono: '♫', titulo: 'Danza y festividad', texto: 'Wuaykoli, tarqueada y moseñada acompañan la festividad de la Virgen de Copacabana, celebrada del 4 al 8 de agosto.' },
      { icono: '✦', titulo: 'Templos de la provincia', texto: 'Quelcata, Alcamarca, Amachuma, Huancaroma y el templo de la Virgen de Copacabana preservan la memoria religiosa local.' },
    ],
    gastronomia: [
      { icono: '◈', titulo: 'Ph’ampaku', texto: 'Preparación altoandina ligada a la cocción comunitaria y los productos de la región.' },
      { icono: '◈', titulo: 'Ph’isara', texto: 'Quinua y productos locales que acompañan la alimentación tradicional.' },
      { icono: '◈', titulo: 'Ph’esque', texto: 'Plato de la región elaborado con alimentos andinos como papa, chuño, haba y carnes locales.' },
    ],
    normativa: [
      { titulo: 'Ley N.º 502 (7 de marzo de 1980)', texto: 'Ley de creación provincial citada para Tomás Barrón durante la presidencia de Lidia Gueiler Tejada.' },
    ],
    territorio: { superficie: '356 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: PROVINCIA_TOMAS_BARRON.ubicacion, relieve: PROVINCIA_TOMAS_BARRON.relieve, organizacion: 'Única Sección Municipal y capital provincial', organizacionCorta: 'Única sección' },
  },
  poopo: {
    descripcion: 'Capital de la Provincia Poopó, ubicada en la ribera oriental del lago homónimo. Su identidad articula la memoria Uru Murato, ayllus, música y actividades productivas de la región.',
    poblacion: '9.189', anoCenso: 2024, altitud: 3800, provincia: 'Poopó', alcalde: 'Nicanor López Choque', provinciaFicha: PROVINCIA_POOPO, ...CONTENIDO_POOPO,
    gastronomia: [
      { icono: '◈', titulo: 'Charquekán', texto: 'Charque de llama con mote, papa, ají y huevo; una preparación emblemática de Oruro.' },
      { icono: '◈', titulo: 'Api y tojori', texto: 'Bebidas tradicionales de maíz que acompañan la gastronomía provincial.' },
    ],
    territorio: { superficie: '697 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: 'A 60 km al sur de Oruro, en la ribera oriental del Lago Poopó.', relieve: PROVINCIA_POOPO.relieve, organizacion: 'Capital provincial', organizacionCorta: 'Capital provincial' },
  },
  pazna: {
    descripcion: 'Municipio de la Provincia Poopó, vinculado a la ribera lacustre, a las comunidades altoandinas y a una cultura de música, agricultura y ganadería.',
    poblacion: '4.251', anoCenso: 2024, altitud: 3734, provincia: 'Poopó', alcalde: 'Diony Achacollo Velásquez', provinciaFicha: PROVINCIA_POOPO, ...CONTENIDO_POOPO,
    gastronomia: [
      { icono: '◈', titulo: 'Thimpu y sajta', texto: 'Carne de cordero o gallina acompañada de chuño, papa y ají amarillo.' },
      { icono: '◈', titulo: 'Api y tojori', texto: 'Bebidas tradicionales presentes en la gastronomía provincial.' },
    ],
    territorio: { ubicacion: 'Zona oeste de la Provincia Poopó, en un territorio que limita con el Lago Poopó.', relieve: PROVINCIA_POOPO.relieve, organizacion: 'Sección Municipal de Poopó', organizacionCorta: 'Sección municipal' },
  },
  antequera: {
    descripcion: 'Municipio de la Provincia Poopó, en un paisaje cordillerano que integra memoria minera, comunidades andinas y rutas hacia el Departamento de Potosí.',
    poblacion: '3.666', anoCenso: 2024, altitud: 4156, provincia: 'Poopó', alcalde: 'Adela Viza Fuertes', provinciaFicha: PROVINCIA_POOPO, ...CONTENIDO_POOPO,
    gastronomia: [
      { icono: '◈', titulo: 'Rostro asado', texto: 'Cabeza de cordero asada lentamente con ají, ajo y especias tradicionales.' },
      { icono: '◈', titulo: 'Api y tojori', texto: 'Bebidas de maíz que acompañan la mesa provincial.' },
    ],
    territorio: { ubicacion: 'Zona este de la Provincia Poopó, con límite hacia el Departamento de Potosí.', relieve: 'Paisajes cordilleranos, zona minera y montañas del altiplano.', organizacion: 'Sección Municipal de Poopó', organizacionCorta: 'Sección municipal' },
  },
  challapata: {
    descripcion: 'Capital de Eduardo Abaroa y centro de nueve distritos. Challapata expresa una profunda herencia andina, vida productiva y relación espiritual con la Pachamama y los cerros tutelares.',
    poblacion: '35.427', anoCenso: 2024, altitud: 3720, provincia: 'Eduardo Abaroa', alcalde: 'Máximo Dionicio Herrera Choque', provinciaFicha: PROVINCIA_EDUARDO_ABAROA, ...CONTENIDO_EDUARDO_ABAROA,
    gastronomia: [
      { icono: '◈', titulo: 'Queso y derivados lácteos', texto: 'Los productos lácteos locales forman parte de la actividad agropecuaria y de la cocina cotidiana.' },
      { icono: '◈', titulo: 'Charque de llama y tostado de haba', texto: 'Preparaciones y productos representativos del altiplano challapateño.' },
    ],
    normativa: [...CONTENIDO_EDUARDO_ABAROA.normativa, { titulo: 'Ley Municipal N.º 507 (2025)', texto: 'Relacionada con la aprobación del Presupuesto Institucional Plurianual, POA y anteproyecto de presupuesto 2026.' }],
    territorio: { superficie: '3.014 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: 'Capital de Eduardo Abaroa; limita con Poopó, Sebastián Pagador, Potosí y el Lago Poopó.', relieve: 'Planicies de altiplano y laderas de la cordillera Azanaque.', organizacion: 'Primera Sección Municipal · 9 distritos', organizacionCorta: '9 distritos' },
  },
  'santuario-de-quillacas': {
    descripcion: 'Segunda Sección Municipal de Eduardo Abaroa. Santuario de Quillacas conserva una fuerte identidad indígena andina y un patrimonio religioso e histórico de gran importancia regional.',
    poblacion: '5.105', anoCenso: 2024, provincia: 'Eduardo Abaroa', alcalde: 'Nilton Huaylla Callahura', provinciaFicha: PROVINCIA_EDUARDO_ABAROA, ...CONTENIDO_EDUARDO_ABAROA,
    cultura: [
      { icono: '◌', titulo: 'Identidad del pueblo quillaca', texto: 'La vida comunitaria y las autoridades originarias preservan una espiritualidad andina de profundo arraigo.' },
      { icono: '✦', titulo: 'Santuario y patrimonio', texto: 'El Santuario de Quillacas es un referente religioso e histórico para el altiplano boliviano.' },
      { icono: '⌁', titulo: 'Comunidad agrícola', texto: 'El trabajo rural enlaza productos del altiplano, celebraciones y prácticas comunitarias.' },
    ],
    gastronomia: [
      { icono: '◈', titulo: 'Productos del altiplano', texto: 'Papa, chuño, haba, quinua y carnes de camélidos y ovinos forman parte de la alimentación local.' },
      { icono: '◈', titulo: 'Tostado de haba', texto: 'Producto reconocido en las preparaciones comunitarias y actividades agrícolas.' },
    ],
    territorio: { ubicacion: 'Sur de Eduardo Abaroa; limita con Santiago de Huari, Potosí y Pampa Aullagas.', relieve: 'Paisajes de altiplano, áreas rurales y sistemas hidrográficos como el río Grande.', organizacion: 'Segunda Sección Municipal · 2 distritos', organizacionCorta: '2 distritos' },
  },
  huachacalla: {
    descripcion: 'Primera Sección Municipal de la Provincia Litoral, integrada a comunidades del altiplano de tradición aymara y economía agropecuaria.',
    provincia: 'Litoral', provinciaFicha: PROVINCIA_LITORAL, ...CONTENIDO_LITORAL,
    territorio: { ubicacion: PROVINCIA_LITORAL.ubicacion, relieve: PROVINCIA_LITORAL.relieve, organizacion: 'Primera Sección Municipal', organizacionCorta: 'Primera sección' },
  },
  escara: {
    descripcion: 'Segunda Sección Municipal de Litoral, con una vida comunitaria aymara ligada a la crianza de camélidos, agricultura andina y ritualidad local.',
    provincia: 'Litoral', provinciaFicha: PROVINCIA_LITORAL, ...CONTENIDO_LITORAL,
    territorio: { ubicacion: PROVINCIA_LITORAL.ubicacion, relieve: PROVINCIA_LITORAL.relieve, organizacion: 'Segunda Sección Municipal', organizacionCorta: 'Segunda sección' },
  },
  'cruz-de-machacamarca': {
    descripcion: 'Tercera Sección Municipal de Litoral, parte de un territorio de comunidades altoandinas, producción tradicional y memoria aymara.',
    provincia: 'Litoral', provinciaFicha: PROVINCIA_LITORAL, ...CONTENIDO_LITORAL,
    territorio: { ubicacion: PROVINCIA_LITORAL.ubicacion, relieve: PROVINCIA_LITORAL.relieve, organizacion: 'Tercera Sección Municipal', organizacionCorta: 'Tercera sección' },
  },
  'yunguyo-de-litoral': {
    nombre: 'Yunguyo del Litoral',
    descripcion: 'Cuarta Sección Municipal de Litoral. Yunguyo del Litoral desarrolla una identidad comunitaria altoandina en un territorio de planicies frías y secas.',
    altitud: 3744, provincia: 'Litoral', alcalde: 'Walter Amaru Viza', provinciaFicha: PROVINCIA_LITORAL, ...CONTENIDO_LITORAL,
    territorio: { superficie: '179 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: 'Territorio de Litoral que limita al norte con Cruz de Machacamarca, al este con Escara y al oeste y sur con Sabaya.', relieve: 'Planicies de clima frío y seco con vegetación propia del altiplano.', organizacion: 'Cuarta Sección Municipal', organizacionCorta: 'Cuarta sección' },
  },
  esmeralda: {
    descripcion: 'Quinta Sección Municipal de Litoral. Esmeralda pertenece a la nación aymara Jacha Carangas y conserva una organización comunal activa en torno al ayllu Collana.',
    altitud: 3747, provincia: 'Litoral', alcalde: 'Eliasa Contreras Arce', provinciaFicha: PROVINCIA_LITORAL, ...CONTENIDO_LITORAL,
    territorio: { superficie: '419 km²', superficieEtiqueta: 'Superficie municipal', ubicacion: 'Sureste de la ciudad de Oruro, a aproximadamente 168 km por carretera; limita con Yunguyo, Huachacalla, Chipaya, Coipasa, Escara, Belén de Andamarca y Sabaya.', relieve: 'Planicies altoandinas de clima frío y seco. El material también cita una referencia alternativa de 602 km² que queda pendiente de validación.', organizacion: 'Quinta Sección Municipal', organizacionCorta: 'Quinta sección' },
  },
};

export const municipios = municipiosBase.map((municipio) => ({
  ...municipio,
  ...(FICHAS_PROFESIONALES[municipio.slug] || {}),
}));

export function getMunicipio(slug) {
  return municipios.find((m) => m.slug === slug) || null;
}
