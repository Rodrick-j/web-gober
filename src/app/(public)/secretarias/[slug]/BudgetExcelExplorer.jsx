'use client';

import { useState, useMemo, useEffect } from 'react';
import { Search, Download, Printer, RefreshCw, FileSpreadsheet, Layers, Coins } from 'lucide-react';
import { ResponsivePie } from '@nivo/pie';
import budgetsData from './municipalitiesBudgets.json';

// Simple list of municipality IDs and names to match keys in JSON
const municipios = [
  { id: "oruro", nombre: "Gob. Autónomo Municipal de Oruro (Capital)" },
  { id: "challapata", nombre: "Gob. Autónomo Municipal de Challapata" },
  { id: "huanuni", nombre: "Gob. Autónomo Municipal de Huanuni" },
  { id: "caracollo", nombre: "Gob. Autónomo Municipal de Caracollo" },
  { id: "corque", nombre: "Gob. Autónomo Municipal de Corque" },
  { id: "toledo", nombre: "Gob. Autónomo Municipal de Toledo" },
  { id: "salinas", nombre: "Gob. Autónomo Municipal de Salinas de Garci Mendoza" },
  { id: "turco", nombre: "Gob. Autónomo Municipal de Turco" },
  { id: "santiago_de_huari", nombre: "Gob. Autónomo Municipal de Santiago de Huari" },
  { id: "curahuara_de_carangas", nombre: "Gob. Autónomo Municipal de Curahuara de Carangas" },
  { id: "pazna", nombre: "Gob. Autónomo Municipal de Pazña" },
  { id: "huayllamarca", nombre: "Gob. Autónomo Municipal de Huayllamarca" },
  { id: "machacamarca", nombre: "Gob. Autónomo Municipal de Machacamarca" },
  { id: "eucaliptos", nombre: "Gob. Autónomo Municipal de Eucaliptos" },
  { id: "santiago_de_andamarca", nombre: "Gob. Autónomo Municipal de Santiago de Andamarca" },
  { id: "sabaya", nombre: "Gob. Autónomo Municipal de Sabaya" },
  { id: "santuario_de_quillacas", nombre: "Gob. Autónomo Municipal de Santuario de Quillacas" },
  { id: "antequera", nombre: "Gob. Autónomo Municipal de Antequera" },
  { id: "el_choro", nombre: "Gob. Autónomo Municipal de El Choro" },
  { id: "totora", nombre: "Gob. Autónomo Municipal de Totora" },
  { id: "poopo", nombre: "Gob. Autónomo Municipal de Poopó" },
  { id: "belen_de_andamarca", nombre: "Gob. Autónomo Municipal de Belén de Andamarca" },
  { id: "cruz_de_machacamarca", nombre: "Gob. Autónomo Municipal de Cruz de Machacamarca" },
  { id: "esmeralda", nombre: "Gob. Autónomo Municipal de Esmeralda" },
  { id: "carangas", nombre: "Gob. Autónomo Municipal de Carangas" },
  { id: "coipasa", nombre: "Gob. Autónomo Municipal de Coipasa" },
  { id: "escara", nombre: "Gob. Autónomo Municipal de Escara" },
  { id: "huachacalla", nombre: "Gob. Autónomo Municipal de Huachacalla" },
  { id: "la_rivera", nombre: "Gob. Autónomo Municipal de La Rivera" },
  { id: "pampa_aullagas", nombre: "Gob. Autónomo Municipal de Pampa Aullagas" },
  { id: "todos_santos", nombre: "Gob. Autónomo Municipal de Todos Santos" },
  { id: "yunyugo_de_litoral", nombre: "Gob. Autónomo Municipal de Yunguyo del Litoral" },
  { id: "chipaya", nombre: "Gob. Autónomo Municipal de Chipaya" },
  { id: "soracachi", nombre: "Gob. Autónomo Municipal de Soracachi" },
  { id: "choquecota", nombre: "Gob. Autónomo Municipal de Choquecota" }
].sort((a, b) => a.nombre.localeCompare(b.nombre));

const formatBOB = (valStr) => {
  const val = parseFloat((valStr || "0").replace(/,/g, ''));
  if (isNaN(val) || val === 0) return "-";
  return new Intl.NumberFormat('es-BO', { minimumFractionDigits: 0, maximumFractionDigits: 0 }).format(val);
};

const MoneyCell = ({ valStr, isTotal }) => {
  const formatted = formatBOB(valStr);
  if (formatted === "-") {
    return <span style={{ color: '#cbd5e1', fontFamily: 'monospace', fontSize: '0.8rem' }}>-</span>;
  }
  return <span style={{ fontWeight: isTotal ? '800' : '500', color: isTotal ? '#9c0720' : 'inherit', fontFamily: 'monospace', fontSize: '0.8rem' }}>{formatted}</span>;
};

