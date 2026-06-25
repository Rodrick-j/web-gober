"use client";

import dynamic from 'next/dynamic';

const EstadisticasChart = dynamic(
  () => import('./EstadisticasChart'),
  { ssr: false }
);

export default function EstadisticasChartWrapper() {
  return <EstadisticasChart />;
}
