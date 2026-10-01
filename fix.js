const fs = require('fs');
const path = 'c:/Users/stard/web-gober/src/components/Navbar/Navbar.jsx';
let content = fs.readFileSync(path, 'utf8');

content = content.replace("{ label: 'Unidad de Transparencia (UTLCC)'", "// { label: 'Unidad de Transparencia (UTLCC)'");
content = content.replace("{ label: 'Solicitud de Información'", "// { label: 'Solicitud de Información'");
content = content.replace("{ label: 'Datos y Estadísticas'", "// { label: 'Datos y Estadísticas'");

fs.writeFileSync(path, content);
console.log('Done!');
