const xlsx = require('xlsx');
const fs = require('fs');

try {
  const filePath = 'D:\\Descargas\\PROGRAMAS Y PROYECTOS AL SEMESTRE 2026.xlsx';
  const workbook = xlsx.readFile(filePath);
  const sheetName = workbook.SheetNames[0];
  const sheet = workbook.Sheets[sheetName];
  const data = xlsx.utils.sheet_to_json(sheet, { header: 1 });
  
  const result = [];
  let currentUnidad = '';

  // Skip header row (row 0)
  for (let i = 1; i < data.length; i++) {
    const row = data[i];
    if (!row || row.length === 0) continue;

    let col0 = row[0] ? String(row[0]).trim() : '';
    let col1 = row[1] ? String(row[1]).trim() : '';
    let col2 = row[2] ? Number(row[2]) : 0;
    let col3 = row[3] ? Number(row[3]) : 0;
    let col4 = row[4] ? Number(row[4]) : 0;

    if (col0 && col0.toLowerCase().startsWith('total')) {
      continue; // Skip total rows
    }

    if (col0) {
      currentUnidad = col0;
    }

    if (col1) {
      // It's a valid program row
      result.push({
        id: i, // simple id
        unidadEjecutora: currentUnidad,
        programa: col1,
        presupuestoVigente: col2,
        ejecucion: col3,
        porcentaje: col4
      });
    }
  }

  // Write to JSON
  const outputPath = './src/app/(public)/secretarias/[slug]/programasProyectos2026.json';
  fs.writeFileSync(outputPath, JSON.stringify(result, null, 2));
  console.log('Successfully wrote', result.length, 'records to', outputPath);
} catch (e) {
  console.error("Error reading Excel:", e);
}
