const fs = require('fs');
const path = require('path');

const dir = 'C:\\gaceta\\DECRETOS\\DECRETOS DEPARTAMENTALES\\3-Decretos Ejecutivos Departamentales';

try {
  const files = fs.readdirSync(dir);
  for (const file of files) {
    console.log(file);
  }
} catch (err) {
  console.error("Error:", err);
}
