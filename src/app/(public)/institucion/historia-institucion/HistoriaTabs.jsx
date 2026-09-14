'use client';

import React, { useState } from 'react';
import HistorySection from '@/components/HistorySection/HistorySection';
import MisionVisionSection from '@/components/MisionVisionSection/MisionVisionSection';
import ContenidoBloque from '@/components/ContenidoInstitucional/ContenidoBloque';
import { motion, AnimatePresence } from 'framer-motion';
import styles from './HistoriaTabs.module.css';

// Textos por defecto (se usan si el bloque aún no fue cargado desde el panel admin)
const FALLBACK_MISION =
  'Promover, estimular y coordinar la construcción colectiva del desarrollo productivo, humano, social, económico, territorial, y la protección de los principios derechos y deberes para mejorar el bienestar y calidad de vida de la población, suministrando a los sectores, mediante la ejecución de proyectos y programas de una manera oportuna, eficiente, equitativa y con calidad según competencias que determine la ley con el uso eficiente y transparente de los recursos públicos en alianza con la iniciativa privada, facilitando nuevos procesos productivos.';
const FALLBACK_VISION =
  'Gobierno Autónomo Departamental de Oruro, una entidad pública autónoma con identidad propia, que planifica, inicia, ejecuta políticas, planes, programas y proyectos promoviendo la construcción colectiva del desarrollo productivo, económico, social, comunitario y territorial del departamento de Oruro articulando el desarrollo con alianzas estratégicas institucionales.';

const TABS = [
  { id: 'historia', icon: '📜', label: 'Historia de la Institución', mobileLabel: 'Historia' },
  { id: 'mision_vision', icon: '🎯', label: 'Misión y Visión', mobileLabel: 'Misión y Visión' },
  { id: 'valores', icon: '⚖️', label: 'Valores y Principios', mobileLabel: 'Valores' },
  { id: 'objetivos', icon: '🏹', label: 'Objetivos Institucionales', mobileLabel: 'Objetivos' },
  { id: 'memoria', icon: '📊', label: 'Memoria Institucional', mobileLabel: 'Memoria' },
];

const tieneContenido = (b) =>
  Boolean(b && ((b.cuerpo && b.cuerpo.replace(/<[^>]*>/g, '').trim().length > 30) || b.archivo_url));

const tieneResenaPersonalizada = (bloque) => {
  const texto = bloque?.cuerpo
    ?.replace(/<[^>]*>/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();

  return Boolean(
    texto &&
    texto.length > 30 &&
    !/complete desde el panel administrativo|contenido en actualizaci[oó]n/i.test(texto)
  );
};

export default function HistoriaTabs({ contenido = {} }) {
  const [activeTab, setActiveTab] = useState('historia');

  const panelWrap = { maxWidth: '1200px', margin: '0 auto', padding: '3.5rem 1.5rem' };
  const fade = {
    initial: { opacity: 0, y: 20 },
    animate: { opacity: 1, y: 0 },
    exit: { opacity: 0, y: -20 },
    transition: { duration: 0.3 },
  };

  return (
    <div style={{ paddingBottom: '4rem' }}>
      {/* Tab Buttons */}
      <div className={styles.tabsNav} role="tablist" aria-label="Contenido institucional">
        {TABS.map((t) => (
          <button
            key={t.id}
            type="button"
            role="tab"
            aria-selected={activeTab === t.id}
            aria-label={t.label}
            onClick={() => setActiveTab(t.id)}
            className={`${styles.tabButton} ${activeTab === t.id ? styles.tabButtonActive : ''}`}
          >
            <span aria-hidden="true" className={styles.tabIcon}>{t.icon}</span>
            <span className={styles.tabLabel}>{t.label}</span>
            <span className={styles.tabLabelMobile}>{t.mobileLabel}</span>
          </button>
        ))}
      </div>

      {/* Tab Content */}
      <div style={{ minHeight: '60vh' }}>
        <AnimatePresence mode="wait">
          {activeTab === 'historia' && (
            <motion.div key="historia" {...fade}>
              {tieneResenaPersonalizada(contenido.resena_historica) ? (
                <div style={panelWrap}>
                  <ContenidoBloque
                    titulo={contenido.resena_historica.titulo || 'Reseña Histórica'}
                    cuerpo={contenido.resena_historica.cuerpo}
                    archivoUrl={contenido.resena_historica.archivo_url}
                  />
                </div>
              ) : (
                <HistorySection />
              )}
            </motion.div>
          )}

          {activeTab === 'mision_vision' && (
            <motion.div key="mision_vision" {...fade}>
              <div style={panelWrap}>
                <h2 style={{ textAlign: 'center', fontSize: '2.3rem', fontWeight: 800, color: '#1a1a1a', marginBottom: '2.5rem' }}>
                  Nuestra Misión y Visión
                </h2>
                {tieneContenido(contenido.mision) || tieneContenido(contenido.vision) ? (
                  <div style={{ display: 'grid', gap: '1.5rem' }}>
                    <ContenidoBloque
                      titulo={contenido.mision?.titulo || 'Misión'}
                      cuerpo={contenido.mision?.cuerpo || `<p>${FALLBACK_MISION}</p>`}
                    />
                    <ContenidoBloque
                      titulo={contenido.vision?.titulo || 'Visión'}
                      cuerpo={contenido.vision?.cuerpo || `<p>${FALLBACK_VISION}</p>`}
                    />
                  </div>
                ) : (
                  <MisionVisionSection mision={FALLBACK_MISION} vision={FALLBACK_VISION} />
                )}
              </div>
            </motion.div>
          )}

          {activeTab === 'valores' && (
            <motion.div key="valores" {...fade}>
              <div style={panelWrap}>
                <ContenidoBloque
                  titulo={contenido.valores_principios?.titulo || 'Valores y Principios'}
                  cuerpo={contenido.valores_principios?.cuerpo}
                />
              </div>
            </motion.div>
          )}

          {activeTab === 'objetivos' && (
            <motion.div key="objetivos" {...fade}>
              <div style={panelWrap}>
                <ContenidoBloque
                  titulo={contenido.objetivos_institucionales?.titulo || 'Objetivos Institucionales'}
                  cuerpo={contenido.objetivos_institucionales?.cuerpo}
                />
              </div>
            </motion.div>
          )}

          {activeTab === 'memoria' && (
            <motion.div key="memoria" {...fade}>
              <div style={panelWrap}>
                <ContenidoBloque
                  titulo={contenido.memoria_institucional?.titulo || 'Memoria Institucional / Informe de Gestión'}
                  cuerpo={contenido.memoria_institucional?.cuerpo}
                  archivoUrl={contenido.memoria_institucional?.archivo_url}
                  archivoLabel="Descargar Memoria / Informe de Gestión"
                />
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </div>
  );
}
