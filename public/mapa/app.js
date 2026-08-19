// ==========================================================================
// Departamento de Oruro - Modern Interactive Map Application
// ==========================================================================

let selectedProvinceId = null;
let currentViewMode = 'vector';
let currentZoneFilter = 'all';
let soundEnabled = true;

// SVG Pan & Zoom State
let mapScale = 1;
let mapTranslateX = 0;
let mapTranslateY = 0;
let isPanning = false;
let startPanX = 0;
let startPanY = 0;

// Leaflet State
let leafletMap = null;
let leafletGeoJsonLayer = null;
let rawGeoJson = null;

// Web Audio API Context for UI sound effects
let audioCtx = null;

document.addEventListener('DOMContentLoaded', () => {
  initSvgPanZoom();
  initSvgEvents();
  initChipsList();
  initSearch();
  initShortcuts();
  initTheme();
  loadGeoJsonData();
});

// Sound Effects Synthesizer (No external MP3 files needed)
function playSound(type) {
  if (!soundEnabled) return;
  try {
    if (!audioCtx) {
      audioCtx = new (window.AudioContext || window.webkitAudioContext)();
    }
    if (audioCtx.state === 'suspended') {
      audioCtx.resume();
    }

    const osc = audioCtx.createOscillator();
    const gain = audioCtx.createGain();
    osc.connect(gain);
    gain.connect(audioCtx.destination);

    const now = audioCtx.currentTime;

    if (type === 'hover') {
      osc.type = 'sine';
      osc.frequency.setValueAtTime(520, now);
      osc.frequency.exponentialRampToValueAtTime(780, now + 0.04);
      gain.gain.setValueAtTime(0.02, now);
      gain.gain.exponentialRampToValueAtTime(0.001, now + 0.04);
      osc.start(now);
      osc.stop(now + 0.04);
    } else if (type === 'select') {
      osc.type = 'triangle';
      osc.frequency.setValueAtTime(440, now);
      osc.frequency.exponentialRampToValueAtTime(880, now + 0.12);
      gain.gain.setValueAtTime(0.06, now);
      gain.gain.exponentialRampToValueAtTime(0.001, now + 0.12);
      osc.start(now);
      osc.stop(now + 0.12);
    } else if (type === 'deselect') {
      osc.type = 'sine';
      osc.frequency.setValueAtTime(600, now);
      osc.frequency.exponentialRampToValueAtTime(300, now + 0.08);
      gain.gain.setValueAtTime(0.04, now);
      gain.gain.exponentialRampToValueAtTime(0.001, now + 0.08);
      osc.start(now);
      osc.stop(now + 0.08);
    }
  } catch (e) {
    // Audio context not allowed or unsupported
  }
}

// Toggle Sound
function toggleSound() {
  soundEnabled = !soundEnabled;
  const icon = document.getElementById('soundIcon');
  icon.innerText = soundEnabled ? '🔊' : '🔇';
}

// View Switcher (Vector vs Leaflet GIS)
function setViewMode(mode) {
  currentViewMode = mode;
  const btnVector = document.getElementById('btnViewVector');
  const btnLeaflet = document.getElementById('btnViewLeaflet');
  const stageVector = document.getElementById('vectorStage');
  const stageLeaflet = document.getElementById('leafletStage');

  playSound('select');

  if (mode === 'vector') {
    btnVector.classList.add('active');
    btnLeaflet.classList.remove('active');
    stageVector.classList.add('active');
    stageLeaflet.classList.remove('active');
  } else {
    btnLeaflet.classList.add('active');
    btnVector.classList.remove('active');
    stageLeaflet.classList.add('active');
    stageVector.classList.remove('active');

    if (!leafletMap) {
      initLeaflet();
    } else {
      setTimeout(() => leafletMap.invalidateSize(), 150);
    }
  }
}

// SVG Pan & Zoom
function initSvgPanZoom() {
  const container = document.getElementById('svgContainer');
  const svg = document.getElementById('oruroSvg');

  container.addEventListener('wheel', (e) => {
    e.preventDefault();
    const zoomFactor = e.deltaY < 0 ? 1.12 : 0.89;
    zoomMap(zoomFactor);
  }, { passive: false });

  container.addEventListener('mousedown', (e) => {
    if (e.button !== 0) return;
    isPanning = true;
    startPanX = e.clientX - mapTranslateX;
    startPanY = e.clientY - mapTranslateY;
  });

  window.addEventListener('mousemove', (e) => {
    if (!isPanning) return;
    mapTranslateX = e.clientX - startPanX;
    mapTranslateY = e.clientY - startPanY;
    applyMapTransform();
  });

  window.addEventListener('mouseup', () => {
    isPanning = false;
  });
}

