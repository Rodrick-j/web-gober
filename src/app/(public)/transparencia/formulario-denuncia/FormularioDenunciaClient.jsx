'use client';

import Image from 'next/image';
import { useEffect, useState } from 'react';
import { Download, Maximize2, Printer, ShieldAlert, X } from 'lucide-react';
import styles from './formulario-denuncia.module.css';

const PDF_URL = '/documentos/transparencia/denuncias/formulario-denuncia.pdf';
const IMAGE_URL = '/documentos/transparencia/denuncias/formulario-denuncia-vista-previa.png';

export default function FormularioDenunciaClient() {
  const [isExpanded, setIsExpanded] = useState(false);

  useEffect(() => {
    if (!isExpanded) return undefined;

    const closeOnEscape = (event) => {
      if (event.key === 'Escape') setIsExpanded(false);
    };

    document.addEventListener('keydown', closeOnEscape);
    const previousOverflow = document.body.style.overflow;
    document.body.style.overflow = 'hidden';

    return () => {
      document.removeEventListener('keydown', closeOnEscape);
      document.body.style.overflow = previousOverflow;
    };
  }, [isExpanded]);

  const printForm = () => {
    const printFrame = document.createElement('iframe');
    printFrame.src = PDF_URL;
    printFrame.title = 'Imprimir formulario de denuncia';
    printFrame.style.position = 'fixed';
    printFrame.style.width = '1px';
    printFrame.style.height = '1px';
    printFrame.style.opacity = '0';
    printFrame.style.pointerEvents = 'none';

    printFrame.onload = () => {
      printFrame.contentWindow?.focus();
      printFrame.contentWindow?.print();
      window.setTimeout(() => printFrame.remove(), 1000);
    };

    document.body.appendChild(printFrame);
  };

  return (
    <>
      <section className={styles.formSection} aria-labelledby="formulario-oficial-title">
        <div className={styles.introCard}>
          <span className={styles.iconBadge}><ShieldAlert aria-hidden="true" /></span>
          <div>
            <p className={styles.eyebrow}>Documento oficial</p>
            <h2 id="formulario-oficial-title">Denuncia de un acto de corrupción</h2>
            <p>Revise el contenido del formulario antes de descargarlo. Puede completarlo de forma manuscrita después de imprimirlo.</p>
          </div>
        </div>

        <div className={styles.contentGrid}>
          <div className={styles.previewCard}>
            <div className={styles.previewHeader}>
              <div>
                <span>Vista previa del formulario</span>
                <strong>Una página · PDF</strong>
              </div>
              <button type="button" onClick={() => setIsExpanded(true)} className={styles.expandButton}>
                <Maximize2 aria-hidden="true" /> Ampliar
              </button>
            </div>

            <button type="button" className={styles.previewButton} onClick={() => setIsExpanded(true)} aria-label="Ampliar formulario de denuncia">
              <Image
                src={IMAGE_URL}
                alt="Vista previa del Formulario de Denuncia de un Acto de Corrupción"
                width={1224}
                height={1584}
                priority
              />
              <span className={styles.previewOverlay}><Maximize2 aria-hidden="true" /> Clic para ampliar</span>
            </button>
          </div>

          <aside className={styles.actionsCard} aria-label="Acciones del formulario">
            <h3>¿Qué desea hacer?</h3>
            <p>Elija una opción para utilizar el formulario de manera inmediata.</p>
            <button type="button" onClick={() => setIsExpanded(true)} className={styles.primaryAction}>
              <Maximize2 aria-hidden="true" /> Ver formulario ampliado
            </button>
            <a href={PDF_URL} download className={styles.secondaryAction}>
              <Download aria-hidden="true" /> Descargar PDF
            </a>
            <button type="button" onClick={printForm} className={styles.printAction}>
              <Printer aria-hidden="true" /> Imprimir directamente
            </button>
            <p className={styles.note}>La información contenida en el formulario será tratada conforme a los canales institucionales de transparencia.</p>
          </aside>
        </div>
      </section>

      {isExpanded && (
        <div className={styles.modal} role="dialog" aria-modal="true" aria-label="Formulario de denuncia ampliado" onClick={() => setIsExpanded(false)}>
          <div className={styles.modalContent} onClick={(event) => event.stopPropagation()}>
            <div className={styles.modalHeader}>
              <div>
                <span>Formulario oficial</span>
                <strong>Denuncia de un acto de corrupción</strong>
              </div>
              <button type="button" onClick={() => setIsExpanded(false)} aria-label="Cerrar vista ampliada">
                <X aria-hidden="true" />
              </button>
            </div>
            <div className={styles.modalPreview}>
              <Image src={IMAGE_URL} alt="Formulario de Denuncia ampliado" width={1224} height={1584} priority />
            </div>
          </div>
        </div>
      )}
    </>
  );
}
