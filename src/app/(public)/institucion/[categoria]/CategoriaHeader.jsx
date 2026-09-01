'use client';
import { motion } from 'framer-motion';
import { Coins, Users, GitMerge, FileSignature, Gavel, FileText, Landmark } from 'lucide-react';
import styles from './CategoriaHeader.module.css';

const getCategoryConfig = (slug) => {
  switch (slug) {
    case 'informacion-financiera':
      return { Icon: Coins, count: 6, color: 'rgba(255, 184, 67, 0.15)' };
    case 'recursos-humanos':
      return { Icon: Users, count: 6, color: 'rgba(255, 255, 255, 0.15)' };
    case 'desarrollo-organizacional':
      return { Icon: GitMerge, count: 5, color: 'rgba(255, 255, 255, 0.15)' };
    case 'contrataciones':
      return { Icon: FileSignature, count: 5, color: 'rgba(255, 255, 255, 0.15)' };
    case 'licitacion-publica':
      return { Icon: Gavel, count: 5, color: 'rgba(255, 184, 67, 0.15)' };
    default:
      return { Icon: Landmark, count: 4, color: 'rgba(255, 255, 255, 0.1)' };
  }
};

export default function CategoriaHeader({ titulo, slug }) {
  const { Icon, count, color } = getCategoryConfig(slug);

  // Posiciones deterministas para evitar error de hidratación entre Servidor/Cliente
  const predefinidos = [
    { size: 70, top: '10%', left: '15%', duration: 18, delay: 0 },
    { size: 50, top: '60%', left: '80%', duration: 22, delay: 1 },
    { size: 90, top: '20%', left: '70%', duration: 15, delay: 2 },
    { size: 45, top: '75%', left: '25%', duration: 25, delay: 0.5 },
    { size: 80, top: '40%', left: '5%', duration: 19, delay: 1.5 },
    { size: 60, top: '85%', left: '60%', duration: 21, delay: 3 },
  ];

  const icons = Array.from({ length: count }).map((_, i) => ({
    id: i,
    ...predefinidos[i % predefinidos.length]
  }));

  return (
    <div className={styles.pageHeader}>
      {/* Animated Background Icons */}
      <div className={styles.animatedBackground}>
        {icons.map((item) => (
          <motion.div
            key={item.id}
            className={styles.floatingIcon}
            style={{ top: item.top, left: item.left, color: color }}
            animate={{
              y: [0, -30, 0],
              x: [0, 20, 0],
              rotate: [0, 10, -10, 0],
            }}
            transition={{
              duration: item.duration,
              repeat: Infinity,
              ease: "linear",
              delay: item.delay,
            }}
          >
            <Icon size={item.size} strokeWidth={1} />
          </motion.div>
        ))}
      </div>

      <div className={styles.headerContent}>
        <motion.div 
          className={styles.breadcrumb}
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
        >
          Institución / {titulo}
        </motion.div>
        
        <motion.h1 
          className={styles.title}
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.1 }}
        >
          {titulo}
        </motion.h1>
        
        <motion.p 
          className={styles.subtitle}
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.2 }}
        >
          Documentación oficial, reportes y archivos de gestión pública.
        </motion.p>
      </div>
    </div>
  );
}
