import React from 'react';
import CenefaCultural from '@/components/CenefaCultural/CenefaCultural';
import HistoriaTabs from './HistoriaTabs';

export const metadata = {
  title: 'Historia de la Institución | GADOR',
  description: 'Historia del Gobierno Autónomo Departamental de Oruro.',
};

export default function HistoriaInstitucionPage() {
  return (
    <div style={{ minHeight: '100vh', background: '#f5f5f5' }}>
      <CenefaCultural />
      <HistoriaTabs />
    </div>
  );
}
