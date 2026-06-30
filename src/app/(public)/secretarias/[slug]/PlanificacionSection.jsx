'use client';

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { FileText, Database, MapPin, ChevronDown, Building, Search, ArrowLeft, Download } from 'lucide-react';
import styles from './SecretariaDetail.module.css'; // Reusing styles from the page

const provinciasOruro = [
  { nombre: "Cercado", municipios: ["Oruro", "Caracollo", "El Choro", "Soracachi (Paria)"] },
  { nombre: "Abaroa", municipios: ["Challapata", "Quillacas"] },
  { nombre: "Carangas", municipios: ["Corque", "Choquecota"] },
  { nombre: "Pantaleón Dalence", municipios: ["Huanuni", "Machacamarca"] },
  { nombre: "Ladislao Cabrera", municipios: ["Salinas de Garci Mendoza", "Pampa Aullagas"] },
  { nombre: "Litoral", municipios: ["Huachacalla", "Esmeralda", "Cruz de Machacamarca", "Escara", "Yunguyo del Litoral"] },
  { nombre: "Mejillones", municipios: ["La Rivera", "Todos Santos", "Carangas"] },
  { nombre: "Nor Carangas", municipios: ["Huayllamarca"] },
  { nombre: "Poopó", municipios: ["Poopó", "Pazña", "Antequera"] },
  { nombre: "Sabaya", municipios: ["Sabaya", "Coipasa", "Chipaya"] },
  { nombre: "Sajama", municipios: ["Curahuara de Carangas", "Turco"] },
  { nombre: "San Pedro de Totora", municipios: ["Totora"] },
  { nombre: "Saucarí", municipios: ["Toledo"] },
  { nombre: "Sebastián Pagador", municipios: ["Santiago de Huari"] },
  { nombre: "Tomás Barrón", municipios: ["Eucaliptus"] }
];

