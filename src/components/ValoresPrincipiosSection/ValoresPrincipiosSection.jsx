'use client';

import { motion } from 'framer-motion';
import styles from './ValoresPrincipiosSection.module.css';

const principios = [
  {
    quechua: 'Ama Qhilla',
    espanol: 'No seas flojo',
    descripcion: 'Promueve el trabajo honrado, constante y productivo como base del desarrollo personal y comunitario.',
    icon: '💪',
  },
  {
    quechua: 'Ama Llulla',
    espanol: 'No seas mentiroso',
    descripcion: 'Fomenta la transparencia, la verdad y la honestidad en todos los actos de la gestión pública.',
    icon: '🤝',
  },
  {
    quechua: 'Ama Suwa',
    espanol: 'No seas ladrón',
    descripcion: 'Impulsa la probidad, la ética y el respeto por los bienes públicos y ajenos.',
    icon: '⚖️',
  },
  {
    quechua: 'Suma Qamaña',
    espanol: 'Vivir Bien',
    descripcion: 'Busca la armonía y el equilibrio entre la persona, la comunidad y la naturaleza como ideal de vida.',
    icon: '🌿',
  },
];

const valores = [
  {
    titulo: 'Trabajo y Lucha',
    descripcion: 'Una vocación forjada desde la época colonial en las minas y mantenida en el esfuerzo productivo del altiplano orureño.',
    icon: '⛏️',
  },
  {
    titulo: 'Hospitalidad',
    descripcion: 'La calidez y apertura con la que los habitantes reciben a visitantes, especialmente durante las festividades culturales.',
    icon: '🫂',
  },
  {
    titulo: 'Fe y Devoción',
    descripcion: 'Representada de forma sublime en la devoción a la Virgen del Socavón y el orgullo de ser la Capital del Folklore de Bolivia.',
    icon: '✨',
  },
  {
    titulo: 'Identidad y Tradición',
    descripcion: 'Un arraigo profundo a las raíces culturales, costumbres ancestrales y expresiones artísticas que definen la identidad orureña.',
    icon: '🎭',
  },
];

const cardVariants = {
  hidden: { opacity: 0, y: 30 },
  visible: (i) => ({
    opacity: 1,
    y: 0,
    transition: { duration: 0.5, delay: i * 0.1, type: 'spring', stiffness: 80 },
  }),
};

export default function ValoresPrincipiosSection() {
  return (
    <section className={styles.section}>
      <div className={styles.container}>

        {/* Header */}
        <motion.div
          className={styles.header}
          initial={{ opacity: 0, y: -20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6 }}
        >
          <span className={styles.badge}>Marco Axiológico</span>
          <h2 className={styles.title}>Valores y Principios Institucionales</h2>
          <p className={styles.subtitle}>
            El Gobierno Autónomo Departamental de Oruro fundamenta su gestión en los mandatos
            ancestrales de los pueblos andinos y en los valores que identifican a la sociedad orureña.
          </p>
        </motion.div>

        {/* Principios Éticos Ancestrales */}
        <div className={styles.blockSection}>
          <motion.div
            className={styles.blockHeader}
            initial={{ opacity: 0, x: -20 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5 }}
          >
            <div className={styles.blockIcon}>🏔️</div>
            <div>
              <h3 className={styles.blockTitle}>Principios Ético-Morales y Ancestrales</h3>
              <p className={styles.blockDesc}>
                Mandatos andinos tradicionales adoptados por el GADOR que guían la convivencia y la gestión pública.
              </p>
            </div>
          </motion.div>

          <div className={styles.principiosGrid}>
            {principios.map((p, i) => (
              <motion.div
                key={p.quechua}
                className={styles.principioCard}
                custom={i}
                variants={cardVariants}
                initial="hidden"
                whileInView="visible"
                viewport={{ once: true }}
              >
                <div className={styles.principioIcon}>{p.icon}</div>
                <div className={styles.principioContent}>
                  <span className={styles.principioQuechua}>{p.quechua}</span>
                  <span className={styles.principioEspanol}>«{p.espanol}»</span>
                  <p className={styles.principioDesc}>{p.descripcion}</p>
                </div>
              </motion.div>
            ))}
          </div>
        </div>

        {/* Divider */}
        <div className={styles.divider} aria-hidden="true">
          <div className={styles.dividerLine} />
          <span className={styles.dividerIcon}>🦅</span>
          <div className={styles.dividerLine} />
        </div>

        {/* Valores Sociales y Culturales */}
        <div className={styles.blockSection}>
          <motion.div
            className={styles.blockHeader}
            initial={{ opacity: 0, x: -20 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5 }}
          >
            <div className={styles.blockIcon}>🎭</div>
            <div>
              <h3 className={styles.blockTitle}>Valores Sociales y Culturales de la Sociedad Orureña</h3>
              <p className={styles.blockDesc}>
                Características históricamente arraigadas en la identidad de la población de Oruro.
              </p>
            </div>
          </motion.div>

          <div className={styles.valoresGrid}>
            {valores.map((v, i) => (
              <motion.div
                key={v.titulo}
                className={styles.valorCard}
                custom={i}
                variants={cardVariants}
                initial="hidden"
                whileInView="visible"
                viewport={{ once: true }}
              >
                <span className={styles.valorIcon}>{v.icon}</span>
                <h4 className={styles.valorTitulo}>{v.titulo}</h4>
                <p className={styles.valorDesc}>{v.descripcion}</p>
              </motion.div>
            ))}
          </div>
        </div>

        <motion.p
          className={styles.citation}
          initial={{ opacity: 0 }}
          whileInView={{ opacity: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6, delay: 0.3 }}
        >
          Fuente: Plan Estratégico Institucional (PEI) 2016–2020 — Gobierno Autónomo Departamental de Oruro
        </motion.p>
      </div>
    </section>
  );
}
