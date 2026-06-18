'use client';

import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import styles from './InteractiveMap.module.css';
import { oruroData } from '@/lib/oruroData';

// Mapa estilizado interactivo con aproximación de las 16 provincias
const MapRegions = [
  { id: 'sajama', d: 'M10,120 L130,80 L150,220 L70,250 L0,180 Z', defaultColor: '#b2ebf2' },
  { id: 'san_pedro_de_totora', d: 'M130,80 L200,60 L210,150 L140,160 Z', defaultColor: '#fff9c4' },
  { id: 'nor_carangas', d: 'M200,60 L260,70 L260,140 L210,150 Z', defaultColor: '#ffccbc' },
  { id: 'cercado', d: 'M260,70 L340,30 L400,90 L390,160 L280,180 L260,140 Z', defaultColor: '#ffe0b2' },
  { id: 'tomas_barron', d: 'M270,80 L300,60 L310,90 L280,100 Z', defaultColor: '#c5e1a5' },
  { id: 'saucari', d: 'M260,140 L280,180 L290,270 L230,270 L210,150 Z', defaultColor: '#c5cae9' },
  { id: 'dalence', d: 'M390,160 L450,140 L470,190 L380,210 Z', defaultColor: '#80cbc4' },
  { id: 'carangas', d: 'M140,160 L210,150 L230,270 L130,260 Z', defaultColor: '#e1bee7' },
  { id: 'poopo', d: 'M280,180 L380,210 L370,290 L290,270 Z', defaultColor: '#ffccbc' },
  { id: 'litoral', d: 'M70,250 L130,260 L140,340 L50,330 Z', defaultColor: '#eeeeee' },
  { id: 'sur_carangas', d: 'M130,260 L230,270 L290,270 L300,350 L140,340 Z', defaultColor: '#a5d6a7' },
  { id: 'atahuallpa', d: 'M0,280 L50,330 L140,340 L160,430 L30,450 Z', defaultColor: '#ffccbc' },
  { id: 'mejillones', d: 'M20,330 L60,350 L50,390 L10,380 Z', defaultColor: '#80cbc4' },
  { id: 'ladislao_cabrera', d: 'M140,340 L300,350 L340,430 L280,490 L160,430 Z', defaultColor: '#c5cae9' },
  { id: 'avaroa', d: 'M290,270 L370,290 L420,270 L460,340 L390,370 L360,320 L300,350 Z', defaultColor: '#e1bee7' },
  { id: 'sebastian_pagador', d: 'M360,320 L390,370 L460,400 L410,430 L340,430 L300,350 Z', defaultColor: '#fff9c4' }
];

import OruroSvgMap from './OruroSvgMap';

export default function InteractiveMap() {
  const [selectedRegion, setSelectedRegion] = useState(null);

  // Ya no usamos el MapRegions de bloques abstractos.
  // Ahora usamos el OruroSvgMap real extraído de la imagen.

  return (
    <div className={styles.container}>
      {/* Lado Izquierdo: El Mapa */}
      <motion.div 
        className={styles.mapWrapper}
        initial={{ opacity: 0, x: -50 }}
        animate={{ opacity: 1, x: 0 }}
        transition={{ duration: 0.5 }}
      >
        {/* Renderiza el SVG real convertido */}
        <OruroSvgMap className={styles.svgMap} />
      </motion.div>

      {/* Lado Derecho: El Panel de Información */}
      <motion.div 
        className={styles.infoPanel}
        initial={{ opacity: 0, x: 50 }}
        animate={{ opacity: 1, x: 0 }}
        transition={{ duration: 0.5, delay: 0.2 }}
      >
        <AnimatePresence mode="wait">
          {selectedRegion ? (
            <motion.div
              key={selectedRegion.id}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              transition={{ duration: 0.3 }}
            >
              <h2 className={styles.title}>{selectedRegion.name}</h2>
              <div className={styles.subtitle}>Departamento de Oruro</div>
              
              <div className={styles.statsGrid}>
                <div className={styles.statCard}>
                  <div className={styles.statLabel}>Fundación</div>
                  <div className={styles.statValue}>{selectedRegion.foundation}</div>
                </div>
                <div className={styles.statCard}>
                  <div className={styles.statLabel}>Población Aprox.</div>
                  <div className={styles.statValue}>{selectedRegion.population}</div>
                </div>
              </div>

              <div className={styles.history}>
                <strong>Reseña Histórica:</strong> <br/>
                {selectedRegion.history}
              </div>
            </motion.div>
          ) : (
            <motion.div 
              className={styles.emptyState}
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
            >
              <div style={{ fontSize: '4rem', marginBottom: '1rem' }}>🗺️</div>
              <h3>Explora Oruro</h3>
              <p>Haz clic en una pieza del rompecabezas en el mapa para descubrir la historia de ese municipio.</p>
            </motion.div>
          )}
        </AnimatePresence>
      </motion.div>
    </div>
  );
}
