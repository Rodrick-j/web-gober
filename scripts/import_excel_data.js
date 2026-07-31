const xlsx = require('xlsx');
const fs = require('fs');
const path = require('path');

const excelPath = 'D:\\Descargas\\ORURO centralizado (2).xlsx';
const jsonPath = path.join(__dirname, '../src/data/planificacion.json');

function parseMonto(val) {
  if (val === undefined || val === null || val === '') return 0;
  if (typeof val === 'number') return val;
  if (typeof val === 'string') {
    // Remove all commas in case they are used as thousand separators
    const cleaned = val.replace(/,/g, '');
    return Number(cleaned) || 0;
  }
  return 0;
}

function processExcel() {
  console.log('Leyendo archivo Excel...');
  const wb = xlsx.readFile(excelPath);
  const sheetName = 'ORURO';
  
  if (!wb.SheetNames.includes(sheetName)) {
    console.error(`La hoja "${sheetName}" no existe en el archivo.`);
    return;
  }

  const sheet = wb.Sheets[sheetName];
  const data = xlsx.utils.sheet_to_json(sheet, { header: 1 });
  
  // La primera fila son cabeceras, ignoramos
  const rows = data.slice(1).filter(row => row.length > 0);

  const jsonData = [];
  let idCounter = 1;

  for (const row of rows) {
    const municipio = row[0];
    const prg = row[1];
    const proyecto = row[2];
    const actividad = row[4];
    const descripcion = row[5] || '';
    const monto = row[15];

    // Ignorar la fila de TOTAL GENERAL
    if (String(descripcion).toUpperCase().includes('TOTAL GENERAL')) {
      continue;
    }

    // Ignorar filas que no tienen prg definido (suelen ser continuaciones de texto de la fila anterior)
    if (prg === undefined || prg === '' || prg === null) {
      continue;
    }

    // Parse values
    const prgStr = String(prg).padStart(2, '0');
    
    let proyClean = String(proyecto).replace(/\s/g, '');
    if (proyClean === '0' || proyClean === '000') proyClean = '0000';
    const proyStr = proyClean;

    const actStr = String(actividad !== undefined && actividad !== null ? actividad : 0).padStart(3, '0');
    
    const parsedMonto = parseMonto(monto);

    let tipo = "GASTO CORRIENTE";
    // Si el proyecto no es 0000, es INVERSION
    if (proyStr !== '0000') {
      tipo = "INVERSION";
    }

    jsonData.push({
      id: idCounter++,
      municipio: municipio || '',
      prg: prgStr,
      proyecto: proyStr,
      actividad: actStr,
      tipo: tipo,
      descripcion: descripcion,
      monto: parsedMonto
    });
  }

  fs.writeFileSync(jsonPath, JSON.stringify(jsonData, null, 2), 'utf-8');
  console.log(`Se generaron exitosamente ${jsonData.length} registros en planificacion.json`);
}

processExcel();
