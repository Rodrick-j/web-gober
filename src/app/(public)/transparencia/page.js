import React from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/public';
import styles from './page.module.css';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';

export const revalidate = 60;

export const metadata = {
  title: 'Transparencia | GADOR',
  description: 'Portal de Transparencia del Gobierno Autónomo Departamental de Oruro. Unidad de Transparencia, denuncia de corrupción, solicitud de información y rendición pública de cuentas.',
};

const OBS_FALLBACK = 'https://observatorio.gob.bo/#/';

const IconDoc = () => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className={styles.auditIconSVG}>
    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
    <polyline points="14 2 14 8 20 8"></polyline>
    <circle cx="11.5" cy="14.5" r="2.5"></circle>
    <line x1="13.27" y1="16.27" x2="16" y2="19"></line>
  </svg>
);

const Arrow = () => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <line x1="5" y1="12" x2="19" y2="12"></line>
    <polyline points="12 5 19 12 12 19"></polyline>
  </svg>
);

export default async function TransparenciaPage() {
  let observatorioUrl = OBS_FALLBACK;
  try {
    const supabase = createClient();
    const { data } = await supabase
      .from('configuracion_global')
      .select('valor')
      .eq('clave', 'enlaces_transparencia')
      .maybeSingle();
    if (data?.valor?.observatorio_url) observatorioUrl = data.valor.observatorio_url;
  } catch { /* usa fallback */ }

  const items = [
    {
      title: 'UNIDAD DE TRANSPARENCIA Y LUCHA CONTRA LA CORRUPCIÓN',
      subtitle: 'Responsable, funciones y contacto (Ley N° 974)',
      href: '/transparencia/unidad',
      external: false,
    },
    {
      title: 'DENUNCIAR HECHOS DE CORRUPCIÓN',
      subtitle: 'Sistema SITPRECO S2+ · Observatorio Ciudadano de Transparencia',
      href: observatorioUrl,
      external: true,
    },
    {
      title: 'SOLICITUD DE INFORMACIÓN PÚBLICA',
      subtitle: 'Formulario en línea para solicitar acceso a información pública',
      href: '/transparencia/solicitud-informacion',
      external: false,
    },
    {
      title: 'RENDICIÓN PÚBLICA DE CUENTAS',
      subtitle: 'Informes de rendición de cuentas de la Gobernación',
      href: '/transparencia/rendicion_cuentas',
      external: false,
    },
    {
      title: 'RENDICIÓN DE CUENTAS EN EL OBSERVATORIO',
      subtitle: 'Portal nacional de rendición pública de cuentas',
      href: observatorioUrl,
      external: true,
    },
    {
      title: 'ACTIVIDADES Y CAMPAÑAS',
      subtitle: 'Documentación de actividades institucionales',
      href: '/transparencia/actividades',
      external: false,
    },
  ];

  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <div className={styles.heroBanner}>
        <div className={styles.heroOverlay}></div>
        <div className={styles.heroContent}>
          <h1 className={styles.heroTitle}>TRANSPARENCIA INSTITUCIONAL</h1>
        </div>
      </div>

      <div className={styles.container}>
        <section className={styles.section} id="lucha">
          <h2 className={styles.sectionTitle}>ACCESO A LA INFORMACIÓN Y LUCHA CONTRA LA CORRUPCIÓN</h2>
          <div className={styles.auditoriaGrid}>
            {items.map((item, idx) => {
              const inner = (
                <>
                  <div className={styles.auditoriaIconWrapper}>
                    <IconDoc />
                  </div>
                  <div className={styles.auditoriaContent}>
                    <h3 className={styles.auditoriaTitle}>{item.title}</h3>
                    <p className={styles.auditoriaSubtitle}>{item.subtitle}</p>
                  </div>
                  <div className={styles.auditoriaArrow}><Arrow /></div>
                </>
              );
              return item.external ? (
                <a href={item.href} key={idx} target="_blank" rel="noopener noreferrer" className={styles.auditoriaCard}>
                  {inner}
                </a>
              ) : (
                <Link href={item.href} key={idx} className={styles.auditoriaCard}>
                  {inner}
                </Link>
              );
            })}
          </div>
        </section>
      </div>
    </main>
  );
}