function zoomMap(factor) {
  const newScale = mapScale * factor;
  if (newScale >= 0.7 && newScale <= 4.0) {
    mapScale = newScale;
    applyMapTransform();
  }
}

function resetMapTransform() {
  mapScale = 1;
  mapTranslateX = 0;
  mapTranslateY = 0;
  applyMapTransform();
  playSound('deselect');
}

function applyMapTransform() {
  const svg = document.getElementById('oruroSvg');
  svg.style.transform = `translate(${mapTranslateX}px, ${mapTranslateY}px) scale(${mapScale})`;
}

// SVG Province Events
function initSvgEvents() {
  const paths = document.querySelectorAll('.province-path');

  paths.forEach(path => {
    const pid = path.getAttribute('data-id');

    path.addEventListener('click', () => {
      selectProvince(pid);
    });

    path.addEventListener('mouseenter', (e) => {
      playSound('hover');
      const data = PROVINCES_DATA[pid];
      if (data) {
        showTooltip(e, data);
      }
    });

    path.addEventListener('mousemove', (e) => {
      moveTooltip(e);
    });

    path.addEventListener('mouseleave', () => {
      hideTooltip();
    });
  });
}

// Select a Province
function selectProvince(pid) {
  if (!PROVINCES_DATA[pid]) return;
  selectedProvinceId = pid;
  const data = PROVINCES_DATA[pid];

  playSound('select');

  // Highlight SVG Path
  document.querySelectorAll('.province-path').forEach(p => {
    p.classList.remove('selected');
  });
  const targetPath = document.getElementById(`poly-${pid}`);
  if (targetPath) {
    targetPath.classList.add('selected');
  }

  // Highlight Bottom Chip
  document.querySelectorAll('.prov-chip').forEach(c => {
    c.classList.remove('active');
    if (c.getAttribute('data-id') === pid) {
      c.classList.add('active');
      c.scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'center' });
    }
  });

  // Populate Province Drawer
  document.getElementById('emptyDrawer').classList.add('hidden');
  const drawer = document.getElementById('provinceDrawer');
  drawer.classList.remove('hidden');

  // Header
  document.getElementById('drawerName').innerText = data.name;
  document.getElementById('drawerZone').innerText = `Zona ${data.zone || 'Central'}`;
  document.getElementById('drawerIcon').innerText = data.icon || '🏛️';
  document.getElementById('drawerCapitalSub').innerText = `Capital: ${data.capital}`;

  // Metrics
  document.getElementById('metricCapital').innerText = data.capital;
  document.getElementById('metricArea').innerText = data.area;
  document.getElementById('metricPopulation').innerText = data.population || '-';
  document.getElementById('metricAltitude').innerText = data.altitude || '3,700 msnm';
  document.getElementById('metricClimate').innerText = data.climate || 'Frío de altiplano';
  document.getElementById('drawerDescription').innerText = data.description || '';

  // Municipios List
  const munisList = document.getElementById('municipiosList');
  munisList.innerHTML = '';
  document.getElementById('municipiosCount').innerText = `Municipios (${data.municipalities.length}):`;
  data.municipalities.forEach((m, idx) => {
    const item = document.createElement('div');
    item.className = 'muni-item';
    item.innerHTML = `<span>🏛️ ${m}</span><span class="muni-item-tag">Mun. ${idx + 1}</span>`;
    munisList.appendChild(item);
  });

  // Highlights List
  const highList = document.getElementById('highlightsList');
  highList.innerHTML = '';
  if (data.highlights && data.highlights.length > 0) {
    data.highlights.forEach(h => {
      const li = document.createElement('li');
      li.innerText = h;
      highList.appendChild(li);
    });
  }

  // Link button
  const linkBtn = document.getElementById('btnGoToProvince');
  linkBtn.href = data.link || '#';

  // Sync with Leaflet layer if available
  if (leafletGeoJsonLayer) {
    leafletGeoJsonLayer.eachLayer(layer => {
      if (layer.feature.properties.id === pid) {
        layer.setStyle({
          weight: 4,
          color: '#FFFFFF',
          fillOpacity: 0.95
        });
      } else {
        leafletGeoJsonLayer.resetStyle(layer);
      }
    });
  }
}

// Deselect
function deselectProvince() {
  selectedProvinceId = null;
  playSound('deselect');

  document.getElementById('provinceDrawer').classList.add('hidden');
  document.getElementById('emptyDrawer').classList.remove('hidden');

  document.querySelectorAll('.province-path').forEach(p => p.classList.remove('selected'));
  document.querySelectorAll('.prov-chip').forEach(c => c.classList.remove('active'));

  if (leafletGeoJsonLayer) {
    leafletGeoJsonLayer.eachLayer(layer => leafletGeoJsonLayer.resetStyle(layer));
  }
}

