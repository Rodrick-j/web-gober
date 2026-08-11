const fs = require('fs');
const path = require('path');

const dataPath = path.join(__dirname, 'src', 'data', 'costos_construccion.json');
const data = JSON.parse(fs.readFileSync(dataPath, 'utf8'));

const groups = {};

data.forEach(item => {
  const codeStr = item.codigo.toString();
  // let's try the first 2 digits
  const prefix = codeStr.substring(0, 2);
  
  if (!groups[prefix]) {
    groups[prefix] = [];
  }
  groups[prefix].push(item.producto);
});

for (const [prefix, products] of Object.entries(groups)) {
  console.log(`Prefix: ${prefix} (${products.length} items)`);
  console.log(`  Samples: ${products.slice(0, 5).join(', ')}`);
}
