'use client';

import React, { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { SketchPicker } from 'react-color';
import styles from './ThemeCustomizer.module.css';

const PaletteIcon = () => (
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10c1.38 0 2.5-1.12 2.5-2.5 0-.53-.21-1.04-.59-1.41-.37-.38-.59-.88-.59-1.41 0-1.1.9-2 2-2h1.17c3.26 0 5.92-2.63 5.92-5.88C22 7.5 17.5 2 12 2z"/>
    <path d="M6.5 11.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
    <path d="M10 7.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
    <path d="M14 7.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
    <path d="M17.5 11.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
  </svg>
);

export default function ThemeCustomizer() {
  const [isOpen, setIsOpen] = useState(false);
  const [colors, setColors] = useState({
    primary: '#9c0720',
    gold: '#ffb843',
    dark: '#1a1a2e'
  });
  const [status, setStatus] = useState('');
  const supabase = createClient();

  // Load colors on mount
  useEffect(() => {
    async function loadColors() {
      const { data, error } = await supabase
        .from('configuracion_global')
        .select('valor')
        .eq('clave', 'tema_web')
        .single();
      
      if (data && data.valor) {
        setColors(data.valor);
        applyColorsToRoot(data.valor);
      }
    }
    loadColors();
  }, [supabase]);

  // Apply colors to CSS variables so admin panel also reflects it
  const applyColorsToRoot = (c) => {
    if (typeof document !== 'undefined') {
      document.documentElement.style.setProperty('--color-primary', c.primary);
      document.documentElement.style.setProperty('--color-gold', c.gold);
    }
  };

  const handleColorChange = (key, value) => {
    const newColors = { ...colors, [key]: value };
    setColors(newColors);
    applyColorsToRoot(newColors);
  };

  const saveColors = async () => {
    setStatus('Guardando...');
    
    // Check if exists first
    const { data: existing } = await supabase
      .from('configuracion_global')
      .select('id')
      .eq('clave', 'tema_web')
      .single();

    let res;
    if (existing) {
      res = await supabase
        .from('configuracion_global')
        .update({ valor: colors })
        .eq('clave', 'tema_web');
    } else {
      res = await supabase
        .from('configuracion_global')
        .insert([{ clave: 'tema_web', valor: colors, descripcion: 'Colores globales de la web' }]);
    }

    if (res.error) {
      console.error(res.error);
      setStatus('Error al guardar');
    } else {
      setStatus('¡Guardado!');
      setTimeout(() => setStatus(''), 2000);
    }
  };

  return (
    <div className={styles.themeCustomizer}>
      <button 
        className={styles.toggleBtn} 
        onClick={() => setIsOpen(!isOpen)}
        aria-label="Abrir Paleta de Colores"
        style={{ backgroundColor: colors.primary }}
      >
        <PaletteIcon />
      </button>

      {isOpen && (
        <div className={styles.panel}>
          <div className={styles.panelTitle}>🎨 Paleta Global</div>
          <p style={{ fontSize: '0.8rem', color: '#666', textAlign: 'center', margin: '0 0 10px 0' }}>
            Los cambios afectarán al panel y a la web pública.
          </p>

          <ColorField 
            label="Rojo Institucional (Primary)" 
            colorKey="primary" 
            color={colors.primary} 
            onChange={handleColorChange} 
          />

          <ColorField 
            label="Oro Institucional (Gold)" 
            colorKey="gold" 
            color={colors.gold} 
            onChange={handleColorChange} 
          />

          <ColorField 
            label="Oscuro (Dark)" 
            colorKey="dark" 
            color={colors.dark} 
            onChange={handleColorChange} 
          />

          <button className={styles.saveBtn} onClick={saveColors} style={{ backgroundColor: colors.primary }}>
            Guardar Colores
          </button>
          
          {status && <div className={styles.statusMsg}>{status}</div>}
        </div>
      )}
    </div>
  );
}

const ColorField = ({ label, colorKey, color, onChange }) => {
  const [showPicker, setShowPicker] = useState(false);

  const popover = {
    position: 'absolute',
    zIndex: '2',
    left: '-250px',
    top: '0'
  };
  const cover = {
    position: 'fixed',
    top: '0px',
    right: '0px',
    bottom: '0px',
    left: '0px',
  };

  return (
    <div className={styles.colorGroup} style={{ position: 'relative' }}>
      <span className={styles.colorLabel}>{label}</span>
      <div className={styles.inputGroup}>
        <div 
          onClick={() => setShowPicker(!showPicker)} 
          style={{
            width: '35px',
            height: '35px',
            borderRadius: '50%', /* Círculo! */
            background: color,
            cursor: 'pointer',
            border: '2px solid #eaeaea',
            boxShadow: '0 2px 4px rgba(0,0,0,0.1)'
          }}
        />
        <input 
          type="text" 
          value={color} 
          onChange={(e) => onChange(colorKey, e.target.value)}
          className={styles.hexInput}
        />
      </div>
      {showPicker && (
        <div style={popover}>
          <div style={cover} onClick={() => setShowPicker(false)} />
          <SketchPicker color={color} onChange={(c) => onChange(colorKey, c.hex)} disableAlpha />
        </div>
      )}
    </div>
  );
}