const LazyAccordion = ({ summary, children, forceOpen, isProgram }) => {
  const [isOpen, setIsOpen] = useState(forceOpen);
  
  // Sincronizar estado si forceOpen cambia por búsqueda o filtro
  useEffect(() => {
    setIsOpen(forceOpen);
  }, [forceOpen]);

  return (
    <details 
      className={`project-accordion ${isProgram ? 'is-program' : 'sub-project-card'}`} 
      open={isOpen} 
      onToggle={(e) => setIsOpen(e.target.open)}
    >
      <summary 
        className={isProgram ? "project-summary" : "sub-project-header"} 
        style={!isProgram ? { cursor: 'pointer', margin: 0, paddingBottom: isOpen ? '0.75rem' : '0', borderBottom: isOpen ? '1px dashed #cbd5e1' : 'none' } : { cursor: 'pointer' }}
      >
        {summary}
      </summary>
      {isOpen && (
        <div className={isProgram ? "project-details" : ""} style={!isProgram ? { paddingTop: '1rem' } : {}}>
          {children}
        </div>
      )}
    </details>
  );
};

export default function BudgetExcelExplorer({ globalMunicipio, setGlobalMunicipio }) {
  const [localMuni, setLocalMuni] = useState('corque');
  const selectedMuni = globalMunicipio || localMuni;
  const setSelectedMuni = setGlobalMunicipio || setLocalMuni;
  const [searchQuery, setSearchQuery] = useState('');
  const [onlyPrograms, setOnlyPrograms] = useState(false);
  const [selectedPrg, setSelectedPrg] = useState('ALL');
  const [selectedProy, setSelectedProy] = useState('ALL');
  const [currentPage, setCurrentPage] = useState(1);
  const ITEMS_PER_PAGE = 50;

  const rawRows = useMemo(() => {
    if (selectedMuni === 'TODOS') {
      let all = [];
      Object.values(budgetsData).forEach(arr => { all = all.concat(arr); });
      return all;
    }
    return budgetsData[selectedMuni] || [];
  }, [selectedMuni]);

  const programDictionary = useMemo(() => {
    const dict = {};
    for (const r of rawRows) {
      if (r.proyecto === '0 000') {
        // En caso de múltiples municipios con el mismo prg, guardamos el primero que encontremos válido o los combinamos
        // Para visualización rápida, con uno es suficiente
        if (!dict[r.prg]) dict[r.prg] = r;
      }
    }
    return dict;
  }, [rawRows]);

  const filteredRows = useMemo(() => {
    const query = searchQuery.toLowerCase().trim();
    return rawRows.filter((row) => {
      if (selectedPrg !== 'ALL' && row.prg !== selectedPrg) return false;
      if (selectedProy !== 'ALL' && row.proyecto !== '0 000' && row.proyecto !== selectedProy) return false;
      if (onlyPrograms && row.proyecto !== '0 000') return false;
      if (!query) return true;
      
      return (
        row.description.toLowerCase().includes(query) ||
        row.prg.includes(query) ||
        row.proyecto.includes(query)
      );
    });
  }, [rawRows, searchQuery, onlyPrograms, selectedPrg, selectedProy]);

  const groupedRows = useMemo(() => {
    const groupsMap = new Map();
    
    filteredRows.forEach(row => {
      if (!groupsMap.has(row.prg)) {
        const programRow = programDictionary[row.prg] || row;
        groupsMap.set(row.prg, {
          prg: row.prg,
          program: programRow,
          projects: []
        });
      }
      
      if (row.proyecto !== '0 000') {
        groupsMap.get(row.prg).projects.push(row);
      }
    });
    
    return Array.from(groupsMap.values()).sort((a, b) => parseInt(a.prg) - parseInt(b.prg));
  }, [filteredRows, programDictionary]);

  // Pagination Logic
  const totalPages = Math.ceil(filteredRows.length / ITEMS_PER_PAGE);
  const paginatedRows = useMemo(() => {
    const startIndex = (currentPage - 1) * ITEMS_PER_PAGE;
    return filteredRows.slice(startIndex, startIndex + ITEMS_PER_PAGE);
  }, [filteredRows, currentPage]);

  useEffect(() => {
    setCurrentPage(1);
  }, [searchQuery, selectedMuni, selectedPrg, selectedProy, onlyPrograms]);

  const uniquePrograms = useMemo(() => {
    const prgs = new Set();
    const result = [];
    rawRows.forEach(row => {
      if (!prgs.has(row.prg)) {
        prgs.add(row.prg);
        const progRow = programDictionary[row.prg] || row;
        result.push({
          prg: row.prg,
          description: progRow.description
        });
      }
    });
    return result.sort((a, b) => parseInt(a.prg) - parseInt(b.prg));
  }, [rawRows, programDictionary]);

  const uniqueProjects = useMemo(() => {
    if (selectedPrg === 'ALL') return [];
    
    const proys = new Set();
    const result = [];
    rawRows.forEach(row => {
      if (row.prg === selectedPrg && row.proyecto !== '0 000') {
        if (!proys.has(row.proyecto)) {
          proys.add(row.proyecto);
          result.push({
            proyecto: row.proyecto,
            description: row.description
          });
        }
      }
    });
    return result.sort((a, b) => a.proyecto.localeCompare(b.proyecto));
  }, [rawRows, selectedPrg]);

  // Calculate quick metrics for the selected municipality
  const metrics = useMemo(() => {
    let totalBudget = 0;
    let programsCount = 0;
    let projectsCount = 0;

    rawRows.forEach(row => {
      const isProgram = row.proyecto === '0 000';
      const val = parseFloat(row.total.replace(/,/g, '')) || 0;
      if (isProgram) {
        totalBudget += val;
        programsCount++;
      } else {
        projectsCount++;
      }
    });

    return { totalBudget, programsCount, projectsCount };
  }, [rawRows]);

  const exportToCSV = () => {
    const headers = ['Prg', 'Proyecto', 'Descripción', 'Grupo 1', 'Grupo 2', 'Grupo 3', 'Grupo 4', 'Grupo 5', 'Grupo 6', 'Grupo 7', 'Grupo 8', 'Grupo 9', 'Total'];
    const rows = filteredRows.map(r => [
      r.prg,
      r.proyecto,
      r.description,
      r.grupo1.replace(/,/g, ''),
      r.grupo2.replace(/,/g, ''),
      r.grupo3.replace(/,/g, ''),
      r.grupo4.replace(/,/g, ''),
      r.grupo5.replace(/,/g, ''),
      r.grupo6.replace(/,/g, ''),
      r.grupo7.replace(/,/g, ''),
      r.grupo8.replace(/,/g, ''),
      r.grupo9.replace(/,/g, ''),
      r.total.replace(/,/g, '')
    ]);

    const csvContent = "data:text/csv;charset=utf-8,\uFEFF" 
      + [headers.join(';'), ...rows.map(e => e.join(';'))].join('\n');
    
    const encodedUri = encodeURI(csvContent);
    const link = document.createElement("a");
    link.setAttribute("href", encodedUri);
    link.setAttribute("download", `POA_2026_${selectedMuni.toUpperCase()}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  const handlePrint = () => {
    window.print();
  };

  const renderPercentageBars = (itemObj) => {
    const rawData = [
      { id: '10000', label: 'Servicios Personales', val: itemObj.grupo1, color: 'linear-gradient(90deg, #9c0720 0%, #d81b3d 100%)', shadow: 'rgba(156,7,32,0.3)' },
      { id: '20000', label: 'Servicios No Personales', val: itemObj.grupo2, color: 'linear-gradient(90deg, #1e3a8a 0%, #3b82f6 100%)', shadow: 'rgba(30,58,138,0.3)' },
      { id: '30000', label: 'Materiales y Suministros', val: itemObj.grupo3, color: 'linear-gradient(90deg, #0f766e 0%, #14b8a6 100%)', shadow: 'rgba(15,118,110,0.3)' },
      { id: '40000', label: 'Activos Reales', val: itemObj.grupo4, color: 'linear-gradient(90deg, #b45309 0%, #f59e0b 100%)', shadow: 'rgba(180,83,9,0.3)' },
      { id: '50000', label: 'Activos Financieros', val: itemObj.grupo5, color: 'linear-gradient(90deg, #4338ca 0%, #6366f1 100%)', shadow: 'rgba(67,56,202,0.3)' },
      { id: '60000', label: 'Deudas', val: itemObj.grupo6, color: 'linear-gradient(90deg, #1f2937 0%, #4b5563 100%)', shadow: 'rgba(31,41,55,0.3)' },
      { id: '70000', label: 'Transferencias', val: itemObj.grupo7, color: 'linear-gradient(90deg, #065f46 0%, #10b981 100%)', shadow: 'rgba(6,95,70,0.3)' },
      { id: '80000', label: 'Impuestos y Otros', val: itemObj.grupo8, color: 'linear-gradient(90deg, #701a75 0%, #d946ef 100%)', shadow: 'rgba(112,26,117,0.3)' },
      { id: '90000', label: 'Otros Gastos', val: itemObj.grupo9, color: 'linear-gradient(90deg, #475569 0%, #94a3b8 100%)', shadow: 'rgba(71,85,105,0.3)' }
    ];

    let totalVal = 0;
    const cleanData = rawData.map(g => {
      const num = parseFloat((g.val || "0").toString().replace(/,/g, ''));
      const value = isNaN(num) ? 0 : num;
      totalVal += value;
      return { ...g, value };
    }).filter(g => g.value > 0);

    // Sort by value descending for better presentation
    cleanData.sort((a, b) => b.value - a.value);

    if (cleanData.length === 0) return null;

    // Data for Pie Chart
    const pieData = cleanData.map(item => ({
      id: item.label,
      label: item.label,
      value: item.value,
      color: item.color.includes('gradient') ? item.color.match(/#(?:[0-9a-fA-F]{3}){1,2}/g)[0] : item.color
    }));

    return (
      <div style={{ marginTop: '1.5rem', padding: '1.75rem', background: '#ffffff', borderRadius: '16px', border: '1px solid #f1f5f9', boxShadow: '0 8px 24px rgba(0,0,0,0.03)' }}>
        <h6 style={{ fontSize: '0.85rem', color: '#64748b', fontWeight: '800', margin: '0 0 1.5rem 0', textTransform: 'uppercase', letterSpacing: '0.5px', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
          <Layers size={16} color="#9c0720" /> Distribución del Presupuesto
        </h6>
        
        {/* Pie Chart (Super Professional) */}
        <div style={{ height: '350px', width: '100%', marginBottom: '2rem' }}>
          <ResponsivePie
            data={pieData}
            margin={{ top: 20, right: 80, bottom: 20, left: 80 }}
            innerRadius={0.6}
            padAngle={0.7}
            cornerRadius={3}
            activeOuterRadiusOffset={8}
            colors={{ datum: 'data.color' }}
            borderWidth={1}
            borderColor={{ from: 'color', modifiers: [ [ 'darker', 0.2 ] ] }}
            enableArcLinkLabels={true}
            arcLinkLabelsSkipAngle={10}
            arcLinkLabelsTextColor="#334155"
            arcLinkLabelsThickness={2}
            arcLinkLabelsColor={{ from: 'color' }}
            arcLabelsSkipAngle={10}
            arcLabelsTextColor="#ffffff"
            valueFormat={value => formatBOB(value.toString()) + ' Bs.'}
            theme={{
              tooltip: {
                container: {
                  background: '#ffffff',
                  color: '#1e293b',
                  fontSize: '12px',
                  borderRadius: '8px',
                  boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)'
                }
              }
            }}
          />
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
          {cleanData.map((item, idx) => {
            const percentage = totalVal > 0 ? ((item.value / totalVal) * 100).toFixed(1) : 0;
            return (
              <div key={idx} style={{ display: 'flex', flexDirection: 'column', gap: '0.6rem' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end', flexWrap: 'wrap', gap: '0.5rem' }}>
                  <span style={{ fontSize: '0.95rem', fontWeight: '800', color: '#1e293b' }}>
                    {item.label} <span style={{ color: '#94a3b8', fontWeight: '600', fontSize: '0.8rem', marginLeft: '0.2rem' }}>(Grupo {item.id.charAt(0)})</span>
                  </span>
                  <div style={{ display: 'flex', gap: '1.5rem', alignItems: 'baseline' }}>
                    <span style={{ fontSize: '1.05rem', fontWeight: '900', color: '#1e293b' }}>{formatBOB(item.value.toString())} <span style={{fontSize: '0.75rem', color: '#94a3b8', fontWeight: '700'}}>BOB</span></span>
                    <span style={{ fontSize: '0.9rem', fontWeight: '900', color: '#9c0720', width: '45px', textAlign: 'right', background: '#fff0f2', padding: '0.15rem 0.4rem', borderRadius: '6px' }}>{percentage}%</span>
                  </div>
                </div>
                <div style={{ width: '100%', height: '8px', background: '#f1f5f9', borderRadius: '8px', overflow: 'hidden', boxShadow: 'inset 0 1px 2px rgba(0,0,0,0.05)' }}>
                  <div 
                    style={{ 
                      width: `${percentage}%`, 
                      height: '100%', 
                      background: item.color, 
                      borderRadius: '8px',
                      boxShadow: `0 0 8px ${item.shadow}`,
                      transition: 'width 1s cubic-bezier(0.4, 0, 0.2, 1)'
                    }} 
                  />
                </div>
              </div>
            );
          })}
        </div>
      </div>
    );
  };


  return (
    <div className="excel-explorer-container">
      <style jsx>{`
        .excel-explorer-container {
          background: #ffffff;
          border: 1px solid #e2e8f0;
          border-radius: 16px;
          padding: 2rem;
          box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
          margin-top: 1.5rem;
          font-family: 'Inter', sans-serif;
        }

        .excel-header {
          display: flex;
          justify-content: space-between;
          align-items: flex-start;
          flex-wrap: wrap;
          gap: 1.5rem;
          margin-bottom: 2rem;
        }

        .excel-title-section h3 {
          font-size: 1.5rem;
          font-weight: 800;
          color: #9c0720;
          margin: 0;
          letter-spacing: -0.5px;
        }

        .excel-title-section p {
          font-size: 0.88rem;
          color: #64748b;
          margin: 0.35rem 0 0 0;
        }

        /* Metrics grid */
        .metrics-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
          gap: 1rem;
          margin-bottom: 2rem;
        }

        .metric-card {
          background: #f8fafc;
          border: 1px solid #e2e8f0;
          border-radius: 12px;
          padding: 1rem 1.25rem;
          display: flex;
          align-items: center;
          gap: 0.85rem;
        }

        .metric-icon-box {
          background: #ffefef;
          color: #9c0720;
          width: 40px;
          height: 40px;
          border-radius: 8px;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .metric-info h4 {
          font-size: 0.72rem;
          font-weight: 700;
          text-transform: uppercase;
          color: #64748b;
          margin: 0;
        }

        .metric-info p {
          font-size: 1.15rem;
          font-weight: 800;
          color: #1e293b;
          margin: 0.15rem 0 0 0;
        }

        /* Controls Section */
        .controls-row {
          display: flex;
          justify-content: space-between;
          align-items: center;
          gap: 1rem;
          margin-bottom: 1.5rem;
          flex-wrap: wrap;
        }

        .search-select-group {
          display: flex;
          gap: 0.75rem;
          flex-wrap: wrap;
          flex-grow: 1;
        }

        .muni-selector {
          padding: 0.65rem 1rem;
          border-radius: 8px;
          border: 1px solid #cbd5e1;
          font-weight: 700;
          color: #1e293b;
          background-color: #f8fafc;
          outline: none;
          cursor: pointer;
          flex: 1 1 260px;
          box-sizing: border-box;
        }

        .muni-selector:focus {
          border-color: #9c0720;
        }

        .project-selector {
          padding: 0.65rem 1rem;
          border-radius: 8px;
          border: 1px solid #cbd5e1;
          font-weight: 500;
          color: #1e293b;
          background-color: #ffffff;
          outline: none;
          cursor: pointer;
          flex: 1 1 260px;
          text-overflow: ellipsis;
          box-sizing: border-box;
        }

        .project-selector:focus {
          border-color: #9c0720;
        }

        .search-wrapper {
          position: relative;
          width: 100%;
          flex-grow: 1;
        }

        .search-input {
          width: 100%;
          box-sizing: border-box;
          padding: 0.65rem 1rem 0.65rem 2.5rem;
          border-radius: 8px;
          border: 1px solid #cbd5e1;
          font-size: 0.9rem;
          outline: none;
        }

        .search-input:focus {
          border-color: #9c0720;
        }

        .actions-group {
          display: flex;
          gap: 0.5rem;
        }

        .btn-action {
          padding: 0.65rem 1.15rem;
          border-radius: 8px;
          font-weight: 700;
          font-size: 0.88rem;
          cursor: pointer;
          border: 1px solid #cbd5e1;
          background: #ffffff;
          color: #475569;
          display: flex;
          align-items: center;
          gap: 0.4rem;
          transition: all 0.2s;
        }

        .btn-action:hover {
          background: #f8fafc;
          color: #1e293b;
        }

        .btn-primary-action {
          background: #9c0720;
          border-color: #9c0720;
          color: #ffffff;
        }

        .btn-primary-action:hover {
          background: #7a0518;
          color: #ffffff;
        }

        /* Checkbox filter */
        .filter-checkbox-label {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.85rem;
          font-weight: 600;
          color: #475569;
          cursor: pointer;
          user-select: none;
        }

        /* Accordion List Style */
        .project-list-container {
          display: flex;
          flex-direction: column;
          gap: 1rem;
        }

        .project-accordion {
          background: #ffffff;
          border: 1px solid #e2e8f0;
          border-radius: 12px;
          overflow: hidden;
          box-shadow: 0 2px 8px rgba(0,0,0,0.02);
          transition: all 0.2s;
        }

        .project-accordion:hover {
          border-color: #cbd5e1;
        }

        .project-accordion[open] {
          border-color: #9c0720;
          box-shadow: 0 4px 16px rgba(156, 7, 32, 0.08);
        }

        .is-program .project-summary {
          background: #fffdf5;
          border-left: 4px solid #D4AF37;
        }

        .project-summary {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 1.25rem 1.5rem;
          cursor: pointer;
          list-style: none;
          background: #f8fafc;
          gap: 1rem;
        }

        .project-accordion[open] .project-summary {
          background: #ffffff;
          border-bottom: 1px solid #e2e8f0;
        }

        .project-summary::-webkit-details-marker {
          display: none;
        }

        .summary-header {
          display: flex;
          flex-direction: column;
          gap: 0.5rem;
          flex-grow: 1;
        }

        .badge-prg {
          font-size: 0.75rem;
          font-weight: 800;
          color: #9c0720;
          background: #ffefef;
          padding: 0.25rem 0.6rem;
          border-radius: 6px;
          width: fit-content;
          letter-spacing: 0.5px;
        }

        .summary-title {
          font-size: 1.05rem;
          font-weight: 700;
          color: #1e293b;
          line-height: 1.3;
        }

        .summary-total {
          text-align: right;
          display: flex;
          flex-direction: column;
          min-width: 140px;
        }

        .summary-total-label {
          font-size: 0.7rem;
          color: #64748b;
          text-transform: uppercase;
          font-weight: 700;
          margin-bottom: 0.2rem;
        }

        .summary-total-value {
          font-size: 1.25rem;
          font-weight: 800;
          color: #9c0720;
        }

        .project-details {
          padding: 1.5rem;
          background: #ffffff;
        }

        .details-title {
          margin: 0 0 1rem 0;
          font-size: 0.85rem;
          font-weight: 700;
          color: #475569;
          text-transform: uppercase;
          letter-spacing: 0.5px;
        }

        .groups-grid {
          display: grid;
          grid-template-columns: repeat(auto-fill, minmax(130px, 1fr));
          gap: 1rem;
        }

        .group-card {
          background: #ffffff;
          border: 1px solid #e2e8f0;
          border-radius: 10px;
          padding: 1rem;
          display: flex;
          flex-direction: column;
          gap: 0.35rem;
          text-align: center;
          transition: all 0.2s;
        }

        .group-card:not(.empty) {
          background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
          border-color: #bbf7d0;
          box-shadow: 0 4px 10px rgba(34, 197, 94, 0.08);
          transform: translateY(-2px);
        }

        .group-card:not(.empty) .group-card-label {
          color: #166534;
        }

        .group-card:not(.empty) .group-card-value {
          color: #14532d;
          font-size: 1.15rem;
        }

        .group-card-label {
          font-size: 0.7rem;
          color: #64748b;
          font-weight: 800;
          text-transform: uppercase;
          letter-spacing: 0.5px;
        }

        .group-card-value {
          font-size: 1.05rem;
          font-weight: 800;
          color: #1e293b;
        }

        .group-card.empty {
          opacity: 0.5;
          background: #f8fafc;
          border-style: dashed;
        }

        .sub-projects-list {
          display: flex;
          flex-direction: column;
          gap: 1.5rem;
          padding: 0.5rem 0;
        }

        .sub-project-card {
          background: linear-gradient(to bottom right, #ffffff, #f8fafc);
          border: 1px solid #e2e8f0;
          border-left: 4px solid #64748b;
          border-radius: 12px;
          padding: 1.25rem;
          box-shadow: 0 4px 12px rgba(0,0,0,0.02);
        }

        .sub-project-header {
          display: flex;
          align-items: center;
          gap: 1rem;
          margin-bottom: 1.25rem;
          padding-bottom: 0.75rem;
          border-bottom: 1px dashed #cbd5e1;
          flex-wrap: wrap;
        }

        .badge-proy {
          font-size: 0.75rem;
          font-weight: 800;
          color: #ffffff;
          background: #1e293b;
          padding: 0.35rem 0.75rem;
          border-radius: 6px;
          white-space: nowrap;
          box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .sub-project-title {
          font-weight: 800;
          color: #0f172a;
          font-size: 1.05rem;
          flex-grow: 1;
        }

        .sub-project-total {
          font-weight: 900;
          color: #9c0720;
          font-size: 1.15rem;
          white-space: nowrap;
          background: #ffefef;
          padding: 0.35rem 0.85rem;
          border-radius: 8px;
          border: 1px solid #fecdd3;
        }

        .empty-state {
          text-align: center;
          padding: 3rem;
          color: #64748b;
          font-style: italic;
          background: #f8fafc;
          border-radius: 12px;
          border: 1px dashed #cbd5e1;
        }

        @media (max-width: 768px) {
          .excel-explorer-container {
            padding: 1rem;
          }
          .excel-header {
            margin-bottom: 1.25rem;
          }
          .controls-row {
            flex-direction: column;
            align-items: stretch;
          }
          .search-select-group {
            flex-direction: column;
          }
          .search-wrapper {
            flex: none;
            width: 100%;
          }
          .muni-selector {
            width: 100%;
            min-width: 100%;
            font-size: 0.75rem;
            box-sizing: border-box;
            flex: none;
          }
          .project-selector {
            width: 100%;
            min-width: 100%;
            max-width: 100%;
            font-size: 0.75rem;
            box-sizing: border-box;
            flex: none;
          }
          .group-card-value {
            font-size: 0.95rem;
          }
          .summary-total-value {
            font-size: 1.1rem;
          }
          .actions-group {
            width: 100%;
            display: grid;
            grid-template-columns: 1fr 1fr;
          }
          .btn-action {
            justify-content: center;
          }
          .pagination {
            flex-direction: row;
            justify-content: space-between;
            gap: 0.5rem;
            padding: 0.75rem;
          }
          .page-btn {
            padding: 0.5rem 0.75rem;
            font-size: 0.75rem;
            flex: 1;
            text-align: center;
          }
          .page-info {
            font-size: 0.75rem;
            text-align: center;
          }
          .metrics-grid {
            grid-template-columns: repeat(3, 1fr);
            gap: 0.5rem;
          }
          .metric-card {
            flex-direction: column;
            padding: 0.75rem 0.25rem;
            gap: 0.5rem;
            text-align: center;
          }
          .metric-info h4 {
            font-size: 0.55rem;
            line-height: 1.2;
          }
          .metric-info p {
            font-size: 0.75rem;
            word-break: break-word;
          }
        } /* End of media query */

          /* Table Styles */
          .table-container {
            background: #ffffff;
            border: 1px solid #E5E7EB;
            border-radius: 12px;
            box-shadow: 0 10px 15px -3px rgba(0,0,0,0.05);
            overflow: hidden;
            margin-top: 2rem;
          }
          .table-responsive {
            width: 100%;
            overflow-x: auto;
          }
          .data-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
          }
          .data-table th {
            background: #9c0720;
            padding: 0.6rem 0.5rem;
            text-align: left;
            font-size: 0.68rem;
            font-weight: 800;
            color: #ffffff;
            text-transform: uppercase;
            border: 1px solid #b81d36;
            white-space: nowrap;
          }
          .data-table td {
            padding: 0.5rem 0.5rem;
            font-size: 0.75rem;
            border: 1px solid #e2e8f0;
            vertical-align: middle;
            color: #1e293b;
          }
          .data-table tbody tr {
            transition: background-color 0.2s ease;
          }
          .data-table tbody tr:hover {
            background: #fcfcfc;
          }
          .row-program {
            background-color: #fef2f2;
          }
          .row-program td {
            border-top: 1.5px solid #fecdd3;
            border-bottom: 1.5px solid #fecdd3;
          }
          .val-cell {
            text-align: right;
            font-variant-numeric: tabular-nums;
          }
          .desc-cell {
            line-height: 1.4;
            color: #0f172a;
          }
          .badge-prg {
            background: #ffefef;
            color: #9c0720;
            font-weight: 800;
            padding: 0.2rem 0.4rem;
            border-radius: 4px;
            font-size: 0.65rem;
          }
          .badge-proy {
            background: #1e293b;
            color: #ffffff;
            font-weight: 700;
            padding: 0.2rem 0.4rem;
            border-radius: 4px;
            font-size: 0.65rem;
          }

          /* Pagination Styles */
          .pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1.5rem;
            padding: 1rem;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
          }
          .page-btn {
            padding: 0.6rem 1.2rem;
            border: 1px solid #cbd5e1;
            background: #ffffff;
            border-radius: 8px;
            font-weight: 600;
            color: #475569;
            cursor: pointer;
            transition: all 0.2s;
          }
          .page-btn:not(:disabled):hover {
            background: #f1f5f9;
            color: #1e293b;
          }
          .page-btn:disabled {
            opacity: 0.5;
            cursor: not-allowed;
          }
          .page-info {
            font-size: 0.9rem;
            color: #64748b;
          }
          
          
          /* Text Size Reductions for Mobile */
          .filter-select { font-size: 0.8rem; padding: 0.5rem 0.75rem; }
          .summary-title { font-size: 0.85rem; }
          .summary-total-value { font-size: 0.95rem; }
          .sub-project-title { font-size: 0.85rem; }
          .sub-project-total { font-size: 0.95rem; padding: 0.25rem 0.5rem; align-self: flex-start; margin-top: 0.5rem; }
          .metric-info p { font-size: 0.95rem; }
          .metric-info h4 { font-size: 0.65rem; }
          .badge-prg { font-size: 0.65rem; padding: 0.2rem 0.4rem; }
          .badge-proy { font-size: 0.65rem; padding: 0.2rem 0.4rem; }

          /* Layout Adjustments for Mobile */
          .project-summary, .sub-project-header {
            flex-direction: column;
            align-items: flex-start !important;
            gap: 0.75rem;
          }
          .summary-header, .summary-total {
            width: 100% !important;
            text-align: left;
            align-items: flex-start;
          }
          .project-details {
            padding: 1rem;
          }
          .sub-project-card {
            padding: 1rem;
          }
        }
      `}</style>

      {/* Header */}
      <header className="excel-header">
        <div className="excel-title-section">
          <h3>Presupuesto Institucional por Proyectos</h3>
          <p>Explorador detallado por categoría programática y objeto de gasto de los municipios de Oruro para la Gestión 2026.</p>
        </div>
      </header>

      {/* Metrics Cards */}
      <section className="metrics-grid">
        <div className="metric-card">
          <div className="metric-icon-box">
            <Coins size={18} />
          </div>
          <div className="metric-info">
            <h4>Presupuesto Total</h4>
            <p>{formatBOB(metrics.totalBudget.toString())} BOB</p>
          </div>
        </div>
        <div className="metric-card">
          <div className="metric-card-bg" />
          <div className="metric-icon-box">
            <Layers size={18} />
          </div>
          <div className="metric-info">
            <h4>Programas Presupuestarios</h4>
            <p>{metrics.programsCount} Categorías</p>
          </div>
        </div>
        <div className="metric-card">
          <div className="metric-icon-box">
            <FileSpreadsheet size={18} />
          </div>
          <div className="metric-info">
            <h4>Actividades</h4>
            <p>{metrics.projectsCount} Registrados</p>
          </div>
        </div>
      </section>

      {/* Controls Bar */}
      <section className="controls-row">
        <div className="search-select-group">
          {/* Municipality Dropdown */}
          <select 
            className="muni-selector" 
            value={selectedMuni} 
            onChange={(e) => {
              setSelectedMuni(e.target.value);
              setSelectedPrg('ALL');
            }}
          >
            <option value="TODOS">Todos los Municipios (Toda la Región)</option>
            {municipios.map(m => (
              <option key={m.id} value={m.id}>
                {m.nombre}
              </option>
            ))}
          </select>

          {/* Program Dropdown */}
          <select
            className="project-selector"
            value={selectedPrg}
            onChange={(e) => {
              setSelectedPrg(e.target.value);
              setSelectedProy('ALL');
            }}
          >
            <option value="ALL">Todos los Programas</option>
            {uniquePrograms.map((prog, idx) => {
              const desc = prog.description || '';
              const shortDesc = desc.length > 45 ? desc.substring(0, 45) + '...' : desc;
              return (
                <option key={idx} value={prog.prg}>
                  PRG {prog.prg} : {shortDesc}
                </option>
              );
            })}
          </select>

          {/* Sub-Project Dropdown */}
          {selectedPrg !== 'ALL' && (
            <select
              className="project-selector"
              value={selectedProy}
              onChange={(e) => setSelectedProy(e.target.value)}
            >
              <option value="ALL">Todos los Proyectos del Programa</option>
              {uniqueProjects.map((proy, idx) => {
                const desc = proy.description || '';
                const shortDesc = desc.length > 45 ? desc.substring(0, 45) + '...' : desc;
                return (
                  <option key={idx} value={proy.proyecto}>
                    PROY {proy.proyecto} : {shortDesc}
                  </option>
                );
              })}
            </select>
          )}
        </div>

        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1rem', marginTop: '0.5rem', width: '100%' }}>
          {/* Search Box */}
          <div className="search-wrapper" style={{ flex: '1', minWidth: '250px' }}>
            <Search size={16} color="#94a3b8" style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)' }} />
            <input 
              type="text" 
              className="search-input" 
              placeholder="Buscar por programa, proyecto o descripción..." 
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
            />
          </div>

          {/* Action Buttons */}
          <div className="actions-group" style={{ display: 'flex', gap: '1rem', width: 'auto' }}>
            <button className="btn-action btn-primary-action" onClick={exportToCSV}>
              <Download size={16} /> Exportar CSV
            </button>
            <button className="btn-action" onClick={handlePrint}>
              <Printer size={16} /> Imprimir
            </button>
          </div>
        </div>
      </section>

      {/* Extra Filters */}
      <div style={{ marginBottom: '1.25rem', marginTop: '1rem', display: 'flex', gap: '1.5rem', alignItems: 'center' }}>
        <label className="filter-checkbox-label" style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', fontSize: '0.85rem', color: '#1e293b', fontWeight: '600' }}>
          <input 
            type="checkbox" 
            checked={onlyPrograms} 
            onChange={(e) => setOnlyPrograms(e.target.checked)} 
            style={{ width: '15px', height: '15px', accentColor: '#9c0720', cursor: 'pointer' }}
          />
          Ver solo Totales de Programas (Resaltados)
        </label>
        <span style={{ fontSize: '0.8rem', color: '#64748b', fontWeight: '500' }}>
          Mostrando <strong>{filteredRows.length}</strong> de {rawRows.length} filas
        </span>
      </div>

      {/* Excel Table */}
      <div className="table-container">
        {paginatedRows.length === 0 ? (
          <div className="empty-state">
            No se encontraron resultados coincidentes con la búsqueda.
          </div>
        ) : (
          <div className="table-responsive">
            <table className="data-table">
              <thead>
                <tr>
                  <th width="4%">PRG</th>
                  <th width="5%">PROY</th>
                  <th width="35%">Descripción</th>
                  <th width="11%" style={{ textAlign: 'right' }}>Serv. Personales</th>
                  <th width="11%" style={{ textAlign: 'right' }}>Serv. No Personales</th>
                  <th width="11%" style={{ textAlign: 'right' }}>Materiales</th>
                  <th width="11%" style={{ textAlign: 'right' }}>Activos Reales</th>
                  <th width="12%" style={{ textAlign: 'right' }}>Total (BOB)</th>
                </tr>
              </thead>
              <tbody>
                {paginatedRows.map((row, idx) => {
                  const isProgram = row.proyecto === '0 000';
                  return (
                    <tr key={idx} className={isProgram ? 'row-program' : 'row-project'}>
                      <td style={{ textAlign: 'center' }}>
                        <span className="badge-prg">{row.prg}</span>
                      </td>
                      <td style={{ textAlign: 'center' }}>
                        {!isProgram && <span className="badge-proy">{row.proyecto}</span>}
                      </td>
                      <td className="desc-cell" style={{ fontWeight: isProgram ? '800' : '500', color: isProgram ? '#9c0720' : '#334155' }}>
                        {isProgram && <span style={{marginRight:'6px'}}>📋</span>}
                        {row.description}
                      </td>
                      <td className="val-cell"><MoneyCell valStr={row.grupo1} /></td>
                      <td className="val-cell"><MoneyCell valStr={row.grupo2} /></td>
                      <td className="val-cell"><MoneyCell valStr={row.grupo3} /></td>
                      <td className="val-cell"><MoneyCell valStr={row.grupo4} /></td>
                      <td className="val-cell"><MoneyCell valStr={row.total} isTotal={true} /></td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {/* Pagination Controls */}
      {totalPages > 1 && (
        <div className="pagination">
          <button 
            className="page-btn" 
            disabled={currentPage === 1}
            onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}
          >
            Anterior
          </button>
          <span className="page-info">
            Página <strong>{currentPage}</strong> de {totalPages}
          </span>
          <button 
            className="page-btn" 
            disabled={currentPage === totalPages}
            onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}
          >
            Siguiente
          </button>
        </div>
      )}
    </div>
  );
}
