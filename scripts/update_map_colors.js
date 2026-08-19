const fs = require('fs');
const path = require('path');

const file = path.join('c:', 'Users', 'HP', 'web-gober', 'public', 'mapa', 'index.html');
let html = fs.readFileSync(file, 'utf8');

const newColors = {
  sajama: '#9c0720',
  sabaya: '#67181a',
  mejillones: '#d61432',
  litoral: '#ffb843',
  carangas: '#ffd27a',
  san_pedro_totora: '#9c0720',
  nor_carangas: '#67181a',
  tomas_barron: '#d61432',
  saucari: '#ffb843',
  cercado: '#ffd27a',
  pantaleon_dalence: '#9c0720',
  poopo: '#67181a',
  abaroa: '#d61432',
  sur_carangas: '#ffb843',
  ladislao_cabrera: '#ffd27a',
  sebastion_pagador: '#9c0720'
};

for (const [id, color] of Object.entries(newColors)) {
  // Replace in SVG paths
  const pathRegex = new RegExp('<path id="poly-' + id + '"([\\s\\S]*?)fill="([^"]+)"', 'g');
  html = html.replace(pathRegex, (match, p1, p2) => match.replace('fill="' + p2 + '"', 'fill="' + color + '"'));

  // Replace in JSON block
  const jsonRegex = new RegExp('"' + id + '":\\s*\\{([\\s\\S]*?)"color":\\s*"([^"]+)"', 'g');
  html = html.replace(jsonRegex, (match, p1, p2) => match.replace('"color": "' + p2 + '"', '"color": "' + color + '"'));
}

fs.writeFileSync(file, html);
console.log('Colors replaced successfully!');
