'use client';

import { useState, useEffect, useRef } from 'react';
import styles from './LanguageSwitcher.module.css';

export default function LanguageSwitcher() {
  const [currentLang, setCurrentLang] = useState('es');
  const selectRef = useRef(null);

  useEffect(() => {
    // Detectar idioma actual desde la cookie de Google Translate
    const match = document.cookie.match(/googtrans=\/[^/]+\/([a-z]{2})/);
    if (match && match[1]) {
      const lang = match[1];
      if (['es', 'qu', 'en'].includes(lang)) {
        setCurrentLang(lang);
      }
    }
  }, []);

  const handleLangChange = (e) => {
    const targetLang = e.target.value;
    setCurrentLang(targetLang);

    // 1. Sincronizar con el widget oculto de Google Translate si está cargado
    const googleSelect = document.querySelector('.goog-te-combo');
    if (googleSelect) {
      googleSelect.value = targetLang;
      googleSelect.dispatchEvent(new Event('change'));
    } else {
      // 2. Si no ha cargado aún, guardar en cookie y refrescar
      document.cookie = `googtrans=/es/${targetLang}; path=/;`;
      window.location.reload();
    }
  };

  const handlePlanetClick = () => {
    if (selectRef.current) {
      try {
        if (typeof selectRef.current.showPicker === 'function') {
          selectRef.current.showPicker();
        } else {
          selectRef.current.focus();
          selectRef.current.click();
        }
      } catch (e) {
        selectRef.current.focus();
      }
    }
  };

  return (
    <div className={styles.container} onClick={handlePlanetClick} title="Seleccionar idioma">
      <button 
        type="button" 
        onClick={handlePlanetClick} 
        className={styles.planetBtn}
        aria-label="Cambiar idioma"
      >
        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round" className="lucide lucide-globe">
          <circle cx="12" cy="12" r="10"/>
          <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>
          <path d="M2 12h20"/>
        </svg>
      </button>

      <select
        ref={selectRef}
        value={currentLang}
        onChange={handleLangChange}
        onClick={(e) => e.stopPropagation()}
        className={styles.customSelect}
        aria-label="Selector de idioma"
      >
        <option value="es">Español</option>
        <option value="qu">Quechua</option>
        <option value="en">English</option>
      </select>

      {/* Widget original de Google Translate oculto para procesar la traducción en segundo plano */}
      <div id="google_translate_element" className={styles.hiddenTranslator}></div>
    </div>
  );
}
