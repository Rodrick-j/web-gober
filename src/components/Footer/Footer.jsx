import { createClient } from '@/lib/supabase/public';
import Link from 'next/link';
import Image from 'next/image';
import styles from './Footer.module.css';
import SocialFeeds from '../SocialFeeds/SocialFeeds';

const FacebookIcon = ({ size = 20 }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"/>
  </svg>
);
const TwitterIcon = ({ size = 20 }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"/>
  </svg>
);
const InstagramIcon = ({ size = 20 }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <rect x="2" y="2" width="20" height="20" rx="5" ry="5"/>
    <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/>
    <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"/>
  </svg>
);
const YoutubeIcon = ({ size = 20 }) => (
  <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
    <path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33 2.78 2.78 0 0 0 1.94 2c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.33 29 29 0 0 0-.46-5.33z"/>
    <polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02"/>
  </svg>
);

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
      {/* Links Grid */}
      <div className={styles.linksGrid}>
        {/* Brand & Contact Column */}
        <div className={styles.brandColumn}>
          <Image 
            src="/logo-gador.png" 
            alt="Gobierno Autónomo Departamental de Oruro" 
            width={160} 
            height={90} 
            style={{ objectFit: 'contain', width: 'auto', height: 'auto', maxWidth: '160px', maxHeight: '90px', marginBottom: '1rem', filter: 'drop-shadow(0 4px 6px rgba(0,0,0,0.3))' }} 
          />
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
          </div>
          <div className={styles.socialIconsRow}>
            {redes.facebook !== '#' && <a href={redes.facebook} target="_blank" rel="noreferrer" aria-label="Facebook"><FacebookIcon size={20} /></a>}
            {redes.twitter !== '#' && <a href={redes.twitter} target="_blank" rel="noreferrer" aria-label="Twitter"><TwitterIcon size={20} /></a>}
            {redes.youtube !== '#' && <a href={redes.youtube} target="_blank" rel="noreferrer" aria-label="YouTube"><YoutubeIcon size={20} /></a>}
            {redes.instagram !== '#' && <a href={redes.instagram} target="_blank" rel="noreferrer" aria-label="Instagram"><InstagramIcon size={20} /></a>}
          </div>
        </div>

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
