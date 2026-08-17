const fs = require('fs');
const path = require('path');
const pdf = require('pdf-parse');

const dir = 'C:\\gaceta\\DECRETOS\\DECRETOS DEPARTAMENTALES\\3-Decretos Ejecutivos Departamentales\\GESTION 2021';
const files = fs.readdirSync(dir).slice(0, 3);

const meses = {
  'enero': '01', 'febrero': '02', 'marzo': '03', 'abril': '04', 'mayo': '05', 'junio': '06',
  'julio': '07', 'agosto': '08', 'septiembre': '09', 'octubre': '10', 'noviembre': '11', 'diciembre': '12'
};

async function test() {
  for (const file of files) {
    const filePath = path.join(dir, file);
    try {
      const dataBuffer = fs.readFileSync(filePath);
      const data = await pdf(dataBuffer);
      const text = data.text;
      
      // Buscar patron: Oruro, 15 de marzo de 2021
      const regex = /Oruro[\s,]+(\d{1,2})\s+de\s+([a-zA-Z]+)\s+de\s+(\d{4})/i;
      const match = text.match(regex);
      if (match) {
        const dia = match[1].padStart(2, '0');
        const mes = meses[match[2].toLowerCase()];
        const anio = match[3];
        console.log(`${file} => ${anio}-${mes}-${dia}`);
      } else {
        console.log(`${file} => Fecha no encontrada`);
        // Opcional: imprimir el final del documento donde suele estar la fecha
        console.log("  Ultimos 200 chars:", text.slice(-200).replace(/\n/g, ' '));
      }
    } catch (err) {
      console.log(`Error leyendo ${file}: ${err.message}`);
    }
  }
}
test();
