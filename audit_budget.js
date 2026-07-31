const fs = require('fs');
const data = require('./src/data/planificacion.json');

let newPlanificacion = data.map(row => {
  let is_header = false;
  let level = 'leaf';

  if (row.actividad === '000') {
    if (row.proyecto === '0000') {
      // Potentially a Program header
      const hasChildren = data.some(d => d.municipio === row.municipio && d.prg === row.prg && (d.proyecto !== '0000' || d.actividad !== '000'));
      if (hasChildren) {
        is_header = true;
        level = 'program';
      }
    } else {
      // Potentially a Project header
      const hasChildren = data.some(d => d.municipio === row.municipio && d.prg === row.prg && d.proyecto === row.proyecto && d.actividad !== '000');
      if (hasChildren) {
        is_header = true;
        level = 'project';
      }
    }
  }

  return { ...row, is_header, level };
});

const oruro = newPlanificacion.filter(d => d.municipio === 'Oruro');
const leafSum = oruro.filter(d => !d.is_header).reduce((acc, curr) => acc + curr.monto, 0);
const headerSum = oruro.filter(d => d.is_header && d.level === 'program').reduce((acc, curr) => acc + curr.monto, 0);

console.log('Leaf Sum:', leafSum);
console.log('Program Header Sum:', headerSum);
console.log('Diff:', leafSum - headerSum);

fs.writeFileSync('./src/data/planificacion_audited.json', JSON.stringify(newPlanificacion, null, 2));
console.log('Wrote planificacion_audited.json');
