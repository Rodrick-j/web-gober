require('dotenv').config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const updates = [
  {
    slug: 'obras-publicas',
    mision: 'Planificar, diseñar, ejecutar y supervisar proyectos de infraestructura vial, civil y arquitectónica con altos estándares de calidad, eficiencia y transparencia, para promover el desarrollo socioeconómico y mejorar la conectividad del Departamento de Oruro.',
    vision: 'Ser la institución pública referente a nivel nacional en la gestión eficiente, transparente e innovadora de obras públicas, dotando al Departamento de Oruro de una infraestructura moderna, resiliente y sostenible que impulse el desarrollo integral de sus habitantes.'
  },
  {
    slug: 'medio-ambiente-agua-madre-tierra',
    mision: 'Proteger, conservar y restaurar los ecosistemas del departamento, garantizando la gestión integral y sustentable de los recursos hídricos, la biodiversidad y el medio ambiente, promoviendo el equilibrio armónico con la Madre Tierra.',
    vision: 'Consolidar al Departamento de Oruro como un territorio sustentable, resiliente al cambio climático y protector de su riqueza natural, donde la sociedad convive en plena armonía y respeto con la Madre Tierra, garantizando agua y un medio ambiente sano para las futuras generaciones.'
  },
  {
    slug: 'mineria-metalurgia-recursos-energeticos',
    mision: 'Promover y fortalecer el desarrollo minero, metalúrgico y energético del departamento de manera responsable, competitiva y sustentable, impulsando la industrialización y generando valor agregado en beneficio del pueblo orureño.',
    vision: 'Ser el departamento líder en el sector minero, metalúrgico y de energías alternativas a nivel nacional, reconocido por su innovación tecnológica, responsabilidad socioambiental y su capacidad para transformar sus recursos naturales en desarrollo humano y económico sostenible.'
  },
  {
    slug: 'desarrollo-social-seguridad-alimentaria',
    mision: 'Diseñar, coordinar y ejecutar políticas y programas integrales de desarrollo social que garanticen la seguridad y soberanía alimentaria, la equidad de género, la inclusión y la protección de los sectores más vulnerables del departamento.',
    vision: 'Alcanzar un Departamento de Oruro equitativo, inclusivo y sin pobreza extrema, donde todos sus habitantes ejerzan plenamente sus derechos, gocen de seguridad alimentaria nutricional y cuenten con igualdad de oportunidades para su bienestar integral.'
  }
];

async function update() {
  for (const item of updates) {
    const res = await fetch(`${supabaseUrl}/rest/v1/secretarias?slug=eq.${item.slug}`, {
      method: 'PATCH',
      headers: {
        'apikey': supabaseKey,
        'Authorization': `Bearer ${supabaseKey}`,
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
      },
      body: JSON.stringify({
        mision: item.mision,
        vision: item.vision
      })
    });
    
    if (res.ok) {
      console.log(`Actualizado correctamente: ${item.slug}`);
    } else {
      const error = await res.text();
      console.error(`Error al actualizar ${item.slug}:`, error);
    }
  }
}

update();
