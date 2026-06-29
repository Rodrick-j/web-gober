import { createClient } from '@/lib/supabase/public';
import Link from 'next/link';
import Image from 'next/image';
import styles from './Footer.module.css';
import SocialFeeds from '../SocialFeeds/SocialFeeds';

// Helper para el footer
const gaceta = [
  { label: 'Leyes Departamentales', href: '/gaceta/leyes' },
  { label: 'Decretos Departamentales', href: '/gaceta/decretos-departamentales' },
  { label: 'Decretos Ejecutivos', href: '/gaceta/decretos-ejecutivos' },
  { label: 'Resoluciones Administrativas', href: '/gaceta/resoluciones' },
];

export default async function Footer() {
  const supabase = createClient();
  const { data: configData } = await supabase
    .from('configuracion_global')
    .select('*')
    .eq('clave', 'redes_sociales')
    .single();

  const redes = configData?.valor || { facebook: '#', twitter: '#', youtube: '#', instagram: '#', tiktok: '#' };

  // Fetch Secretarias activas para el footer
  const { data: dbSecretarias } = await supabase
    .from('secretarias')
    .select('nombre_corto, slug')
    .eq('activo', true)
    .order('orden', { ascending: true });
    
  const secretariasLinks = dbSecretarias || [];

  return (
    <>
      <SocialFeeds redes={redes} />
      <footer className={styles.footer}>
        {/* Red band */}
        <div className={styles.topBand}>
          <div className={styles.topBandInner}>
            <div className={styles.brandBlock}>
              <div className={styles.brandLogo}>
                <Image src="/footer_icon.jpg" alt="Logo de Oruro" width={60} height={60} quality={60} />
              </div>
              <div>
                <div className={styles.brandName}>Gobierno Autónomo Departamental de Oruro</div>
                <div className={styles.brandSub}>Bolivia — Estado Plurinacional</div>
              </div>
            </div>
          </div>
        </div>

      {/* Links Grid */}
      <div className={styles.linksGrid}>
        <div>
          <h4 className={styles.colTitle}>Secretarías</h4>
          <ul>
            {secretariasLinks.map((s) => (
              <li key={s.slug}><Link href={`/secretarias/${s.slug}`} className={styles.footerLink}>{s.nombre_corto}</Link></li>
            ))}
          </ul>
        </div>
        <div>
          <h4 className={styles.colTitle}>Gaceta Oficial</h4>
          <ul>
            {gaceta.map((g) => (
              <li key={g.label}><Link href={g.href} className={styles.footerLink}>{g.label}</Link></li>
            ))}
          </ul>
        </div>
        <div>
          <h4 className={styles.colTitle}>Institución</h4>
          <ul>
            {[
              { label: 'El Gobernador', href: '/institucion/gobernador' },
              { label: 'Historia', href: '/institucion/historia' },
              { label: 'Organigrama', href: '/institucion/organigrama' },
              { label: 'Transparencia', href: '/transparencia' },
            ].map((item) => (
              <li key={item.label}><Link href={item.href} className={styles.footerLink}>{item.label}</Link></li>
            ))}
          </ul>
        </div>
        <div>
          <h4 className={styles.colTitle}>Contacto</h4>
          <div className={styles.contactInfo}>
            <div className={styles.contactItem}>
              <span className={styles.contactIcon}>📍</span>
              <span>Plaza 10 de Febrero s/n<br/>Oruro, Bolivia</span>
            </div>
            <div className={styles.contactItem}>
              <span className={styles.contactIcon}>📞</span>
              <span>(591-2) 5270-000</span>
            </div>
            <div className={styles.contactItem}>
              <span className={styles.contactIcon}>✉️</span>
              <span>contacto@oruro.gob.bo</span>
            </div>
            <div className={styles.contactItem}>
              <span className={styles.contactIcon}>🕐</span>
              <span>Lun–Vie: 8:00 – 16:00</span>
            </div>
          </div>
        </div>
      </div>

      {/* Bottom bar */}
      <div className={styles.bottomBar}>
        <span>© 2026 Gobierno Autónomo Departamental de Oruro. Todos los derechos reservados.</span>
        <div className={styles.bottomLinks}>
          <a href="#">Política de Privacidad</a>
          <a href="#">Términos de Uso</a>
          <a href="#">Accesibilidad</a>
        </div>
      </div>
    </footer>
    </>
  );
}