// Drawer Tabs
function switchDrawerTab(tabId) {
  playSound('hover');
  document.querySelectorAll('.drawer-tab-btn').forEach(btn => btn.classList.remove('active'));
  document.querySelectorAll('.tab-pane').forEach(pane => pane.classList.remove('active'));

  if (tabId === 'resumen') {
    document.querySelectorAll('.drawer-tab-btn')[0].classList.add('active');
    document.getElementById('tabContentResumen').classList.add('active');
  } else if (tabId === 'municipios') {
    document.querySelectorAll('.drawer-tab-btn')[1].classList.add('active');
    document.getElementById('tabContentMunicipios').classList.add('active');
  } else if (tabId === 'turismo') {
    document.querySelectorAll('.drawer-tab-btn')[2].classList.add('active');
    document.getElementById('tabContentTurismo').classList.add('active');
  }
}

// Zone Filter
function filterByZone(zone) {
  currentZoneFilter = zone;
  playSound('select');

  document.querySelectorAll('.zone-pill').forEach(pill => pill.classList.remove('active'));
  event.target.classList.add('active');

  const paths = document.querySelectorAll('.province-path');
  paths.forEach(path => {
    const pid = path.getAttribute('data-id');
    const data = PROVINCES_DATA[pid];
    if (zone === 'all' || (data && data.zone === zone)) {
      path.classList.remove('dimmed');
    } else {
      path.classList.add('dimmed');
    }
  });
}

// Chips Carousel
function initChipsList() {
  const container = document.getElementById('provinceChipsList');
  container.innerHTML = '';

  Object.values(PROVINCES_DATA).forEach(prov => {
    const chip = document.createElement('button');
    chip.className = 'prov-chip';
    chip.setAttribute('data-id', prov.id);
    chip.innerHTML = `<span class="prov-chip-dot" style="background:${prov.color}"></span>${prov.short_name}`;
    chip.addEventListener('click', () => selectProvince(prov.id));
    container.appendChild(chip);
  });
}

// Search
function initSearch() {
  const input = document.getElementById('provinceSearch');
  const dropdown = document.getElementById('searchResults');

  input.addEventListener('input', (e) => {
    const q = e.target.value.trim().toLowerCase();
    if (!q) {
      dropdown.classList.remove('active');
      return;
    }

    const matches = Object.values(PROVINCES_DATA).filter(p => {
      const matchName = p.name.toLowerCase().includes(q) || p.short_name.toLowerCase().includes(q);
      const matchCap = p.capital.toLowerCase().includes(q);
      const matchMuni = p.municipalities.some(m => m.toLowerCase().includes(q));
      return matchName || matchCap || matchMuni;
    });

    if (matches.length > 0) {
      dropdown.innerHTML = matches.map(m => `
        <div class="search-result-item" onclick="selectFromSearch('${m.id}')">
          <div class="search-item-title">
            <span class="search-item-badge" style="background:${m.color}"></span>
            <span>${m.icon || '📍'} <strong>${m.name}</strong></span>
          </div>
          <span class="search-item-meta">${m.capital} (${m.zone})</span>
        </div>
      `).join('');
      dropdown.classList.add('active');
    } else {
      dropdown.innerHTML = `<div class="search-result-item" style="color:var(--text-muted);">No se encontraron provincias o municipios</div>`;
      dropdown.classList.add('active');
    }
  });

  document.addEventListener('click', (e) => {
    if (!e.target.closest('.search-container')) {
      dropdown.classList.remove('active');
    }
  });
}

function selectFromSearch(pid) {
  document.getElementById('provinceSearch').value = '';
  document.getElementById('searchResults').classList.remove('active');
  selectProvince(pid);
}

// Keyboard shortcuts
function initShortcuts() {
  window.addEventListener('keydown', (e) => {
    if (e.key === '/' && document.activeElement.tagName !== 'INPUT') {
      e.preventDefault();
      document.getElementById('provinceSearch').focus();
    }
    if (e.key === 'Escape') {
      deselectProvince();
      document.getElementById('searchResults').classList.remove('active');
    }
  });
}

// Tooltip
function showTooltip(e, data) {
  const tt = document.getElementById('smartTooltip');
  document.getElementById('tooltipIcon').innerText = data.icon || '📍';
  document.getElementById('tooltipTitle').innerText = data.name;
  document.getElementById('tooltipCapital').innerText = data.capital;
  document.getElementById('tooltipPop').innerText = data.population || '-';
  tt.style.display = 'block';
  moveTooltip(e);
}

