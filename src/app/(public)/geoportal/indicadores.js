// =====================================================
// Catálogo de indicadores del Geoportal de Oruro.
// Para sumar un indicador nuevo basta agregar una entrada aquí
// y la propiedad correspondiente en public/geoportal/oruro_municipios.geojson.
// =====================================================

const nf0 = new Intl.NumberFormat('es-BO', { maximumFractionDigits: 0 });
const nf1 = new Intl.NumberFormat('es-BO', { maximumFractionDigits: 1 });
const nf2 = new Intl.NumberFormat('es-BO', { maximumFractionDigits: 2 });

export const fmtEntero = (v) => nf0.format(v);
export const fmtBs = (v) => `Bs ${nf0.format(v)}`;
export const fmtBsCorto = (v) => {
  if (Math.abs(v) >= 1e9) return `Bs ${nf2.format(v / 1e9)} mil mill.`;
  if (Math.abs(v) >= 1e6) return `Bs ${nf1.format(v / 1e6)} mill.`;
  return `Bs ${nf0.format(v)}`;
};

export const GRUPOS = [
  {
    id: 'censo',
    label: 'Censo de Población y Vivienda 2024',
    fuente: 'INE · Censo 2024 (datos municipales cargados en el portal)',
    items: ['poblacion', 'densidad'],
  },
  {
    id: 'territorio',
    label: 'Territorio',
    fuente: 'Límites administrativos oficiales (OCHA COD-AB, base INE) y fichas municipales',
    items: ['area_km2', 'altitud'],
  },
  {
    id: 'poa',
    label: 'Planificación municipal (POA)',
    fuente: 'Programación de Operaciones Anual · Planificación municipal GADOR',
    items: ['poa_total', 'poa_inversion', 'poa_corriente', 'inv_percapita'],
  },
];

export const INDICADORES = {
  poblacion: {
    label: 'Población total',
    unidad: 'habitantes',
    fmt: fmtEntero,
    get: (p) => p.poblacion,
    desc: 'Población total empadronada por municipio (Censo 2024).',
  },
  densidad: {
    label: 'Densidad poblacional',
    unidad: 'hab/km²',
    fmt: (v) => nf2.format(v),
    get: (p) => p.densidad,
    desc: 'Habitantes por kilómetro cuadrado.',
  },
  area_km2: {
    label: 'Superficie',
    unidad: 'km²',
    fmt: (v) => nf1.format(v),
    get: (p) => p.area_km2,
    desc: 'Superficie del municipio según límites oficiales.',
  },
  altitud: {
    label: 'Altitud de la capital',
    unidad: 'msnm',
    fmt: fmtEntero,
    get: (p) => p.altitud,
    desc: 'Metros sobre el nivel del mar de la capital municipal.',
  },
  poa_total: {
    label: 'Presupuesto total',
    unidad: 'Bs',
    fmt: fmtBsCorto,
    get: (p) => p.poa_total,
    desc: 'Suma de gasto corriente e inversión programados.',
  },
  poa_inversion: {
    label: 'Inversión programada',
    unidad: 'Bs',
    fmt: fmtBsCorto,
    get: (p) => p.poa_inversion,
    desc: 'Monto programado en proyectos de inversión.',
  },
  poa_corriente: {
    label: 'Gasto corriente',
    unidad: 'Bs',
    fmt: fmtBsCorto,
    get: (p) => p.poa_corriente,
    desc: 'Monto programado en gasto corriente.',
  },
  inv_percapita: {
    label: 'Inversión por habitante',
    unidad: 'Bs/hab',
    fmt: (v) => `Bs ${nf0.format(v)}`,
    get: (p) => (p.poa_inversion != null && p.poblacion ? p.poa_inversion / p.poblacion : null),
    desc: 'Inversión programada dividida entre la población del municipio.',
  },
};

