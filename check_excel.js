const xlsx = require('xlsx');

try {
  const filePath = 'D:\\Descargas\\PROGRAMAS Y PROYECTOS AL SEMESTRE 2026.xlsx';
  const workbook = xlsx.readFile(filePath);
  const sheetName = workbook.SheetNames[0];
  const sheet = workbook.Sheets[sheetName];
  const data = xlsx.utils.sheet_to_json(sheet, { header: 1 });
  
  for(let i=0; i<10; i++) {
    console.log(`Row ${i}:`, data[i]);
  }
} catch (e) {
  console.error("Error reading Excel:", e);
}
