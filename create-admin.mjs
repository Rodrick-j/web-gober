import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';
import WebSocket from 'ws';
globalThis.WebSocket = WebSocket;

// simple env parser
const env = readFileSync('.env.local', 'utf-8')
  .split('\n')
  .filter(line => line.includes('='))
  .reduce((acc, line) => {
    const [key, ...val] = line.split('=');
    acc[key.trim()] = val.join('=').trim().replace(/^"|"$/g, '');
    return acc;
  }, {});

const supabase = createClient(
  env.NEXT_PUBLIC_SUPABASE_URL,
  env.SUPABASE_SERVICE_ROLE_KEY
);

async function manageAdmin() {
  const email = 'admin@oruro.bo';
  const password = 'adminpassword123';
  
  // Try to find if user exists
  const { data: { users }, error: listError } = await supabase.auth.admin.listUsers();
  
  const existingAdmin = users?.find(u => u.email === email);
  
  if (existingAdmin) {
    console.log(`User ${email} already exists. Updating password...`);
    const { error: updateError } = await supabase.auth.admin.updateUserById(existingAdmin.id, {
      password: password,
      email_confirm: true
    });
    
    if (updateError) {
      console.error('Failed to update password:', updateError);
    } else {
      console.log('Password updated successfully.');
      console.log(`EMAIL: ${email}`);
      console.log(`PASSWORD: ${password}`);
    }
    
    // Also check if they are in usuarios_admin
    const { data: profile } = await supabase.from('usuarios_admin').select('id').eq('auth_user_id', existingAdmin.id).single();
    if (!profile) {
      console.log('Adding missing profile to usuarios_admin...');
      await supabase.from('usuarios_admin').insert({
        auth_user_id: existingAdmin.id,
        nombre: 'Super',
        apellido: 'Admin',
        email: email,
        rol: 'super_admin',
        cargo: 'Administrador Principal'
      });
    }
  } else {
    console.log(`Creating new user ${email}...`);
    const { data: { user }, error: createError } = await supabase.auth.admin.createUser({
      email: email,
      password: password,
      email_confirm: true
    });
    
    if (createError) {
      console.error('Failed to create user:', createError);
      return;
    }
    
    console.log('User created successfully.');
    
    console.log('Adding to usuarios_admin table...');
    const { error: insertError } = await supabase.from('usuarios_admin').insert({
      auth_user_id: user.id,
      nombre: 'Super',
      apellido: 'Admin',
      email: email,
      rol: 'super_admin',
      cargo: 'Administrador Principal'
    });
    
    if (insertError) {
      console.error('Failed to add to usuarios_admin:', insertError);
    } else {
      console.log('Admin user setup complete!');
      console.log(`EMAIL: ${email}`);
      console.log(`PASSWORD: ${password}`);
    }
  }
}

manageAdmin();
