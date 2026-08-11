const xlsx = require('xlsx');

try {
  const filePath = 'D:\\Descargas\\04.Costo_de_la_construcción_Oruro_06-26 (1).xlsx';
  const workbook = xlsx.readFile(filePath);
  const sheetName = workbook.SheetNames[0];
  const sheet = workbook.Sheets[sheetName];
  const data = xlsx.utils.sheet_to_json(sheet, { header: 1 });
  
  for(let i=0; i<6; i++) {
    console.log(`Row ${i}:`, data[i]);
  }
} catch (e) {
  console.error("Error reading Excel:", e);
}