export default function PlanificacionSection() {
  const [activeTab, setActiveTab] = useState('sistemas');
  const [openProvincia, setOpenProvincia] = useState(null);
  const [viewMode, setViewMode] = useState('cards'); // 'cards', 'poa', 'sisin'
  const [poaYear, setPoaYear] = useState('2024');

  return (
    <div style={{ marginTop: '3rem' }}>
      <h2 style={{ fontSize: '1.75rem', color: '#1a1a2e', marginBottom: '1.5rem', fontWeight: '800' }}>
        Planificación Departamental
      </h2>
      
      {/* Tabs */}
      <div style={{ display: 'flex', gap: '1rem', marginBottom: '2rem', borderBottom: '2px solid #eee' }}>
        <button
          onClick={() => { setActiveTab('sistemas'); setViewMode('cards'); }}
          style={{
            padding: '0.75rem 1.5rem',
            background: 'transparent',
            border: 'none',
            borderBottom: activeTab === 'sistemas' ? '3px solid #9c0720' : '3px solid transparent',
            color: activeTab === 'sistemas' ? '#9c0720' : '#666',
            fontWeight: 'bold',
            fontSize: '1rem',
            cursor: 'pointer',
            display: 'flex',
            alignItems: 'center',
            gap: '0.5rem',
            transition: 'all 0.2s'
          }}
        >
          <Database size={20} /> Sistemas POA y SISIN
        </button>
        <button
          onClick={() => setActiveTab('territorio')}
          style={{
            padding: '0.75rem 1.5rem',
            background: 'transparent',
            border: 'none',
            borderBottom: activeTab === 'territorio' ? '3px solid #9c0720' : '3px solid transparent',
            color: activeTab === 'territorio' ? '#9c0720' : '#666',
            fontWeight: 'bold',
            fontSize: '1rem',
            cursor: 'pointer',
            display: 'flex',
            alignItems: 'center',
            gap: '0.5rem',
            transition: 'all 0.2s'
          }}
        >
          <MapPin size={20} /> División Territorial
        </button>
      </div>

      {/* Tab Content */}
      <AnimatePresence mode="wait">
        {activeTab === 'sistemas' && (
          <motion.div
            key="sistemas"
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -10 }}
          >
            {viewMode === 'cards' && (
              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', gap: '1.5rem' }}>
                {/* Card POA */}
                <div style={{ background: 'linear-gradient(135deg, #9c0720 0%, #7a0518 100%)', border: 'none', borderRadius: '12px', padding: '1.75rem', boxShadow: '0 8px 16px rgba(156, 7, 32, 0.2)', transition: 'transform 0.2s', color: '#fff', position: 'relative', overflow: 'hidden' }}>
                  {/* Decorative background element */}
                  <div style={{ position: 'absolute', right: '-20px', top: '-20px', opacity: 0.1, transform: 'scale(2)' }}>
                    <FileText size={150} />
                  </div>
                  
                  <div style={{ position: 'relative', zIndex: 1 }}>
                    <div style={{ background: 'rgba(255, 255, 255, 0.2)', width: '50px', height: '50px', borderRadius: '12px', display: 'flex', alignItems: 'center', justifyContent: 'center', color: '#fff', marginBottom: '1.25rem' }}>
                      <FileText size={24} />
                    </div>
                    <h3 style={{ fontSize: '1.35rem', fontWeight: 'bold', color: '#fff', marginBottom: '0.75rem' }}>Plan Operativo Anual (POA)</h3>
                    <p style={{ color: 'rgba(255, 255, 255, 0.9)', fontSize: '0.95rem', marginBottom: '1.75rem', lineHeight: '1.5' }}>
                      Acceda a los documentos e instrumentos de planificación anual del Gobierno Autónomo Departamental de Oruro.
                    </p>
                    <button 
                      onClick={() => setViewMode('poa')}
                      style={{ display: 'inline-flex', alignItems: 'center', gap: '0.5rem', background: '#fff', color: '#9c0720', padding: '0.75rem 1.5rem', borderRadius: '8px', fontWeight: 'bold', fontSize: '0.95rem', border: 'none', cursor: 'pointer', boxShadow: '0 4px 6px rgba(0,0,0,0.1)' }}
                    >
                      Acceder al POA
                    </button>
                  </div>
                </div>

                {/* Card SISIN */}
                <div style={{ background: 'linear-gradient(135deg, #67181a 0%, #4a1012 100%)', border: 'none', borderRadius: '12px', padding: '1.75rem', boxShadow: '0 8px 16px rgba(103, 24, 26, 0.2)', transition: 'transform 0.2s', color: '#fff', position: 'relative', overflow: 'hidden' }}>
                  {/* Decorative background element */}
                  <div style={{ position: 'absolute', right: '-20px', top: '-20px', opacity: 0.1, transform: 'scale(2)' }}>
                    <Database size={150} />
                  </div>
                  
                  <div style={{ position: 'relative', zIndex: 1 }}>
                    <div style={{ background: 'rgba(255, 255, 255, 0.2)', width: '50px', height: '50px', borderRadius: '12px', display: 'flex', alignItems: 'center', justifyContent: 'center', color: '#fff', marginBottom: '1.25rem' }}>
                      <Database size={24} />
                    </div>
                    <h3 style={{ fontSize: '1.35rem', fontWeight: 'bold', color: '#fff', marginBottom: '0.75rem' }}>Sistema de Información (SISIN)</h3>
                    <p style={{ color: 'rgba(255, 255, 255, 0.9)', fontSize: '0.95rem', marginBottom: '1.75rem', lineHeight: '1.5' }}>
                      Plataforma de seguimiento y evaluación de proyectos de inversión pública del departamento.
                    </p>
                    <a href="#" style={{ display: 'inline-flex', alignItems: 'center', gap: '0.5rem', background: '#ffb843', color: '#1a1a2e', padding: '0.75rem 1.5rem', borderRadius: '8px', fontWeight: 'bold', fontSize: '0.95rem', textDecoration: 'none', boxShadow: '0 4px 6px rgba(0,0,0,0.1)' }}>
                      Ingresar al SISIN
                    </a>
                  </div>
                </div>
              </div>
            )}

            {viewMode === 'poa' && (
              <motion.div
                initial={{ opacity: 0, x: 20 }}
                animate={{ opacity: 1, x: 0 }}
                style={{ background: '#fff', border: '1px solid #eaeaea', borderRadius: '12px', padding: '2rem', boxShadow: '0 4px 12px rgba(0,0,0,0.05)' }}
              >
                <div style={{ display: 'flex', alignItems: 'center', gap: '1rem', marginBottom: '2rem' }}>
                  <button 
                    onClick={() => setViewMode('cards')}
                    style={{ background: '#f5f5f5', border: 'none', width: '40px', height: '40px', borderRadius: '50%', display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer', color: '#444' }}
                  >
                    <ArrowLeft size={20} />
                  </button>
                  <h3 style={{ fontSize: '1.5rem', fontWeight: 'bold', color: '#1a1a2e', margin: 0 }}>Descarga de Documentos POA</h3>
                </div>

                <div style={{ display: 'flex', gap: '1rem', marginBottom: '2rem', flexWrap: 'wrap' }}>
                  <div style={{ flex: '1', minWidth: '250px', position: 'relative' }}>
                    <Search size={18} color="#888" style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)' }} />
                    <input 
                      type="text" 
                      placeholder="Buscar documento por nombre..." 
                      style={{ width: '100%', padding: '0.75rem 1rem 0.75rem 2.5rem', borderRadius: '8px', border: '1px solid #ddd', fontSize: '1rem' }}
                    />
                  </div>
                  <select 
                    value={poaYear}
                    onChange={(e) => setPoaYear(e.target.value)}
                    style={{ padding: '0.75rem 1rem', borderRadius: '8px', border: '1px solid #ddd', fontSize: '1rem', fontWeight: '600', color: '#1a1a2e', background: '#f9f9f9', minWidth: '150px' }}
                  >
                    <option value="2025">Gestión 2025</option>
                    <option value="2024">Gestión 2024</option>
                    <option value="2023">Gestión 2023</option>
                    <option value="2022">Gestión 2022</option>
                  </select>
                </div>

                <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                  {[1, 2, 3].map((item) => (
                    <div key={item} style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '1.25rem', border: '1px solid #eee', borderRadius: '8px', transition: 'background 0.2s', cursor: 'pointer' }} className={styles.poaItemHover}>
                      <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
                        <div style={{ background: '#ffefef', color: '#9c0720', padding: '0.75rem', borderRadius: '8px' }}>
                          <FileText size={24} />
                        </div>
                        <div>
                          <h4 style={{ margin: '0 0 0.25rem 0', fontSize: '1.1rem', color: '#1a1a2e' }}>POA Inicial - Gestión {poaYear} (Parte {item})</h4>
                          <span style={{ fontSize: '0.85rem', color: '#888' }}>PDF Document • 2.{item} MB • Publicado recientemente</span>
                        </div>
                      </div>
                      <button style={{ background: 'transparent', border: '1px solid #9c0720', color: '#9c0720', padding: '0.5rem 1rem', borderRadius: '6px', display: 'flex', alignItems: 'center', gap: '0.5rem', fontWeight: '600', cursor: 'pointer' }}>
                        <Download size={16} /> Descargar
                      </button>
                    </div>
                  ))}
                </div>
              </motion.div>
            )}
          </motion.div>
        )}

        {activeTab === 'territorio' && (
          <motion.div
            key="territorio"
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -10 }}
          >
            <p style={{ color: '#4a4848', marginBottom: '1.5rem', lineHeight: '1.6', fontSize: '1rem' }}>
              El departamento de Oruro (Bolivia) se divide administrativamente en <strong>16 provincias</strong> y <strong>35 municipios</strong>. La capital departamental es la ciudad de Oruro.
            </p>
            
            <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
              {provinciasOruro.map((prov, index) => (
                <div key={index} style={{ border: '1px solid #eaeaea', borderRadius: '8px', overflow: 'hidden', background: '#fff' }}>
                  <button
                    onClick={() => setOpenProvincia(openProvincia === index ? null : index)}
                    style={{
                      width: '100%',
                      padding: '1rem 1.5rem',
                      background: openProvincia === index ? 'rgba(156, 7, 32, 0.03)' : '#fff',
                      border: 'none',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'space-between',
                      cursor: 'pointer',
                      fontWeight: 'bold',
                      color: openProvincia === index ? '#9c0720' : '#1a1a2e',
                      fontSize: '1rem'
                    }}
                  >
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                      <MapPin size={18} color={openProvincia === index ? '#9c0720' : '#888'} />
                      Provincia {prov.nombre}
                    </div>
                    <ChevronDown size={20} style={{ transform: openProvincia === index ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.3s' }} />
                  </button>
                  <AnimatePresence>
                    {openProvincia === index && (
                      <motion.div
                        initial={{ height: 0, opacity: 0 }}
                        animate={{ height: 'auto', opacity: 1 }}
                        exit={{ height: 0, opacity: 0 }}
                        style={{ overflow: 'hidden' }}
                      >
                        <div style={{ padding: '0 1.5rem 1rem 3.5rem' }}>
                          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))', gap: '0.75rem' }}>
                            {prov.municipios.map((mun, i) => (
                              <div key={i} style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#4a4848', fontSize: '0.9rem' }}>
                                <Building size={14} color="#ccc" />
                                {mun}
                              </div>
                            ))}
                          </div>
                        </div>
                      </motion.div>
                    )}
                  </AnimatePresence>
                </div>
              ))}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
