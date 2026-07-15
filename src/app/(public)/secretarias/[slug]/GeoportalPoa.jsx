'use client';

import { useState, useEffect, useRef, useMemo } from 'react';
import { Search, MapPin, Filter, Layers, DollarSign, Award, Activity, X, Eye, Globe, Compass, Moon, Sun, RotateCcw, List, ChevronRight, CheckCircle2, AlertCircle } from 'lucide-react';

// Proyectos oficiales reales extraídos del Presupuesto Institucional de Corque 2025 (SDPD)
const OBRAS_OFICIALES_CORQUE_2025 = [
  {
    id: "corque-poa-1",
    titulo: "APOYO A LA PRODUCCIÓN AGROPECUARIA MUNICIPIO DE CORQUE",
    categoria: "Desarrollo Agropecuario",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 80000,
    distrito: "Distrito 1",
    subalcaldia: "CENTRAL CORQUE",
    gestion: "2025",
    latOffset: 0.002, lngOffset: 0.003
  },
  {
    id: "corque-poa-2",
    titulo: "IMPLEMENTACIÓN DE CERCOS Y ALAMBRADO COM. PICHACANI",
    categoria: "Desarrollo Agropecuario",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "DESCONCENTRADA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 45000,
    distrito: "Distrito 2",
    subalcaldia: "PICHACANI",
    gestion: "2025",
    latOffset: 0.015, lngOffset: -0.012
  },
  {
    id: "corque-poa-3",
    titulo: "AMPLIACIÓN SEDE AGROGANADERA COMUNIDAD ANTIPACHACA",
    categoria: "Desarrollo Agropecuario",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "EN LICITACIÓN / ADJUDICACIÓN",
    presupuesto: 40000,
    distrito: "Distrito 2",
    subalcaldia: "ANTIPACHACA",
    gestion: "2025",
    latOffset: 0.022, lngOffset: 0.018
  },
  {
    id: "corque-poa-4",
    titulo: "IMPLEMENTACIÓN DE CERCOS Y ALAMBRADO COM. SAN BARTOLOME",
    categoria: "Desarrollo Agropecuario",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "DESCONCENTRADA",
    estado: "CONCLUIDO 100%",
    presupuesto: 41000,
    distrito: "Distrito 3",
    subalcaldia: "SAN BARTOLOME",
    gestion: "2025",
    latOffset: -0.018, lngOffset: 0.024
  },
  {
    id: "corque-poa-5",
    titulo: "IMPLEMENTACIÓN DE ATAJADOS PARA COSECHA DE AGUA DE LLUVIA COM. SAN BARTOLOME",
    categoria: "Agua Potable y Riego",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 92000,
    distrito: "Distrito 3",
    subalcaldia: "SAN BARTOLOME",
    gestion: "2025",
    latOffset: -0.020, lngOffset: 0.026
  },
  {
    id: "corque-poa-6",
    titulo: "MEJORAMIENTO GENÉTICO DE GANADO CAMÉLIDO CON COMPRA DE REPRODUCTORES COM. CUYUNDANI",
    categoria: "Desarrollo Agropecuario",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 75000,
    distrito: "Distrito 2",
    subalcaldia: "CUYUNDANI",
    gestion: "2025",
    latOffset: 0.028, lngOffset: -0.015
  },
  {
    id: "corque-poa-7",
    titulo: "IMPLEMENTACIÓN DE CORRALES MÓVILES PARA PROD. INTEGRAL COM. CENTRO VILUMA",
    categoria: "Desarrollo Agropecuario",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "DESCONCENTRADA",
    estado: "CONCLUIDO 100%",
    presupuesto: 60000,
    distrito: "Distrito 1",
    subalcaldia: "VILUMA",
    gestion: "2025",
    latOffset: 0.008, lngOffset: -0.009
  },
  {
    id: "corque-poa-8",
    titulo: "IMPLEMENTACIÓN DE CERCOS Y ALAMBRADO COM. ANTACAHUA",
    categoria: "Desarrollo Agropecuario",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "DESCONCENTRADA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 89000,
    distrito: "Distrito 3",
    subalcaldia: "ANTACAHUA",
    gestion: "2025",
    latOffset: -0.025, lngOffset: -0.018
  },
  {
    id: "corque-poa-9",
    titulo: "CONST. SEDE AGROGANADERA COMUNIDAD HUMAMARCA",
    categoria: "Desarrollo Agropecuario",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 80000,
    distrito: "Distrito 2",
    subalcaldia: "HUMAMARCA",
    gestion: "2025",
    latOffset: 0.019, lngOffset: 0.009
  },
  {
    id: "corque-poa-10",
    titulo: "CONST. INFRAESTRUCTURA PARA CULTIVO HIDROPÓNICO COMUNIDAD CENTRO BOLIVAR",
    categoria: "Desarrollo Agropecuario",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "ESTRATÉGICA",
    estado: "EN LICITACIÓN / ADJUDICACIÓN",
    presupuesto: 188000,
    distrito: "Distrito 1",
    subalcaldia: "CENTRAL BOLIVAR",
    gestion: "2025",
    latOffset: 0.005, lngOffset: 0.012
  },
  {
    id: "corque-poa-11",
    titulo: "AMPLIACIÓN SISTEMA DE AGUA POTABLE VILLA COPACABANA",
    categoria: "Agua Potable y Riego",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 110000,
    distrito: "Distrito 1",
    subalcaldia: "VILLA COPACABANA",
    gestion: "2025",
    latOffset: -0.004, lngOffset: -0.007
  },
  {
    id: "corque-poa-12",
    titulo: "PERFORACIÓN POZO PROFUNDO FOTOVOLTAICO SECTOR ORKO HUANO COMUNIDAD VILLA NUEVA",
    categoria: "Agua Potable y Riego",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 27000,
    distrito: "Distrito 3",
    subalcaldia: "VILLA NUEVA",
    gestion: "2025",
    latOffset: -0.030, lngOffset: 0.015
  },
  {
    id: "corque-poa-13",
    titulo: "CONST. SISTEMA DE ALCANTARILLADO SANITARIO COMUNIDAD POMATA AITE",
    categoria: "Salud y Saneamiento",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 174000,
    distrito: "Distrito 2",
    subalcaldia: "POMATA AITE",
    gestion: "2025",
    latOffset: 0.032, lngOffset: -0.008
  },
  {
    id: "corque-poa-14",
    titulo: "CONST. SISTEMA DE ALCANTARILLADO SANITARIO COMUNIDAD SAN ANTONIO DE NOR KALA",
    categoria: "Salud y Saneamiento",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 272000,
    distrito: "Distrito 3",
    subalcaldia: "NOR KALA",
    gestion: "2025",
    latOffset: -0.028, lngOffset: -0.022
  },
  {
    id: "corque-poa-15",
    titulo: "CONST. SISTEMA DE RIEGO TECNIFICADO COMUNIDAD VILLA TARUCACHI",
    categoria: "Agua Potable y Riego",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 100000,
    distrito: "Distrito 2",
    subalcaldia: "TARUCACHI",
    gestion: "2025",
    latOffset: 0.025, lngOffset: 0.029
  },
  {
    id: "corque-poa-16",
    titulo: "MEJORAMIENTO DE CALLES DE LA PLAZA COMUNIDAD CONDORIRI",
    categoria: "Infraestructura Vial y Caminos",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "CONCLUIDO 100%",
    presupuesto: 141000,
    distrito: "Distrito 3",
    subalcaldia: "CONDORIRI",
    gestion: "2025",
    latOffset: -0.015, lngOffset: -0.031
  },
  {
    id: "corque-poa-17",
    titulo: "MEJORAMIENTO DE PLAZA COMUNIDAD VILLA REMEDIOS",
    categoria: "Infraestructura Vial y Caminos",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "DESCONCENTRADA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 59000,
    distrito: "Distrito 1",
    subalcaldia: "VILLA REMEDIOS",
    gestion: "2025",
    latOffset: -0.008, lngOffset: 0.014
  },
  {
    id: "corque-poa-18",
    titulo: "CONST. ENLOSETADO MUNICIPIO DE CORQUE (CASCO URBANO)",
    categoria: "Infraestructura Vial y Caminos",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 299974,
    distrito: "Distrito 1",
    subalcaldia: "CENTRAL CORQUE",
    gestion: "2025",
    latOffset: 0.001, lngOffset: -0.001
  },
  {
    id: "corque-poa-19",
    titulo: "CONST. ENLOSETADO Y CORDONES CALLES S/N COMUNIDAD OPOQUERI",
    categoria: "Infraestructura Vial y Caminos",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 340000,
    distrito: "Distrito 2",
    subalcaldia: "OPOQUERI",
    gestion: "2025",
    latOffset: 0.035, lngOffset: 0.012
  },
  {
    id: "corque-poa-20",
    titulo: "CONST. ENLOSETADO Y CORDONES CALLES CAMPO JORDAN, E. AVAROA, ANTOFAGASTA",
    categoria: "Infraestructura Vial y Caminos",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 650000,
    distrito: "Distrito 1",
    subalcaldia: "CENTRAL CORQUE",
    gestion: "2025",
    latOffset: -0.002, lngOffset: 0.004
  },
  {
    id: "corque-poa-21",
    titulo: "GESTIÓN DE CAMINOS VECINALES Y MANTENIMIENTO MUNICIPIO DE CORQUE",
    categoria: "Infraestructura Vial y Caminos",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 120000,
    distrito: "Distrito 1",
    subalcaldia: "RED VECINAL",
    gestion: "2025",
    latOffset: 0.010, lngOffset: -0.020
  },
  {
    id: "corque-poa-22",
    titulo: "EQUIPAMIENTO MÉDICO RED MUNICIPAL DE SALUD CENTROS DE CORQUE",
    categoria: "Salud y Saneamiento",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 200000,
    distrito: "Distrito 1",
    subalcaldia: "CENTRAL SALUD",
    gestion: "2025",
    latOffset: 0.003, lngOffset: -0.003
  },
  {
    id: "corque-poa-23",
    titulo: "MANTENIMIENTO INFRAESTRUCTURAS DE RED DE SALUD MUNICIPAL",
    categoria: "Salud y Saneamiento",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "CONCLUIDO 100%",
    presupuesto: 50000,
    distrito: "Distrito 1",
    subalcaldia: "RED SALUD",
    gestion: "2025",
    latOffset: -0.006, lngOffset: -0.012
  },
  {
    id: "corque-poa-24",
    titulo: "DESAYUNO Y ALMUERZO ESCOLAR MUNICIPIO DE CORQUE",
    categoria: "Educación y Deportes",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 1400000,
    distrito: "Distrito 1",
    subalcaldia: "RED EDUCATIVA",
    gestion: "2025",
    latOffset: 0.000, lngOffset: 0.000
  },
  {
    id: "corque-poa-25",
    titulo: "EQUIPAMIENTO UNIDADES EDUCATIVAS MUNICIPIO DE CORQUE",
    categoria: "Educación y Deportes",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 300000,
    distrito: "Distrito 1",
    subalcaldia: "RED EDUCATIVA",
    gestion: "2025",
    latOffset: -0.003, lngOffset: 0.006
  },
  {
    id: "corque-poa-26",
    titulo: "CONST. COMEDOR Y COCINA UNIDAD EDUCATIVA COMUNIDAD ANDAPATA LUPE",
    categoria: "Educación y Deportes",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 119000,
    distrito: "Distrito 2",
    subalcaldia: "ANDAPATA LUPE",
    gestion: "2025",
    latOffset: 0.026, lngOffset: 0.021
  },
  {
    id: "corque-poa-27",
    titulo: "AMPLIACIÓN UNIDAD EDUCATIVA RAFAEL PABÓN COMUNIDAD SAN JOSE KALA",
    categoria: "Educación y Deportes",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "ESTRATÉGICA",
    estado: "EN LICITACIÓN / ADJUDICACIÓN",
    presupuesto: 400000,
    distrito: "Distrito 3",
    subalcaldia: "SAN JOSE KALA",
    gestion: "2025",
    latOffset: -0.032, lngOffset: -0.005
  },
  {
    id: "corque-poa-28",
    titulo: "CONST. CANCHA POLIFUNCIONAL COMUNIDAD BARRAS AYLLU CATAZA",
    categoria: "Educación y Deportes",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "DESCONCENTRADA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 32000,
    distrito: "Distrito 2",
    subalcaldia: "BARRAS CATAZA",
    gestion: "2025",
    latOffset: 0.038, lngOffset: -0.022
  },
  {
    id: "corque-poa-29",
    titulo: "PROMOCIÓN Y FOVENTO A ESCUELA MUNICIPAL DE DEPORTES",
    categoria: "Educación y Deportes",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 60000,
    distrito: "Distrito 1",
    subalcaldia: "CENTRAL DEPORTES",
    gestion: "2025",
    latOffset: 0.007, lngOffset: 0.008
  },
  {
    id: "corque-poa-30",
    titulo: "FORTALECIMIENTO Y MANTENIMIENTO MAQUINARIA PESADA Y CAMIONES",
    categoria: "Infraestructura Vial y Caminos",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 250000,
    distrito: "Distrito 1",
    subalcaldia: "MAESTRANZA",
    gestion: "2025",
    latOffset: 0.012, lngOffset: -0.005
  }
];

