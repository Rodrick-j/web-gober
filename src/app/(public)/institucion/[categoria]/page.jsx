import { createClient } from '@/lib/supabase/public';
import { notFound } from 'next/navigation';
import { FileText, Download, Calendar } from 'lucide-react';
import CategoriaHeader from './CategoriaHeader';
import styles from './CategoriaInstitucion.module.css';

export const revalidate = 60;

const CATEGORIAS_VALIDAS = {
  'informacion-financiera': 'Información Financiera',
  'recursos-humanos': 'Recursos Humanos',
  'desarrollo-organizacional': 'Desarrollo Organizacional',
  'contrataciones': 'Contrataciones',
  'licitacion-publica': 'Licitación Pública',
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

        <div className={styles.contentWrapper}>
          {error ? (
            <div className={styles.errorState}>
              <p>Ocurrió un error al cargar los documentos.</p>
            </div>
          ) : !documentos || documentos.length === 0 ? (
            <div className={styles.emptyState}>
              <FileText size={48} className={styles.emptyIcon} />
              <h2>No hay documentos disponibles</h2>
              <p>Actualmente no hay archivos publicados en la categoría de {titulo}.</p>
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
