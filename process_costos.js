const xlsx = require('xlsx');
const fs = require('fs');
const path = require('path');

try {
  const filePath = 'D:\\Descargas\\04.Costo_de_la_construcción_Oruro_06-26 (1).xlsx';
  const workbook = xlsx.readFile(filePath);
  const sheetName = workbook.SheetNames[0];
  const sheet = workbook.Sheets[sheetName];
  const data = xlsx.utils.sheet_to_json(sheet, { header: 1 });
  
  const result = [];
  
  // Row 3 has years, Row 4 has months
  const yearRow = data[3];
  const monthRow = data[4];
  
  // Parse years and their column ranges
  const yearCols = {};
  let currentYear = null;
  for(let col = 4; col < monthRow.length; col++) {
    if (yearRow[col] && typeof yearRow[col] === 'number') {
      currentYear = yearRow[col];
      yearCols[currentYear] = [];
    }
    if (currentYear && monthRow[col]) {
      yearCols[currentYear].push({ colIndex: col, month: monthRow[col] });
    }
  }

  // Iterate over data rows starting from row 5
  for (let i = 5; i < data.length; i++) {
    const row = data[i];
    if (!row || !row[0] || !row[1]) continue; // Skip empty rows
    
    const material = {
      codigo: row[0],
      producto: row[1],
      cantidad: row[2] || 1,
      unidad: row[3] || '',
      precios: {}
    };
    
    // Extract prices by year
    for (const year in yearCols) {
      material.precios[year] = {};
      for (const m of yearCols[year]) {
        material.precios[year][m.month] = row[m.colIndex] || null;
      }
    }
    
    result.push(material);
  }

  const outputPath = path.join(__dirname, 'src', 'data', 'costos_construccion.json');
  fs.writeFileSync(outputPath, JSON.stringify(result, null, 2));
  console.log("Successfully created costos_construccion.json with", result.length, "items.");
} catch (e) {
  console.error("Error processing Excel:", e);
}
