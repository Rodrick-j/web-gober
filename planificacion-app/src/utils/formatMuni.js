export function getMuniFullName(rawName) {
  if (!rawName || rawName === 'Todos') return 'Todos';
  
  let name = rawName.toLowerCase().replace(/(?:^|\s)\S/g, function(a) { return a.toUpperCase(); });
  
  // Fix specific typos or abbreviations from the Excel sheet
  const fixes = {
    'S. De Huari': 'Santiago de Huari',
    'Cruz De Machacamarca': 'Cruz de Machacamarca',
    'Yunguyo De Litoral': 'Yunguyo de Litoral',
    'Huallamarca': 'Huayllamarca'
  };
  
  name = fixes[name] || name;
  name = name.replace(' De ', ' de ').replace(' Del ', ' del ');
  
  return 'Gob. Autónomo Municipal de ' + name;
}
