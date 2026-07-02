'use client';
import { useState, useMemo } from 'react';
import styles from './gaceta.module.css';

export default function GacetaClient({ documentos, tipoLabel, icon }) {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedYear, setSelectedYear] = useState('Todos');
  const [previewUrl, setPreviewUrl] = useState(null);
  const [previewTitle, setPreviewTitle] = useState('');

  // Extraer años únicos para los filtros
  const years = useMemo(() => {
    const y = documentos.map(doc => doc.anio);
    const unique = [...new Set(y)].sort((a, b) => b - a);
    return ['Todos', ...unique];
  }, [documentos]);

  // Filtrar documentos
  const filteredDocs = useMemo(() => {
    return documentos.filter(doc => {
      const matchYear = selectedYear === 'Todos' || doc.anio === parseInt(selectedYear);
      const matchSearch = doc.numero_documento?.toLowerCase().includes(searchTerm.toLowerCase()) || 
                          doc.titulo?.toLowerCase().includes(searchTerm.toLowerCase());
      return matchYear && matchSearch;
    });
  }, [documentos, selectedYear, searchTerm]);

  const openPreview = (url, title) => {
    setPreviewUrl(url);
    setPreviewTitle(title);
  };

  const closePreview = () => {
    setPreviewUrl(null);
    setPreviewTitle('');
  };

  return (
    <>
      {/* ── MODAL DE PREVISUALIZACIÓN ── */}
      {previewUrl && (
        <div className={styles.previewOverlay} onClick={closePreview}>
          <div className={styles.previewModal} onClick={e => e.stopPropagation()}>
            <div className={styles.previewHeader}>
              <div className={styles.previewTitleText}>
                <span>📄</span>
                <span>{previewTitle}</span>
              </div>
              <div className={styles.previewActions}>
                <a
                  href={previewUrl}
                  download
                  className={styles.previewDownloadBtn}
                  onClick={e => e.stopPropagation()}
                >
                  📥 Descargar PDF
                </a>
                <button className={styles.previewCloseBtn} onClick={closePreview} aria-label="Cerrar">
                  ✕
                </button>
              </div>
            </div>
            <iframe
              src={`${previewUrl}#toolbar=1&navpanes=0`}
              className={styles.previewFrame}
              title={previewTitle}
            />
          </div>
        </div>
      )}

      <div className={styles.clientLayout}>
        
        {/* Sidebar con Filtros (Chips) */}
        <aside className={styles.filtersSidebar}>
          <h3 className={styles.filterTitle}>Filtrar por Gestión</h3>
          <div className={styles.chipsContainer}>
            {years.map(year => (
              <button 
                key={year}
                className={`${styles.chip} ${selectedYear === year.toString() ? styles.chipActive : ''}`}
                onClick={() => setSelectedYear(year.toString())}
              >
                <span>{year}</span>
                {year !== 'Todos' && <span style={{ opacity: 0.6, fontSize: '0.8em' }}>
                  {documentos.filter(d => d.anio === year).length} docs
                </span>}
              </button>
            ))}
          </div>
        </aside>

        {/* Contenido Principal */}
        <div className={styles.mainContent}>
          
          {/* Buscador Súper Rápido */}
          <div className={styles.searchContainer}>
            <span className={styles.searchIcon}>🔍</span>
            <input 
              type="text" 
              placeholder={`Buscar en ${tipoLabel} (ej. Ley 045)...`}
              className={styles.searchInput}
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>

          {/* Grilla de Documentos (Tarjetas) */}
          <div className={styles.documentGrid}>
            {filteredDocs.length === 0 ? (
              <div className={styles.emptyState}>
                <div style={{ fontSize: '3rem' }}>📭</div>
                <h3>No se encontraron resultados</h3>
                <p>Intenta cambiar el año o el término de búsqueda.</p>
              </div>
            ) : (
              filteredDocs.map(doc => (
                <div key={doc.id} className={styles.docCard}>
                  
                  <div className={styles.docInfo}>
                    <div className={styles.docIconWrapper}>
                      {icon}
                    </div>
                    
                    <div className={styles.docDetails}>
                      <span className={styles.docBadge}>{doc.numero_documento}</span>
                      <h4 className={styles.docTitle}>{doc.titulo}</h4>
                      {doc.descripcion && <p className={styles.docDesc}>{doc.descripcion}</p>}
                      <span className={styles.docDate}>
                        Publicado el {new Date(doc.fecha_publicacion + 'T00:00:00').toLocaleDateString('es-ES', { day: 'numeric', month: 'long', year: 'numeric' })}
                      </span>
                    </div>
                  </div>

                  {/* Botones de acción */}
                  <div className={styles.docActions}>
                    <button
                      className={styles.previewBtn}
                      onClick={() => openPreview(doc.archivo_pdf_url, doc.titulo)}
                      disabled={!doc.archivo_pdf_url || doc.archivo_pdf_url === '#'}
                    >
                      <span>👁️</span> Ver PDF
                    </button>
                    <a 
                      href={doc.archivo_pdf_url || '#'} 
                      download
                      target="_blank"
                      rel="noreferrer"
                      className={styles.downloadBtn}
                    >
                      <span>📥</span> Descargar
                    </a>
                  </div>
                  
                </div>
              ))
            )}
          </div>
        </div>
        
      </div>
    </>
  );
}
