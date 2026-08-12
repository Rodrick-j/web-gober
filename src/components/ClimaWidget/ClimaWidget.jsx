'use client';
import React, { useState } from 'react';
import { CloudRain, Wind, Thermometer, Layers } from 'lucide-react';
import styles from './ClimaWidget.module.css';

export default function ClimaWidget() {
  const [activeLayer, setActiveLayer] = useState('temperature-2m');

  const layers = [
    { id: 'temperature-2m', name: 'Temperatura', icon: Thermometer },
    { id: 'rain-3h', name: 'Precipitación', icon: CloudRain },
    { id: 'wind-10m', name: 'Viento', icon: Wind },
  ];

  // Coordenadas de Oruro, Bolivia: -18.0, -67.1, zoom 7
  const ventuskyUrl = `https://www.ventusky.com/?p=-18.0;-67.1;7&l=${activeLayer}`;

  return (
    <div className={styles.widgetContainer}>
      <div className={styles.header}>
        <div className={styles.iconWrapper}>
          <CloudRain size={28} />
        </div>
        <div>
          <h3 className={styles.title}>Monitoreo Climatológico en Tiempo Real</h3>
          <p className={styles.subtitle}>Información meteorológica del Departamento de Oruro y Bolivia.</p>
        </div>
      </div>

      <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '1rem', flexWrap: 'wrap' }}>
        {layers.map(layer => (
          <button
            key={layer.id}
            onClick={() => setActiveLayer(layer.id)}
            style={{
              padding: '0.5rem 1rem',
              display: 'flex',
              alignItems: 'center',
              gap: '0.5rem',
              background: activeLayer === layer.id ? '#9c0720' : '#f1f5f9',
              color: activeLayer === layer.id ? '#fff' : '#475569',
              border: 'none',
              borderRadius: '8px',
              fontWeight: '700',
              fontSize: '0.85rem',
              cursor: 'pointer',
              transition: 'all 0.2s'
            }}
          >
            <layer.icon size={16} /> {layer.name}
          </button>
        ))}
      </div>

      <div className={styles.iframeWrapper}>
        <div className={styles.overlayTopLeft}>
          <img src="/imagotipo_gador_2026.png" alt="Gobernación de Oruro" className={styles.overlayLogo} />
        </div>
        <div className={styles.overlayTopRight}>
          <img src="/logo-gador.png" alt="Escudo" className={styles.overlayLogo} />
        </div>
        <iframe 
          src={ventuskyUrl}
          className={styles.iframe}
          title="Mapa Climático Interactivo de Oruro - Ventusky"
          loading="lazy"
          allowFullScreen
        ></iframe>
      </div>
    </div>
  );
}
