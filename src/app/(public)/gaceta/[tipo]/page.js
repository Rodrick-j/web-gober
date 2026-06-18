import { createClient } from '@/lib/supabase/server';
import { notFound } from 'next/navigation';
import Navbar from '@/components/Navbar/Navbar';
import Footer from '@/components/Footer/Footer';
import GacetaClient from './GacetaClient';
import styles from './gaceta.module.css';

// Configuración de los tipos permitidos y su metadata
// dbTipo: el valor exacto del ENUM en la tabla "documentos"
const TYPE_CONFIG = {
  'leyes': {
    title: 'Leyes Departamentales',
    subtitle: 'Normativa emitida por la Asamblea Legislativa Departamental de Oruro.',
    icon: '⚖️',
    dbTipo: 'ley_departamental'
  },
  'decretos-departamentales': {
    title: 'Decretos Departamentales',
    subtitle: 'Normas de carácter general emitidas por el Gobernador.',
    icon: '📄',
    dbTipo: 'decreto_departamental'
  },
  'decretos-ejecutivos': {
    title: 'Decretos Ejecutivos',
    subtitle: 'Designaciones, creación de programas y normas administrativas internas.',
    icon: '📝',
    dbTipo: 'decreto_ejecutivo'
  },
  'resoluciones': {
    title: 'Resoluciones Administrativas',
    subtitle: 'Disposiciones específicas emitidas por las Secretarías Departamentales.',
    icon: '📌',
    dbTipo: 'resolucion_administrativa'
  }
};

export async function generateMetadata({ params }) {
  const { tipo } = await params;
  const config = TYPE_CONFIG[tipo];
  
  if (!config) {
    return { title: 'No encontrado' };
  }

  return {
    title: `${config.title} — Gaceta Oficial GADOR`,
    description: config.subtitle,
  };
}

export default async function GacetaPage({ params }) {
  const { tipo } = await params;
  const config = TYPE_CONFIG[tipo];

  // Si el tipo en la URL no coincide con ninguno, mostrar 404
  if (!config) {
    notFound();
  }

  const supabase = await createClient();
  
  // Consultar la tabla "documentos" (donde el admin guarda los documentos)
  const { data, error } = await supabase
    .from('documentos')
    .select('id, tipo, numero, titulo, descripcion, fecha_publicacion, archivo_url, descargas')
    .eq('tipo', config.dbTipo)      // Usar el valor ENUM correcto
    .eq('es_publico', true)         // Solo los públicos
    .order('fecha_publicacion', { ascending: false });

  if (error) {
    console.error("Error consultando documentos:", error.message);
  }

  // Normalizar los datos para que GacetaClient los entienda
  const documentos = (data || []).map(doc => ({
    id: doc.id,
    tipo: tipo,
    anio: new Date(doc.fecha_publicacion).getFullYear(),
    numero_documento: doc.numero,
    titulo: doc.titulo,
    descripcion: doc.descripcion || '',
    fecha_publicacion: doc.fecha_publicacion,
    archivo_pdf_url: doc.archivo_url,
  }));

  return (
    <>

      
      <main className={styles.portalContainer}>
        {/* Header Dinámico Premium */}
        <div className="container">
          <header className={styles.headerSection}>
            <div className={styles.headerIcon}>{config.icon}</div>
            <h1 className={styles.headerTitle}>{config.title}</h1>
            <p className={styles.headerSubtitle}>{config.subtitle}</p>
          </header>
          
          {/* Cliente para el Filtrado */}
          <GacetaClient 
            documentos={documentos} 
            tipoLabel={config.title} 
            icon={config.icon}
          />
        </div>
      </main>


    </>
  );
}
