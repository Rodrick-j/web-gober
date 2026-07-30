'use client';

import { motion } from 'framer-motion';
import styles from './HistorySection.module.css';

export default function HistorySection() {
  const historyItems = [
    {
      year: '1606',
      title: 'Época Colonial y la Fundación',
      icon: '🏛️',
      description: 'Fundada el 1 de noviembre de 1606 por el oidor Manuel de Castro y Padilla. Denominada originalmente como Real Villa de San Felipe de Austria. Su gobierno inicial estuvo estrictamente ligado a la administración de las Cajas Reales.'
    },
    {
      year: '1810',
      title: 'Revolución y Junta de Gobierno',
      icon: '✊',
      description: 'Tras la revolución de Buenos Aires en mayo de 1810, los vecinos de Oruro rompieron el orden colonial, adhiriéndose públicamente a la Junta de Gobierno e iniciando su propio proceso de autogobierno en el Alto Perú.'
    },
    {
      year: '1826',
      title: 'Creación del Departamento',
      icon: '🇧🇴',
      description: 'El departamento de Oruro se creó oficialmente el 5 de septiembre de 1826 mediante un decreto dictado por el presidente Mariscal Antonio José de Sucre. Durante casi dos siglos funcionó bajo el modelo de Prefectura.'
    },
    {
      year: '2010 - Presente',
      title: 'Transición a la Autonomía',
      icon: '🔄',
      description: 'Con la promulgación de la Ley de Autonomías en Bolivia, la antigua Prefectura se transformó en el Gobierno Autónomo Departamental de Oruro, otorgándole independencia legislativa y fiscal.'
    }
  ];

  return (
    <section className={styles.historySection}>
      <div className={styles.container}>
        <div className={styles.header}>
          <h2 className={styles.title}>
            <span className={styles.goldText}>HISTORIA DE LA</span><br />
            <span className={styles.goldText}>INSTITUCIÓN</span>
          </h2>
          <p className={styles.intro}>
            La historia de gobierno de la institución de Oruro —estructurada formalmente hoy como el Gobierno Autónomo Departamental de Oruro— ha evolucionado desde el control colonial español y las juntas revolucionarias hasta convertirse en un gobierno subnacional descentralizado y autónomo.
          </p>
        </div>

        <motion.div 
          className={styles.videoContainer}
          initial={{ opacity: 0, scale: 0.95 }}
          whileInView={{ opacity: 1, scale: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
        >
          <video
            src="/videos/oruro.mp4"
            poster="/videos/oruro-poster.jpg"
            controls
            autoPlay 
            loop 
            muted 
            playsInline
            className={styles.historyVideo}
          />
        </motion.div>

        <div className={styles.timeline}>
          {historyItems.map((item, index) => (
            <motion.div 
              key={item.year}
              className={styles.timelineItem}
              initial={{ opacity: 0, y: 50 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: "-50px" }}
              transition={{ duration: 0.6, delay: index * 0.15 }}
            >
              <div className={styles.timelineIcon}>{item.icon}</div>
              <div className={styles.timelineContent}>
                <span className={styles.timelineYear}>{item.year}</span>
                <h3 className={styles.timelineTitle}>{item.title}</h3>
                <p className={styles.timelineDesc}>{item.description}</p>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
