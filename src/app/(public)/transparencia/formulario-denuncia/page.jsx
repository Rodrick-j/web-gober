import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import TransparencyHero from '@/components/TransparencyHero/TransparencyHero';
import FormularioDenunciaClient from './FormularioDenunciaClient';
import styles from './formulario-denuncia.module.css';

export const metadata = {
  title: 'Formulario de Denuncia | Transparencia | GADOR',
  description: 'Formulario oficial para la presentación de denuncias por posibles actos de corrupción.',
};

export default function FormularioDenunciaPage() {
  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <TransparencyHero
        eyebrow="Canal de transparencia"
        title="Formulario de denuncia"
        description="Consulta el formulario oficial, amplíalo para revisarlo con detalle y descárgalo o imprímelo directamente."
      />
      <div className={styles.container}>
        <FormularioDenunciaClient />
      </div>
    </main>
  );
}
