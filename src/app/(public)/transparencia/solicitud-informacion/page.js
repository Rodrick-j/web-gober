import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import TransparencyHero from '@/components/TransparencyHero/TransparencyHero';
import SolicitudForm from './SolicitudForm';
import styles from './page.module.css';

export const metadata = {
  title: 'Solicitud de Información Pública | Transparencia | GADOR',
  description: 'Formulario en línea para solicitar acceso a información pública del Gobierno Autónomo Departamental de Oruro.',
};

const CheckIcon = () => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
    <path d="m5 12 4 4L19 6" />
  </svg>
);

export default function SolicitudInformacionPage() {
  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <TransparencyHero
        eyebrow="Acceso a la información"
        title="Solicitud de Información Pública"
        description="Presenta tu solicitud en línea de manera clara, segura y directa."
      />

      <div className={styles.container}>
        <div className={styles.layout}>
          <aside className={styles.guideCard}>
            <span className={styles.guideBadge}>Orientación ciudadana</span>
            <h2>Antes de enviar tu solicitud</h2>
            <p>
              Describe con precisión la información que necesitas. Esto ayudará a identificarla y responder tu solicitud de manera adecuada.
            </p>

            <ol className={styles.steps}>
              <li><span>1</span><div><strong>Completa tus datos</strong><small>Ingresa un correo o teléfono para recibir la respuesta.</small></div></li>
              <li><span>2</span><div><strong>Explica tu solicitud</strong><small>Indica claramente el documento o la información requerida.</small></div></li>
              <li><span>3</span><div><strong>Envía el formulario</strong><small>La Unidad de Transparencia realizará el seguimiento correspondiente.</small></div></li>
            </ol>

            <div className={styles.guarantees}>
              <span><CheckIcon /> Trámite gratuito</span>
              <span><CheckIcon /> Información protegida</span>
              <span><CheckIcon /> Seguimiento institucional</span>
            </div>
          </aside>

          <SolicitudForm />
        </div>
      </div>
    </main>
  );
}
