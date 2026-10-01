import { createClient } from '@/lib/supabase/server';
import TransparenciaClientHub from './TransparenciaClientHub';
import { getDocumentosRendicionCuentas } from '@/data/transparenciaRendicionCuentas';

export const revalidate = 60;

export const metadata = {
  title: 'Transparencia | GADOR',
  description: 'Portal de Transparencia del Gobierno Autónomo Departamental de Oruro. Acceso a información pública, rendición de cuentas y lucha contra la corrupción.',
};

export default async function TransparenciaPage() {
  const supabase = await createClient();

  // Fetch Unidad data
  let unidadData = null;
  let encargadoData = null;
  try {
    const { data: instData } = await supabase
      .from('contenido_institucional')
      .select('clave, titulo, cuerpo, archivo_url')
      .in('clave', ['unidad_transparencia', 'encargado_mensajes']);
    (instData || []).forEach((row) => {
      if (row.clave === 'unidad_transparencia') unidadData = row;
      if (row.clave === 'encargado_mensajes') encargadoData = row;
    });
  } catch (e) {
    console.error('Error fetching unidad data:', e);
  }

  // Fetch Actividades
  let actividadesDocumentos = [];
  try {
    const { data: actData } = await supabase
      .from('transparencia_documentos')
      .select('id, gestion, titulo, fecha_publicacion, archivo_url')
      .eq('tipo', 'actividades')
      .eq('es_publico', true)
      .order('gestion', { ascending: false })
      .order('fecha_publicacion', { ascending: false });
    
    actividadesDocumentos = (actData || []).map(doc => ({
      id: doc.id,
      anio: doc.gestion || parseInt(doc.fecha_publicacion?.substring(0, 4) || new Date().getFullYear()),
      numero_documento: 'Transparencia',
      titulo: doc.titulo,
      descripcion: '',
      fecha_publicacion: doc.fecha_publicacion,
      archivo_pdf_url: encodeURI(doc.archivo_url || ''),
    }));
  } catch (e) {
    console.error('Error fetching actividades:', e);
  }

  // Fetch Rendición Cuentas (from local data)
  const rendicionDocumentos = getDocumentosRendicionCuentas();

  return (
    <TransparenciaClientHub 
      unidadData={unidadData}
      encargadoData={encargadoData}
      rendicionDocumentos={rendicionDocumentos}
      actividadesDocumentos={actividadesDocumentos}
    />
  );
}
