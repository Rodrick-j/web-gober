'use client';

import React, { useState } from 'react';
import { getDocumentosRecursosHumanos, RECURSOS_HUMANOS_SECCIONES } from '@/data/recursosHumanos';
import GacetaClient from '@/app/(public)/gaceta/[tipo]/GacetaClient';
import styles from '@/components/SecretariatTabs/SecretariatTabs.module.css';

export default function RecursosHumanosHub() {
  const secciones = Object.keys(RECURSOS_HUMANOS_SECCIONES);
  const [activeTab, setActiveTab] = useState(secciones[0]);

  const seccionData = getDocumentosRecursosHumanos(activeTab);

  return (
    <section aria-labelledby="secciones-recursos-humanos" style={{ padding: '2rem 0' }}>
      <div style={{ textAlign: 'center', marginBottom: '2rem' }}>
        <span style={{ color: '#8b0000', fontWeight: 'bold', textTransform: 'uppercase', fontSize: '0.85rem', letterSpacing: '1px' }}>Gestión de personas</span>
        <h2 id="secciones-recursos-humanos" style={{ fontSize: '2.5rem', color: '#1a1a1a', marginTop: '0.5rem', marginBottom: '0.5rem' }}>Información de Recursos Humanos</h2>
        <p style={{ color: '#666', fontSize: '1.1rem' }}>Consulte las nóminas institucionales y los perfiles de cargos vigentes.</p>
      </div>

      <div className={styles.tabsContainer}>
        <div className={styles.tabButtons}>
          {secciones.map((slug) => (
            <button
              key={slug}
              className={`${styles.tabBtn} ${activeTab === slug ? styles.active : ''}`}
              onClick={() => setActiveTab(slug)}
              style={{ '--color-primary': '#8b0000' }}
            >
              {RECURSOS_HUMANOS_SECCIONES[slug].icono} {RECURSOS_HUMANOS_SECCIONES[slug].titulo}
            </button>
          ))}
        </div>

        <div className={styles.tabContent}>
          {seccionData && (
            <div className={styles.contentBlockFull} style={{ padding: '0', background: 'transparent', boxShadow: 'none' }}>
              <GacetaClient
                documentos={seccionData.documentos}
                tipoLabel={seccionData.titulo}
                icon={seccionData.icono}
              />
            </div>
          )}
        </div>
      </div>
    </section>
  );
}
