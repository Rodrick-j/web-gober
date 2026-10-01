BEGIN;
DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CORIA MAMANI YMA', '7263885', '68301434', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION NUEVO AMANECER' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION NUEVO AMANECER', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SARZURI RUEDA DE CONDORI BENIGNA', '2777295', '69583901', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SARZURI RUEDA DE CONDORI BENIGNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SARZURI RUEDA DE CONDORI BENIGNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'VINTO' AND direccion = 'URB CIO 2 FEDECOMIN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VINTO', 'URB CIO 2 FEDECOMIN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CANELAS AVENDAÑO ELVA CAROLINA', '7269811', '76132846', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CANEL S' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CANEL S', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'HUAJARA' AND direccion = 'HUAJARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'HUAJARA', 'HUAJARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ ZAMBRANA TEODORA', '3117017', '79404877', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES THEO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES THEO', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRO' AND direccion = 'CATACORA AMERICA 12 DE OCTUBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRO', 'CATACORA AMERICA 12 DE OCTUBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MAMANI MARCO ANTONIO', '7284189', '75412632', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI MAMANI MARCO ANTONIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI MAMANI MARCO ANTONIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUAYO JAMACHI AGUSTINA', '7311424', '62975282', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUAYO JAMACHI AGUSTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUAYO JAMACHI AGUSTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLE PARDO ROGER MARCELO', '4071845', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALLE PARDO ROGER MARCELO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALLE PARDO ROGER MARCELO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'RESD. EN LA JOYA - PROV. CERCADO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'RESD. EN LA JOYA - PROV. CERCADO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JIMENEZ COMBATA DE SELAYA JENNY', '6665271', '67241348', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JIMENEZ COMBATA DE SELAYA JENNY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JIMENEZ COMBATA DE SELAYA JENNY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE MONTAÑO DIEGO', '14355985', '68947281', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE MONTAÑO DIEGO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE MONTAÑO DIEGO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'RESD. LA JOYA PROV. CERCADO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'RESD. LA JOYA PROV. CERCADO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('USNAYO MANCILLA FRANZ JOAQUIN', '7310414', '72317048', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'USNAYO MANCILLA FRANZ JOAQUIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('USNAYO MANCILLA FRANZ JOAQUIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'RESD. LA JOYA PROV. CERCADO OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'RESD. LA JOYA PROV. CERCADO OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FAJARDO LOVERA ALEXANDRA', '7426078', '73832811', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FAJARDO LOVERA ALEXANDRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FAJARDO LOVERA ALEXANDRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'RESD. LA JOYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'RESD. LA JOYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES MANCILLA NOEL', '12519492', '71182447', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES MANCILLA NOEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES MANCILLA NOEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'RESD. EN LA JOYA. PROV. CERCADO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'RESD. EN LA JOYA. PROV. CERCADO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SELAYA HUACOTA FRANZ', '4044470', '73811544', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SELAYA HUACOTA FRANZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SELAYA HUACOTA FRANZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS YUGAR ROSALIA', '2796364', '71184632', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMOS YUGAR ROSALIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMOS YUGAR ROSALIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MONTAÑO LIRA CANDELARIA', '10466760', '68947281', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MONTAÑO LIRA CANDELARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MONTAÑO LIRA CANDELARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'RESD. EN LA JOYA PROV. CERCADO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'RESD. EN LA JOYA PROV. CERCADO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES  ROSA', '3545508', '73310483', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES  ROSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES  ROSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VASQUEZ QUENTA ROMALDINA', '15788075', '68292817', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VASQUEZ QUENTA ROMALDINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VASQUEZ QUENTA ROMALDINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORIBIO COLQUE CATALINA', '10508078', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORIBIO COLQUE CATALINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORIBIO COLQUE CATALINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'RESD. JUNTAVI - PROV. CHAYANTA -PT.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'RESD. JUNTAVI - PROV. CHAYANTA -PT.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MONTAÑO LIRA DELFINA', '10560820', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MONTAÑO LIRA DELFINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MONTAÑO LIRA DELFINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'NOR ESTE' AND direccion = 'COCHABAMBA Y LAPAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NOR ESTE', 'COCHABAMBA Y LAPAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES MANCILLA CIRILO', '683191', '68309604', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES MANCILLA CIRILO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES MANCILLA CIRILO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'CALLE COCHABAMBA Y LAPAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'CALLE COCHABAMBA Y LAPAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CASTILLO YUCRA CIPRIANA', '5765120', '68309604', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CASTILLO YUCRA CIPRIANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CASTILLO YUCRA CIPRIANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'CALLE COCHABAMBA Y LAPAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'CALLE COCHABAMBA Y LAPAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES CASTILLO LUCY', '14142712', '73833828', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES CASTILLO LUCY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES CASTILLO LUCY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'AV. TACNA NO.9 CAMPO JORDAN Y F - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'AV. TACNA NO.9 CAMPO JORDAN Y F - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLEGAS MAMANI KAREN', '7313059', '60410196', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLEGAS MAMANI KAREN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLEGAS MAMANI KAREN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA ROCHA JUAN CAROS', '4047969', '73316624', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YUCRA ROCHA JUAN CAROS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YUCRA ROCHA JUAN CAROS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAMPOS TORREZ SEVERINO', '10551396', '68816005', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAMPOS TORREZ SEVERINO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAMPOS TORREZ SEVERINO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'RESD. LA JOYA PROV. CERCADO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'RESD. LA JOYA PROV. CERCADO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ESCOBAR COLQUE SILVIA', '5749978', '79414833', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ESCOBAR COLQUE SILVIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ESCOBAR COLQUE SILVIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SALINAS  WILMA', '4035112', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SALINAS  WILMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SALINAS  WILMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APAZA  LUIS BARTOLOME', '3531360', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'APAZA  LUIS BARTOLOME' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('APAZA  LUIS BARTOLOME', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CACHAMANI VALASCO NICANOR', '15524673', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CACHAMANI VALASCO NICANOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CACHAMANI VALASCO NICANOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORIBIO COLQUE FIDEL', '10508081', '63383028', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORIBIO COLQUE FIDEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORIBIO COLQUE FIDEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'CENTRAL' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'CENTRAL', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORIBIO COLQUE ALICIA', '10508079', '72704101', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORIBIO COLQUE ALICIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORIBIO COLQUE ALICIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZUBIETA QUENA NOHEMY', '4071274', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZUBIETA QUENA NOHEMY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZUBIETA QUENA NOHEMY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALA PANAVIRI MARICRUZ', '12868736', '72306308', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALA PANAVIRI MARICRUZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALA PANAVIRI MARICRUZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'NORTE' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'NORTE', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE  WILMA RITA', '5771834', '74111929', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE  WILMA RITA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE  WILMA RITA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ  ROSA MARIA', '7409430', '67222026', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUTIERREZ  ROSA MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUTIERREZ  ROSA MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES CANAVIRI ERIKA PAOLA', '12868901', '73392446', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES CANAVIRI ERIKA PAOLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES CANAVIRI ERIKA PAOLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ  NORKHA', '3530453', '72356769', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUTIERREZ  NORKHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUTIERREZ  NORKHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA MAMANI EVANGELINA', '7389004', '67234855', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NINA MAMANI EVANGELINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NINA MAMANI EVANGELINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TAQUICHIRI  LEONARDA', '3556462', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TAQUICHIRI  LEONARDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TAQUICHIRI  LEONARDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YAVI  MARY INGRITH', '7309416', '74105378', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YAVI  MARY INGRITH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YAVI  MARY INGRITH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAURA NINA MARIA ELENA', '73094330', '68337012', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAURA NINA MARIA ELENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAURA NINA MARIA ELENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE  MARIVEL', '7276168', '72343532', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE  MARIVEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE  MARIVEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MORALES LAURA SONIA', '12964907', '63073531', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MORALES LAURA SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MORALES LAURA SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENDOZA  FABIANA JIMENA', '5748594', '71103197', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MENDOZA  FABIANA JIMENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MENDOZA  FABIANA JIMENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'AV TOMAS BARRON  ENTRE INGAVI Y CHUQUISACA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'AV TOMAS BARRON  ENTRE INGAVI Y CHUQUISACA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS BALDERRAMA JHOVANA', '7275018', '73811193', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COMIDA SALUDABLE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COMIDA SALUDABLE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'AV DEL EJERCITO Y QUINTANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'AV DEL EJERCITO Y QUINTANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES  ELIZABETH', '4065869', '72344317', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LEVANTATE MUJER' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LEVANTATE MUJER', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZUBIETA  NANCY', '4073062', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZUBIETA  NANCY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZUBIETA  NANCY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'NORTE' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'NORTE', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA MAMANI DOLORES MARITZA', '7388978', '63655549', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NINA MAMANI DOLORES MARITZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NINA MAMANI DOLORES MARITZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'CALLE DONATO LOPEZ ENTRE 2 DE AGOSTO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'CALLE DONATO LOPEZ ENTRE 2 DE AGOSTO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI  REANET EMILDA', '12489283', '72341314', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REMAR 7,7 TEJIDOS ARTESANAL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REMAR 7,7 TEJIDOS ARTESANAL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'MILENIUM 2000' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'MILENIUM 2000')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE  BETHY', '5771922', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE  BETHY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE  BETHY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'BOLIVAR, 6 DE AOCTUBRE Y SORIA GALVARRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'BOLIVAR, 6 DE AOCTUBRE Y SORIA GALVARRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RIOS TOLEDO BRAULIO', '3514394', '71846384', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BRAULIO S ARTESANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BRAULIO S ARTESANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'PANAMERICANA, PETOT Y LINARES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'PANAMERICANA, PETOT Y LINARES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ATAHUICHI CALANI JULIO', '3517597', '71185517', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALZADOS SAN SALVADOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALZADOS SAN SALVADOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZANABRIA OLGUIN JUAN DAVID', '3091914', '74121680', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DELICIAS Z' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DELICIAS Z', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALCHI GONZALES GILMAR', '7318311', '67118582', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PUREZA SECA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PUREZA SECA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MAMANI ABIGAIL', '15982529', '67118582', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BART BOLIVIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BART BOLIVIA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


COMMIT;
