'use client';

import React from 'react';
import Image from 'next/image';
import { motion } from 'framer-motion';
import styles from './gobernador.module.css';
import CenefaCultural from '@/components/CenefaCultural/CenefaCultural';

export default function GobernadorPage() {
  return (
    <>
      <CenefaCultural />
      <div className={styles.pageWrapper}>
        <div className={styles.container}>
          
          {/* Left Side: Executive Portrait Card */}
          <motion.div 
            initial={{ opacity: 0, x: -40, y: 15 }}
            animate={{ opacity: 1, x: 0, y: 0 }}
            transition={{ duration: 0.8, cubicBezier: [0.16, 1, 0.3, 1] }}
            style={{ position: 'relative' }}
          >
            {/* Esquinero Superior Izquierdo */}
            <div className={styles.esquineroTopLeft}>
              <Image src="/motivos/motivo_10.png" alt="Motivo Cultural" fill style={{ objectFit: 'contain' }} />
            </div>

            <div className={styles.portraitCard}>
              {/* Fondo decorativo institucional con aureola sutil */}
              <div className={styles.portraitBackground}>
                <div className={styles.portraitBgGlow} />
                <div className={styles.portraitBgMotif}>
                  <Image src="/motivos/motivo_10.png" alt="Sello Cultural" width={260} height={260} style={{ objectFit: 'contain', opacity: 0.08 }} />
                </div>
              </div>

              {/* Contenedor de la Imagen del Gobernador (anclado a la base del marco) */}
              <div className={styles.portraitImageContainer}>
                <Image 
                  src="/gobernador_perfil.png" 
                  alt="Gobernador Constitucional Edgar Sánchez Aguirre"
                  width={800}
                  height={1000}
                  className={styles.governorImage}
                  priority
                />
              </div>

              {/* Placa Ejecutiva / Footer Oficial */}
              <div className={styles.portraitFooter}>
                <div className={styles.footerBadge}>
                  <span className={styles.footerFlag}>🇧🇴</span>
                  <span className={styles.footerRole}>Gobernador Constitucional</span>
                </div>
                <div className={styles.footerEntity}>Departamento de Oruro — Gestión 2026</div>
                <div className={styles.footerGoldLine} />
              </div>
            </div>
          </motion.div>

          {/* Right Side: Biography Text */}
          <motion.div 
            className={styles.contentArea}
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.2 }}
            style={{ position: 'relative' }}
          >
            {/* Esquinero Inferior Derecho */}
            <div className={styles.esquineroBottomRight}>
              <Image src="/motivos/motivo_11.png" alt="Motivo Cultural" fill style={{ objectFit: 'contain' }} />
            </div>

            <div>
              <h1 className={styles.mainTitle}>ÉDGAR SÁNCHEZ AGUIRRE</h1>
              
              <div className={styles.separadorMotivo}>
                <div className={styles.separadorIcono}>
                  <Image src="/motivos/motivo_10.png" alt="Motivo Cultural" fill style={{ objectFit: 'contain' }} />
                </div>
                <div className={styles.separadorLinea}></div>
              </div>

              <p className={styles.subtitle}>Gobernador del Departamento de Oruro</p>
            </div>

          <div className={styles.biography}>
            <p>
              Edgar Sánchez Aguirre, el cuarto gobernador electo por voto popular en Oruro, fue posesionado el 4 de mayo de 2026, marcando un tiempo de unidad para la región. Nació en la marka Lagunillas (Santiago de Huari) en un entorno de carencias que no frenaron su superación; desde niño trabajó vendiendo diversos productos y cargando maletas para apoyar a su familia. Con el tiempo, se graduó como Ingeniero en Software y cultivó su pasión por el fútbol, impulsando proyectos para jóvenes deportistas.
            </p>
            
            <p>
              Su trayectoria político-sindical incluye cargos como ejecutivo de la Fsutco, diputado nacional, gerente del FPS y asesor estratégico en gobiernos locales, donde priorizó la cohesión social sobre las divisiones ideológicas. Además, se ha desempeñado como analista político, columnista y autor del libro “Insurrección de Indios y toma de Oruro del 10 de Febrero”, un aporte a la memoria histórica que resalta la unidad entre indígenas, criollos y mestizos.
            </p>

            <motion.div 
              className={styles.quoteCard}
              initial={{ opacity: 0, scale: 0.95 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: 0.3 }}
            >
              <p className={styles.quoteText}>
                "En 2026, respaldado por la Alianza Jach´a, ganó las elecciones subnacionales. Su gestión busca transformar la administración departamental mediante la transparencia, la lucha contra la corrupción, la modernización y la reactivación económica."
              </p>
            </motion.div>
          </div>
        </motion.div>

      </div>
    </div>
    </>
  );
}
