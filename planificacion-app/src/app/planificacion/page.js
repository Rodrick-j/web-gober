"use client";
import React from 'react';
import Link from 'next/link';
import { ArrowLeft, BarChart3 } from 'lucide-react';
import { motion } from 'framer-motion';
import PlanificacionSection from './PlanificacionSection';
import './planificacion.css';

export default function PlanificacionPage() {
  return (
    <div className="planificacion-page-wrapper">
      {/* Navbar/Encabezado Superior */}
      <motion.nav 
        className="top-nav-bar"
        initial={{ y: -50, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ duration: 0.5, ease: "easeOut" }}
      >
        <div className="nav-container">
          <Link href="/" className="back-link">
            <ArrowLeft size={20} />
            <span>Volver a Secretarías</span>
          </Link>
          <div className="nav-title">
            <BarChart3 size={24} color="#ffb843" />
            <h1>Módulo Estadístico GADOR</h1>
          </div>
          <div className="nav-status">
            <span className="status-dot"></span>
            En línea
          </div>
        </div>
      </motion.nav>

      {/* Header Épico */}
      <header className="epic-header">
        <div className="epic-header-bg">
          <div className="overlay"></div>
        </div>
        <motion.div 
          className="epic-content"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.7, delay: 0.2 }}
        >
          <div className="badge">Gobernación de Oruro</div>
          <h2>Inteligencia de Datos Departamentales</h2>
          <p>
            Plataforma central de monitoreo, planificación estratégica y análisis presupuestario de los 35 municipios del departamento.
          </p>
        </motion.div>
      </header>

      {/* Contenido Principal (El Tablero Migrado) */}
      <main className="main-dashboard-container">
        <motion.div 
          className="dashboard-card"
          initial={{ opacity: 0, scale: 0.98 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.6, delay: 0.4 }}
        >
          <PlanificacionSection secretariaId="4cd04746-512c-4613-bedc-bcaf81c0c163" /> 
        </motion.div>
      </main>
    </div>
  );
}
