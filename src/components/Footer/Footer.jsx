import { createClient } from '@/lib/supabase/public';
import Image from 'next/image';
import Link from 'next/link';
import styles from './Footer.module.css';

const FacebookIcon = ({ size = 20 }) => (
  <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
    <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z" />
  </svg>
);

const InstagramIcon = ({ size = 20 }) => (
  <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
    <rect x="2" y="2" width="20" height="20" rx="5" />
    <circle cx="12" cy="12" r="4" />
    <line x1="17.5" y1="6.5" x2="17.51" y2="6.5" />
  </svg>
);

const TiktokIcon = ({ size = 20 }) => (
  <svg width={size} height={size} viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
    <path d="M19.59 6.69a4.83 4.83 0 0 1-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 0 1-5.2 1.74 2.89 2.89 0 0 1 2.31-4.64c.3 0 .6.05.88.13V9.4a6.84 6.84 0 0 0-1-.05A6.33 6.33 0 0 0 5 20.1a6.34 6.34 0 0 0 10.86-4.43v-7a8.16 8.16 0 0 0 4.77 1.52v-3.4a4.85 4.85 0 0 1-1.04-.1z" />
  </svg>
);

const YoutubeIcon = ({ size = 20 }) => (
  <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
    <path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33 2.78 2.78 0 0 0 1.94 2c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.33 29 29 0 0 0-.46-5.33z" />
    <polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02" />
  </svg>
);

const LocationIcon = () => (
  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.9" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
    <path d="M20 10c0 5-8 12-8 12S4 15 4 10a8 8 0 1 1 16 0Z" />
    <circle cx="12" cy="10" r="2.5" />
  </svg>
);

const PhoneIcon = () => (
  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.9" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
    <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.8 19.8 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6A19.8 19.8 0 0 1 2.12 4.18 2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.12.9.33 1.78.62 2.63a2 2 0 0 1-.45 2.11L8 9.73a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.85.29 1.73.5 2.63.62A2 2 0 0 1 22 16.92Z" />
  </svg>
);

const MessageIcon = () => (
  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.9" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
    <path d="M21 11.5a8.4 8.4 0 0 1-9 8.5 9.5 9.5 0 0 1-4-1l-5 2 2-5a9.5 9.5 0 0 1-1-4 8.4 8.4 0 0 1 8.5-9 8.4 8.4 0 0 1 8.5 8.5Z" />
    <path d="M8.5 12h.01M12 12h.01M15.5 12h.01" />
  </svg>
);

const FaxIcon = () => (
  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.9" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
    <path d="M6 9V2h12v7M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2" />
    <rect x="6" y="14" width="12" height="8" rx="1" />
    <path d="M17 12h.01" />
  </svg>
);

const MailIcon = () => (
  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.9" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
    <rect x="2.5" y="4.5" width="19" height="15" rx="2" />
    <path d="m3.5 6 8.5 7 8.5-7" />
  </svg>
);

const ArrowIcon = () => (
  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
    <path d="M5 12h14M13 6l6 6-6 6" />
  </svg>
);

const institutionLinks = [
  { label: 'Historia, Misión y Visión', href: '/institucion/historia-institucion' },
  { label: 'Organigrama', href: '/institucion/organigrama' },
  { label: 'Nómina de Autoridades', href: '/institucion/autoridades' },
  { label: 'Publicaciones', href: '/publicaciones' },
  { label: 'Contrataciones', href: '/contrataciones' },
  { label: 'Datos y Estadísticas', href: '/datos-estadisticas' },
];

const transparencyLinks = [
  { label: 'Portal de Transparencia', href: '/transparencia' },
  { label: 'Unidad de Transparencia (UTLCC)', href: '/transparencia/unidad' },
  { label: 'Solicitud de Información', href: '/transparencia/solicitud-informacion' },
  { label: 'Rendición Pública de Cuentas', href: '/transparencia/rendicion_cuentas' },
  { label: 'Auditoría Interna', href: '/auditoria' },
];

