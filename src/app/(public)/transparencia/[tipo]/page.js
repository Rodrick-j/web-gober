import React from 'react';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import styles from './page.module.css';

const TIPO_LABELS = {
  rendicion_cuentas: 'Rendición de Cuentas',
  actividades: 'Actividades',
  reclamos: 'Formulario de Reclamos',
  auditoria_gador: 'Auditoría G.A.D.O.R.',
  auditoria_sedcam: 'Auditoría S.E.D.C.A.M.',
  auditoria_sedeges: 'Auditoría S.E.D.E.G.E.S.',
  auditoria_sedes: 'Auditoría S.E.D.E.S.',
};

export async function generateMetadata({ params }) {
  const { tipo } = await params;
  const label = TIPO_LABELS[tipo] || 'Documentos';
  return {
    title: `${label} - Transparencia | GADOR`,
  };
}

function formatFecha(fechaStr) {
  if (!fechaStr) return '';
  const dateOnly = fechaStr.split('T')[0];
  return new Date(dateOnly + 'T00:00:00').toLocaleDateString('es-BO');
}

export default async function DocumentosPorTipoPage({ params }) {
  const { tipo } = await params;
  
  if (!TIPO_LABELS[tipo]) {
    notFound();
  }

  const supabase = await createClient();
  
  // Obtener documentos públicos de este tipo
  const { data: documentos, error } = await supabase
    .from('transparencia_documentos')
    .select('*')
    .eq('tipo', tipo)
    .eq('es_publico', true)
    .order('gestion', { ascending: false })
    .order('fecha_publicacion', { ascending: false });

  if (error) {
    console.error("Error fetching documentos:", error);
  }

  const docs = documentos || [];

  // Agrupar por gestión (año)
  const groupedByYear = docs.reduce((acc, doc) => {
    if (!acc[doc.gestion]) acc[doc.gestion] = [];
    acc[doc.gestion].push(doc);
    return acc;
  }, {});

  const years = Object.keys(groupedByYear).sort((a, b) => b - a);

  return (
    <main className={styles.main}>
      <AnimatedBackground />
      
      <div className={styles.heroBanner}>
        <Link href="/transparencia" className={styles.btnVolver}>
          ← Volver a Transparencia
        </Link>
        <h1 className={styles.heroTitle}>{TIPO_LABELS[tipo]}</h1>
      </div>

      <div className={styles.container}>
        {years.length === 0 ? (
          <div className={styles.emptyState}>
            <div className={styles.emptyStateIcon}>📄</div>
            <p className={styles.emptyStateText}>Actualmente no hay documentos públicos publicados en esta sección.</p>
          </div>
        ) : (
          years.map(year => (
            <section key={year} className={styles.yearSection}>
              <h2 className={styles.yearTitle}>Gestión {year}</h2>
              <div className={styles.docsList}>
                {groupedByYear[year].map(doc => (
                  <div key={doc.id} className={styles.docItem}>
                    <div className={styles.docInfo}>
                      <h3 className={styles.docTitle}>{doc.titulo}</h3>
                      <span className={styles.docDate}>
                        Publicado el {formatFecha(doc.fecha_publicacion)}
                      </span>
                    </div>
                    {doc.archivo_url && (
                      <a 
                        href={doc.archivo_url} 
                        target="_blank" 
                        rel="noopener noreferrer"
                        className={styles.btnDescargar}
                      >
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{width: 18, height: 18}}>
                          <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                          <polyline points="7 10 12 15 17 10"></polyline>
                          <line x1="12" y1="15" x2="12" y2="3"></line>
                        </svg>
                        Descargar PDF
                      </a>
                    )}
                  </div>
                ))}
              </div>
            </section>
          ))
        )}
      </div>
    </main>
  );
}
