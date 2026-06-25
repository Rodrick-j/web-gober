'use client';

import React, { useState, useMemo } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { categoriasTramites, catalogoTramites, estadisticasTramites } from './tramitesData';
import styles from './tramites.module.css';

export default function TramitesClient() {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('todas');
  const [activeModalTramite, setActiveModalTramite] = useState(null);
  const [trackerCode, setTrackerCode] = useState('');
  const [trackerResult, setTrackerResult] = useState(null);
  const [toastMessage, setToastMessage] = useState('');

  // Filtrado reactivo en tiempo real
  const filteredTramites = useMemo(() => {
    return catalogoTramites.filter((tramite) => {
      const matchCat = selectedCategory === 'todas' || tramite.categoria === selectedCategory;
      const term = searchTerm.toLowerCase().trim();
      const matchSearch =
        term === '' ||
        tramite.titulo.toLowerCase().includes(term) ||
        tramite.codigo.toLowerCase().includes(term) ||
        tramite.secretaria.toLowerCase().includes(term) ||
        tramite.resumen.toLowerCase().includes(term);

      return matchCat && matchSearch;
    });
  }, [searchTerm, selectedCategory]);

  const showToast = (msg) => {
    setToastMessage(msg);
    setTimeout(() => setToastMessage(''), 3500);
  };

  const handleTrackerSubmit = (e) => {
    e.preventDefault();
    if (!trackerCode.trim()) return;
    
    // Búsqueda en catálogo o simulador
    const found = catalogoTramites.find(t => t.codigo.toLowerCase() === trackerCode.toLowerCase().trim());
    if (found) {
      setTrackerResult({
        codigo: found.codigo,
        titulo: found.titulo,
        estado: 'EN REVISIÓN TÉCNICA (Ventanilla Única)',
        avance: '75%',
        fechaActualizacion: 'Hoy, 09:45 AM'
      });
    } else {
      setTrackerResult({
        codigo: trackerCode.toUpperCase(),
        titulo: 'Trámite Departamental en Proceso',
        estado: 'EN DESPACHO DE SECRETARÍA GENERAL',
        avance: '40%',
        fechaActualizacion: 'Ayer, 16:20 PM'
      });
    }
  };

  return (
    <>
      {/* Toast Flotante */}
      <AnimatePresence>
        {toastMessage && (
          <motion.div
            initial={{ opacity: 0, y: 50, scale: 0.9 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 20, scale: 0.9 }}
            style={{
              position: 'fixed',
              bottom: '2rem',
              right: '2rem',
              background: '#0f172a',
              color: '#fff',
              padding: '1rem 1.5rem',
              borderRadius: '12px',
              borderLeft: '4px solid #10b981',
              boxShadow: '0 20px 40px rgba(0,0,0,0.3)',
              zIndex: 99999,
              fontWeight: 600,
              display: 'flex',
              alignItems: 'center',
              gap: '0.5rem'
            }}
          >
            <span>📄</span> {toastMessage}
          </motion.div>
        )}
      </AnimatePresence>

      {/* Hero Buscador */}
      <section className={styles.heroTramites}>
        <div className={styles.heroBackground} />
        <div className="container">
          <div className={styles.heroInner}>
            <span className={styles.heroBadge}>⚡ Servicios Ciudadanos en Línea</span>
            <h1 className={styles.heroTitle}>Guía de Trámites Departamentales</h1>
            <p className={styles.heroSubtitle}>
              Consulta requisitos actualizados, costos oficiales, descarga formularios y haz el seguimiento de tus trámites ante el Gobierno Autónomo Departamental de Oruro.
            </p>

            {/* Barra de Búsqueda */}
            <div className={styles.searchContainer}>
              <span className={styles.searchIcon}>🔍</span>
              <input
                type="text"
                className={styles.searchInput}
                placeholder="Ej. Regalía minera, personería jurídica, licencia ambiental..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
              />
              {searchTerm && (
                <button className={styles.clearSearchBtn} onClick={() => setSearchTerm('')} title="Limpiar búsqueda">
                  ✕
                </button>
              )}
            </div>

            {/* Estadísticas */}
            <div className={styles.statsGrid}>
              {estadisticasTramites.map((stat, i) => (
                <div key={i} className={styles.statCard}>
                  <div className={styles.statValue}>{stat.valor}</div>
                  <div className={styles.statLabel}>{stat.etiqueta}</div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Sección Principal y Catálogo */}
      <section className={styles.mainSection}>
        <div className="container">
          {/* Tabs de Categorías */}
          <div className={styles.categoriesWrap}>
            {categoriasTramites.map((cat) => (
              <button
                key={cat.id}
                className={`${styles.categoryBtn} ${selectedCategory === cat.id ? styles.active : ''}`}
                onClick={() => setSelectedCategory(cat.id)}
              >
                <span>{cat.icono}</span>
                <span>{cat.label}</span>
              </button>
            ))}
          </div>

          {/* Contador de Resultados */}
          <div style={{ marginBottom: '1.5rem', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <h2 style={{ fontSize: '1.25rem', fontWeight: 800, color: '#334155' }}>
              {selectedCategory === 'todas' ? 'Trámites Destacados' : categoriasTramites.find(c => c.id === selectedCategory)?.label}
            </h2>
            <span style={{ fontSize: '0.85rem', color: '#64748b', fontWeight: 600 }}>
              Mostrando {filteredTramites.length} de {catalogoTramites.length} trámites
            </span>
          </div>

          {/* Grilla de Resultados */}
          {filteredTramites.length === 0 ? (
            <div style={{ textAlign: 'center', padding: '4rem 2rem', background: '#fff', borderRadius: '20px', border: '1px dashed #cbd5e1' }}>
              <span style={{ fontSize: '3rem', display: 'block', marginBottom: '1rem' }}>📭</span>
              <h3 style={{ fontSize: '1.3rem', fontWeight: 800, color: '#1e293b', marginBottom: '0.5rem' }}>
                No encontramos trámites que coincidan con &quot;{searchTerm}&quot;
              </h3>
              <p style={{ color: '#64748b', marginBottom: '1.5rem' }}>
                Intenta buscar con otras palabras o selecciona &quot;Todas las Categorías&quot;.
              </p>
              <button
                onClick={() => { setSearchTerm(''); setSelectedCategory('todas'); }}
                style={{ padding: '0.6rem 1.5rem', background: '#9c0720', color: '#fff', borderRadius: '999px', fontWeight: 700 }}
              >
                Restablecer búsqueda
              </button>
            </div>
          ) : (
            <motion.div layout className={styles.gridTramites}>
              <AnimatePresence>
                {filteredTramites.map((tramite) => (
                  <motion.div
                    layout
                    key={tramite.id}
                    initial={{ opacity: 0, scale: 0.95 }}
                    animate={{ opacity: 1, scale: 1 }}
                    exit={{ opacity: 0, scale: 0.95 }}
                    transition={{ duration: 0.2 }}
                    className={styles.cardTramite}
                  >
                    <div>
                      <div className={styles.cardHeader}>
                        <span className={styles.cardCode}>{tramite.codigo}</span>
                        <span className={styles.cardTime}>⏱️ {tramite.tiempoEstimado}</span>
                      </div>
                      <h3 className={styles.cardTitle}>{tramite.titulo}</h3>
                      <div className={styles.cardSec}>{tramite.secretaria}</div>
                      <p className={styles.cardSummary}>{tramite.resumen}</p>
                    </div>

                    <div className={styles.cardFooter}>
                      <div className={styles.cardCostWrap}>
                        <span className={styles.cardCostLabel}>Costo Oficial</span>
                        <span className={styles.cardCostValue}>{tramite.costo}</span>
                      </div>
                      <button className={styles.btnVerDetalle} onClick={() => setActiveModalTramite(tramite)}>
                        <span>Ver requisitos</span>
                        <span>→</span>
                      </button>
                    </div>
                  </motion.div>
                ))}
              </AnimatePresence>
            </motion.div>
          )}

          {/* Mini Simulador Rastreo en Línea */}
          <div className={styles.trackerBox}>
            <span style={{ fontSize: '2.5rem', marginBottom: '0.5rem' }}>🛰️</span>
            <h3 className={styles.trackerTitle}>¿Iniciaste un trámite? Consulta su avance</h3>
            <p className={styles.trackerSub}>
              Ingresa el código correlativo de tu boleta o formulario (ej. OR-MIN-001, OR-PER-201) para revisar el estado en tiempo real.
            </p>
            
            <form className={styles.trackerForm} onSubmit={handleTrackerSubmit}>
              <input
                type="text"
                className={styles.trackerInput}
                placeholder="CÓDIGO DE TRÁMITE O HOJA DE RUTA"
                value={trackerCode}
                onChange={(e) => setTrackerCode(e.target.value)}
              />
              <button type="submit" className={styles.btnTracker}>
                Rastrear ahora
              </button>
            </form>

            {/* Resultado Simulador */}
            <AnimatePresence>
              {trackerResult && (
                <motion.div
                  initial={{ opacity: 0, y: 15 }}
                  animate={{ opacity: 1, y: 0 }}
                  style={{
                    marginTop: '2rem',
                    padding: '1.5rem 2rem',
                    background: '#0f172a',
                    borderRadius: '16px',
                    border: '1px solid #ffb843',
                    width: '100%',
                    maxWidth: '580px',
                    textAlign: 'left'
                  }}
                >
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.75rem' }}>
                    <span style={{ color: '#ffb843', fontWeight: 800, fontSize: '0.85rem' }}>CÓDIGO: {trackerResult.codigo}</span>
                    <span style={{ background: '#10b98120', color: '#10b981', padding: '0.2rem 0.6rem', borderRadius: '999px', fontSize: '0.75rem', fontWeight: 800 }}>
                      Avance: {trackerResult.avance}
                    </span>
                  </div>
                  <h4 style={{ fontSize: '1.1rem', fontWeight: 800, color: '#fff', marginBottom: '0.5rem' }}>{trackerResult.titulo}</h4>
                  <p style={{ color: '#94a3b8', fontSize: '0.85rem', marginBottom: '0.5rem' }}>
                    <strong>Ubicación actual:</strong> {trackerResult.estado}
                  </p>
                  <div style={{ fontSize: '0.75rem', color: '#64748b' }}>Última actualización: {trackerResult.fechaActualizacion}</div>
                </motion.div>
              )}
            </AnimatePresence>
          </div>
        </div>
      </section>

      {/* Modal Requisitos Paso a Paso */}
      <AnimatePresence>
        {activeModalTramite && (
          <div className={styles.modalBackdrop} onClick={() => setActiveModalTramite(null)}>
            <motion.div
              initial={{ opacity: 0, y: 50, scale: 0.95 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              exit={{ opacity: 0, y: 50, scale: 0.95 }}
              transition={{ type: 'spring', damping: 25, stiffness: 300 }}
              className={styles.modalBox}
              onClick={(e) => e.stopPropagation()}
            >
              <div className={styles.modalHeader}>
                <button className={styles.modalCloseBtn} onClick={() => setActiveModalTramite(null)} title="Cerrar ventana">
                  ✕
                </button>
                <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'center', marginBottom: '0.5rem' }}>
                  <span style={{ background: '#9c072015', color: '#9c0720', fontWeight: 800, fontSize: '0.75rem', padding: '0.2rem 0.6rem', borderRadius: '6px' }}>
                    {activeModalTramite.codigo}
                  </span>
                  <span style={{ fontSize: '0.8rem', color: '#64748b', fontWeight: 600 }}>🏛️ {activeModalTramite.secretaria}</span>
                </div>
                <h3 style={{ fontSize: '1.5rem', fontWeight: 900, color: '#0f172a', lineHeight: 1.2 }}>
                  {activeModalTramite.titulo}
                </h3>
              </div>

              <div className={styles.modalContent}>
                {/* Info rápida */}
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '1rem', padding: '1rem', background: '#f8fafc', borderRadius: '16px', border: '1px solid #e2e8f0' }}>
                  <div>
                    <div style={{ fontSize: '0.7rem', color: '#94a3b8', textTransform: 'uppercase' }}>Costo</div>
                    <div style={{ fontSize: '0.95rem', fontWeight: 800, color: '#1e293b' }}>{activeModalTramite.costo}</div>
                  </div>
                  <div>
                    <div style={{ fontSize: '0.7rem', color: '#94a3b8', textTransform: 'uppercase' }}>Tiempo estimado</div>
                    <div style={{ fontSize: '0.95rem', fontWeight: 800, color: '#1e293b' }}>{activeModalTramite.tiempoEstimado}</div>
                  </div>
                  <div>
                    <div style={{ fontSize: '0.7rem', color: '#94a3b8', textTransform: 'uppercase' }}>Modalidad</div>
                    <div style={{ fontSize: '0.95rem', fontWeight: 800, color: '#1e293b' }}>{activeModalTramite.modalidad}</div>
                  </div>
                </div>

                {/* Ubicación y horario */}
                <div style={{ fontSize: '0.9rem', color: '#475569', background: '#fffbeb', padding: '1rem', borderRadius: '12px', borderLeft: '4px solid #f59e0b' }}>
                  📍 <strong>Lugar de presentación:</strong> {activeModalTramite.ubicación} <br />
                  🕒 <strong>Horario de atención:</strong> {activeModalTramite.horario}
                </div>

                {/* Requisitos */}
                <div>
                  <h4 className={styles.modalSectionTitle}>
                    <span>📋</span> Requisitos obligatorios para iniciar el trámite
                  </h4>
                  <div className={styles.requisitosList}>
                    {activeModalTramite.requisitos.map((req, i) => (
                      <div key={i} className={styles.requisitoItem}>
                        <span className={styles.requisitoCheck}>✓</span>
                        <span>{req}</span>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Pasos */}
                {activeModalTramite.pasos && (
                  <div>
                    <h4 className={styles.modalSectionTitle}>
                      <span>🔄</span> Procedimiento interno paso a paso
                    </h4>
                    <div className={styles.pasosWrap}>
                      {activeModalTramite.pasos.map((paso, i) => (
                        <div key={i} className={styles.pasoCard}>
                          <div className={styles.pasoNum}>{i + 1}</div>
                          <div className={styles.pasoText}>{paso}</div>
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </div>

              <div className={styles.modalActions}>
                <button
                  onClick={() => setActiveModalTramite(null)}
                  style={{ padding: '0.85rem 1.5rem', fontWeight: 700, color: '#64748b' }}
                >
                  Cerrar ventana
                </button>
                <button
                  className={styles.btnDownload}
                  onClick={() => showToast(`Descargando formulario oficial para: ${activeModalTramite.codigo}`)}
                >
                  <span>📥</span> Descargar Formulario PDF
                </button>
              </div>
            </motion.div>
          </div>
        )}
      </AnimatePresence>
    </>
  );
}
