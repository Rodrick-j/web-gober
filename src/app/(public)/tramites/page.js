import React from 'react';
import TramitesClient from './TramitesClient';

export const metadata = {
  title: 'Trámites en Línea y Servicios Ciudadanos | Gobernación de Oruro',
  description: 'Consulta los requisitos, costos y procedimientos oficiales para realizar trámites departamentales de minería, medio ambiente, personería jurídica, salud y transportes ante la Gobernación de Oruro.',
};

export default function TramitesPage() {
  return <TramitesClient />;
}
