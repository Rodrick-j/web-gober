'use client';

import styles from './LanguageSwitcher.module.css';

export default function LanguageSwitcher() {
  const handlePlanetClick = () => {
    const selectElement = document.querySelector('.goog-te-combo');
    if (selectElement) {
      try {
        if (typeof selectElement.showPicker === 'function') {
          selectElement.showPicker();
        } else {
          selectElement.focus();
          selectElement.click();
        }
      } catch (e) {
        selectElement.focus();
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
        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round" className="lucide lucide-globe"><circle cx="12" cy="12" r="10"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/><path d="M2 12h20"/></svg>
      </button>
      <div id="google_translate_element" className={styles.translatorWrapper}></div>
    </div>
  );
}
