import React from 'react';
import { createClient } from '@/lib/supabase/public';
import CenefaCultural from '@/components/CenefaCultural/CenefaCultural';
import ProgressiveImage from '@/components/MediaLoader/ProgressiveImage';
import styles from './autoridades.module.css';

export const revalidate = 60;

export const metadata = {
  title: 'Nómina de Autoridades | Institución | GADOR',
  description: 'Autoridades del Gobierno Autónomo Departamental de Oruro: máxima autoridad, secretarios departamentales y directores generales, con biografía y datos de contacto.',
};

const GRUPOS = [
  { nivel: 'maxima', titulo: 'Máxima Autoridad Ejecutiva' },
  { nivel: 'secretario', titulo: 'Secretarías Departamentales' },
  { nivel: 'director', titulo: 'Direcciones Generales' },
  { nivel: 'jefe', titulo: 'Jefaturas de Unidad' },
  { nivel: 'otro', titulo: 'Otras Autoridades' },
];

export default async function AutoridadesPage() {
  let autoridades = [];
  try {
    const supabase = createClient();
    const { data } = await supabase
      .from('autoridades')
      .select('id, nombre, cargo, nivel, unidad, foto_url, bio, email, telefono, orden')
      .eq('activo', true)
      .order('orden', { ascending: true })
      .order('nombre', { ascending: true });
    autoridades = data || [];
  } catch {
    autoridades = [];
  }

  const porNivel = (n) => autoridades.filter((a) => a.nivel === n);

  return (
    <main className={styles.main}>
      <CenefaCultural />
      <header className={styles.hero}>
        <h1 className={styles.heroTitle}>Nómina de Autoridades</h1>
        <p className={styles.heroSub}>
          Autoridades del Gobierno Autónomo Departamental de Oruro hasta el nivel de directores generales.
        </p>
      </header>

      <div className={styles.container}>
        {autoridades.length === 0 ? (
          <div className={styles.empty}>La nómina de autoridades se encuentra en actualización.</div>
        ) : (
          GRUPOS.map((g) => {
            const items = porNivel(g.nivel);
            if (items.length === 0) return null;
            return (
              <section key={g.nivel} className={styles.section}>
                <h2 className={styles.sectionTitle}>{g.titulo}</h2>
                <div className={styles.grid}>
                  {items.map((a) => (
                    <article key={a.id} className={styles.card}>
                      {a.foto_url ? (
                        <div className={styles.photoWrap}>
                          <ProgressiveImage
                            className={styles.photo}
                            src={a.foto_url}
                            alt={a.nombre}
                            fill
                            sizes="110px"
                            quality={75}
                            showLoaderLabel={false}
                          />
                        </div>
                      ) : (
                        <div className={styles.photoPlaceholder}>👤</div>
                      )}
                      <h3 className={styles.name}>{a.nombre}</h3>
                      <p className={styles.role}>{a.cargo}</p>
                      {a.unidad && <p className={styles.unit}>{a.unidad}</p>}
                      {a.bio && <p className={styles.bio}>{a.bio}</p>}
                      {(a.email || a.telefono) && (
                        <p className={styles.contact}>
                          {a.email && <>✉ {a.email}</>}
                          {a.email && a.telefono && <> · </>}
                          {a.telefono && <>☎ {a.telefono}</>}
                        </p>
                      )}
                    </article>
                  ))}
                </div>
              </section>
            );
          })
        )}
      </div>
    </main>
  );
}
