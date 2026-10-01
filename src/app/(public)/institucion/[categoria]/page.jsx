import { createClient } from '@/lib/supabase/public';
import { notFound } from 'next/navigation';
import { FileText, Download, Calendar } from 'lucide-react';
import CategoriaHeader from './CategoriaHeader';
import GacetaClient from '@/app/(public)/gaceta/[tipo]/GacetaClient';
import DesarrolloOrganizacionalHub from './DesarrolloOrganizacionalHub';
import RecursosHumanosHub from './RecursosHumanosHub';
import styles from './CategoriaInstitucion.module.css';

export const revalidate = 60;

const CATEGORIAS_VALIDAS = {
  // Categorías originales
  'informacion-financiera': 'Información Financiera',
  'recursos-humanos': 'Recursos Humanos',
  'desarrollo-organizacional': 'Desarrollo Organizacional',
  'contrataciones': 'Contrataciones',
  'licitacion-publica': 'Licitación Pública',

  // ── RM 067/2025 · Contenidos Mínimos ──
  // Marco normativo (ítems 40, 41, 42)
  'marco-normativo': 'Marco Normativo Institucional',
  'normativa-nacional': 'Normativa Nacional',
  'normativa-internacional': 'Normativa Internacional',
  'reglamentos-vigentes': 'Reglamentos Vigentes',
  // Plan estratégico y POA (ítems 7, 9, 10)
  'plan-estrategico': 'Plan Estratégico Institucional',
  'poa-documento': 'Programación Operativa Anual (POA)',
  'seguimiento-poa': 'Seguimiento y Evaluación al POA',
  'flujos-procesos': 'Flujos de Procesos',
  // Información financiera (ítems 11, 12, 14)
  'presupuesto': 'Presupuesto Institucional',
  'ejecucion-presupuestaria': 'Ejecución Presupuestaria',
  'fuentes-financiamiento': 'Fuentes de Financiamiento',
  // Recursos humanos (ítems 32, 33, 34, 35, 36)
  'mof': 'Manual de Organización de Funciones (MOF)',
  'mpp': 'Manual de Procesos y Procedimientos (MPP)',
  'poai': 'Plan Operativo Anual Individual (POAI)',
  'escala-salarial': 'Escala Salarial',
  'nomina-servidores': 'Nómina de Servidores Públicos',
};

export async function generateMetadata({ params }) {
  const slug = (await params).categoria;
  const titulo = CATEGORIAS_VALIDAS[slug] || 'Documentos';
  
  return {
    title: `${titulo} | Institución | GADOR`,
    description: `Documentos oficiales de ${titulo} del Gobierno Autónomo Departamental de Oruro`,
  };
}

