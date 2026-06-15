import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';
import Image from 'next/image';
import styles from './Footer.module.css';

// Helper para el footer
const gaceta = [
  { label: 'Leyes Departamentales', href: '/gaceta/leyes' },
  { label: 'Decretos Departamentales', href: '/gaceta/decretos-departamentales' },
  { label: 'Decretos Ejecutivos', href: '/gaceta/decretos-ejecutivos' },
  { label: 'Resoluciones Administrativas', href: '/gaceta/resoluciones' },
];

export default async function Footer() {
  const supabase = await createClient();
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
    <footer className={styles.footer}>
      {/* Red band */}
      <div className={styles.topBand}>
        <div className={styles.topBandInner}>
          <div className={styles.brandBlock}>
            <div className={styles.brandLogo}>
              <Image src="/escudo_oruro.jpg" alt="Escudo de Oruro" width={60} height={60} />
            </div>
            <div>
              <div className={styles.brandName}>Gobierno Autónomo Departamental de Oruro</div>
              <div className={styles.brandSub}>Bolivia — Estado Plurinacional</div>
            </div>
          </div>
          <div className={styles.socialWrapper}>
            <div className={styles.socialTitle}>Redes de la Gobernación</div>
            <div className={styles.socialLinks}>
              <a href={redes.facebook || '#'} target="_blank" rel="noopener noreferrer" aria-label="Facebook" className={`${styles.socialLink} ${styles.fb}`}>
                <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 320 512" height="1.2em" width="1.2em" xmlns="http://www.w3.org/2000/svg"><path d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"></path></svg>
              </a>
              <a href={redes.twitter || '#'} target="_blank" rel="noopener noreferrer" aria-label="X (Twitter)" className={`${styles.socialLink} ${styles.tw}`}>
                <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 512 512" height="1.2em" width="1.2em" xmlns="http://www.w3.org/2000/svg"><path d="M389.2 48h70.6L305.6 224.2 487 464H345L233.7 318.6 106.5 464H35.8L200.7 275.5 26.8 48H172.4L272.9 180.9 389.2 48zM364.4 421.8h39.1L151.1 88h-42L364.4 421.8z"></path></svg>
              </a>
              <a href={redes.instagram || '#'} target="_blank" rel="noopener noreferrer" aria-label="Instagram" className={`${styles.socialLink} ${styles.ig}`}>
                <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 448 512" height="1.2em" width="1.2em" xmlns="http://www.w3.org/2000/svg"><path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"></path></svg>
              </a>
              <a href={redes.tiktok || '#'} target="_blank" rel="noopener noreferrer" aria-label="TikTok" className={`${styles.socialLink} ${styles.tk}`}>
                <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 448 512" height="1.2em" width="1.2em" xmlns="http://www.w3.org/2000/svg"><path d="M448,209.91a210.06,210.06,0,0,1-122.77-39.25V349.38A162.55,162.55,0,1,1,185,188.31V278.2a74.62,74.62,0,1,0,52.23,71.18V0l88,0a121.18,121.18,0,0,0,1.86,22.17h0A122.18,122.18,0,0,0,381,102.39a121.43,121.43,0,0,0,67,20.14Z"></path></svg>
              </a>
              <a href={redes.youtube || '#'} target="_blank" rel="noopener noreferrer" aria-label="YouTube" className={`${styles.socialLink} ${styles.yt}`}>
                <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 576 512" height="1.2em" width="1.2em" xmlns="http://www.w3.org/2000/svg"><path d="M549.655 124.083c-6.281-23.65-24.787-42.276-48.284-48.597C458.781 64 288 64 288 64S117.22 64 74.629 75.486c-23.497 6.322-42.003 24.947-48.284 48.597-11.412 42.867-11.412 132.305-11.412 132.305s0 89.438 11.412 132.305c6.281 23.65 24.787 41.5 48.284 47.821C117.22 448 288 448 288 448s170.78 0 213.371-11.486c23.497-6.321 42.003-24.171 48.284-47.821 11.412-42.867 11.412-132.305 11.412-132.305s0-89.438-11.412-132.305zm-317.51 213.508V175.185l142.739 81.205-142.739 81.201z"></path></svg>
              </a>
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
  );
}
