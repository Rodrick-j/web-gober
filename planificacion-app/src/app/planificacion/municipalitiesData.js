import { Activity, Users, TrendingUp, Building2, Shield, Map, Wallet, PieChart } from 'lucide-react';

// Plantillas base de programas para municipios en proyección / carga
const defaultProgramas = (total) => [
  { id: "Salud", label: "Gestión de Salud", value: Math.round(total * 0.19), color: "hsl(204, 70%, 50%)", icon: Activity },
  { id: "Educación", label: "Gestión de Educación", value: Math.round(total * 0.16), color: "hsl(43, 74%, 49%)", icon: Users },
  { id: "Infraestructura", label: "Infraestructura Urbana/Rural", value: Math.round(total * 0.15), color: "hsl(180, 25%, 25%)", icon: Building2 },
  { id: "Agropecuario", label: "Desarrollo Agropecuario", value: Math.round(total * 0.12), color: "hsl(145, 63%, 42%)", icon: Map },
  { id: "Ejecutivo", label: "Órgano Ejecutivo", value: Math.round(total * 0.11), color: "hsl(348, 70%, 50%)", icon: Building2 },
  { id: "Vulnerables", label: "Grupos Vulnerables", value: Math.round(total * 0.09), color: "hsl(14, 89%, 55%)", icon: Shield },
  { id: "Deliberativo", label: "Órgano Deliberativo", value: Math.round(total * 0.06), color: "hsl(348, 70%, 40%)", icon: Building2 },
  { id: "Caminos", label: "Caminos Vecinales", value: Math.round(total * 0.06), color: "hsl(30, 80%, 50%)", icon: Map },
  { id: "Otros", label: "Otros Programas", value: Math.round(total * 0.06), color: "hsl(0, 0%, 50%)", icon: PieChart }
];

const defaultGruposGasto = (total) => [
  { grupo: "Grupo 3", descripcion: "Materiales y Suministros", value: Math.round(total * 0.38), color: "hsl(348, 70%, 35%)" },
  { grupo: "Grupo 2", descripcion: "Servicios No Personales", value: Math.round(total * 0.28), color: "hsl(348, 70%, 45%)" },
  { grupo: "Grupo 1", descripcion: "Servicios Personales", value: Math.round(total * 0.18), color: "hsl(348, 70%, 55%)" },
  { grupo: "Grupo 4", descripcion: "Activos Reales", value: Math.round(total * 0.10), color: "hsl(348, 70%, 15%)" },
  { grupo: "Grupo 7", descripcion: "Transferencias", value: Math.round(total * 0.06), color: "hsl(348, 70%, 25%)" }
];

