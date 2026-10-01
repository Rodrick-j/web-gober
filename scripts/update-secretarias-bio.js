const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const secretariasUpdates = [
  {
    slug: 'secretaria-general',
    secretario_nombre: 'Eddy Erlan Torrez Nina',
    secretario_bio: 'Es Licenciado en Derecho y ejerce activamente como Abogado con amplia experiencia en la administración pública regional. Fue seleccionado directamente por el Gobernador debido a su perfil conciliador con las centrales obreras y vecinales. Su principal objetivo de gestión consiste en articular y unificar políticamente el trabajo entre las 16 provincias locales. Actúa actualmente como la mano derecha del ejecutivo en la toma de decisiones estratégicas e institucionales.'
  },
  {
    slug: 'planificacion-desarrollo',
    secretario_nombre: 'Mgtr. Lic. Giovani Hugo Luis Torrez Yáñez',
    secretario_bio: 'Ostenta el título de Licenciado en Economía y cuenta con una Maestría enfocada en Finanzas y Proyectos Públicos. Es el estratega técnico responsable de consolidar de forma transparente el Plan Operativo Anual (POA) de la región. Su experiencia en auditorías previas le permite optimizar la distribución de recursos económicos del tesoro departamental. Actualmente lidera las mesas de concertación para atraer inversión de empresas privadas y cooperaciones extranjeras.'
  },
  {
    slug: 'administracion-finanzas-publicas',
    secretario_nombre: 'César Rodrigo Ayala Pérez',
    secretario_bio: 'Es Licenciado en Contaduría Pública y cuenta con acreditación oficial como Auditor Financiero y de Sistemas. Recibió el mandato explícito de fiscalizar el gasto público bajo una política estricta de cero corrupción institucional. Se encarga del control presupuestario integral, pago de planillas y la administración de activos fijos del departamento. Su gestión se enfoca en optimizar los ingresos propios para reducir la dependencia de los hidrocarburos estatales.'
  },
  {
    slug: 'obras-publicas',
    secretario_nombre: 'Ing. Edson Reynaldo Copa Rojas',
    secretario_bio: 'Posee el grado académico de Ingeniero Civil con una especialidad técnica en Estructuras y Fiscalización de Proyectos Viales. Su trayectoria incluye la supervisión de caminos vecinales y la reactivación de obras de gran envergadura paralizadas. Está a cargo de modernizar la infraestructura vial, puentes y la red de hospitales públicos en el área urbana. Su misión prioritaria es asegurar contratos transparentes y sin sobreprecios con las constructoras locales.'
  },
  {
    slug: 'desarrollo-social-seguridad-alimentaria',
    secretario_nombre: 'Lic. Silvia Jimena Padilla Padilla',
    secretario_bio: 'Es Licenciada en Trabajo Social y cuenta con postgrados enfocados en Gestión de Programas de Salud Comunitaria. Dirige los centros de acogida para la niñez y coordina de forma directa los servicios del [SEDEGES Oruro](https://rtvu.uto.edu.bo/2026/05/05/eddgar-sanchez-conforma-su-gabinete-oruro-ya-tiene-equipo-tecnico-y-administrativo-para-la-gestion-2026-2031/). Su enfoque prioritario radica en mitigar la desnutrición infantil mediante programas integrales de seguridad alimentaria provincial. Administra los recursos asistenciales destinados al resguardo de mujeres en situación de vulnerabilidad extrema.'
  },
  {
    slug: 'asuntos-juridicos',
    secretario_nombre: 'Abg. Omar Richard Calizaya Choque',
    secretario_bio: 'Es Licenciado en Derecho y cuenta con una destacada experiencia en asesoría legal de entidades descentralizadas. Es el encargado de revisar la legalidad y validez de cada decreto, convenio y contratación que firma la Gobernación. Representa legalmente a la institución ante demandas externas y coordina la posesión de autoridades de salud. Su gestión busca evitar contingencias jurídicas y garantizar que todos los funcionarios actúen apegados a la normativa.'
  },
  {
    slug: 'desarrollo-productivo-industria',
    secretario_nombre: 'Jorge Antonio Méndez Rodríguez',
    secretario_bio: 'Es Ingeniero Comercial con una sólida formación en el área de macroeconomía y desarrollo de mercados emergentes. Ha trabajado en el fomento y fortalecimiento técnico de pequeñas asociaciones productoras del área rural orureña. Lidera las políticas de apoyo técnico destinadas a las micro, pequeñas y grandes empresas del sector manufacturero. Su meta central es generar cadenas de valor sólidas para la exportación de textiles, quinua y camélidos nativos.'
  },
  {
    slug: 'mineria-metalurgia-recursos-energeticos',
    secretario_nombre: 'Max Martínez Quispe',
    secretario_bio: 'Es Ingeniero de Minas y posee estrechos nexos de trabajo con el sector cooperativista e industrial minero. Es el responsable técnico de fiscalizar, cobrar y optimizar las regalías mineras que sostienen al departamento. Coordina las políticas operacionales ecológicas junto a la empresa estatal e incentiva nuevos proyectos de prospección. Trabaja activamente en el diseño de planes de diversificación energética hacia fuentes limpias y alternativas modernas.'
  },
  {
    slug: 'medio-ambiente-agua-madre-tierra',
    secretario_nombre: 'Freddy Choqueticlla Quispe',
    secretario_bio: 'Tiene la formación profesional de Ingeniero Ambiental y experto en el manejo sostenible de Cuencas Hidrográficas. Su campo de acción abarca el control y la mitigación de la contaminación causada por la actividad minera regional. Está a cargo de implementar sistemas de riego agrícola para mitigar las sequías en las provincias más afectadas. Promueve campañas de reforestación urbana y el resguardo de la fauna andina de los lagos del departamento.'
  },
  {
    slug: 'cultura-turismo',
    secretario_nombre: 'Rolando Barrientos',
    secretario_bio: 'Es Licenciado en Turismo y se ha destacado durante años como un reconocido Gestor Cultural folclórico. Tiene bajo su mando la organización institucional del majestuoso Carnaval de Oruro en coordinación con la [Asociación de Conjuntos del Folklore (ACFO)](https://lapatria.bo/enfoque-nacional/gobernador-de-oruro-posesiona-su-primer-gabinete-departamental/). Su labor prioritaria es potenciar las rutas turísticas arqueológicas y naturales presentes en el área provincial. Trabaja de la mano con las comunidades locales para fomentar el turismo comunitario y salvaguardar el patrimonio material.'
  }
];

async function run() {
  for (const item of secretariasUpdates) {
    console.log(`Actualizando ${item.slug}...`);
    const { error } = await supabase
      .from('secretarias')
      .update({
        secretario_nombre: item.secretario_nombre,
        secretario_bio: item.secretario_bio
      })
      .eq('slug', item.slug);
      
    if (error) {
      console.error(`Error actualizando ${item.slug}:`, error);
    } else {
      console.log(`Exito: ${item.slug}`);
    }
  }
  console.log('Terminado.');
}

run();
