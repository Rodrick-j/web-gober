// ==========================================================================
// Departamento de Oruro - Modern Interactive Map Application
// ==========================================================================

let selectedProvinceId = null;

document.addEventListener('DOMContentLoaded', () => {
  initSvgEvents();
  initSearch();
  initShortcuts();
});

// SVG Province Events
function initSvgEvents() {
  const paths = document.querySelectorAll('.province-path');

  paths.forEach(path => {
    const pid = path.getAttribute('data-id');

    path.addEventListener('click', () => {
      selectProvince(pid);
    });

    path.addEventListener('mouseenter', (e) => {
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

  // Highlight SVG Path
  document.querySelectorAll('.province-path').forEach(p => {
    p.classList.remove('selected');
  });
  const targetPath = document.getElementById(`poly-${pid}`);
  if (targetPath) {
    targetPath.classList.add('selected');
  }

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
  // Helper to map municipality name to slug
  const getSlug = (name) => {
    let clean = name.toLowerCase().trim();
    if (clean.includes('uru chipaya')) return 'chipaya';
    if (clean.includes('salinas')) return 'salinas';
    if (clean.includes('huari')) return 'santiago_de_huari';
    if (clean.includes('huallamarca')) return 'huayllamarca';
    if (clean.includes('eucaliptus')) return 'eucaliptos';
    if (clean.includes('belén')) return 'belen_de_andamarca';
    if (clean.includes('santiago de andamarca') || clean.includes('andamarca')) return 'santiago_de_andamarca';
    if (clean.includes('pampa aullagas')) return 'pampa_aullagas';
    if (clean.includes('yunguyo')) return 'yunyugo_de_litoral';
    if (clean.includes('quillacas')) return 'santuario_de_quillacas';
    
    return clean
      .normalize("NFD").replace(/[\u0300-\u036f]/g, "") // remove accents
      .replace(/[^a-z0-9 ]/g, '') // remove symbols
      .replace(/\s+/g, '_'); // replace spaces with underscores
  };

  data.municipalities.forEach((m, idx) => {
    const slug = getSlug(m);
    const item = document.createElement('a');
    item.href = `/institucion/historia/${slug}`;
    item.target = '_parent';
    item.className = 'muni-item';
    item.style.textDecoration = 'none';
    item.style.display = 'flex';
    item.style.justifyContent = 'space-between';
    item.style.color = 'inherit';
    item.innerHTML = `<span>🏛️ ${m}</span><span class="muni-item-tag" style="background:var(--accent-cyan);color:#fff;">Ver Datos →</span>`;
    
    // Add hover effect since it's a link now
    item.onmouseover = () => item.style.background = 'var(--bg-card-hover)';
    item.onmouseout = () => item.style.background = 'transparent';
    
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

}

// Deselect
function deselectProvince() {
  selectedProvinceId = null;
  document.getElementById('provinceDrawer').classList.add('hidden');
  document.getElementById('emptyDrawer').classList.remove('hidden');

  document.querySelectorAll('.province-path').forEach(p => p.classList.remove('selected'));
}

// Drawer Tabs
function switchDrawerTab(tabId) {
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
