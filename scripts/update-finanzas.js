const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function updateFinanzas() {
  const { data, error } = await supabase
    .from('secretarias')
    .update({
      descripcion: 'Nuestra Secretaría tiene la responsabilidad de garantizar una eficiente, transparente y responsable administración de todos los recursos financieros y humanos del Gobierno Autónomo Departamental de Oruro.',
      mision: 'Administrar de manera transparente, eficiente y responsable los recursos económicos, financieros, materiales y humanos de la Gobernación. Nuestra misión es garantizar que la inversión pública se ejecute en estricto apego a las normativas legales vigentes, brindando el soporte administrativo necesario para el funcionamiento institucional.',
      vision: 'Ser la Secretaría modelo a nivel nacional en la gestión administrativa y financiera pública, reconocida por sus altos estándares de transparencia, innovación tecnológica en procesos contables y su compromiso inquebrantable con el desarrollo del departamento de Oruro a través de una ejecución presupuestaria óptima.'
    })
    .eq('slug', 'administracion-finanzas-publicas');

  if (error) {
    console.error('Error updating:', error);
  } else {
    console.log('Successfully updated Finanzas.');
  }
}

updateFinanzas();
