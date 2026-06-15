import Image from 'next/image';
import styles from './GovernorSection.module.css';

export default function GovernorSection() {
  return (
    <section className={styles.governorSection}>
      <div className={styles.container}>
        <div className={styles.textContent}>
          <h2 className={styles.title}>
            <span className={styles.goldText}>ÉDGAR SÁNCHEZ</span><br />
            <span className={styles.goldText}>AGUIRRE</span>
          </h2>
          <h3 className={styles.subtitle}>Gobernador del Departamento de Oruro</h3>
          
          <div className={styles.description}>
            <p>
              Édgar Sánchez Aguirre nació en la humilde comunidad de Lagunillas, Oruro, donde de niño pastoreaba ovejas y trabajaba vendiendo dulces o cargando maletas para ayudar a su madre. Superó las dificultades económicas estudiando hasta graduarse como ingeniero, y construyó un liderazgo político cercano a las bases sindicales y campesinas.
            </p>
            <p className={styles.unidadText}>
              ¡GOBIERNO DE UNIDAD!
            </p>
          </div>
        </div>

        <div className={styles.imageContent}>
          <div className={styles.imageWrapper}>
            <Image
              src="/gober_oruro.jpg" 
              alt="Gobernador Édgar Sánchez Aguirre"
              fill
              style={{ objectFit: 'cover', objectPosition: 'top center' }}
              className={styles.image}
              sizes="(max-width: 768px) 100vw, 50vw"
              priority
            />
          </div>
        </div>
      </div>
    </section>
  );
}
