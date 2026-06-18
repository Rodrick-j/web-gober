"use client";

import { ResponsivePie } from '@nivo/pie';

// Datos de ejemplo
const data = [
  { id: "Salud", label: "Salud", value: 35, color: "hsl(210, 70%, 50%)" },
  { id: "Educación", label: "Educación", value: 45, color: "hsl(140, 70%, 50%)" },
  { id: "Infraestructura", label: "Infraestructura", value: 15, color: "hsl(45, 70%, 50%)" },
  { id: "Seguridad", label: "Seguridad", value: 5, color: "hsl(340, 70%, 50%)" }
];

export default function EstadisticasChart() {
  return (
    <section style={{ padding: '60px 20px', backgroundColor: '#f9fafb' }}>
      <div style={{ maxWidth: '1200px', margin: '0 auto' }}>
        <div style={{ textAlign: 'center', marginBottom: '40px' }}>
          <h2 style={{ fontSize: '2.5rem', fontWeight: 'bold', color: '#1f2937', marginBottom: '10px' }}>
            Transparencia y Gestión
          </h2>
          <p style={{ color: '#6b7280', fontSize: '1.1rem' }}>
            Distribución de la inversión pública departamental
          </p>
        </div>

        <div style={{ height: '500px', width: '100%', background: '#fff', borderRadius: '24px', padding: '30px', boxShadow: '0 10px 40px rgba(0,0,0,0.08)' }}>
          <ResponsivePie
            data={data}
            margin={{ top: 40, right: 80, bottom: 80, left: 80 }}
            innerRadius={0.5} // Esto la hace ver como un anillo (donut), que se ve más elegante
            padAngle={1.5}
            cornerRadius={8}
            activeOuterRadiusOffset={12}
            colors={{ scheme: 'nivo' }} // Usa la paleta de colores vibrantes por defecto
            borderWidth={1}
            borderColor={{
                from: 'color',
                modifiers: [ [ 'darker', 0.2 ] ]
            }}
            arcLinkLabelsSkipAngle={10}
            arcLinkLabelsTextColor="#333333"
            arcLinkLabelsThickness={2}
            arcLinkLabelsColor={{ from: 'color' }}
            arcLabelsSkipAngle={10}
            arcLabelsTextColor={{
                from: 'color',
                modifiers: [ [ 'darker', 2 ] ]
            }}
            // Configuración de animaciones que lo hace ver fluido
            transitionMode="pushIn"
            legends={[
                {
                    anchor: 'bottom',
                    direction: 'row',
                    justify: false,
                    translateX: 0,
                    translateY: 56,
                    itemsSpacing: 20,
                    itemWidth: 100,
                    itemHeight: 18,
                    itemTextColor: '#666',
                    itemDirection: 'left-to-right',
                    itemOpacity: 1,
                    symbolSize: 18,
                    symbolShape: 'circle',
                    effects: [
                        {
                            on: 'hover',
                            style: {
                                itemTextColor: '#000'
                            }
                        }
                    ]
                }
            ]}
          />
        </div>
      </div>
    </section>
  );
}
