'use client';

import { motion } from 'framer-motion';
import styles from './HistorySection.module.css';

export default function HistorySection() {
  const historyItems = [
    {
      year: '1826',
      title: 'Los Orígenes: La Creación del Departamento',
      icon: '📜',
      description: 'Antes de existir una administración departamental, el territorio giraba en torno a la Real Villa de San Felipe de Austria y su gesta libertaria de 1781. El 5 de septiembre de 1826, el Mariscal Sucre promulgó la ley que erigió el nuevo departamento de Oruro, conformado por tres provincias: Oruro, Paria y Carangas, dando origen a la Prefectura.'
    },
    {
      year: 'S. XIX - XX',
      title: 'La Larga Era de la Prefectura Centralizada',
      icon: '🏛️',
      description: 'Durante el siglo XIX y casi todo el siglo XX, la institución fue la Prefectura de Oruro, de naturaleza centralista. El Prefecto, máxima autoridad, era designado por el Presidente de la República y actuaba como brazo operativo del Ejecutivo nacional, dependiendo enteramente de La Paz.'
    },
    {
      year: '1995 - 2005',
      title: 'Descentralización y Despertar Regional',
      icon: '✊',
      description: 'En 1995 se promulgó la Ley de Descentralización Administrativa, creando el Consejo Departamental. El verdadero punto de quiebre ocurrió en 2005, cuando los orureños, tras intensas luchas sociales, acudieron a las urnas para elegir democráticamente a su Prefecto por primera vez.'
    },
    {
      year: '2009 - Presente',
      title: 'Nacimiento de la Gobernación y Autonomía',
      icon: '🇧🇴',
      description: 'Con la Nueva Constitución (2009) y la Ley Marco de Autonomías (2010), la Prefectura dio paso al Gobierno Autónomo Departamental de Oruro (GADOR). El "Prefecto" pasó a ser "Gobernador" electo, y el Consejo fue reemplazado por la Asamblea Legislativa Departamental con facultad legislativa propia.'
    },
    {
      year: '2010 - 2021',
      title: 'La Era de los Gobernadores Electos',
      icon: '🗳️',
      description: 'Santos Tito (2010-2015) fue el primer Gobernador bajo la nueva Constitución. Le siguió Víctor Hugo Vásquez, quien renunció por la crisis de 2019. Posteriormente, los gobernadores interinos Zenón Pizarro y Edson Oczachoque estabilizaron la Gobernación durante la pandemia.'
    },
    {
      year: '2021 - 2026',
      title: 'Gestión de la Post-Pandemia',
      icon: '🏥',
      description: 'Johnny Vedia Rodríguez asumió como Gobernador con el desafío de reactivar el departamento, gestionar el sistema de salud tras la pandemia, y enfocar esfuerzos en el desarrollo productivo e industrial de la región.'
    },
    {
      year: '2026',
      title: 'Elecciones y Nueva Administración',
      icon: '🔄',
      description: 'Tras dos vueltas electorales (marzo y abril de 2026), Edgar Sánchez asumió como actual Gobernador. Su gestión inició con el restablecimiento del diálogo interinstitucional y acuerdos estratégicos de infraestructura, como la carretera Crucero–Qaqachaca–Pocoata.'
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
            autoPlay 
            loop 
            muted 
            playsInline
            className={styles.historyVideo}
          />
          <img src="/logo-gador.png" alt="" className={styles.watermarkOverlay} />
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
