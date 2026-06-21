'use client';
import Link from 'next/link';
import ScrollReveal from '@/components/ScrollReveal/ScrollReveal';
import styles from './GacetaSection.module.css';

// Helper map for document types to display text and badges
const typeMap = {
  'ley_departamental': { text: 'Ley', badge: 'badge-red' },
  'decreto_departamental': { text: 'Decreto', badge: 'badge-gold' },
  'decreto_ejecutivo': { text: 'Ejecutivo', badge: 'badge-gray' },
  'resolucion_administrativa': { text: 'Resolución', badge: 'badge-gray' },
  'resolucion_secretarial': { text: 'Resolución Sec.', badge: 'badge-gray' },
  'convenio': { text: 'Convenio', badge: 'badge-gold' },
  'contrato': { text: 'Contrato', badge: 'badge-gray' },
  'otro': { text: 'Documento', badge: 'badge-gray' },
};

export default function GacetaSection({ documentos = [] }) {
  // Use DB data if available, or fallback if none
  const displayDocuments = documentos.length > 0 ? documentos.map(doc => {
    const typeInfo = typeMap[doc.tipo] || typeMap['otro'];
    return {
      id: doc.id,
      type: typeInfo.text,
      number: doc.numero,
      title: doc.titulo,
      date: new Date(doc.fecha_publicacion).toLocaleDateString('es-ES', { day: 'numeric', month: 'short', year: 'numeric' }),
      badge: typeInfo.badge,
      url: doc.archivo_url || '#'
    };
  }) : [];
  return (
    <section className={`section ${styles.gacetaSection}`} id="gaceta">
      <div className="container">
          {/* Centered Header */}
          <ScrollReveal direction="up" className={`section-header ${styles.gacetaHeader}`}>
            <span className="section-label">Documentos Oficiales</span>
            <h2 className={`section-title ${styles.glowingTitle}`}>Gaceta Oficial</h2>
            <div className="divider" />
            <p className="section-subtitle">
              Accede a toda la normativa departamental: leyes, decretos y resoluciones
              emitidas por el Gobierno Autónomo Departamental de Oruro.
            </p>
          </ScrollReveal>

          <div className={styles.layout}>
            {/* Left Panel */}
            <ScrollReveal direction="left" className={styles.leftPanel}>

            <ScrollReveal direction="up" wrapChildren stagger={0.1} className={styles.categories}>
              {[
                { 
                  label: 'Leyes Departamentales', 
                  icon: <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" width="24" height="24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>, 
                  desc: 'Ver normativa departamental' 
                },
                { 
                  label: 'Decretos Departamentales', 
                  icon: <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" width="24" height="24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>, 
                  desc: 'Acceder a decretos oficiales' 
                },
                { 
                  label: 'Decretos Ejecutivos', 
                  icon: <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" width="24" height="24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path></svg>, 
                  desc: 'Consultar decretos del ejecutivo' 
                },
                { 
                  label: 'Resoluciones Administrativas', 
                  icon: <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" width="24" height="24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"></path></svg>, 
                  desc: 'Ver resoluciones emitidas' 
                },
              ].map((cat) => (
                <Link href="/gaceta" key={cat.label} className={styles.catCard} id={`gaceta-${cat.label.toLowerCase().replace(/\s+/g,'-')}`}>
                  <span className={styles.catIcon}>{cat.icon}</span>
                  <div className={styles.catTextContainer}>
                    <div className={styles.catLabel}>{cat.label}</div>
                    <div className={styles.catCount}>{cat.desc}</div>
                  </div>
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" style={{marginLeft:'auto'}} className={styles.catArrow}>
                    <path d="M5 12h14M12 5l7 7-7 7"/>
                  </svg>
                </Link>
              ))}
            </ScrollReveal>

            <Link href="/gaceta" className="btn btn-primary" style={{ width: 'fit-content' }} id="gaceta-all-btn">
              Ver Gaceta Completa
            </Link>
          </ScrollReveal>

          {/* Right Panel — Document List */}
          <ScrollReveal direction="right" delay={0.1} className={styles.rightPanel}>
            <div className={styles.docList}>
              <div className={styles.docListHeader}>
                <span>Últimas Publicaciones</span>
                <span className={styles.liveIndicator}>
                  <span className={styles.liveDot} />
                  Actualizado hoy
                </span>
              </div>
              <ScrollReveal direction="up" wrapChildren stagger={0.09}>
                {displayDocuments.length > 0 ? displayDocuments.map((doc, i) => (
                  <div
                    key={doc.id || i}
                    className={styles.docItem}
                    id={`doc-${doc.number}`}
                  >
                    <div className={styles.docType}>
                      <span className={`badge ${doc.badge}`}>{doc.type}</span>
                      <span className={styles.docNumber}>{doc.number}</span>
                    </div>
                    <p className={styles.docTitle}>{doc.title}</p>
                    <div className={styles.docFooter}>
                      <span className={styles.docDate}>📅 {doc.date}</span>
                      <a href={doc.url} target="_blank" rel="noopener noreferrer" className={styles.docDownload} aria-label="Descargar PDF">
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                          <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
                          <polyline points="7 10 12 15 17 10"/>
                          <line x1="12" y1="15" x2="12" y2="3"/>
                        </svg>
                        PDF
                      </a>
                    </div>
                  </div>
                )) : (
                  <div style={{ padding: '1.5rem', textAlign: 'center', color: 'var(--color-text-muted)' }}>
                    No hay documentos recientes publicados.
                  </div>
                )}
              </ScrollReveal>
            </div>
          </ScrollReveal>
        </div>
      </div>
    </section>
  );
}
