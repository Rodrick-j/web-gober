import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';
import Navbar from '@/components/Navbar/Navbar';
import Footer from '@/components/Footer/Footer';
import styles from './Secretarias.module.css';

export const metadata = {
  title: 'Secretarías Departamentales | GADOR',
  description: 'Conoce las diferentes Secretarías que conforman el Gobierno Autónomo Departamental de Oruro.',
};

export const revalidate = 60; // Revalidar la página cada 60 segundos

export default async function SecretariasHubPage() {
  const supabase = await createClient();

  const { data: secretarias, error } = await supabase
    .from('secretarias')
    .select('*')
    .eq('activo', true)
    .order('orden', { ascending: true });

  if (error) {
    console.error('Error fetching secretarias:', error);
  }

  return (
    <>

      <div style={{ backgroundColor: '#fafafa', minHeight: '100vh', paddingTop: '80px' }}>
        <div className={styles.hubContainer}>
          <div className={styles.hubHeader}>
            <h1 className={styles.hubTitle}>Nuestras Secretarías</h1>
            <p className={styles.hubSubtitle}>
              Conoce el trabajo, la misión y los servicios que ofrece cada una de las
              Secretarías Departamentales del Gobierno Autónomo Departamental de Oruro.
            </p>
          </div>

          {secretarias && secretarias.length > 0 ? (
            <div className={styles.grid}>
              {secretarias.map((sec) => (
                <Link href={`/secretarias/${sec.slug}`} key={sec.id} className={styles.card}>
                  <div className={styles.colorBar} style={{ backgroundColor: sec.color_acento || '#8B0000' }}></div>

                  <div className={styles.cardHeader}>
                    <div className={styles.iconWrapper} style={{ color: sec.color_acento || '#8B0000', backgroundColor: `${sec.color_acento}15` }}>
                      {sec.icono}
                    </div>
                    <h2 className={styles.cardTitle}>{sec.nombre_corto}</h2>
                  </div>

                  <p className={styles.cardDescription}>
                    {sec.descripcion || 'Sin descripción disponible por el momento.'}
                  </p>

                  <div className={styles.cardFooter}>
                    <div className={styles.autoridad}>
                      {sec.secretario_foto_url ? (
                        <img
                          src={sec.secretario_foto_url}
                          alt={sec.secretario_nombre || 'Autoridad'}
                          className={styles.autoridadFoto}
                        />
                      ) : (
                        <div className={styles.autoridadFoto} style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '1rem' }}>👤</div>
                      )}
                      <span>{sec.secretario_nombre ? `Sec. ${sec.secretario_nombre.split(' ')[0]}` : 'Autoridad no designada'}</span>
                    </div>
                    <span className={styles.btnVerMas} style={{ color: sec.color_acento || '#8B0000' }}>
                      Ver portal &rarr;
                    </span>
                  </div>
                </Link>
              ))}
            </div>
          ) : (
            <div style={{ textAlign: 'center', padding: '4rem', color: '#666', background: 'white', borderRadius: '12px', border: '1px dashed #ccc' }}>
              <h2>Aún no hay Secretarías registradas</h2>
              <p>Por favor, ingrese al Panel de Administrador para configurarlas.</p>
            </div>
          )}
        </div>
      </div>

    </>
  );
}
