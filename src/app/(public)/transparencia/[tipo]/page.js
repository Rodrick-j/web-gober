import { notFound } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import TransparencyHero from '@/components/TransparencyHero/TransparencyHero';
import DocumentosExplorer from './DocumentosExplorer';
import styles from './page.module.css';

const TIPO_LABELS = {
  rendicion_cuentas: 'Rendición Pública de Cuentas',
  actividades: 'Actividades y Campañas',
  reclamos: 'Formulario de Reclamos',
  auditoria_gador: 'Auditoría G.A.D.O.R.',
  auditoria_sedcam: 'Auditoría S.E.D.C.A.M.',
  auditoria_sedeges: 'Auditoría S.E.D.E.G.E.S.',
  auditoria_sedes: 'Auditoría S.E.D.E.S.',
};

export async function generateMetadata({ params }) {
  const { tipo } = await params;
  const label = TIPO_LABELS[tipo] || 'Documentos';
  return {
    title: `${label} - Transparencia | GADOR`,
    description: `Consulta de documentos públicos de ${label} del Gobierno Autónomo Departamental de Oruro.`,
  };
}

export default async function DocumentosPorTipoPage({ params }) {
  const { tipo } = await params;

  if (!TIPO_LABELS[tipo]) notFound();

  const supabase = await createClient();
  const { data: documentos, error } = await supabase
    .from('transparencia_documentos')
    .select('id, gestion, titulo, fecha_publicacion, archivo_url')
    .eq('tipo', tipo)
    .eq('es_publico', true)
    .order('gestion', { ascending: false })
    .order('fecha_publicacion', { ascending: false });

  if (error) console.error('Error fetching documentos:', error);

  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <TransparencyHero
        title={TIPO_LABELS[tipo]}
        description="Consulta, visualiza y descarga documentación institucional organizada por gestión."
      />

      <div className={styles.container}>
        <DocumentosExplorer documentos={documentos || []} />
      </div>
    </main>
  );
}