// Rampas de color (de menor a mayor). Paleta institucional primero.
export const RAMPAS = {
  institucional: ['#fff1d6', '#ffd27a', '#f5a04a', '#e0603a', '#c0262d', '#9c0720', '#5e0414'],
  oro: ['#fff8e1', '#ffe9a8', '#ffd05c', '#f5a623', '#d9780f', '#a8480a', '#6b2a05'],
  azul: ['#eaf3fb', '#cbe0f3', '#9cc4e8', '#6aa5d9', '#3f82c2', '#27609b', '#183f6b'],
  verde: ['#eef7ee', '#cfe8cf', '#a3d3a5', '#72ba78', '#43995a', '#25783f', '#14502a'],
};

export const METODOS = {
  cuantiles: 'Cuantiles (igual nº de municipios)',
  iguales: 'Intervalos iguales',
  jenks: 'Rupturas naturales (Jenks)',
};

// ---------- clasificación ----------
function cuantiles(vals, k) {
  const s = [...vals].sort((a, b) => a - b);
  const cortes = [];
  for (let i = 1; i < k; i++) {
    const pos = (s.length - 1) * (i / k);
    const lo = Math.floor(pos);
    const hi = Math.ceil(pos);
    cortes.push(s[lo] + (s[hi] - s[lo]) * (pos - lo));
  }
  return cortes;
}

function iguales(vals, k) {
  const min = Math.min(...vals);
  const max = Math.max(...vals);
  const paso = (max - min) / k;
  return Array.from({ length: k - 1 }, (_, i) => min + paso * (i + 1));
}

function jenks(vals, k) {
  const data = [...vals].sort((a, b) => a - b);
  const n = data.length;
  if (n <= k) return data.slice(0, -1);
  const lower = Array.from({ length: n + 1 }, () => Array(k + 1).fill(0));
  const variance = Array.from({ length: n + 1 }, () => Array(k + 1).fill(Infinity));
  for (let i = 1; i <= k; i++) {
    lower[1][i] = 1;
    variance[1][i] = 0;
  }
  for (let l = 2; l <= n; l++) {
    let sum = 0;
    let sumSq = 0;
    let w = 0;
    for (let m = 1; m <= l; m++) {
      const i3 = l - m + 1;
      const val = data[i3 - 1];
      w++;
      sum += val;
      sumSq += val * val;
      const v = sumSq - (sum * sum) / w;
      const i4 = i3 - 1;
      if (i4 !== 0) {
        for (let j = 2; j <= k; j++) {
          if (variance[l][j] >= v + variance[i4][j - 1]) {
            lower[l][j] = i3;
            variance[l][j] = v + variance[i4][j - 1];
          }
        }
      }
    }
    lower[l][1] = 1;
    variance[l][1] = sumSq - (sum * sum) / w;
  }
  const cortes = Array(k - 1);
  let idx = n;
  for (let j = k; j >= 2; j--) {
    const id = lower[idx][j] - 2;
    cortes[j - 2] = data[Math.max(id, 0)];
    idx = lower[idx][j] - 1;
  }
  return cortes;
}

// Devuelve los cortes ascendentes (k-1 valores) sin repetidos.
export function calcularCortes(vals, k, metodo) {
  if (vals.length === 0) return [];
  const kk = Math.max(2, Math.min(k, vals.length));
  const raw = metodo === 'iguales' ? iguales(vals, kk) : metodo === 'jenks' ? jenks(vals, kk) : cuantiles(vals, kk);
  return [...new Set(raw)].sort((a, b) => a - b);
}

export function claseDe(valor, cortes) {
  let c = 0;
  while (c < cortes.length && valor > cortes[c]) c++;
  return c;
}

export function coloresPara(nClases, rampa) {
  const r = RAMPAS[rampa] || RAMPAS.institucional;
  if (nClases <= 1) return [r[r.length - 1]];
  return Array.from({ length: nClases }, (_, i) => r[Math.round((i * (r.length - 1)) / (nClases - 1))]);
}
