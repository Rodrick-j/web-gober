'use client';

import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import styles from './MemoriaInstitucionalSection.module.css';

const memorias = [
  {
    year: '2021',
    title: 'Memoria Institucional 2021',
    description: 'Resultados, ejecución presupuestaria y logros estratégicos de la gestión 2021.',
    fileUrl: '/pdfs/Memoria-institucional-2021.pdf',
    dataUrl: '/pdfs/Memoria-institucional-2021.data',
    coverImage: '/logo-gador.png'
  },
  {
    year: '2022',
    title: 'Memoria Institucional 2022',
    description: 'Documento en preparación o pendiente de publicación oficial.',
    fileUrl: null,
  },
  {
    year: '2023',
    title: 'Memoria Institucional 2023',
    description: 'Documento en preparación o pendiente de publicación oficial.',
    fileUrl: null,
  }
];

export default function MemoriaInstitucionalSection() {
  const [activeYear, setActiveYear] = useState('2021');
  const [isFullscreen, setIsFullscreen] = useState(false);
  const [isPdfLoaded, setIsPdfLoaded] = useState(false);
  const [pdfBlobUrl, setPdfBlobUrl] = useState(null);

  const activeMemoria = memorias.find(m => m.year === activeYear);

  useEffect(() => {
    if (isPdfLoaded && activeMemoria?.dataUrl) {
      // Fetch as raw data to bypass IDM
      fetch(activeMemoria.dataUrl)
        .then(res => res.blob())
        .then(blob => {
          // Recreate as PDF blob
          const pdfBlob = new Blob([blob], { type: 'application/pdf' });
          const url = URL.createObjectURL(pdfBlob);
          setPdfBlobUrl(`${url}#toolbar=0&navpanes=0&scrollbar=0&view=FitH`);
        })
        .catch(err => console.error("Error loading PDF", err));
    }
  }, [isPdfLoaded, activeMemoria]);

  // Reset loaded state when changing years
  const handleYearChange = (year) => {
    setActiveYear(year);
    setIsPdfLoaded(false);
  };

  const toggleFullscreen = () => {
    setIsFullscreen(!isFullscreen);
  };

  return (
    <section className={styles.section}>
      <div className={`${styles.container} ${isFullscreen ? styles.fullscreenMode : ''}`}>
        
        {/* Header */}
        {!isFullscreen && (
          <motion.div 
            className={styles.header}
            initial={{ opacity: 0, y: -20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
          >
            <h2 className={styles.title}>Memorias Institucionales</h2>
            <p className={styles.subtitle}>
              Conozca los informes de gestión, ejecución presupuestaria y los logros estratégicos 
              del Gobierno Autónomo Departamental de Oruro clasificados por año.
            </p>
          </motion.div>
        )}



        {/* PDF Viewer Area */}
        <AnimatePresence mode="wait">
          <motion.div
            key={activeYear}
            initial={{ opacity: 0, scale: 0.98 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0, scale: 0.98 }}
            transition={{ duration: 0.4 }}
            className={`${styles.viewerWrapper} ${isFullscreen ? styles.viewerFullscreen : ''}`}
          >
            {/* Viewer Toolbar */}
            <div className={styles.viewerToolbar}>
              <div className={styles.toolbarLeft}>
                <div className={styles.toolbarInfo}>
                  <span className={styles.toolbarIcon}>📄</span>
                  <div>
                    <h3 className={styles.toolbarTitle}>{activeMemoria.title}</h3>
                    <p className={styles.toolbarDesc}>{activeMemoria.description}</p>
                  </div>
                </div>
                <div className={styles.yearSelectorMini}>
                  {memorias.map((mem) => (
                    <button
                      key={mem.year}
                      onClick={() => handleYearChange(mem.year)}
                      className={`${styles.yearBtnMini} ${activeYear === mem.year ? styles.yearBtnMiniActive : ''}`}
                    >
                      {mem.year}
                    </button>
                  ))}
                </div>
              </div>
              
              {activeMemoria.fileUrl && (
                <div className={styles.toolbarActions}>
                  <button 
                    onClick={() => window.open(activeMemoria.fileUrl, '_blank')}
                    className={styles.actionBtn}
                    title="Abrir en nueva pestaña"
                  >
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path><polyline points="15 3 21 3 21 9"></polyline><line x1="10" y1="14" x2="21" y2="3"></line></svg>
                    <span>Abrir</span>
                  </button>
                  <button onClick={toggleFullscreen} className={styles.actionBtnSecondary}>
                    {isFullscreen ? (
                      <><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M8 3v3a2 2 0 0 1-2 2H3m18 0h-3a2 2 0 0 1-2-2V3m0 18v-3a2 2 0 0 1 2-2h3M3 16h3a2 2 0 0 1 2 2v3"></path></svg> <span>Salir</span></>
                    ) : (
                      <><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M8 3H5a2 2 0 0 0-2 2v3m18 0V5a2 2 0 0 0-2-2h-3m0 18h3a2 2 0 0 0 2-2v-3M3 16v3a2 2 0 0 0 2 2h3"></path></svg> <span>Pantalla Completa</span></>
                    )}
                  </button>
                </div>
              )}
            </div>

            {/* Embed PDF */}
            <div className={styles.pdfContainer}>
              {activeMemoria.fileUrl ? (
                isPdfLoaded ? (
                  pdfBlobUrl ? (
                    <iframe 
                      src={pdfBlobUrl}
                      className={styles.pdfIframe}
                      title={activeMemoria.title}
                    />
                  ) : (
                    <div className={styles.noDataState}>
                      <div className={styles.noDataIcon}>⏳</div>
                      <h3>Cargando documento seguro...</h3>
                      <p>Bypasseando el gestor de descargas local. Por favor espera (16MB).</p>
                    </div>
                  )
                ) : (
                  <div className={styles.pdfCover}>
                    <div className={styles.pdfCoverIcon}>📄</div>
                    <h3>{activeMemoria.title}</h3>
                    <p>Haz clic abajo para iniciar el visor del documento (16MB)</p>
                    <button 
                      onClick={() => setIsPdfLoaded(true)}
                      className={styles.loadPdfBtn}
                    >
                      Cargar Visor PDF
                    </button>
                    <p style={{marginTop: '1rem', fontSize: '0.8rem', color: '#666', fontStyle: 'italic'}}>
                      (Si usas un gestor de descargas como IDM, podría pedirte descargar el archivo).
                    </p>
                  </div>
                )
              ) : (
                <div className={styles.noDataState}>
                  <div className={styles.noDataIcon}>🚧</div>
                  <h3>Documento no disponible</h3>
                  <p>La memoria institucional para la gestión {activeYear} se encuentra en etapa de elaboración o pendiente de publicación oficial.</p>
                </div>
              )}
            </div>
          </motion.div>
        </AnimatePresence>

      </div>
    </section>
  );
}
