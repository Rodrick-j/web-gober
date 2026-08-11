'use client';

import Image from 'next/image';
import { motion } from 'framer-motion';
import styles from './GovernorSection.module.css';

export default function GovernorSection() {
  return (
    <section className={styles.governorSection}>
      <div className={styles.container}>
        <div className={styles.textContent}>
          <h2 className={styles.title}>
            <span className={styles.goldText}>EDDGAR SÁNCHEZ</span><br />
            <span className={styles.goldText}>AGUIRRE</span>
          </h2>
          <h3 className={styles.subtitle}>Gobernador del Departamento de Oruro</h3>
          
          <div className={styles.description}>
            <p>
              Eddgar Sánchez Aguirre, el cuarto gobernador electo por voto popular en la historia de Oruro, nació en la marka Lagunillas (Santiago de Huari). Forjado en el trabajo duro desde niño para ayudar a su familia, superó las carencias económicas hasta alcanzar el título de Ingeniero en Software, demostrando que la perseverancia es el motor del éxito.
            </p>
            <p>
              Su liderazgo lo llevó a destacar como ejecutivo de la FSUTCO, diputado nacional y gerente del FPS, priorizando siempre el progreso de Oruro. Su aguda conciencia crítica se refleja además en su faceta como analista político y autor del libro <em>"Insurrección de Indios y toma de Oruro del 10 de Febrero"</em>.
            </p>
            <p>
              Con el apoyo contundente del pueblo y la Alianza Jach'a, asumió la gobernación en mayo de 2026. Hoy lidera un proyecto histórico enfocado en la transparencia, la lucha frontal contra la corrupción, la recuperación económica y la modernización administrativa, marcando un nuevo tiempo de reencuentro y unidad para todos los orureños.
            </p>
            <p className={styles.unidadText}>
              ¡GOBIERNO DE UNIDAD!
            </p>
          </div>
        </div>

        <motion.div 
          className={styles.imageContent}
          initial={{ opacity: 0, filter: 'blur(15px)', scale: 0.95 }}
          whileInView={{ opacity: 1, filter: 'blur(0px)', scale: 1 }}
          viewport={{ once: true, amount: 0.3 }}
          transition={{ duration: 2.5, ease: 'easeOut' }}
        >
          <div className={styles.imageWrapper}>
            <Image
              src="/gober_oruro.jpg" 
              alt="Gobernador Eddgar Sánchez Aguirre"
              fill
              style={{ objectFit: 'cover', objectPosition: 'top center' }}
              className={styles.image}
              sizes="(max-width: 768px) 100vw, 50vw"
              priority
              quality={80}
            />
          </div>
        </motion.div>
      </div>
    </section>
  );
}
