'use client';

import { useState, useEffect, useRef, useMemo } from 'react';
import Link from 'next/link';
import { motion, AnimatePresence } from 'framer-motion';
import { createClient } from '@/lib/supabase/client';
import { Search, X, ArrowRight, Sparkles, Building2, ScrollText, Newspaper, User, ClipboardList } from 'lucide-react';
import styles from './GlobalSearchModal.module.css';

const staticSearchIndex = [
  { id: 'tramites', title: 'Trámites y Servicios Ciudadanos', desc: 'Guía de requisitos, personerías jurídicas y audiencias', category: 'Trámite', href: '/tramites', icon: '📋' },
  { id: 'gobernador', title: 'El Gobernador — Máxima Autoridad', desc: 'Biografía oficial, agenda y mensaje del Gobernador de Oruro', category: 'Institución', href: '/institucion/gobernador', icon: '👤' },
  { id: 'historia', title: 'Historia del Departamento de Oruro', desc: 'Reseña histórica, símbolos patrios, provincias y cultura', category: 'Institución', href: '/institucion/historia', icon: '🏛️' },
  { id: 'leyes', title: 'Gaceta Oficial — Leyes Departamentales', desc: 'Archivo digital oficial de Leyes aprobadas por la Asamblea', category: 'Gaceta', href: '/gaceta/leyes', icon: '⚖️' },
  { id: 'decretos', title: 'Gaceta Oficial — Decretos Departamentales', desc: 'Decretos ejecutivos y normativas departamentales vigentes', category: 'Gaceta', href: '/gaceta/decretos-departamentales', icon: '📜' },
  { id: 'obras', title: 'Secretaría de Obras Públicas e Infraestructura', desc: 'Proyectos viales, caminos y desarrollo urbano departamental', category: 'Secretaría', href: '/secretarias/obras-publicas', icon: '🏗️' },
  { id: 'mineria', title: 'Secretaría de Minería y Metalurgia', desc: 'Regalías mineras, control ambiental y desarrollo productivo', category: 'Secretaría', href: '/secretarias/mineria-y-metalurgia', icon: '⛏️' },
  { id: 'ambiente', title: 'Secretaría de Medio Ambiente y Madre Tierra', desc: 'Recursos hídricos, cambio climático y protección ambiental', category: 'Secretaría', href: '/secretarias/medio-ambiente', icon: '🌿' },
  { id: 'juridica', title: 'Secretaría de Asuntos Jurídicos', desc: 'Asesoría legal institucional y convenios intergubernativos', category: 'Secretaría', href: '/secretarias/asuntos-juridicos', icon: '⚖️' },
  { id: 'salud', title: 'Secretaría de Desarrollo Social y Salud', desc: 'Programas sociales, hospitales y atención a grupos vulnerables', category: 'Secretaría', href: '/secretarias/desarrollo-social', icon: '🏥' },
  { id: 'economia', title: 'Secretaría de Economía y Finanzas', desc: 'Presupuesto departamental, POA y ejecución presupuestaria', category: 'Secretaría', href: '/secretarias/economia-y-finanzas', icon: '💰' },
  { id: 'transparencia', title: 'Portal de Transparencia y Rendición de Cuentas', desc: 'Auditorías, convocatorias y acceso a la información pública', category: 'Portal', href: '/transparencia', icon: '🔍' },
  { id: 'noticias', title: 'Sala de Prensa y Últimas Noticias', desc: 'Boletines informativos, comunicados oficiales y videos', category: 'Noticias', href: '/noticias', icon: '📰' }
];

