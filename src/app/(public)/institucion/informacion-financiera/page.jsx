import React from 'react';
import Link from 'next/link';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import CategoriaHeader from '../[categoria]/CategoriaHeader';
import styles from '../[categoria]/CategoriaInstitucion.module.css';

export const metadata = {
  title: 'Información Financiera | Institución | GADOR',
  description: 'Módulo de Información Financiera del Gobierno Autónomo Departamental de Oruro.',
};

export default function InformacionFinancieraPage() {
  return (
    <>
      <main className={styles.mainContainer}>
        <AnimatedBackground />
        <CategoriaHeader titulo="Información Financiera" slug="informacion-financiera" />

        <div className={styles.contentWrapper} style={{ maxWidth: '1000px', margin: '0 auto', background: 'transparent', boxShadow: 'none' }}>
          <div style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))',
            gap: '2rem',
            padding: '1rem'
          }}>
            {/* ESCALA SALARIAL */}
            <Link href="/institucion/escala-salarial" style={{ textDecoration: 'none' }}>
              <div style={{
                background: '#fff', borderRadius: '12px', overflow: 'hidden',
                boxShadow: '0 8px 24px rgba(0,0,0,0.1)', transition: 'transform 0.2s',
                display: 'flex', flexDirection: 'column'
              }}>
                <div style={{ padding: '1.5rem', textAlign: 'center', borderBottom: '2px solid #9c0720' }}>
                  <h3 style={{ margin: 0, color: '#1a1a2e', fontSize: '1.2rem', fontWeight: 800 }}>ESCALA SALARIAL</h3>
                </div>
                <div style={{ height: '220px', backgroundImage: "url('/informacion-financiera/escala_salarial.jpg')", backgroundSize: 'cover', backgroundPosition: 'center' }}></div>
                <div style={{ padding: '1rem', background: '#9c0720', color: '#fff', textAlign: 'center', fontWeight: 'bold' }}>
                  📄 VER DOCUMENTOS
                </div>
              </div>
            </Link>

            {/* PRESUPUESTO INSTITUCIONAL */}
            <Link href="/institucion/presupuesto" style={{ textDecoration: 'none' }}>
              <div style={{
                background: '#fff', borderRadius: '12px', overflow: 'hidden',
                boxShadow: '0 8px 24px rgba(0,0,0,0.1)', transition: 'transform 0.2s',
                display: 'flex', flexDirection: 'column'
              }}>
                <div style={{ padding: '1.5rem', textAlign: 'center', borderBottom: '2px solid #9c0720' }}>
                  <h3 style={{ margin: 0, color: '#1a1a2e', fontSize: '1.2rem', fontWeight: 800 }}>PRESUPUESTO INSTITUCIONAL</h3>
                </div>
                <div style={{ height: '220px', backgroundImage: "url('/informacion-financiera/presupuesto_institucional.jpg')", backgroundSize: 'cover', backgroundPosition: 'center' }}></div>
                <div style={{ padding: '1rem', background: '#9c0720', color: '#fff', textAlign: 'center', fontWeight: 'bold' }}>
                  📄 VER DOCUMENTOS
                </div>
              </div>
            </Link>

            {/* EJECUCIÓN PRESUPUESTARIA */}
            <Link href="/institucion/ejecucion-presupuestaria" style={{ textDecoration: 'none' }}>
              <div style={{
                background: '#fff', borderRadius: '12px', overflow: 'hidden',
                boxShadow: '0 8px 24px rgba(0,0,0,0.1)', transition: 'transform 0.2s',
                display: 'flex', flexDirection: 'column'
              }}>
                <div style={{ padding: '1.5rem', textAlign: 'center', borderBottom: '2px solid #9c0720' }}>
                  <h3 style={{ margin: 0, color: '#1a1a2e', fontSize: '1.2rem', fontWeight: 800 }}>EJECUCIÓN PRESUPUESTARIA</h3>
                </div>
                <div style={{ height: '220px', backgroundImage: "url('/informacion-financiera/ejecucion_presupuestaria.jpg')", backgroundSize: 'cover', backgroundPosition: 'center' }}></div>
                <div style={{ padding: '1rem', background: '#9c0720', color: '#fff', textAlign: 'center', fontWeight: 'bold' }}>
                  📄 VER DOCUMENTOS
                </div>
              </div>
            </Link>

            {/* CONVOCATORIA DE BIENES Y SERVICIOS */}
            <Link href="/institucion/bienes-y-servicios" style={{ textDecoration: 'none' }}>
              <div style={{
                background: '#fff', borderRadius: '12px', overflow: 'hidden',
                boxShadow: '0 8px 24px rgba(0,0,0,0.1)', transition: 'transform 0.2s',
                display: 'flex', flexDirection: 'column'
              }}>
                <div style={{ padding: '1.5rem', textAlign: 'center', borderBottom: '2px solid #9c0720' }}>
                  <h3 style={{ margin: 0, color: '#1a1a2e', fontSize: '1.2rem', fontWeight: 800 }}>CONVOCATORIA DE BIENES Y SERVICIOS</h3>
                </div>
                <div style={{ height: '220px', backgroundImage: "url('/informacion-financiera/bienes_servicios.jpg')", backgroundSize: 'cover', backgroundPosition: 'center' }}></div>
                <div style={{ padding: '1rem', background: '#9c0720', color: '#fff', textAlign: 'center', fontWeight: 'bold' }}>
                  📄 VER DOCUMENTOS
                </div>
              </div>
            </Link>

          </div>
        </div>
      </main>
    </>
  );
}
