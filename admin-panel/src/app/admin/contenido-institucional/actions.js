'use server';

import { revalidatePath } from 'next/cache';

/**
 * Revalida las rutas públicas que consumen `contenido_institucional`.
 * La web pública además usa ISR (revalidate = 60s), por lo que los cambios
 * se reflejan automáticamente en menos de un minuto aunque esta llamada no
 * alcance el despliegue del sitio público.
 */
export async function revalidateContenido() {
  revalidatePath('/institucion/historia-institucion');
  revalidatePath('/institucion/organigrama');
  revalidatePath('/transparencia/unidad');
  revalidatePath('/admin/contenido-institucional');
}