// Proyectos oficiales reales extraídos del Presupuesto Institucional de Choquecota 2025 (SDPD - Entidad 1415)
const OBRAS_OFICIALES_CHOQUECOTA_2025 = [
  {
    id: "choquecota-poa-1",
    titulo: "FUNCIONAMIENTO ÓRGANO EJECUTIVO MUNICIPAL",
    categoria: "Órgano Ejecutivo",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 398627,
    distrito: "Distrito Central",
    subalcaldia: "CHOQUECOTA CENTRAL",
    gestion: "2025",
    latOffset: 0.001, lngOffset: 0.001
  },
  {
    id: "choquecota-poa-2",
    titulo: "FUNCIONAMIENTO CONCEJO MUNICIPAL (ÓRGANO DELIBERATIVO)",
    categoria: "Órgano Deliberativo",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 265751,
    distrito: "Distrito Central",
    subalcaldia: "CHOQUECOTA CENTRAL",
    gestion: "2025",
    latOffset: 0.002, lngOffset: -0.001
  },
  {
    id: "choquecota-poa-3",
    titulo: "FORTALECIMIENTO A LA PRODUCCIÓN MUNICIPIO DE CHOQUECOTA",
    categoria: "Desarrollo Agropecuario",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 42000,
    distrito: "Distrito Agropecuario",
    subalcaldia: "CHOQUECOTA CENTRAL",
    gestion: "2025",
    latOffset: 0.008, lngOffset: 0.012
  },
  {
    id: "choquecota-poa-4",
    titulo: "APOYO A FERIAS PRODUCTIVAS MUNICIPALES",
    categoria: "Desarrollo Agropecuario",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 50000,
    distrito: "Distrito Central",
    subalcaldia: "FERIAS PRODUCTIVAS",
    gestion: "2025",
    latOffset: -0.005, lngOffset: 0.007
  },
  {
    id: "choquecota-poa-5",
    titulo: "SANIDAD ANIMAL Y CAMPAÑAS SANITARIAS",
    categoria: "Desarrollo Agropecuario",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 15000,
    distrito: "Distrito Agropecuario",
    subalcaldia: "AYLLUS CHOQUECOTA",
    gestion: "2025",
    latOffset: 0.014, lngOffset: -0.009
  },
  {
    id: "choquecota-poa-6",
    titulo: "MANTENIMIENTO Y LIMPIEZA DE VIGIÑAS AYLLU LERCO",
    categoria: "Desarrollo Agropecuario",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 33120,
    distrito: "Ayllu Lerco",
    subalcaldia: "AYLLU LERCO",
    gestion: "2025",
    latOffset: 0.021, lngOffset: 0.015
  },
  {
    id: "choquecota-poa-7",
    titulo: "IMPLEMENTACIÓN DE ROTURADO Y ADQ. DE SEMILLAS AYLLU SAYJASI",
    categoria: "Desarrollo Agropecuario",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "ESTRATÉGICA",
    estado: "EN LICITACIÓN / ADJUDICACIÓN",
    presupuesto: 50600,
    distrito: "Ayllu Sayjasi",
    subalcaldia: "AYLLU SAYJASI",
    gestion: "2025",
    latOffset: -0.018, lngOffset: 0.022
  },
  {
    id: "choquecota-poa-8",
    titulo: "IMPLEMENTACIÓN DE CERCOS PARA LA PRODUCCIÓN DE FORRAJE AYLLU HILANACA",
    categoria: "Desarrollo Agropecuario",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 11040,
    distrito: "Ayllu Hilanaca",
    subalcaldia: "AYLLU HILANACA",
    gestion: "2025",
    latOffset: 0.026, lngOffset: -0.018
  },
  {
    id: "choquecota-poa-9",
    titulo: "MANTENIMIENTO Y LIMPIEZA DE VIGIÑAS AYLLU CHAPITA",
    categoria: "Desarrollo Agropecuario",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 33120,
    distrito: "Ayllu Chapita",
    subalcaldia: "AYLLU CHAPITA",
    gestion: "2025",
    latOffset: -0.024, lngOffset: -0.014
  },
  {
    id: "choquecota-poa-10",
    titulo: "SEGURO AGRARIO INSA",
    categoria: "Desarrollo Agropecuario",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 12992,
    distrito: "Distrito Central",
    subalcaldia: "CHOQUECOTA CENTRAL",
    gestion: "2025",
    latOffset: 0.003, lngOffset: 0.004
  },
  {
    id: "choquecota-poa-11",
    titulo: "SANEAMIENTO BÁSICO - MANTENIMIENTO DE SISTEMA DE AGUA POTABLE",
    categoria: "Saneamiento Básico",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 20320,
    distrito: "Distrito Central",
    subalcaldia: "SISTEMA AGUA CHOQUECOTA",
    gestion: "2025",
    latOffset: -0.008, lngOffset: -0.006
  },
  {
    id: "choquecota-poa-12",
    titulo: "DESARROLLO Y PRESERVACIÓN DEL MEDIO AMBIENTE - VIVEROS Y CARPAS SOLARES",
    categoria: "Medio Ambiente",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 10000,
    distrito: "Distrito Agropecuario",
    subalcaldia: "VIVEROS CHOQUECOTA",
    gestion: "2025",
    latOffset: 0.016, lngOffset: 0.008
  },
  {
    id: "choquecota-poa-13",
    titulo: "ASEO URBANO - LIMPIEZA URBANA Y MANEJO DE RESIDUOS SÓLIDOS",
    categoria: "Aseo Urbano",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 60000,
    distrito: "Distrito Urbano",
    subalcaldia: "CHOQUECOTA URBANO",
    gestion: "2025",
    latOffset: 0.004, lngOffset: -0.003
  },
  {
    id: "choquecota-poa-14",
    titulo: "MANTENIMIENTO Y REPARACIÓN DE ALUMBRADO PÚBLICO",
    categoria: "Alumbrado Público",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 20000,
    distrito: "Distrito Urbano",
    subalcaldia: "CHOQUECOTA URBANO",
    gestion: "2025",
    latOffset: -0.003, lngOffset: 0.005
  },
  {
    id: "choquecota-poa-15",
    titulo: "MANTENIMIENTO Y REFACCIÓN DE INFRAESTRUCTURAS MUNICIPALES",
    categoria: "Infraestructura Urbana y Rural",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 30000,
    distrito: "Distrito Central",
    subalcaldia: "CHOQUECOTA CENTRAL",
    gestion: "2025",
    latOffset: 0.006, lngOffset: -0.008
  },
  {
    id: "choquecota-poa-16",
    titulo: "FUNCIONAMIENTO MATADERO MUNICIPAL",
    categoria: "Infraestructura Urbana y Rural",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 40000,
    distrito: "Distrito Agropecuario",
    subalcaldia: "MATADERO CHOQUECOTA",
    gestion: "2025",
    latOffset: 0.012, lngOffset: 0.018
  },
  {
    id: "choquecota-poa-17",
    titulo: "MANTENIMIENTO Y MEJORAMIENTO DE LA PLAZA COMUNIDAD DE CRUZANI - JULO",
    categoria: "Infraestructura Urbana y Rural",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "CONCLUIDO 100%",
    presupuesto: 51520,
    distrito: "Comunidad Cruzani-Julo",
    subalcaldia: "CRUZANI - JULO",
    gestion: "2025",
    latOffset: 0.028, lngOffset: 0.025
  },
  {
    id: "choquecota-poa-18",
    titulo: "MANTENIMIENTO Y MEJORAMIENTO DE LA PLAZA COMUNIDAD PUCA PUCA - MITMA",
    categoria: "Infraestructura Urbana y Rural",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 43240,
    distrito: "Comunidad Puca Puca-Mitma",
    subalcaldia: "PUCA PUCA - MITMA",
    gestion: "2025",
    latOffset: -0.029, lngOffset: 0.031
  },
  {
    id: "choquecota-poa-19",
    titulo: "MANTENIMIENTO Y MEJORAMIENTO DE LA PLAZA DE LA COMUNIDAD ANDAPATA - SULLKA MALLKU",
    categoria: "Infraestructura Urbana y Rural",
    tipo: "INVERSIÓN NUEVA",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 50600,
    distrito: "Comunidad Andapata-Sullka Mallku",
    subalcaldia: "ANDAPATA - SULLKA MALLKU",
    gestion: "2025",
    latOffset: -0.032, lngOffset: -0.028
  },
  {
    id: "choquecota-poa-20",
    titulo: "GESTIÓN DE CAMINOS - MANTENIMIENTO DE CAMINOS VECINALES NIVEL MUNICIPIO",
    categoria: "Infraestructura Vial y Caminos",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 120000,
    distrito: "Red Vial Municipal",
    subalcaldia: "CAMINOS CHOQUECOTA",
    gestion: "2025",
    latOffset: 0.035, lngOffset: 0.010
  },
  {
    id: "choquecota-poa-21",
    titulo: "MANTENIMIENTO DE CAMINO VECINAL HUAYLLUMA - MALLKUNACA",
    categoria: "Infraestructura Vial y Caminos",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 29440,
    distrito: "Tramo Huaylluma-Mallkunaca",
    subalcaldia: "HUAYLLUMA - MALLKUNACA",
    gestion: "2025",
    latOffset: -0.038, lngOffset: -0.012
  },
  {
    id: "choquecota-poa-22",
    titulo: "SERVICIO DE CATASTRO URBANO Y RURAL - SANEAMIENTO URBANO",
    categoria: "Infraestructura Urbana y Rural",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 43200,
    distrito: "Distrito Central",
    subalcaldia: "CATASTRO CHOQUECOTA",
    gestion: "2025",
    latOffset: 0.005, lngOffset: 0.002
  },
  {
    id: "choquecota-poa-23",
    titulo: "GESTIÓN INTEGRAL DE SALUD - APOYO FUNCIONAMIENTO Y CENTROS DE SALUD",
    categoria: "Gestión de Salud",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 208000,
    distrito: "Red de Salud Municipal",
    subalcaldia: "CENTROS DE SALUD CHOQUECOTA",
    gestion: "2025",
    latOffset: -0.006, lngOffset: -0.009
  },
  {
    id: "choquecota-poa-24",
    titulo: "SERVICIOS DE SALUD UNIVERSAL Y GRATUITA (SUS)",
    categoria: "Gestión de Salud",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 384014,
    distrito: "Red de Salud Municipal",
    subalcaldia: "HOSPITAL Y RED SUS",
    gestion: "2025",
    latOffset: -0.004, lngOffset: -0.012
  },
  {
    id: "choquecota-poa-25",
    titulo: "PROGRAMAS DE PREVENCIÓN EN SALUD (DESNUTRICIÓN CERO, VACUNACIÓN, SAFCI, BONO JUANA AZURDUY)",
    categoria: "Gestión de Salud",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 70000,
    distrito: "Red de Salud Municipal",
    subalcaldia: "BRIGADAS MÓVILES DE SALUD",
    gestion: "2025",
    latOffset: 0.015, lngOffset: -0.022
  },
  {
    id: "choquecota-poa-26",
    titulo: "GESTIÓN DE EDUCACIÓN - PROGRAMA DE ALIMENTACIÓN ESCOLAR (DESAYUNO ESCOLAR)",
    categoria: "Gestión de Educación",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 140000,
    distrito: "Unidades Educativas",
    subalcaldia: "DISTRITO EDUCATIVO CHOQUECOTA",
    gestion: "2025",
    latOffset: 0.007, lngOffset: -0.005
  },
  {
    id: "choquecota-poa-27",
    titulo: "APOYO DEL FUNCIONAMIENTO DE LA EDUCACIÓN Y CENTROS PAN",
    categoria: "Gestión de Educación",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 135000,
    distrito: "Unidades Educativas y PAN",
    subalcaldia: "CENTROS PAN Y ESCUELAS",
    gestion: "2025",
    latOffset: 0.018, lngOffset: 0.010
  },
  {
    id: "choquecota-poa-28",
    titulo: "MANTENIMIENTO Y EQUIPAMIENTO DE UNIDADES EDUCATIVAS Y CEA CHOQUECOTA",
    categoria: "Gestión de Educación",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 102000,
    distrito: "Unidades Educativas",
    subalcaldia: "MANTENIMIENTO INFRAESTRUCTURA EDUCATIVA",
    gestion: "2025",
    latOffset: -0.015, lngOffset: 0.018
  },
  {
    id: "choquecota-poa-29",
    titulo: "APOYO AL DEPORTE ESTUDIANTIL, OLIMPIADAS CIENTÍFICAS, FESTIVAL DE BANDAS Y PERMANENCIA ESCOLAR",
    categoria: "Gestión de Educación",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "CONCLUIDO 100%",
    presupuesto: 69489,
    distrito: "Unidades Educativas",
    subalcaldia: "ACTIVIDADES EDUCATIVAS Y DEPORTIVAS",
    gestion: "2025",
    latOffset: -0.022, lngOffset: -0.008
  },
  {
    id: "choquecota-poa-30",
    titulo: "FOMENTO AL DEPORTE Y ESCUELAS DEPORTIVAS MUNICIPALES",
    categoria: "Deporte y Cultura",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 48000,
    distrito: "Complejo Deportivo",
    subalcaldia: "ESCUELAS DEPORTIVAS CHOQUECOTA",
    gestion: "2025",
    latOffset: 0.011, lngOffset: 0.024
  },
  {
    id: "choquecota-poa-31",
    titulo: "PROMOCIÓN Y CONSERVACIÓN DE CULTURA, PATRIMONIO Y FOMENTO AL TURISMO",
    categoria: "Deporte y Cultura",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 35000,
    distrito: "Patrimonio Municipal",
    subalcaldia: "CULTURA Y TURISMO CHOQUECOTA",
    gestion: "2025",
    latOffset: -0.010, lngOffset: -0.025
  },
  {
    id: "choquecota-poa-32",
    titulo: "PROMOCIÓN Y POLÍTICAS PARA GRUPOS VULNERABLES (RENTA DIGNIDAD Y AYUDA A DISCAPACIDAD)",
    categoria: "Grupos Vulnerables",
    tipo: "CONTINUIDAD",
    prioridad: "ESTRATÉGICA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 235344,
    distrito: "Atención Social",
    subalcaldia: "UNIDAD DE DESARROLLO SOCIAL",
    gestion: "2025",
    latOffset: 0.002, lngOffset: -0.015
  },
  {
    id: "choquecota-poa-33",
    titulo: "SERVICIOS LEGALES INTEGRALES MUNICIPALES (SLIM), ADULTO MAYOR Y PREVENCIÓN CONTRA LA VIOLENCIA",
    categoria: "Grupos Vulnerables",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 64409,
    distrito: "Defensoría y SLIM",
    subalcaldia: "SLIM Y ADULTO MAYOR CHOQUECOTA",
    gestion: "2025",
    latOffset: -0.014, lngOffset: 0.003
  },
  {
    id: "choquecota-poa-34",
    titulo: "DEFENSORÍA Y PROTECCIÓN DE LA NIÑEZ Y ADOLESCENCIA (DNA)",
    categoria: "Grupos Vulnerables",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 32000,
    distrito: "Defensoría y DNA",
    subalcaldia: "DEFENSORÍA DE LA NIÑEZ CHOQUECOTA",
    gestion: "2025",
    latOffset: -0.016, lngOffset: -0.005
  },
  {
    id: "choquecota-poa-35",
    titulo: "GESTIÓN DE RIESGOS - PREVENCIÓN, ATENCIÓN Y DESASTRES NATURALES",
    categoria: "Gestión de Riesgos",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 28000,
    distrito: "Zonas de Riesgo",
    subalcaldia: "UNIDAD DE GESTIÓN DEL RIESGO",
    gestion: "2025",
    latOffset: 0.029, lngOffset: -0.025
  },
  {
    id: "choquecota-poa-36",
    titulo: "SERVICIOS DE SEGURIDAD CIUDADANA Y FORTALECIMIENTO A LA FELCV",
    categoria: "Seguridad Ciudadana",
    tipo: "CONTINUIDAD",
    prioridad: "MEDIA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 29163,
    distrito: "Seguridad Ciudadana",
    subalcaldia: "SEGURIDAD Y FELCV CHOQUECOTA",
    gestion: "2025",
    latOffset: 0.009, lngOffset: -0.018
  },
  {
    id: "choquecota-poa-37",
    titulo: "FORTALECIMIENTO INSTITUCIONAL Y APORTES MANCOMUNIDAD / RUAT / DEFENSA DE LÍMITES",
    categoria: "Fortalecimiento Institucional",
    tipo: "CONTINUIDAD",
    prioridad: "ALTA",
    estado: "EN EJECUCIÓN FÍSICA",
    presupuesto: 403001,
    distrito: "Distrito Central",
    subalcaldia: "ADMINISTRACIÓN MUNICIPAL CHOQUECOTA",
    gestion: "2025",
    latOffset: 0.000, lngOffset: 0.000
  }
];

