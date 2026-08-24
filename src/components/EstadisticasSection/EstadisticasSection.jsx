'use client';
import { useEffect, useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import { motion } from 'framer-motion';
import styles from './EstadisticasSection.module.css';

export default function EstadisticasSection({ secretariaId, colorAcento = '#8B0000' }) {
  const [stats, setStats] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!secretariaId) return;
    const supabase = createClient();
    supabase
      .from('estadisticas_secretarias')
      .select('*')
      .eq('secretaria_id', secretariaId)
      .eq('es_publico', true)
      .order('orden')
      .then(({ data, error }) => {
        // If table doesn't exist yet (406/error), fail silently
        if (!error && data) setStats(data);
        setLoading(false);
      })
      .catch(() => setLoading(false));
  }, [secretariaId]);

  if (loading) {
    return (
      <div className={styles.loading}>
        <div className={styles.spinner} style={{ borderTopColor: colorAcento }} />
      </div>
    );
  }

  if (stats.length === 0) return null;

  return (
    <section className={styles.section}>
      <h2 className={styles.title} style={{ color: colorAcento }}>
        📊 Indicadores de Gestión
      </h2>
      <div className={styles.grid}>
        {stats.map((stat, i) => (
          <motion.div
            key={stat.id}
            className={styles.card}
            style={{ borderLeftColor: stat.color || colorAcento }}
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: i * 0.08, duration: 0.4, ease: 'easeOut' }}
            whileHover={{ scale: 1.02, transition: { duration: 0.15 } }}
          >
            <div className={styles.iconWrapper} style={{ background: `${stat.color || colorAcento}18` }}>
              <span className={styles.icon}>{stat.icono}</span>
            </div>
            <div className={styles.content}>
              <div className={styles.value} style={{ color: stat.color || colorAcento }}>
                {stat.valor}
                {stat.unidad && <span className={styles.unit}> {stat.unidad}</span>}
              </div>
              <div className={styles.label}>{stat.titulo}</div>
              {stat.descripcion && (
                <div className={styles.description}>{stat.descripcion}</div>
              )}
              <div className={styles.period}>{stat.periodo}</div>
            </div>
          </motion.div>
        ))}
      </div>
    </section>
  );
}