function moveTooltip(e) {
  const tt = document.getElementById('smartTooltip');
  tt.style.left = (e.clientX + 16) + 'px';
  tt.style.top = (e.clientY + 16) + 'px';
}

function hideTooltip() {
  const tt = document.getElementById('smartTooltip');
  tt.style.display = 'none';
}

// Copy Province Data
function copyProvinceData() {
  if (!selectedProvinceId) return;
  const p = PROVINCES_DATA[selectedProvinceId];
  const text = `📌 PROVINCIA: ${p.name} (${p.short_name})\n🏛️ Capital: ${p.capital}\n📐 Superficie: ${p.area}\n👥 Población: ${p.population}\n⛰️ Altitud: ${p.altitude}\n🌤️ Clima: ${p.climate}\n🏙️ Municipios: ${p.municipalities.join(', ')}\n📖 Resumen: ${p.description}`;

  navigator.clipboard.writeText(text).then(() => {
    alert(`¡Ficha de la provincia ${p.name} copiada al portapapeles!`);
  });
}

// Center on GIS Leaflet
function centerProvinceOnLeaflet() {
  if (!selectedProvinceId) return;
  setViewMode('leaflet');
  if (leafletGeoJsonLayer && leafletMap) {
    leafletGeoJsonLayer.eachLayer(layer => {
      if (layer.feature.properties.id === selectedProvinceId) {
        leafletMap.fitBounds(layer.getBounds(), { padding: [40, 40], maxZoom: 11 });
      }
    });
  }
}

// Theme
function initTheme() {
  const saved = localStorage.getItem('oruro_theme') || 'dark';
  document.documentElement.setAttribute('data-theme', saved);
  document.getElementById('themeIcon').innerText = saved === 'dark' ? '🌙' : '☀️';
}

function toggleTheme() {
  const current = document.documentElement.getAttribute('data-theme') || 'dark';
  const next = current === 'dark' ? 'light' : 'dark';
  document.documentElement.setAttribute('data-theme', next);
  localStorage.setItem('oruro_theme', next);
  document.getElementById('themeIcon').innerText = next === 'dark' ? '🌙' : '☀️';
  playSound('hover');
}

// GeoJSON Download
function downloadGeoJSON() {
  if (!rawGeoJson) return;
  const dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(rawGeoJson, null, 2));
  const downloadAnchor = document.createElement('a');
  downloadAnchor.setAttribute("href", dataStr);
  downloadAnchor.setAttribute("download", "oruro_provincias_oficial.geojson");
  document.body.appendChild(downloadAnchor);
  downloadAnchor.click();
  downloadAnchor.remove();
}

// Load GeoJSON & Init Leaflet
function loadGeoJsonData() {
  fetch('oruro_provinces.geojson')
    .then(res => res.json())
    .then(data => {
      rawGeoJson = data;
    })
    .catch(err => console.error("Error loading GeoJSON:", err));
}

function initLeaflet() {
  // Center of Oruro Department
  leafletMap = L.map('leafletMap', {
    center: [-18.6, -67.4],
    zoom: 8,
    zoomControl: true
  });

  // Modern Basemap (CartoDB Voyager)
  L.tileLayer('https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png', {
    attribution: '&copy; OpenStreetMap &copy; CARTO',
    maxZoom: 18
  }).addTo(leafletMap);

  if (rawGeoJson) {
    renderLeafletLayers(rawGeoJson);
  } else {
    fetch('oruro_provinces.geojson')
      .then(res => res.json())
      .then(data => {
        rawGeoJson = data;
        renderLeafletLayers(data);
      });
  }
}

function renderLeafletLayers(geojson) {
  leafletGeoJsonLayer = L.geoJSON(geojson, {
    style: (feature) => {
      const pid = feature.properties.id;
      const color = PROVINCES_DATA[pid] ? PROVINCES_DATA[pid].color : '#38BDF8';
      return {
        fillColor: color,
        weight: 2,
        opacity: 1,
        color: '#1E293B',
        fillOpacity: 0.82
      };
    },
    onEachFeature: (feature, layer) => {
      const pid = feature.properties.id;
      const name = feature.properties.name;

      layer.bindTooltip(`<strong>${name}</strong>`, { direction: 'center', className: 'leaflet-tooltip-custom' });

      layer.on({
        mouseover: (e) => {
          e.target.setStyle({ weight: 3.5, color: '#FFFFFF', fillOpacity: 0.95 });
        },
        mouseout: (e) => {
          if (selectedProvinceId !== pid) {
            leafletGeoJsonLayer.resetStyle(e.target);
          }
        },
        click: () => {
          selectProvince(pid);
        }
      });
    }
  }).addTo(leafletMap);

  if (selectedProvinceId) {
    selectProvince(selectedProvinceId);
  }
}