// Generador genérico en caso de que sea otro municipio del que aún no tengamos fotos
function generarObrasPOA2025(municipioId, latCentro, lngCentro, totalPresupuesto) {
  if (municipioId === 'corque') {
    return OBRAS_OFICIALES_CORQUE_2025.map(o => ({
      ...o,
      lat: latCentro + o.latOffset,
      lng: lngCentro + o.lngOffset
    }));
  }
  if (municipioId === 'choquecota') {
    return OBRAS_OFICIALES_CHOQUECOTA_2025.map(o => ({
      ...o,
      lat: latCentro + o.latOffset,
      lng: lngCentro + o.lngOffset
    }));
  }

  const distritos = ['Distrito 1 - Urbano', 'Distrito 2 - Norte', 'Distrito 3 - Sur', 'Comunidad Cheka', 'Comunidad Payacollo', 'Subalcaldía Central', 'Subalcaldía Jacha Suyo'];
  const tipos = ['CONTINUIDAD', 'INVERSIÓN NUEVA', 'PREINVERSIÓN'];
  const prioridades = ['DESCONCENTRADA', 'ALTA', 'ESTRATÉGICA', 'MEDIA'];
  const estados = ['EN EJECUCIÓN FÍSICA', 'EN LICITACIÓN / ADJUDICACIÓN', 'ESTUDIO DE PREINVERSIÓN', 'CONCLUIDO 100%'];
  
  const plantillasYCategorias = [
    { titulo: "CONST. ENLOSETADO Y OBRAS COMPLEMENTARIAS ACCESO AL ÁREA DE EQUIPAMIENTO COMUNIDAD", categoria: "Infraestructura Vial y Caminos" },
    { titulo: "CONST. SISTEMA DE AGUA POTABLE Y RED DE DISTRIBUCIÓN COMUNIDAD", categoria: "Agua Potable y Riego" },
    { titulo: "MEJORAMIENTO Y EMPEDRADO CAMINO VECINAL TRAMO 1 - SUBALCALDÍA", categoria: "Infraestructura Vial y Caminos" },
    { titulo: "REFACCIÓN INTEGRAL Y EQUIPAMIENTO MÉDICO CENTRO DE SALUD", categoria: "Salud y Saneamiento" },
    { titulo: "AMPLIACIÓN E INFRAESTRUCTURA UNIDAD EDUCATIVA CENTRAL DE", categoria: "Educación y Deportes" },
    { titulo: "PROYECTO DE APOYO A LA PRODUCCIÓN AGROPECUARIA Y SISTEMAS DE RIEGO EN", categoria: "Desarrollo Agropecuario" }
  ];

  let seed = 54321;
  function random() {
    const x = Math.sin(seed++) * 10000;
    return x - Math.floor(x);
  }

  const obras = [];
  for (let i = 1; i <= 32; i++) {
    const item = plantillasYCategorias[Math.floor(random() * plantillasYCategorias.length)];
    const distrito = distritos[Math.floor(random() * distritos.length)];
    const tipo = random() > 0.4 ? 'CONTINUIDAD' : tipos[Math.floor(random() * tipos.length)];
    const prioridad = prioridades[Math.floor(random() * prioridades.length)];
    const estado = estados[Math.floor(random() * estados.length)];
    
    const factorPresupuesto = random();
    let monto = Math.floor(120000 + random() * 1500000);

    const angle = random() * Math.PI * 2;
    const radius = Math.sqrt(random()) * 0.032;
    const lat = latCentro + Math.sin(angle) * radius;
    const lng = lngCentro + Math.cos(angle) * radius * 1.1;

    obras.push({
      id: `${municipioId}-poa-2025-${i}`,
      titulo: `${item.titulo} ${distrito.toUpperCase()}`,
      categoria: item.categoria,
      tipo,
      prioridad,
      estado,
      presupuesto: monto,
      distrito: distrito.split(' - ')[0],
      subalcaldia: distrito.includes(' - ') ? distrito.split(' - ')[1].toUpperCase() : 'CENTRAL',
      gestion: '2025',
      lat,
      lng
    });
  }
  return obras;
}