export default function GlobalSearchModal({ isOpen, onClose }) {
  const [query, setQuery] = useState('');
  const [dbResults, setDbResults] = useState([]);
  const [loading, setLoading] = useState(false);
  const inputRef = useRef(null);
  const supabase = useMemo(() => createClient(), []);

  useEffect(() => {
    if (isOpen) {
      setTimeout(() => inputRef.current?.focus(), 50);
    } else {
      setQuery('');
      setDbResults([]);
    }
  }, [isOpen]);

  // Atajo de teclado general Ctrl+K / Cmd+K y ESC
  useEffect(() => {
    const handleKeyDown = (e) => {
      if (e.key === 'Escape' && isOpen) {
        onClose();
      }
      if ((e.ctrlKey || e.metaKey) && e.key.toLowerCase() === 'k') {
        e.preventDefault();
        if (isOpen) onClose();
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [isOpen, onClose]);

  // Búsqueda dinámica en Supabase cuando se escribe
  useEffect(() => {
    if (query.trim().length < 2) {
      setDbResults([]);
      return;
    }

    const timer = setTimeout(async () => {
      setLoading(true);
      try {
        const { data, error } = await supabase
          .from('noticias')
          .select('id, titulo, resumen')
          .ilike('titulo', `%${query}%`)
          .limit(4);

        if (data && !error) {
          setDbResults(
            data.map((item) => ({
              id: item.id,
              title: item.titulo,
              desc: item.resumen || 'Nota de prensa oficial',
              category: 'Noticia',
              href: `/noticias/${item.id}`,
              icon: '📰'
            }))
          );
        }
      } catch (e) {
        // En caso de error de conexión, mantener índice local
      } finally {
        setLoading(false);
      }
    }, 250);

    return () => clearTimeout(timer);
  }, [query, supabase]);

  const localResults = useMemo(() => {
    if (!query.trim()) return [];
    const q = query.toLowerCase();
    return staticSearchIndex.filter(
      (item) =>
        item.title.toLowerCase().includes(q) ||
        item.desc.toLowerCase().includes(q) ||
        item.category.toLowerCase().includes(q)
    );
  }, [query]);

  const combinedResults = useMemo(() => {
    return [...localResults, ...dbResults];
  }, [localResults, dbResults]);

  const handleSuggestionClick = (suggestionText) => {
    setQuery(suggestionText);
  };

  if (!isOpen) return null;

  return (
    <AnimatePresence>
      <motion.div
        className={styles.overlay}
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        exit={{ opacity: 0 }}
        onClick={onClose}
      >
        <motion.div
          className={styles.modal}
          initial={{ scale: 0.92, y: 30, opacity: 0 }}
          animate={{ scale: 1, y: 0, opacity: 1 }}
          exit={{ scale: 0.92, y: 30, opacity: 0 }}
          transition={{ type: 'spring', stiffness: 350, damping: 28 }}
          onClick={(e) => e.stopPropagation()}
        >
          {/* Header con Input */}
          <div className={styles.header}>
            <Search size={22} className={styles.searchIcon} />
            <input
              ref={inputRef}
              type="text"
              className={styles.input}
              placeholder="Buscar leyes, secretarías, noticias, trámites..."
              value={query}
              onChange={(e) => setQuery(e.target.value)}
            />
            {query && (
              <button type="button" onClick={() => setQuery('')} className={styles.closeBtn} title="Limpiar">
                <X size={16} />
              </button>
            )}
            <span className={styles.escBadge}>ESC</span>
            <button type="button" onClick={onClose} className={styles.closeBtn} aria-label="Cerrar">
              <X size={20} />
            </button>
          </div>

          {/* Cuerpo */}
          <div className={styles.body}>
            {!query.trim() ? (
              <div>
                <div className={styles.sectionTitle}>
                  <Sparkles size={16} /> Búsquedas Frecuentes
                </div>
                <div className={styles.suggestionsGrid}>
                  {[
                    'Leyes Departamentales',
                    'Obras Públicas',
                    'Trámites Ciudadanos',
                    'El Gobernador',
                    'Minería y Metalurgia',
                    'Becas y Ayuda Social',
                    'Últimas Noticias'
                  ].map((sug) => (
                    <button
                      key={sug}
                      type="button"
                      className={styles.suggestionChip}
                      onClick={() => handleSuggestionClick(sug)}
                    >
                      🔥 {sug}
                    </button>
                  ))}
                </div>
              </div>
            ) : combinedResults.length > 0 ? (
              <div>
                <div className={styles.sectionTitle}>
                  Resultados encontrados ({combinedResults.length})
                </div>
                <div className={styles.resultsList}>
                  {combinedResults.map((res) => (
                    <Link
                      key={res.id}
                      href={res.href}
                      className={styles.resultItem}
                      onClick={onClose}
                    >
                      <div className={styles.resultContent}>
                        <div className={styles.resultIcon}>{res.icon}</div>
                        <div className={styles.resultInfo}>
                          <span className={styles.resultTitle}>{res.title}</span>
                          <span className={styles.resultDesc}>{res.desc}</span>
                        </div>
                      </div>
                      <span className={styles.resultBadge}>{res.category}</span>
                    </Link>
                  ))}
                </div>
              </div>
            ) : (
              <div className={styles.noResults}>
                <div className={styles.noResultsEmoji}>😕</div>
                <p style={{ fontWeight: 700, color: '#1a1a2e', marginBottom: '0.3rem' }}>
                  No encontramos resultados para &quot;{query}&quot;
                </p>
                <p style={{ fontSize: '0.85rem' }}>
                  Intenta con otras palabras clave como &quot;Leyes&quot;, &quot;Obras&quot; o &quot;Gobernador&quot;.
                </p>
              </div>
            )}
          </div>

          {/* Footer */}
          <div className={styles.footer}>
            <span>⚡ Portal Inteligente del Gobierno Autónomo Departamental de Oruro</span>
            <span>Atajo: <strong>Ctrl + K</strong></span>
          </div>
        </motion.div>
      </motion.div>
    </AnimatePresence>
  );
}
