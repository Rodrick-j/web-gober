import React from 'react';
import CenefaCultural from '@/components/CenefaCultural/CenefaCultural';
import { createClient } from '@/lib/supabase/public';
import HistoriaTabs from './HistoriaTabs';

export const revalidate = 60;

export const metadata = {
  title: 'Historia de la Institución | GADOR',
  description: 'Historia, misión, visión, valores, objetivos y memoria institucional del Gobierno Autónomo Departamental de Oruro.',
};

const CLAVES = [
  'mision',
  'vision',
  'valores_principios',
  'objetivos_institucionales',
  'resena_historica',
  'memoria_institucional',
];

export default async function HistoriaInstitucionPage() {
  let contenido = {};
  try {
    const supabase = createClient();
    const { data } = await supabase
      .from('contenido_institucional')
      .select('clave, titulo, cuerpo, archivo_url')
      .in('clave', CLAVES);
    (data || []).forEach((r) => { contenido[r.clave] = r; });
  } catch {
    contenido = {};
  }

  return (
    <div style={{ minHeight: '100vh', background: '#f5f5f5' }}>
      <CenefaCultural />
      <HistoriaTabs contenido={contenido} />
    </div>
  );
}
