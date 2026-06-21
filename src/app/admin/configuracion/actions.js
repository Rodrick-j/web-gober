'use server';

import { revalidatePath } from 'next/cache';

export async function revalidateConfig() {
  // Forzar a Next.js a que recargue la página pública y traiga los nuevos datos de Supabase
  revalidatePath('/');
  revalidatePath('/admin/configuracion');
}