export default async function CategoriaInstitucionPage({ params }) {
  const slug = (await params).categoria;
  const titulo = CATEGORIAS_VALIDAS[slug];

  if (!titulo) {
    notFound();
  }

  if (slug === 'desarrollo-organizacional') {
    return (
      <main className={styles.mainContainer}>
        <CategoriaHeader titulo={titulo} slug={slug} />
        <DesarrolloOrganizacionalHub />
      </main>
    );
  }

  if (slug === 'recursos-humanos') {
    return (
      <main className={styles.mainContainer}>
        <CategoriaHeader titulo={titulo} slug={slug} />
        <RecursosHumanosHub />
      </main>
    );
  }

  const supabase = createClient();
  const { data: documentos, error } = await supabase
    .from('institucion_documentos')
    .select('*')
    .eq('categoria', slug)
    .eq('activo', true)
    .order('fecha_publicacion', { ascending: false });

  return (
    <>
      <main className={styles.mainContainer}>
        <CategoriaHeader titulo={titulo} slug={slug} />

        <div className={styles.contentWrapper} style={slug === 'marco-normativo' ? { maxWidth: '100%', padding: 0 } : {}}>
          {error ? (
            <div className={styles.errorState}>
              <p>Ocurrió un error al cargar los documentos.</p>
            </div>
          ) : !documentos || (documentos.length === 0 && !['marco-normativo', 'escala-salarial', 'presupuesto', 'ejecucion-presupuestaria', 'bienes-y-servicios'].includes(slug)) ? (
            <div className={styles.emptyState}>
              <FileText size={48} className={styles.emptyIcon} />
              <h2>No hay documentos disponibles</h2>
              <p>Actualmente no hay archivos publicados en la categoría de {titulo}.</p>
            </div>
          ) : slug === 'marco-normativo' ? (
            <div style={{ backgroundColor: '#fcfcfc', paddingTop: '2rem' }}>
              <GacetaClient
                documentos={[
                  { id: 's1', anio: 1990, numero_documento: 'Ley N.º 1178', titulo: 'SAFCO', fecha_publicacion: '1990-07-20T00:00:00', archivo_pdf_url: '/marco-normativo/Ley 1178  MARCO NORMARIVO.pdf' },
                  { id: 's2', anio: 2009, numero_documento: 'CPE', titulo: 'Constitución Política del Estado', fecha_publicacion: '2009-02-07T00:00:00', archivo_pdf_url: '/marco-normativo/marco_normativo_gobernacion_bolivia.pdf' },
                  { id: 's3', anio: 2010, numero_documento: 'Ley N.º 031', titulo: 'Marco de Autonomías y Descentralización', fecha_publicacion: '2010-07-19T00:00:00', archivo_pdf_url: encodeURI('/marco-normativo/ley-nº-031-marco-de-autonomias-y-descentralizacion-“andres-ibanyez” MARCO NORMARIVO.pdf') },
                  { id: 's4', anio: 2011, numero_documento: 'Ley N.º 164', titulo: 'Telecomunicaciones y TIC', fecha_publicacion: '2011-08-08T00:00:00', archivo_pdf_url: encodeURI('/marco-normativo/ley-n-164 MARCO NORMARIVO.pdf') },
                  { id: 's5', anio: 2017, numero_documento: 'D.S. N.º 3251', titulo: 'Gobierno Electrónico y Software Libre', fecha_publicacion: '2017-07-12T00:00:00', archivo_pdf_url: encodeURI('/marco-normativo/decreto-supremo-3251  MARCO NORMARIVO.pdf') },
                  { id: 's6', anio: 2018, numero_documento: 'Ley N.º 1080', titulo: 'Ciudadanía Digital', fecha_publicacion: '2018-07-11T00:00:00', archivo_pdf_url: encodeURI('/marco-normativo/Ley-N°-1080-Ciudadania-Digital MARCO NORMARIVO.pdf') },
                  { id: 's7', anio: 2025, numero_documento: 'D.S. N.º 5340', titulo: 'Creación de la plataforma gob.bo', fecha_publicacion: '2025-02-26T00:00:00', archivo_pdf_url: encodeURI('/marco-normativo/Decreto_Supremo_N_5340_0  MARCO NORMARIVO.pdf') },
                  { id: 's8', anio: 2025, numero_documento: 'D.S. N.º 5367', titulo: 'Agenda Digital 2030', fecha_publicacion: '2025-04-02T00:00:00', archivo_pdf_url: encodeURI('/marco-normativo/Decreto Supremo N° 5367-firmado  MARCO NORMARIVO.pdf') },
                  { id: 's9', anio: 2025, numero_documento: 'R.M. N.º 060/2025', titulo: 'Lineamientos de la plataforma gob.bo', fecha_publicacion: '2025-04-16T00:00:00', archivo_pdf_url: encodeURI('/marco-normativo/RA_60_2025_-GOB.BO-firmado MARCO NORMARIVO.pdf') },
                  ...((documentos || []).map(doc => ({
                    id: doc.id,
                    anio: parseInt(doc.fecha_publicacion?.substring(0, 4) || new Date().getFullYear()),
                    numero_documento: 'Normativa',
                    titulo: doc.titulo,
                    descripcion: doc.descripcion || '',
                    fecha_publicacion: doc.fecha_publicacion,
                    archivo_pdf_url: doc.archivo_url,
                  })))
                ]}
                tipoLabel="Marco Normativo Institucional"
                icon="⚖️"
              />
            </div>
          ) : slug === 'escala-salarial' ? (
            <div style={{ backgroundColor: '#fcfcfc', paddingTop: '2rem' }}>
              <GacetaClient
                documentos={[
                  { id: 'e1', anio: 2021, numero_documento: 'Doc 2021', titulo: 'ESCALA SALARIAL GADOR 2021', fecha_publicacion: '2021-01-01T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/ESCALA-SALARIAL-GADOR-2021.pdf') },
                  { id: 'e2', anio: 2022, numero_documento: 'Doc 2022', titulo: 'ESCALA SALARIAL PERSONAL ITEM', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/ESCALA-SALARIAL-PERSONAL-ITEM.pdf') },
                ]}
                tipoLabel="Escala Salarial"
                icon="💰"
              />
            </div>
          ) : slug === 'presupuesto' ? (
            <div style={{ backgroundColor: '#fcfcfc', paddingTop: '2rem' }}>
              <GacetaClient
                documentos={[
                  { id: 'p1', anio: 2022, numero_documento: 'Doc 1', titulo: 'PRESUPUESTOS DE RECURSOS POR RUBROS', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/PRESUPUESTOS-DE-RECURSOS-POR-RUBROS-3  presupuesot institucional.pdf') },
                  { id: 'p2', anio: 2022, numero_documento: 'Doc 2', titulo: 'PRESUPUESTO INSTITUCIONAL GADOR', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/RFprPresInstCatProgGrupGtoSinProyInver_904-2 presupuesot instiucionla gador.pdf') },
                ]}
                tipoLabel="Presupuesto Institucional"
                icon="📊"
              />
            </div>
          ) : slug === 'ejecucion-presupuestaria' ? (
            <div style={{ backgroundColor: '#fcfcfc', paddingTop: '2rem' }}>
              <GacetaClient
                documentos={[
                  { id: 'ej1', anio: 2022, numero_documento: 'Global 2022', titulo: 'EJECUCIÓN PPTARIA GLOBAL 2022', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/EJECUCION-PPTARIA-GLOBAL-2022  ejecuacion presupuestaria.pdf') },
                  { id: 'ej2', anio: 2022, numero_documento: 'General 2022', titulo: 'EJECUCIÓN PRESUPUESTARIA', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/EJECUCION-PRESUPUESTARIA   ejecuacion presupuestaria.pdf') },
                  { id: 'ej3', anio: 2021, numero_documento: 'Ag. 2021', titulo: 'EJECUCIÓN PRESUPUESTARIA GADOR AG. 2021', fecha_publicacion: '2021-08-01T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/EJECUCION-PRESUPUESTARIA-GADOR-AG.-2021  ejecuacion presupuestaria.pdf') },
                  { id: 'ej4', anio: 2022, numero_documento: 'Dic. 2022', titulo: 'EJECUCIÓN PRESUPUESTARIA DIC 2022', fecha_publicacion: '2022-12-01T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/EJECUCION-PRESUPUESTARIA-dic-2022  ejecuacion presupuestaria.pdf') },
                  { id: 'ej5', anio: 2026, numero_documento: 'Reporte 2026', titulo: 'REPORTE DINÁMICO 2026', fecha_publicacion: '2026-09-03T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/REgaReporteDinamico-2026-09-03T115458.254  ejecuacion presupuestaria.pdf') },
                ]}
                tipoLabel="Ejecución Presupuestaria"
                icon="📈"
              />
            </div>
          ) : slug === 'bienes-y-servicios' ? (
            <div style={{ backgroundColor: '#fcfcfc', paddingTop: '2rem' }}>
              <GacetaClient
                documentos={[
                  { id: 'b1', anio: 2022, numero_documento: 'Convocatoria', titulo: 'CONVOCATORIA DE BIENES Y SERVICIOS', fecha_publicacion: '2022-01-01T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/CONVOCATORIA-DE-BIENES-Y-SERVICIOS.pdf') },
                  { id: 'b2', anio: 2021, numero_documento: 'Proceso 2021', titulo: 'PROCESOS DE CONTRATACIÓN GADOR 2021', fecha_publicacion: '2021-01-01T00:00:00', archivo_pdf_url: encodeURI('/informacion-financiera/presupuesto/PROCEOS-DE-CONTRATACION-GADOR-2021 bienes y servicios.pdf') },
                ]}
                tipoLabel="Bienes y Servicios"
                icon="📦"
              />
            </div>
          ) : (
            <div className={styles.documentGrid}>
              {documentos.map((doc) => (
                <div key={doc.id} className={styles.documentCard}>
                  <div className={styles.docIconWrapper}>
                    <FileText size={32} className={styles.docIcon} />
                  </div>
                  <div className={styles.docInfo}>
                    <h3 className={styles.docTitle}>{doc.titulo}</h3>
                    {doc.descripcion && (
                      <p className={styles.docDesc}>{doc.descripcion}</p>
                    )}
                    <div className={styles.docMeta}>
                      <span className={styles.metaItem}>
                        <Calendar size={14} />
                        {new Date(doc.fecha_publicacion).toLocaleDateString('es-BO', {
                          year: 'numeric',
                          month: 'long',
                          day: 'numeric'
                        })}
                      </span>
                    </div>
                  </div>
                  <a 
                    href={doc.archivo_url} 
                    target="_blank" 
                    rel="noopener noreferrer"
                    className={styles.downloadBtn}
                    aria-label={`Descargar ${doc.titulo}`}
                  >
                    <Download size={20} />
                    <span>Descargar</span>
                  </a>
                </div>
              ))}
            </div>
          )}
        </div>
      </main>
    </>
  );
}