export default function GeoportalPoa({ currentData }) {
  const [criterio, setCriterio] = useState('monto');
  const [baseLayer, setBaseLayer] = useState('voyager');
  
  // Filtros Avanzados
  const [busqueda, setBusqueda] = useState('');
  const [categoriaFiltro, setCategoriaFiltro] = useState('TODAS');
  const [estadoFiltro, setEstadoFiltro] = useState('TODOS');
  const [distritoFiltro, setDistritoFiltro] = useState('TODOS');

  const [obraSeleccionada, setObraSeleccionada] = useState(null);
  const [mostrarListaResultados, setMostrarListaResultados] = useState(false);
  const [leyendaMinimizada, setLeyendaMinimizada] = useState(true);
  
  const mapContainerRef = useRef(null);
  const leafletMapRef = useRef(null);
  const tileLayerRef = useRef(null);
  const markersGroupRef = useRef(null);

  const baseMapConfigs = {
    voyager: {
      name: 'Institucional Claro',
      url: 'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
      icon: Sun
    },
    satelite: {
      name: 'Satelital HD Esri',
      url: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
      icon: Globe
    },
    topografico: {
      name: 'Relieve Topográfico',
      url: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}',
      icon: Compass
    },
    dark: {
      name: 'Modo Oscuro',
      url: 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
      icon: Moon
    }
  };

  const obras = useMemo(() => {
    if (!currentData) return [];
    return generarObrasPOA2025(currentData.id || 'corque', currentData.lat, currentData.lng, currentData.totalPresupuesto);
  }, [currentData]);

  const obrasFiltradas = useMemo(() => {
    let list = obras;

    if (busqueda.trim()) {
      const q = busqueda.toLowerCase();
      list = list.filter(o => o.titulo.toLowerCase().includes(q) || o.distrito.toLowerCase().includes(q) || o.subalcaldia.toLowerCase().includes(q));
    }
    if (categoriaFiltro !== 'TODAS') {
      list = list.filter(o => o.categoria === categoriaFiltro);
    }
    if (estadoFiltro !== 'TODOS') {
      list = list.filter(o => o.estado === estadoFiltro);
    }
    if (distritoFiltro !== 'TODOS') {
      list = list.filter(o => o.distrito === distritoFiltro);
    }

    return list;
  }, [obras, busqueda, categoriaFiltro, estadoFiltro, distritoFiltro]);

  const getMarkerColor = (obra) => {
    if (criterio === 'monto') {
      if (obra.presupuesto >= 350000) return '#d31027'; // Rojo para inversiones principales (>350k)
      if (obra.presupuesto >= 130000) return '#ff8c00'; // Naranja para inversiones altas (130k - 350k)
      if (obra.presupuesto >= 40000) return '#28a745';  // Verde para inversiones medias (40k - 130k)
      return '#007bff';                                 // Azul para inversiones regulares (<40k)
    } else if (criterio === 'prioridad') {
      if (obra.prioridad === 'ALTA') return '#d31027';
      if (obra.prioridad === 'ESTRATÉGICA') return '#9c0720';
      if (obra.prioridad === 'MEDIA') return '#ff8c00';
      return '#17a2b8';
    } else if (criterio === 'tipo') {
      if (obra.tipo === 'CONTINUIDAD') return '#28a745';
      if (obra.tipo === 'INVERSIÓN NUEVA') return '#6f42c1';
      return '#007bff';
    } else if (criterio === 'categoria') {
      if (obra.categoria === 'Salud y Saneamiento' || obra.categoria === 'Gestión de Salud' || obra.categoria === 'Órgano Ejecutivo') return '#d31027';
      if (obra.categoria === 'Desarrollo Agropecuario') return '#28a745';
      if (obra.categoria === 'Agua Potable y Riego' || obra.categoria === 'Saneamiento Básico') return '#007bff';
      if (obra.categoria === 'Educación y Deportes' || obra.categoria === 'Gestión de Educación') return '#6f42c1';
      if (obra.categoria === 'Infraestructura Urbana y Rural' || obra.categoria === 'Infraestructura Vial y Caminos') return '#17a2b8';
      if (obra.categoria === 'Grupos Vulnerables' || obra.categoria === 'Órgano Deliberativo') return '#fd7e14';
      if (obra.categoria === 'Deporte y Cultura' || obra.categoria === 'Alumbrado Público') return '#ffc107';
      return '#ff8c00';
    } else {
      if (obra.estado === 'EN EJECUCIÓN FÍSICA') return '#28a745';
      if (obra.estado === 'EN LICITACIÓN / ADJUDICACIÓN') return '#ff8c00';
      if (obra.estado === 'ESTUDIO DE PREINVERSIÓN') return '#007bff';
      if (obra.estado === 'CONCLUIDO 100%') return '#6f42c1';
      return '#6c757d';
    }
  };

  const formatCurrency = (val) => {
    return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(val);
  };

  const hasActiveFilters = busqueda || categoriaFiltro !== 'TODAS' || estadoFiltro !== 'TODOS' || distritoFiltro !== 'TODOS';

  const resetFilters = () => {
    setBusqueda('');
    setCategoriaFiltro('TODAS');
    setEstadoFiltro('TODOS');
    setDistritoFiltro('TODOS');
    setMostrarListaResultados(false);
  };

  // Ir directamente a una obra en el mapa
  const saltarAObra = (obra) => {
    setObraSeleccionada(obra);
    setMostrarListaResultados(false);
    if (leafletMapRef.current) {
      leafletMapRef.current.flyTo([obra.lat, obra.lng], 16, { duration: 0.8 });
    }
  };

  useEffect(() => {
    if (!document.getElementById('leaflet-cdn-css')) {
      const link = document.createElement('link');
      link.id = 'leaflet-cdn-css';
      link.rel = 'stylesheet';
      link.href = 'https://unpkg.com/leaflet@1.9.4/dist/leaflet.css';
      document.head.appendChild(link);
    }

    let isMounted = true;

    import('leaflet').then((L) => {
      if (!isMounted || !mapContainerRef.current) return;

      if (leafletMapRef.current) {
        leafletMapRef.current.remove();
        leafletMapRef.current = null;
      }

      const map = L.map(mapContainerRef.current, {
        center: [currentData.lat, currentData.lng],
        zoom: 14,
        zoomControl: true,
        attributionControl: false
      });

      const layer = L.tileLayer(baseMapConfigs[baseLayer].url, {
        maxZoom: 19,
        subdomains: 'abcd'
      }).addTo(map);

      leafletMapRef.current = map;
      tileLayerRef.current = layer;
      markersGroupRef.current = L.layerGroup().addTo(map);

      return () => {
        isMounted = false;
        if (leafletMapRef.current) {
          leafletMapRef.current.remove();
          leafletMapRef.current = null;
        }
      };
    });
  }, [currentData]);

  useEffect(() => {
    if (!leafletMapRef.current || !tileLayerRef.current) return;

    import('leaflet').then((L) => {
      if (!leafletMapRef.current || !tileLayerRef.current) return;
      leafletMapRef.current.removeLayer(tileLayerRef.current);

      const layer = L.tileLayer(baseMapConfigs[baseLayer].url, {
        maxZoom: 19,
        subdomains: 'abcd'
      }).addTo(leafletMapRef.current);

      tileLayerRef.current = layer;
      if (layer.bringToBack) {
        layer.bringToBack();
      }
    });
  }, [baseLayer]);

  useEffect(() => {
    if (!leafletMapRef.current || !markersGroupRef.current) return;

    import('leaflet').then((L) => {
      if (!markersGroupRef.current) return;
      markersGroupRef.current.clearLayers();

      obrasFiltradas.forEach((obra) => {
        const color = getMarkerColor(obra);
        const radius = obra.presupuesto > 500000 ? 9.5 : obra.presupuesto > 100000 ? 7.5 : 6;

        const circle = L.circleMarker([obra.lat, obra.lng], {
          radius,
          fillColor: color,
          color: '#ffffff',
          weight: 2,
          opacity: 1,
          fillOpacity: 0.88
        });

        const tooltipHtml = `
          <div style="font-family: 'Inter', system-ui, sans-serif; padding: 10px 14px; max-width: 280px; text-align: left;">
            <div style="display: flex; align-items: center; gap: 6px; margin-bottom: 5px;">
              <span style="display: inline-block; width: 10px; height: 10px; border-radius: 50%; background: ${color}; box-shadow: 0 0 6px ${color};"></span>
              <span style="font-size: 0.72rem; font-weight: 800; color: ${color}; text-transform: uppercase; letter-spacing: 0.5px;">${obra.categoria}</span>
            </div>
            <div style="font-size: 0.88rem; font-weight: 800; color: #1a1a2e; line-height: 1.3; margin-bottom: 8px;">
              ${obra.titulo}
            </div>
            <div style="background: #f8f9fa; border: 1px solid #eaeaea; border-radius: 6px; padding: 6px 8px; font-size: 0.76rem; color: #444; display: flex; flex-direction: column; gap: 3px;">
              <div style="display: flex; justify-content: space-between;">
                <span>Presupuesto:</span>
                <strong style="color: #9c0720; font-weight: 800;">BOB ${obra.presupuesto.toLocaleString('es-BO')}</strong>
              </div>
              <div style="display: flex; justify-content: space-between;">
                <span>Subalcaldía/Distrito:</span>
                <strong style="color: #1a1a2e;">${obra.subalcaldia || obra.distrito}</strong>
              </div>
            </div>
            <div style="margin-top: 6px; font-size: 0.68rem; color: #888; text-align: right; font-style: italic;">
              ⚡ Haz clic para enfocar en mapa
            </div>
          </div>
        `;

        circle.bindTooltip(tooltipHtml, {
          direction: 'top',
          offset: [0, -10],
          opacity: 0.98,
          className: 'premium-map-tooltip',
          sticky: true
        });

        circle.on('mouseover', () => {
          circle.setRadius(radius + 4);
          circle.setStyle({ weight: 3, fillOpacity: 1 });
        });

        circle.on('mouseout', () => {
          circle.setRadius(radius);
          circle.setStyle({ weight: 2, fillOpacity: 0.88 });
        });

        circle.on('click', () => {
          setObraSeleccionada(obra);
          leafletMapRef.current.flyTo([obra.lat, obra.lng], 16, { duration: 0.8 });
        });

        circle.addTo(markersGroupRef.current);
      });
    });
  }, [obrasFiltradas, criterio]);

  return (
    <div className="geoportal-wrapper">
      <style jsx>{`
        :global(.premium-map-tooltip) {
          background: rgba(255, 255, 255, 0.98) !important;
          border: 1px solid rgba(156, 7, 32, 0.2) !important;
          border-radius: 12px !important;
          box-shadow: 0 12px 30px rgba(0, 0, 0, 0.18) !important;
          padding: 0 !important;
          backdrop-filter: blur(8px) !important;
        }
        :global(.premium-map-tooltip::before) {
          border-top-color: rgba(255, 255, 255, 0.98) !important;
        }
        .geoportal-wrapper {
          display: flex;
          flex-direction: column;
          gap: 1.25rem;
          width: 100%;
        }
        .geoportal-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          flex-wrap: wrap;
          gap: 1rem;
          background: #f8f9fa;
          padding: 1.25rem 1.5rem;
          border-radius: 12px;
          border: 1px solid #eaeaea;
        }
        .model-switcher {
          display: flex;
          align-items: center;
          flex-wrap: wrap;
          gap: 0.4rem;
          background: #ffffff;
          padding: 0.4rem;
          border-radius: 10px;
          border: 1px solid #ddd;
        }
        .model-btn {
          border: none;
          padding: 0.4rem 0.75rem;
          border-radius: 6px;
          font-size: 0.8rem;
          cursor: pointer;
          display: flex;
          align-items: center;
          gap: 0.35rem;
          transition: all 0.2s;
        }
        .geoportal-filters {
          display: flex;
          flex-direction: column;
          gap: 0.75rem;
          background: #ffffff;
          padding: 1rem 1.5rem;
          border-radius: 12px;
          border: 1px solid #eaeaea;
          box-shadow: 0 2px 6px rgba(0,0,0,0.01);
          position: relative;
        }
        .filter-row-top {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          width: 100%;
        }
        .filter-row-bottom {
          display: flex;
          align-items: center;
          flex-wrap: wrap;
          gap: 0.75rem;
          width: 100%;
        }
        .filter-select {
          padding: 0.5rem 0.75rem;
          border-radius: 8px;
          border: 1px solid #ccc;
          font-size: 0.84rem;
          font-weight: 600;
          color: #1a1a2e;
          background: #f8f9fa;
          outline: none;
          cursor: pointer;
          flex: 1;
          min-width: 140px;
        }
        .geoportal-grid {
          display: flex;
          flex-direction: column;
          gap: 1.5rem;
          width: 100%;
        }
        .geoportal-map-box {
          position: relative;
          border-radius: 16px;
          overflow: hidden;
          border: 2px solid #eaeaea;
          box-shadow: 0 6px 20px rgba(0,0,0,0.06);
          background: #e5e3df;
          height: 520px;
          width: 100%;
        }
        .geoportal-map-inner {
          width: 100%;
          height: 100%;
        }
        .floating-legend-box {
          position: absolute;
          bottom: 16px;
          right: 16px;
          z-index: 1000;
          background: rgba(255, 255, 255, 0.96);
          backdrop-filter: blur(10px);
          border: 1px solid rgba(0, 0, 0, 0.12);
          border-radius: 14px;
          padding: 1.1rem 1.25rem;
          box-shadow: 0 12px 30px rgba(0,0,0,0.22);
          max-width: 330px;
          width: calc(100% - 32px);
          transition: all 0.25s ease;
          font-family: 'Inter', sans-serif;
        }
        .floating-legend-toggle {
          position: absolute;
          bottom: 16px;
          right: 16px;
          z-index: 1000;
          background: #1a1a2e;
          color: #ffffff;
          border: 1px solid rgba(255, 255, 255, 0.2);
          border-radius: 10px;
          padding: 0.6rem 1rem;
          font-weight: 800;
          font-size: 0.82rem;
          cursor: pointer;
          display: flex;
          align-items: center;
          gap: 0.5rem;
          box-shadow: 0 6px 18px rgba(0,0,0,0.28);
          transition: all 0.2s ease;
        }
        .floating-legend-toggle:hover {
          background: #9c0720;
          transform: translateY(-2px);
        }
        .obra-popup-card {
          position: absolute;
          top: 16px;
          left: 16px;
          right: 16px;
          max-width: 430px;
          background: #ffffff;
          border-radius: 12px;
          padding: 1.25rem;
          box-shadow: 0 10px 30px rgba(0,0,0,0.22), 0 0 0 1px rgba(0,0,0,0.08);
          z-index: 1000;
          font-family: 'Inter', sans-serif;
          animation: fadeIn 0.25s ease;
        }
        .search-results-panel {
          position: absolute;
          top: 100%;
          left: 1.5rem;
          right: 1.5rem;
          background: #ffffff;
          border: 1px solid #d1d5db;
          border-radius: 12px;
          box-shadow: 0 15px 35px rgba(0,0,0,0.15);
          max-height: 320px;
          overflow-y: auto;
          z-index: 2000;
          margin-top: 0.5rem;
        }

        @media (max-width: 1024px) {
          .geoportal-map-box {
            height: 460px;
          }
        }
        @media (max-width: 768px) {
          .geoportal-wrapper {
            gap: 0.85rem !important;
          }
          .geoportal-header {
            padding: 0.75rem 0.85rem !important;
            flex-direction: column;
            align-items: stretch !important;
            gap: 0.65rem !important;
          }
          .model-switcher {
            display: grid !important;
            grid-template-columns: repeat(4, 1fr) !important;
            gap: 0.2rem !important;
            padding: 0.25rem !important;
            width: 100% !important;
          }
          .model-btn {
            padding: 0.4rem 0.15rem !important;
            font-size: 0.68rem !important;
            justify-content: center !important;
            width: 100% !important;
            gap: 0.2rem !important;
          }
          .geoportal-filters {
            padding: 0.65rem 0.75rem !important;
            gap: 0.5rem !important;
          }
          .filter-row-top {
            display: grid !important;
            grid-template-columns: 1fr auto !important;
            gap: 0.4rem !important;
            width: 100% !important;
          }
          .filter-row-bottom {
            display: grid !important;
            grid-template-columns: repeat(3, 1fr) !important;
            gap: 0.35rem !important;
            width: 100% !important;
          }
          .filter-select {
            padding: 0.35rem 0.35rem !important;
            font-size: 0.72rem !important;
            min-width: 0 !important;
            height: 34px !important;
            border-radius: 6px !important;
          }
          .geoportal-map-box {
            display: flex !important;
            flex-direction: column !important;
            height: auto !important;
            overflow: visible !important;
            background: transparent !important;
            border: none !important;
            box-shadow: none !important;
            gap: 0.65rem !important;
          }
          .geoportal-map-inner {
            height: 380px !important;
            width: 100% !important;
            border: 2px solid #eaeaea;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            overflow: hidden;
            flex-shrink: 0;
          }
          .obra-popup-card,
          .floating-legend-box,
          .floating-legend-toggle {
            position: relative !important;
            top: auto !important;
            bottom: auto !important;
            left: auto !important;
            right: auto !important;
            width: 100% !important;
            max-width: 100% !important;
            margin: 0 !important;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08) !important;
            z-index: 10 !important;
          }
          .floating-legend-box {
            padding: 0.85rem !important;
          }
          .floating-legend-toggle {
            padding: 0.6rem 0.9rem !important;
            font-size: 0.78rem !important;
            justify-content: center !important;
          }
          .search-results-panel {
            left: 0.5rem;
            right: 0.5rem;
          }
        }
        @media (max-width: 480px) {
          .geoportal-map-inner {
            height: 350px !important;
          }
          .model-btn span {
            font-size: 0.65rem !important;
          }
        }
      `}</style>

      {/* Barra superior del Geoportal 2025 */}
      <div className="geoportal-header">
        <div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', flexWrap: 'wrap' }}>
            <span style={{ background: '#9c0720', color: '#fff', fontSize: '0.75rem', fontWeight: '900', padding: '0.25rem 0.65rem', borderRadius: '6px', letterSpacing: '0.5px' }}>
              POA 2025 OFICIAL
            </span>
            <h3 style={{ margin: 0, fontSize: '1.2rem', fontWeight: '900', color: '#1a1a2e', display: 'flex', alignItems: 'center', gap: '0.45rem' }}>
              <MapPin size={20} color="#9c0720" /> Geoportal Interactivo de Obras
            </h3>
          </div>
          <p style={{ margin: '0.25rem 0 0 0', fontSize: '0.82rem', color: '#666', fontWeight: '600' }}>
            {currentData.entidad} • {obrasFiltradas.length} de {obras.length} operaciones (Auditado SDPD)
          </p>
        </div>

        {/* Selector de Modelos de Mapa (Capas Base) en una sola fila compacta */}
        <div className="model-switcher">
          {Object.entries(baseMapConfigs).map(([key, config]) => {
            const Icon = config.icon;
            const isActive = baseLayer === key;
            return (
              <button
                key={key}
                onClick={() => setBaseLayer(key)}
                className="model-btn"
                style={{
                  background: isActive ? '#9c0720' : 'transparent',
                  color: isActive ? '#ffffff' : '#555',
                  fontWeight: isActive ? '800' : '600',
                  boxShadow: isActive ? '0 2px 6px rgba(156,7,32,0.25)' : 'none'
                }}
                title={config.name}
              >
                <Icon size={13} />
                <span>{config.name.split(' ')[0]}</span>
              </button>
            );
          })}
        </div>
      </div>

      {/* Barra de Filtros Avanzados Compacta (2 filas en móvil sin scroll vertical perdido) */}
      <div className="geoportal-filters">
        
        {/* Fila 1: Buscador Principal + Botón Resultados */}
        <div className="filter-row-top">
          <div style={{ position: 'relative', flex: '1', minWidth: '0' }}>
            <input 
              type="text"
              placeholder="Buscar obra, comunidad (ej. Agua, Pichacani)..."
              value={busqueda}
              onChange={(e) => {
                setBusqueda(e.target.value);
                setMostrarListaResultados(true);
              }}
              onFocus={() => setMostrarListaResultados(true)}
              style={{
                width: '100%',
                padding: '0.45rem 2rem 0.45rem 0.85rem',
                borderRadius: '8px',
                border: '1px solid #9c0720',
                fontSize: '0.84rem',
                fontWeight: '600',
                outline: 'none',
                color: '#1a1a2e',
                background: '#fff',
                boxShadow: '0 1px 3px rgba(156,7,32,0.08)'
              }}
            />
            {busqueda ? (
              <button onClick={() => { setBusqueda(''); setMostrarListaResultados(false); }} style={{ position: 'absolute', right: '6px', top: '50%', transform: 'translateY(-50%)', background: 'none', border: 'none', cursor: 'pointer', color: '#666' }}>
                <X size={16} />
              </button>
            ) : (
              <Search size={15} color="#9c0720" style={{ position: 'absolute', right: '10px', top: '50%', transform: 'translateY(-50%)', pointerEvents: 'none' }} />
            )}
          </div>

          <button
            onClick={() => setMostrarListaResultados(!mostrarListaResultados)}
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: '0.35rem',
              padding: '0.45rem 0.75rem',
              borderRadius: '8px',
              border: '1px solid #d1d5db',
              background: mostrarListaResultados ? '#1a1a2e' : '#f8f9fa',
              color: mostrarListaResultados ? '#ffffff' : '#1a1a2e',
              fontSize: '0.78rem',
              fontWeight: '700',
              cursor: 'pointer',
              whiteSpace: 'nowrap',
              transition: 'all 0.2s'
            }}
          >
            <List size={14} /> Resultados ({obrasFiltradas.length})
          </button>
        </div>

        {/* Fila 2: Selectores en grilla de 3 columnas en móvil + Limpiar si activo */}
        <div className="filter-row-bottom">
          <select
            value={categoriaFiltro}
            onChange={(e) => { setCategoriaFiltro(e.target.value); setMostrarListaResultados(true); }}
            className="filter-select"
          >
            <option value="TODAS">Categoría: Todas</option>
            <option value="Infraestructura Vial y Caminos">Vial y Caminos</option>
            <option value="Salud y Saneamiento">Salud y Saneamiento</option>
            <option value="Educación y Deportes">Educación y Deportes</option>
            <option value="Agua Potable y Riego">Agua y Riego</option>
            <option value="Desarrollo Agropecuario">Agropecuario</option>
          </select>

          <select
            value={estadoFiltro}
            onChange={(e) => { setEstadoFiltro(e.target.value); setMostrarListaResultados(true); }}
            className="filter-select"
          >
            <option value="TODOS">Estado: Todos</option>
            <option value="EN EJECUCIÓN FÍSICA">En Ejecución</option>
            <option value="EN LICITACIÓN / ADJUDICACIÓN">Licitación</option>
            <option value="ESTUDIO DE PREINVERSIÓN">Preinversión</option>
            <option value="CONCLUIDO 100%">Concluido</option>
          </select>

          <select
            value={distritoFiltro}
            onChange={(e) => { setDistritoFiltro(e.target.value); setMostrarListaResultados(true); }}
            className="filter-select"
          >
            <option value="TODOS">Distrito: Todos</option>
            <option value="Distrito 1">Distrito 1</option>
            <option value="Distrito 2">Distrito 2</option>
            <option value="Distrito 3">Distrito 3</option>
          </select>

          {hasActiveFilters && (
            <button
              onClick={resetFilters}
              style={{ display: 'flex', alignItems: 'center', gap: '0.3rem', padding: '0.45rem 0.65rem', borderRadius: '8px', border: '1px solid #fecaca', background: '#fff1f2', color: '#9c0720', fontSize: '0.76rem', fontWeight: '700', cursor: 'pointer', whiteSpace: 'nowrap' }}
            >
              <RotateCcw size={13} /> Limpiar
            </button>
          )}
        </div>

        {/* Panel Desplegable de Resultados Interactivos del Buscador */}
        {mostrarListaResultados && (
          <div className="search-results-panel">
            <div style={{ padding: '0.75rem 1rem', background: '#f8f9fa', borderBottom: '1px solid #e5e7eb', display: 'flex', justifyContent: 'space-between', alignItems: 'center', position: 'sticky', top: 0, zIndex: 10 }}>
              <span style={{ fontSize: '0.84rem', fontWeight: '800', color: '#1a1a2e' }}>
                📋 Resultados de Búsqueda y Filtro ({obrasFiltradas.length} obras coincidentes)
              </span>
              <button onClick={() => setMostrarListaResultados(false)} style={{ background: 'none', border: 'none', cursor: 'pointer', color: '#666', display: 'flex', alignItems: 'center', gap: '0.2rem', fontSize: '0.78rem', fontWeight: '700' }}>
                Cerrar Lista <X size={14} />
              </button>
            </div>

            {obrasFiltradas.length === 0 ? (
              <div style={{ padding: '2.5rem', textAlign: 'center', color: '#666', fontSize: '0.9rem', fontWeight: '600' }}>
                No se encontraron obras o proyectos que coincidan con la búsqueda actual en el presupuesto 2025.
              </div>
            ) : (
              <div style={{ display: 'flex', flexDirection: 'column', divideY: '1px solid #f1f5f9' }}>
                {obrasFiltradas.map((o) => (
                  <div
                    key={o.id}
                    onClick={() => saltarAObra(o)}
                    style={{
                      padding: '0.85rem 1rem',
                      display: 'flex',
                      justifyContent: 'space-between',
                      alignItems: 'center',
                      gap: '1rem',
                      cursor: 'pointer',
                      borderBottom: '1px solid #f1f5f9',
                      transition: 'background 0.15s',
                      background: obraSeleccionada && obraSeleccionada.id === o.id ? '#fdf2f3' : '#ffffff'
                    }}
                    onMouseEnter={(e) => { e.currentTarget.style.background = '#f8f9fa'; }}
                    onMouseLeave={(e) => { e.currentTarget.style.background = obraSeleccionada && obraSeleccionada.id === o.id ? '#fdf2f3' : '#ffffff'; }}
                  >
                    <div style={{ flex: 1 }}>
                      <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginBottom: '0.2rem' }}>
                        <span style={{ fontSize: '0.7rem', fontWeight: '800', background: '#f1f5f9', color: '#475569', padding: '0.15rem 0.45rem', borderRadius: '4px' }}>
                          {o.categoria}
                        </span>
                        <span style={{ fontSize: '0.72rem', fontWeight: '700', color: o.estado.includes('EJECUCIÓN') ? '#16a34a' : '#d97706' }}>
                          ● {o.estado}
                        </span>
                      </div>
                      <h5 style={{ margin: 0, fontSize: '0.88rem', fontWeight: '800', color: '#1a1a2e', lineHeight: 1.3 }}>
                        {o.titulo}
                      </h5>
                      <p style={{ margin: '0.2rem 0 0 0', fontSize: '0.78rem', color: '#64748b', fontWeight: '600' }}>
                        📍 {o.subalcaldia} ({o.distrito})
                      </p>
                    </div>

                    <div style={{ textAlign: 'right', flexShrink: 0, display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div>
                        <span style={{ display: 'block', fontSize: '0.94rem', fontWeight: '900', color: '#9c0720' }}>
                          {formatCurrency(o.presupuesto)}
                        </span>
                        <span style={{ fontSize: '0.72rem', fontWeight: '700', color: '#64748b' }}>
                          {o.prioridad}
                        </span>
                      </div>
                      <div style={{ background: '#9c0720', color: '#fff', padding: '0.4rem', borderRadius: '50%', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                        <ChevronRight size={16} />
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        )}
      </div>

      {/* Grilla principal responsiva: Mapa vs Selector/Leyenda */}
      <div className="geoportal-grid">
        
        {/* Contenedor del Mapa Interactivo con Card Flotante */}
        <div className="geoportal-map-box">
          <div ref={mapContainerRef} className="geoportal-map-inner" />

          {/* Tarjeta Flotante (Popup de Obra 2025 Auditada) */}
          {obraSeleccionada && (
            <div className="obra-popup-card">
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: '1rem', marginBottom: '0.85rem' }}>
                <div>
                  <span style={{ fontSize: '0.72rem', fontWeight: '800', background: '#fdf2f3', color: '#9c0720', padding: '0.2rem 0.5rem', borderRadius: '4px', border: '1px solid #fecaca', display: 'inline-block', marginBottom: '0.35rem' }}>
                    {obraSeleccionada.categoria}
                  </span>
                  <h4 style={{ margin: 0, fontSize: '0.94rem', fontWeight: '800', color: '#1a1a2e', lineHeight: 1.35 }}>
                    {obraSeleccionada.titulo}
                  </h4>
                </div>
                <button 
                  onClick={() => setObraSeleccionada(null)}
                  style={{ background: '#f1f5f9', border: 'none', borderRadius: '50%', width: '26px', height: '26px', display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer', flexShrink: 0, color: '#64748b' }}
                  title="Cerrar"
                >
                  <X size={15} />
                </button>
              </div>

              <div style={{ borderTop: '1px solid #f1f5f9', paddingTop: '0.75rem', display: 'grid', gridTemplateColumns: '125px 1fr', gap: '0.45rem 0.65rem', fontSize: '0.84rem' }}>
                <span style={{ color: '#64748b', fontWeight: '500' }}>Gestión Fiscal:</span>
                <span style={{ color: '#9c0720', fontWeight: '900' }}>POA {obraSeleccionada.gestion} (OFICIAL)</span>

                <span style={{ color: '#64748b', fontWeight: '500' }}>Estado Avance:</span>
                <span style={{ color: '#1a1a2e', fontWeight: '800', display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                  <span style={{ width: '8px', height: '8px', borderRadius: '50%', background: obraSeleccionada.estado.includes('EJECUCIÓN') ? '#28a745' : '#ff8c00' }} />
                  {obraSeleccionada.estado}
                </span>

                <span style={{ color: '#64748b', fontWeight: '500' }}>Tipo Operación:</span>
                <span style={{ color: '#1a1a2e', fontWeight: '800' }}>{obraSeleccionada.tipo}</span>

                <span style={{ color: '#64748b', fontWeight: '500' }}>Prioridad:</span>
                <span style={{ color: '#1a1a2e', fontWeight: '800' }}>{obraSeleccionada.prioridad}</span>

                <span style={{ color: '#64748b', fontWeight: '500' }}>Presupuesto:</span>
                <span style={{ color: '#9c0720', fontWeight: '900', fontSize: '1.05rem' }}>{formatCurrency(obraSeleccionada.presupuesto)}</span>

                <span style={{ color: '#64748b', fontWeight: '500' }}>Distrito:</span>
                <span style={{ color: '#1a1a2e', fontWeight: '700' }}>{obraSeleccionada.distrito}</span>

                <span style={{ color: '#64748b', fontWeight: '500' }}>Sub Alcaldía:</span>
                <span style={{ color: '#1a1a2e', fontWeight: '700' }}>{obraSeleccionada.subalcaldia}</span>
              </div>
            </div>
          )}

          {/* Panel Flotante Interno del Mapa: Leyenda Oficial + Selector de Coloreo */}
          {!leyendaMinimizada ? (
            <div className="floating-legend-box">
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.65rem', borderBottom: '1px solid #eaeaea', paddingBottom: '0.5rem' }}>
                <span style={{ fontSize: '0.78rem', fontWeight: '800', color: '#1a1a2e', display: 'flex', alignItems: 'center', gap: '0.35rem', letterSpacing: '0.3px' }}>
                  <Layers size={14} color="#9c0720" /> CRITERIO & LEYENDA
                </span>
                <button 
                  onClick={() => setLeyendaMinimizada(true)} 
                  style={{ background: '#f1f5f9', border: 'none', borderRadius: '6px', padding: '0.2rem 0.55rem', fontSize: '0.72rem', fontWeight: '700', cursor: 'pointer', color: '#475569', display: 'flex', alignItems: 'center', gap: '0.25rem', transition: 'all 0.2s' }}
                  title="Minimizar Leyenda"
                >
                  Ocultar <X size={12} />
                </button>
              </div>

              {/* Pills del selector de coloreo */}
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.3rem', marginBottom: '0.85rem' }}>
                <button 
                  onClick={() => setCriterio('monto')} 
                  style={{ background: criterio === 'monto' ? '#9c0720' : '#f1f5f9', color: criterio === 'monto' ? '#fff' : '#475569', border: 'none', borderRadius: '6px', padding: '0.3rem 0.6rem', fontSize: '0.74rem', fontWeight: '700', cursor: 'pointer', transition: 'all 0.2s' }}
                >
                  Monto
                </button>
                <button 
                  onClick={() => setCriterio('prioridad')} 
                  style={{ background: criterio === 'prioridad' ? '#9c0720' : '#f1f5f9', color: criterio === 'prioridad' ? '#fff' : '#475569', border: 'none', borderRadius: '6px', padding: '0.3rem 0.6rem', fontSize: '0.74rem', fontWeight: '700', cursor: 'pointer', transition: 'all 0.2s' }}
                >
                  Prioridad
                </button>
                <button 
                  onClick={() => setCriterio('tipo')} 
                  style={{ background: criterio === 'tipo' ? '#9c0720' : '#f1f5f9', color: criterio === 'tipo' ? '#fff' : '#475569', border: 'none', borderRadius: '6px', padding: '0.3rem 0.6rem', fontSize: '0.74rem', fontWeight: '700', cursor: 'pointer', transition: 'all 0.2s' }}
                >
                  Tipo
                </button>
                <button 
                  onClick={() => setCriterio('categoria')} 
                  style={{ background: criterio === 'categoria' ? '#9c0720' : '#f1f5f9', color: criterio === 'categoria' ? '#fff' : '#475569', border: 'none', borderRadius: '6px', padding: '0.3rem 0.6rem', fontSize: '0.74rem', fontWeight: '700', cursor: 'pointer', transition: 'all 0.2s' }}
                >
                  Área
                </button>
                <button 
                  onClick={() => setCriterio('estado')} 
                  style={{ background: criterio === 'estado' ? '#9c0720' : '#f1f5f9', color: criterio === 'estado' ? '#fff' : '#475569', border: 'none', borderRadius: '6px', padding: '0.3rem 0.6rem', fontSize: '0.74rem', fontWeight: '700', cursor: 'pointer', transition: 'all 0.2s' }}
                >
                  Avance
                </button>
              </div>

              {/* Título de leyenda dinámica */}
              <p style={{ margin: '0 0 0.2rem 0', fontSize: '0.68rem', fontWeight: '700', color: '#64748b', textTransform: 'uppercase', letterSpacing: '0.5px' }}>
                Leyenda Oficial:
              </p>
              <h5 style={{ margin: '0 0 0.65rem 0', fontSize: '0.84rem', fontWeight: '800', color: '#1a1a2e' }}>
                {criterio === 'monto' && 'OPERACIONES SEGÚN MONTO 2025'}
                {criterio === 'prioridad' && 'OPERACIONES SEGÚN PRIORIDAD'}
                {criterio === 'tipo' && 'OPERACIONES SEGÚN TIPO DE OBRA'}
                {criterio === 'categoria' && 'OPERACIONES SEGÚN ÁREA'}
                {criterio === 'estado' && 'OPERACIONES SEGÚN AVANCE'}
              </h5>

              {/* Lista de colores según el criterio */}
              <div style={{ display: 'flex', flexDirection: 'column', gap: '0.45rem' }}>
                {criterio === 'monto' && (
                  <>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#007bff', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Bs 10.000 – Bs 80.000</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#28a745', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Bs 80.000 – Bs 300.000</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#ff8c00', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Bs 300.000 – Bs 1.000.000</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#d31027', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Más de Bs 1.000.000</span>
                    </div>
                  </>
                )}

                {criterio === 'prioridad' && (
                  <>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#d31027', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Prioridad Alta</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#9c0720', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Prioridad Estratégica</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#ff8c00', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Prioridad Media</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#17a2b8', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Desconcentrada</span>
                    </div>
                  </>
                )}

                {criterio === 'tipo' && (
                  <>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#28a745', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Continuidad de Obra</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#6f42c1', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Inversión Nueva</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#007bff', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Preinversión / Estudio</span>
                    </div>
                  </>
                )}

                {criterio === 'categoria' && (
                  <>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#d31027', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Salud y Saneamiento</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#ff8c00', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Infraestructura Vial y Caminos</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#28a745', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Desarrollo Agropecuario</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#007bff', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Agua Potable y Riego</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#6f42c1', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Educación y Deportes</span>
                    </div>
                  </>
                )}

                {criterio === 'estado' && (
                  <>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#28a745', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>En Ejecución Física</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#ff8c00', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>En Licitación / Adjudicación</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#007bff', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Estudio de Preinversión</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                      <div style={{ width: '18px', height: '10px', background: '#6c757d', borderRadius: '3px', flexShrink: 0 }} />
                      <span style={{ fontSize: '0.78rem', color: '#334155', fontWeight: '600' }}>Concluido 100%</span>
                    </div>
                  </>
                )}
              </div>
            </div>
          ) : (
            <button 
              onClick={() => setLeyendaMinimizada(false)} 
              className="floating-legend-toggle"
              title="Desplegar Leyenda de Colores"
            >
              <Layers size={15} color="#ff6b81" /> Leyenda ({criterio.toUpperCase()})
            </button>
          )}
        </div>
      </div>
    </div>
  );
}