const hasSocialUrl = (url) => Boolean(url && url !== '#');

export default async function Footer() {
  const supabase = createClient();
  const { data: configRows } = await supabase
    .from('configuracion_global')
    .select('clave, valor')
    .in('clave', ['redes_sociales', 'contacto_oficial']);

  const redes = configRows?.find((row) => row.clave === 'redes_sociales')?.valor
    || { facebook: '#', twitter: '#', youtube: '#', instagram: '#', tiktok: '#' };
  const contacto = configRows?.find((row) => row.clave === 'contacto_oficial')?.valor || {};

  const { data: dbSecretarias } = await supabase
    .from('secretarias')
    .select('nombre_corto, slug')
    .eq('activo', true)
    .order('orden', { ascending: true });

  const secretariasLinks = dbSecretarias || [];
  const address = contacto.direccion || 'Calle Presidente Montes, entre Bolívar y Adolfo Mier, Oruro, Bolivia';
  const phone = contacto.telefono || '(591-2) 5270-000';
  const email = contacto.email || 'contacto@oruro.gob.bo';
  const phoneHref = String(phone).replace(/[^\d+]/g, '');
  const whatsappHref = contacto.whatsapp
    ? String(contacto.whatsapp).replace(/\D/g, '')
    : '';

  return (
    <footer className={styles.footer} aria-label="Pie de página institucional">
      <div className={styles.topAccent} aria-hidden="true" />
      <span className={[styles.ambientGlow, styles.glowOne].join(' ')} aria-hidden="true" />
      <span className={[styles.ambientGlow, styles.glowTwo].join(' ')} aria-hidden="true" />

      <div className={styles.footerInner}>


        <div className={styles.linksGrid}>
          <section className={styles.brandColumn} aria-label="Contacto institucional">
            <div className={styles.logoWrap}>
              <Image
                src="/logo-gador.png"
                alt="Gobierno Autónomo Departamental de Oruro"
                width={260}
                height={145}
                className={styles.logo}
              />
            </div>

            <p className={styles.brandDescription}>
              Trabajamos por un Oruro unido, transparente y al servicio de su gente.
            </p>

            <div className={styles.contactInfo}>
              <div className={styles.contactItem}>
                <span className={styles.contactIcon}><LocationIcon /></span>
                <span>{address}</span>
              </div>
              <a href={`tel:${phoneHref}`} className={styles.contactItem}>
                <span className={styles.contactIcon}><PhoneIcon /></span>
                <span>{phone}{contacto.call_center ? ` · Call center ${contacto.call_center}` : ''}</span>
              </a>
              {contacto.whatsapp && (
                <a
                  href={`https://wa.me/${whatsappHref}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className={styles.contactItem}
                >
                  <span className={styles.contactIcon}><MessageIcon /></span>
                  <span>WhatsApp {contacto.whatsapp}</span>
                </a>
              )}
              {contacto.fax && (
                <div className={styles.contactItem}>
                  <span className={styles.contactIcon}><FaxIcon /></span>
                  <span>Fax {contacto.fax}</span>
                </div>
              )}
              <a href={`mailto:${email}`} className={styles.contactItem}>
                <span className={styles.contactIcon}><MailIcon /></span>
                <span>{email}</span>
              </a>
            </div>

            <div className={styles.socialBlock}>
              <span className={styles.socialLabel}>Conecta con nosotros</span>
              <div className={styles.socialIconsRow}>
                {hasSocialUrl(redes.facebook) && <a href={redes.facebook} target="_blank" rel="noopener noreferrer" aria-label="Facebook"><FacebookIcon /></a>}
                {hasSocialUrl(redes.instagram) && <a href={redes.instagram} target="_blank" rel="noopener noreferrer" aria-label="Instagram"><InstagramIcon /></a>}
                {hasSocialUrl(redes.tiktok) && <a href={redes.tiktok} target="_blank" rel="noopener noreferrer" aria-label="TikTok"><TiktokIcon /></a>}
                {hasSocialUrl(redes.youtube) && <a href={redes.youtube} target="_blank" rel="noopener noreferrer" aria-label="YouTube"><YoutubeIcon /></a>}
              </div>
            </div>
          </section>

          <nav className={styles.mobileQuickLinks} aria-label="Accesos rápidos del pie de página">
            <Link href="/institucion/historia-institucion" className={styles.mobileQuickLink}>
              <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.9" aria-hidden="true">
                <path d="M3 10h18M5 10v9M9 10v9M15 10v9M19 10v9M2 21h20M12 3 2 8h20L12 3Z" />
              </svg>
              <span>Historia institucional</span>
            </Link>
            <Link href="/gaceta/leyes" className={styles.mobileQuickLink}>
              <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.9" aria-hidden="true">
                <path d="M6 2h9l4 4v16H6z" />
                <path d="M14 2v5h5M9 12h7M9 16h7" />
              </svg>
              <span>Gaceta Oficial</span>
            </Link>
          </nav>

          <nav className={[styles.linkColumn, styles.secretariasColumn].join(' ')} aria-labelledby="footer-secretarias">
            <div className={styles.columnHeading}>
              <span className={styles.headingIcon} aria-hidden="true">
                <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8">
                  <path d="M3 21h18M5 21V9l7-5 7 5v12M9 21v-7h6v7" />
                </svg>
              </span>
              <h3 id="footer-secretarias">Secretarías</h3>
            </div>
            <ul className={styles.secretariasList}>
              {secretariasLinks.map((secretaria) => (
                <li key={secretaria.slug}>
                  <Link href={`/secretarias/${secretaria.slug}`} className={styles.footerLink}>
                    <span>{secretaria.nombre_corto}</span>
                    <ArrowIcon />
                  </Link>
                </li>
              ))}
            </ul>
          </nav>

          <nav className={styles.linkColumn} aria-labelledby="footer-institucion">
            <div className={styles.columnHeading}>
              <span className={styles.headingIcon} aria-hidden="true">
                <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8">
                  <path d="M3 10h18M5 10v9M9 10v9M15 10v9M19 10v9M2 21h20M12 3 2 8h20L12 3Z" />
                </svg>
              </span>
              <h3 id="footer-institucion">Institución</h3>
            </div>
            <ul>
              {institutionLinks.map((item) => (
                <li key={item.label}>
                  <Link href={item.href} className={styles.footerLink}>
                    <span>{item.label}</span>
                    <ArrowIcon />
                  </Link>
                </li>
              ))}
            </ul>
          </nav>

          <nav className={styles.linkColumn} aria-labelledby="footer-transparencia">
            <div className={styles.columnHeading}>
              <span className={styles.headingIcon} aria-hidden="true">
                <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8">
                  <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10Z" />
                  <path d="m9 12 2 2 4-4" />
                </svg>
              </span>
              <h3 id="footer-transparencia">Transparencia</h3>
            </div>
            <ul>
              {transparencyLinks.map((item) => (
                <li key={item.label}>
                  <Link href={item.href} className={styles.footerLink}>
                    <span>{item.label}</span>
                    <ArrowIcon />
                  </Link>
                </li>
              ))}
            </ul>
          </nav>
        </div>
      </div>

      <div className={styles.bottomBar}>
        <div className={styles.bottomInner}>
          <div className={styles.copyright}>
            <span className={styles.flagMark} aria-hidden="true"><i /><i /><i /></span>
            <span>
              <strong>© 2026 Gobierno Autónomo Departamental de Oruro</strong>
              <small>Todos los derechos reservados · Estado Plurinacional de Bolivia</small>
            </span>
          </div>
          <div className={styles.bottomLinks}>
            <Link href="/transparencia">Transparencia</Link>
            <Link href="/transparencia/solicitud-informacion">Solicitud de información</Link>
            <Link href="/transparencia/unidad">Denuncias y ética</Link>
          </div>
        </div>
      </div>
    </footer>
  );
}