export const municipalitiesData = {
  corque: {
    id: 'corque',
    entidad: "Gob. Autónomo Municipal de Corque",
    lat: -18.1666,
    lng: -67.8166,
    totalPresupuesto: 17924466,
    isLoaded100: true,
    programas: [
      { id: "Salud", label: "Gestión de Salud", value: 3210999, color: "hsl(204, 70%, 50%)", icon: Activity },
      { id: "Educación", label: "Gestión de Educación", value: 2757004, color: "hsl(43, 74%, 49%)", icon: Users },
      { id: "Ejecutivo", label: "Órgano Ejecutivo", value: 1906618, color: "hsl(348, 70%, 50%)", icon: Building2 },
      { id: "Infraestructura", label: "Infraestructura Urbana", value: 1792974, color: "hsl(180, 25%, 25%)", icon: Building2 },
      { id: "Agropecuario", label: "Producción Agropecuaria", value: 1699155, color: "hsl(145, 63%, 42%)", icon: Map },
      { id: "Vulnerables", label: "Grupos Vulnerables", value: 1396160, color: "hsl(14, 89%, 55%)", icon: Shield },
      { id: "Activos", label: "Activos Financieros", value: 1394336, color: "hsl(283, 39%, 53%)", icon: Wallet },
      { id: "Deliberativo", label: "Órgano Deliberativo", value: 817122, color: "hsl(348, 70%, 40%)", icon: Building2 },
      { id: "Fortalecimiento", label: "Fortalecimiento Inst.", value: 733275, color: "hsl(220, 50%, 50%)", icon: TrendingUp },
      { id: "Otros", label: "Otros Programas", value: 2216823, color: "hsl(0, 0%, 50%)", icon: PieChart }
    ],
    gruposGasto: [
      { grupo: "Grupo 3", descripcion: "Materiales y Suministros", value: 6951743, color: "hsl(348, 70%, 35%)" },
      { grupo: "Grupo 4", descripcion: "Activos Reales", value: 3394974, color: "hsl(348, 70%, 15%)" },
      { grupo: "Grupo 2", descripcion: "Servicios No Personales", value: 2413602, color: "hsl(348, 70%, 45%)" },
      { grupo: "Grupo 1", descripcion: "Servicios Personales", value: 1831626, color: "hsl(348, 70%, 55%)" },
      { grupo: "Grupo 5", descripcion: "Activos Financieros", value: 1394336, color: "hsl(145, 63%, 42%)" },
      { grupo: "Grupo 7", descripcion: "Transferencias", value: 1327439, color: "hsl(348, 70%, 25%)" },
      { grupo: "Grupo 6", descripcion: "Deudas", value: 610746, color: "hsl(0, 0%, 50%)" },
    ]
  },
  choquecota: {
    id: 'choquecota',
    entidad: "Gob. Autónomo Municipal de Choquecota",
    lat: -17.9666,
    lng: -67.8833,
    totalPresupuesto: 3413990,
    isLoaded100: true,
    programas: [
      { id: "Salud", label: "Gestión de Salud", value: 662014, color: "hsl(204, 70%, 50%)", icon: Activity },
      { id: "Educación", label: "Gestión de Educación", value: 446489, color: "hsl(43, 74%, 49%)", icon: Users },
      { id: "Fortalecimiento", label: "Fortalecimiento Inst.", value: 403001, color: "hsl(283, 39%, 53%)", icon: TrendingUp },
      { id: "Ejecutivo", label: "Órgano Ejecutivo", value: 398627, color: "hsl(348, 70%, 50%)", icon: Building2 },
      { id: "Vulnerables", label: "Grupos Vulnerables", value: 298253, color: "hsl(14, 89%, 55%)", icon: Shield },
      { id: "Deliberativo", label: "Órgano Deliberativo", value: 265751, color: "hsl(348, 70%, 40%)", icon: Building2 },
      { id: "Agropecuario", label: "Desarrollo Agropec.", value: 247872, color: "hsl(145, 63%, 42%)", icon: Map },
      { id: "Infraestructura", label: "Infraestructura", value: 215360, color: "hsl(180, 25%, 25%)", icon: Building2 },
      { id: "Caminos", label: "Gestión de Caminos", value: 149440, color: "hsl(30, 80%, 50%)", icon: Map },
      { id: "Otros", label: "Otros Programas", value: 327183, color: "hsl(0, 0%, 50%)", icon: PieChart }
    ],
    gruposGasto: [
      { grupo: "Grupo 2", descripcion: "Servicios No Personales", value: 1293885, color: "hsl(348, 70%, 45%)" },
      { grupo: "Grupo 3", descripcion: "Materiales y Suministros", value: 1180526, color: "hsl(348, 70%, 35%)" },
      { grupo: "Grupo 1", descripcion: "Servicios Personales", value: 615836, color: "hsl(348, 70%, 55%)" },
      { grupo: "Grupo 7", descripcion: "Transferencias", value: 246743, color: "hsl(348, 70%, 25%)" },
      { grupo: "Grupo 4", descripcion: "Activos Reales", value: 77000, color: "hsl(348, 70%, 15%)" },
    ]
  },
  antequera: {
    id: 'antequera', entidad: "Gob. Autónomo Municipal de Antequera", lat: -18.5166, lng: -66.8500, totalPresupuesto: 6850000,
    programas: defaultProgramas(6850000), gruposGasto: defaultGruposGasto(6850000)
  },
  belen_de_andamarca: {
    id: 'belen_de_andamarca', entidad: "Gob. Autónomo Municipal de Belén de Andamarca", lat: -18.9166, lng: -67.6500, totalPresupuesto: 5420000,
    programas: defaultProgramas(5420000), gruposGasto: defaultGruposGasto(5420000)
  },
  caracollo: {
    id: 'caracollo', entidad: "Gob. Autónomo Municipal de Caracollo", lat: -17.6333, lng: -67.2166, totalPresupuesto: 28450000,
    programas: defaultProgramas(28450000), gruposGasto: defaultGruposGasto(28450000)
  },
  carangas: {
    id: 'carangas', entidad: "Gob. Autónomo Municipal de Carangas", lat: -18.8166, lng: -68.7166, totalPresupuesto: 4120000,
    programas: defaultProgramas(4120000), gruposGasto: defaultGruposGasto(4120000)
  },
  challapata: {
    id: 'challapata', entidad: "Gob. Autónomo Municipal de Challapata", lat: -18.9000, lng: -66.7666, totalPresupuesto: 34800000,
    programas: defaultProgramas(34800000), gruposGasto: defaultGruposGasto(34800000)
  },
  chipaya: {
    id: 'chipaya', entidad: "Gob. Autónomo Municipal de Chipaya", lat: -18.9666, lng: -68.0166, totalPresupuesto: 4680000,
    programas: defaultProgramas(4680000), gruposGasto: defaultGruposGasto(4680000)
  },
  coipasa: {
    id: 'coipasa', entidad: "Gob. Autónomo Municipal de Coipasa", lat: -19.2833, lng: -68.2166, totalPresupuesto: 3890000,
    programas: defaultProgramas(3890000), gruposGasto: defaultGruposGasto(3890000)
  },
  cruz_de_machacamarca: {
    id: 'cruz_de_machacamarca', entidad: "Gob. Autónomo Municipal de Cruz de Machacamarca", lat: -18.8833, lng: -68.4333, totalPresupuesto: 4250000,
    programas: defaultProgramas(4250000), gruposGasto: defaultGruposGasto(4250000)
  },
  curahuara_de_carangas: {
    id: 'curahuara_de_carangas', entidad: "Gob. Autónomo Municipal de Curahuara de Carangas", lat: -17.8666, lng: -68.4333, totalPresupuesto: 8950000,
    programas: defaultProgramas(8950000), gruposGasto: defaultGruposGasto(8950000)
  },
  el_choro: {
    id: 'el_choro', entidad: "Gob. Autónomo Municipal de El Choro", lat: -18.2666, lng: -67.1666, totalPresupuesto: 6340000,
    programas: defaultProgramas(6340000), gruposGasto: defaultGruposGasto(6340000)
  },
  escara: {
    id: 'escara', entidad: "Gob. Autónomo Municipal de Escara", lat: -18.9166, lng: -68.6166, totalPresupuesto: 3750000,
    programas: defaultProgramas(3750000), gruposGasto: defaultGruposGasto(3750000)
  },
  esmeralda: {
    id: 'esmeralda', entidad: "Gob. Autónomo Municipal de Esmeralda", lat: -18.9166, lng: -68.4833, totalPresupuesto: 4100000,
    programas: defaultProgramas(4100000), gruposGasto: defaultGruposGasto(4100000)
  },
  eucaliptos: {
    id: 'eucaliptos', entidad: "Gob. Autónomo Municipal de Eucaliptos", lat: -17.5833, lng: -67.5166, totalPresupuesto: 7650000,
    programas: defaultProgramas(7650000), gruposGasto: defaultGruposGasto(7650000)
  },
  huachacalla: {
    id: 'huachacalla', entidad: "Gob. Autónomo Municipal de Huachacalla", lat: -18.7833, lng: -68.7500, totalPresupuesto: 4520000,
    programas: defaultProgramas(4520000), gruposGasto: defaultGruposGasto(4520000)
  },
  huanuni: {
    id: 'huanuni', entidad: "Gob. Autónomo Municipal de Huanuni", lat: -18.2833, lng: -66.8333, totalPresupuesto: 46500000,
    programas: defaultProgramas(46500000), gruposGasto: defaultGruposGasto(46500000)
  },
  huayllamarca: {
    id: 'huayllamarca', entidad: "Gob. Autónomo Municipal de Huayllamarca", lat: -17.8333, lng: -67.9500, totalPresupuesto: 8400000,
    programas: defaultProgramas(8400000), gruposGasto: defaultGruposGasto(8400000)
  },
  la_rivera: {
    id: 'la_rivera', entidad: "Gob. Autónomo Municipal de La Rivera", lat: -19.1166, lng: -68.7333, totalPresupuesto: 3600000,
    programas: defaultProgramas(3600000), gruposGasto: defaultGruposGasto(3600000)
  },
  machacamarca: {
    id: 'machacamarca', entidad: "Gob. Autónomo Municipal de Machacamarca", lat: -18.1666, lng: -67.0166, totalPresupuesto: 7800000,
    programas: defaultProgramas(7800000), gruposGasto: defaultGruposGasto(7800000)
  },
  oruro: {
    id: 'oruro', entidad: "Gob. Autónomo Municipal de Oruro (Capital)", lat: -17.9666, lng: -67.1166, totalPresupuesto: 385400000,
    programas: defaultProgramas(385400000), gruposGasto: defaultGruposGasto(385400000)
  },
  pampa_aullagas: {
    id: 'pampa_aullagas', entidad: "Gob. Autónomo Municipal de Pampa Aullagas", lat: -19.1833, lng: -67.1000, totalPresupuesto: 5120000,
    programas: defaultProgramas(5120000), gruposGasto: defaultGruposGasto(5120000)
  },
  pazna: {
    id: 'pazna', entidad: "Gob. Autónomo Municipal de Pazña", lat: -18.6000, lng: -66.9000, totalPresupuesto: 8650000,
    programas: defaultProgramas(8650000), gruposGasto: defaultGruposGasto(8650000)
  },
  poopo: {
    id: 'poopo', entidad: "Gob. Autónomo Municipal de Poopó", lat: -18.3833, lng: -66.9666, totalPresupuesto: 9400000,
    programas: defaultProgramas(9400000), gruposGasto: defaultGruposGasto(9400000)
  },
  sabaya: {
    id: 'sabaya', entidad: "Gob. Autónomo Municipal de Sabaya", lat: -19.0166, lng: -68.3666, totalPresupuesto: 7200000,
    programas: defaultProgramas(7200000), gruposGasto: defaultGruposGasto(7200000)
  },
  salinas: {
    id: 'salinas', entidad: "Gob. Autónomo Municipal de Salinas de Garci Mendoza", lat: -19.6333, lng: -67.6333, totalPresupuesto: 14200000,
    programas: defaultProgramas(14200000), gruposGasto: defaultGruposGasto(14200000)
  },
  santiago_de_andamarca: {
    id: 'santiago_de_andamarca', entidad: "Gob. Autónomo Municipal de Santiago de Andamarca", lat: -18.7833, lng: -67.5500, totalPresupuesto: 7500000,
    programas: defaultProgramas(7500000), gruposGasto: defaultGruposGasto(7500000)
  },
  santiago_de_huari: {
    id: 'santiago_de_huari', entidad: "Gob. Autónomo Municipal de Santiago de Huari", lat: -19.0166, lng: -66.7833, totalPresupuesto: 16800000,
    programas: defaultProgramas(16800000), gruposGasto: defaultGruposGasto(16800000)
  },
  santuario_de_quillacas: {
    id: 'santuario_de_quillacas', entidad: "Gob. Autónomo Municipal de Santuario de Quillacas", lat: -19.2500, lng: -66.9500, totalPresupuesto: 6900000,
    programas: defaultProgramas(6900000), gruposGasto: defaultGruposGasto(6900000)
  },
  soracachi: {
    id: 'soracachi', entidad: "Gob. Autónomo Municipal de Soracachi", lat: -17.8666, lng: -67.0333, totalPresupuesto: 18500000,
    programas: defaultProgramas(18500000), gruposGasto: defaultGruposGasto(18500000)
  },
  todos_santos: {
    id: 'todos_santos', entidad: "Gob. Autónomo Municipal de Todos Santos", lat: -19.0166, lng: -68.8000, totalPresupuesto: 3500000,
    programas: defaultProgramas(3500000), gruposGasto: defaultGruposGasto(3500000)
  },
  toledo: {
    id: 'toledo', entidad: "Gob. Autónomo Municipal de Toledo", lat: -18.1833, lng: -67.4000, totalPresupuesto: 15400000,
    programas: defaultProgramas(15400000), gruposGasto: defaultGruposGasto(15400000)
  },
  totora: {
    id: 'totora', entidad: "Gob. Autónomo Municipal de Totora", lat: -17.8500, lng: -67.8833, totalPresupuesto: 5800000,
    programas: defaultProgramas(5800000), gruposGasto: defaultGruposGasto(5800000)
  },
  turco: {
    id: 'turco', entidad: "Gob. Autónomo Municipal de Turco", lat: -18.2000, lng: -68.2000, totalPresupuesto: 12600000,
    programas: defaultProgramas(12600000), gruposGasto: defaultGruposGasto(12600000)
  },
  yunyugo_de_litoral: {
    id: 'yunyugo_de_litoral', entidad: "Gob. Autónomo Municipal de Yunguyo del Litoral", lat: -19.0500, lng: -68.4166, totalPresupuesto: 3950000,
    programas: defaultProgramas(3950000), gruposGasto: defaultGruposGasto(3950000)
  }
};

export const municipalitiesList = Object.values(municipalitiesData).sort((a, b) => {
  if (a.id === 'corque') return -1;
  if (b.id === 'corque') return 1;
  if (a.id === 'choquecota') return -1;
  if (b.id === 'choquecota') return 1;
  return a.entidad.localeCompare(b.entidad);
});
