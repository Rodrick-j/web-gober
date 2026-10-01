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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE ARICA 1221 ENTRE AV. DEL EJERCITO Y AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE ARICA 1221 ENTRE AV. DEL EJERCITO Y AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VICENTE CHOQUE PAOLA', '5759774', '72317070', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COMERCIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COMERCIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'C. LEON H. LOZA Y TOLEDO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'C. LEON H. LOZA Y TOLEDO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA JAUREGUI REBECA', '12996892', '67245440', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REBECA JAUREGUI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REBECA JAUREGUI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'ARICA Y AMERICA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'ARICA Y AMERICA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOMÁS JAUREGUI MARIBEL', '7361940', '68319252', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARIBEL TOMAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARIBEL TOMAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'CALLE 14  DE SEPTIEMBRE Y CALLE ROSARIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'CALLE 14  DE SEPTIEMBRE Y CALLE ROSARIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AROJA ALVAREZ MARIA MAGDALENA', '7260053', '69575397', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GASTRONOMIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GASTRONOMIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'CALLE LA PAZ Y SAN ANDRÉS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'CALLE LA PAZ Y SAN ANDRÉS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RIVAS CONDORI HENRRY', '7363907', '78604114', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONFECCIÓN TEXTIL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONFECCIÓN TEXTIL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'CALLE LA PAZ Y SAN ANDRES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'CALLE LA PAZ Y SAN ANDRES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARIOJA ALVAREZ LUISA', '740947', '74131368', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARIOJA ALVAREZ LUISA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARIOJA ALVAREZ LUISA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'AV. BERNAL ENTRE CALLE AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'AV. BERNAL ENTRE CALLE AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SIACARÍ NICOLÁS MARIBEL CRISTINA', '7300177', '73318105', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COMIDITAS DOÑA MARY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COMIDITAS DOÑA MARY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'C. LA PAZ Y LA VAYEN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'C. LA PAZ Y LA VAYEN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SALINAS CARDENAS MARTHA', '7377316', '73847402', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CARLIAM' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CARLIAM', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'AV. PANAMERICANA CARRETERA (VILLA PUENTE)' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'AV. PANAMERICANA CARRETERA (VILLA PUENTE)')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SALVADOR PILCO ROSA', '9152978', '68280589', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'AVENIDA BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'AVENIDA BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AROJA ALVAREZ DANIELA', '7409478', '61824419', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SNACK HELADOS Y DULCES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SNACK HELADOS Y DULCES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'AV. BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'AV. BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE MAMANI WILMA B.', '7454315', '75702590', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ALTO CARACOLLO' AND direccion = 'AV. PANAMERICANA ENTRE AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ALTO CARACOLLO', 'AV. PANAMERICANA ENTRE AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUELLAR CONDORI ROSALÍA', '5724992', '68312213', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROSY DELI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROSY DELI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'COMUNIDAD PIQUISIRCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'COMUNIDAD PIQUISIRCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARITA LOBO GUIEVER CARLOS', '5043346', '76137775', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'C Y C' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('C Y C', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = 'POQUERIRI' AND direccion = 'POQUERIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'POQUERIRI', 'POQUERIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TITO CHOQUE GERÓNIMO', '3508862', '72095876', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GERÓNIMO TITO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GERÓNIMO TITO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TITO MUNZON ISIDORA', '7279287', '73882832', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TITO MUNZON ISIDORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TITO MUNZON ISIDORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'CENTRAL' AND direccion = 'CALLE BOLIVAR, BALDIVIESO Y ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'CENTRAL', 'CALLE BOLIVAR, BALDIVIESO Y ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUIZARA ALBINO MACARIO', '5738093', '68925583', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'METAL MECÁNICA LOS ANGELES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('METAL MECÁNICA LOS ANGELES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ESCOBAR CIRCUNSICIÓN', '7262715', '72355232', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CIRCUNSICIÓN MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CIRCUNSICIÓN MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TURCO' AND zona = 'TURCO' AND direccion = 'EN EL PUEBLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TURCO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TURCO', 'TURCO', 'EN EL PUEBLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLLO null PASCUAL', '3549854', '72351141', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AICAT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AICAT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TURCO' AND zona = '' AND direccion = 'TURCO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TURCO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TURCO', '', 'TURCO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLLO INGALA FELIPA', '2789369', '74122006', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'WAYNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('WAYNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PUMA DE VARGAS JUANA', '4050079', '75429942', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JUANA PUMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JUANA PUMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'CENTRAL' AND direccion = 'CARRETERA ORURO - CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'CENTRAL', 'CARRETERA ORURO - CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHUNGARA ARANIBAR GUMERCINDO', '3534497', '74376939', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUMERCINDO CHUNGARA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUMERCINDO CHUNGARA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'PANDO Y BAPTISTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'PANDO Y BAPTISTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GERÓNIMO RIOS HILDA', '7315083', '67239833', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VAQUITA DE ORO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VAQUITA DE ORO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = 'RURAL' AND direccion = 'COMUNIDAD QUEREZANA ANDAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'RURAL', 'COMUNIDAD QUEREZANA ANDAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CORDOVA PUMA ERICK SAUL', '7271322', '74208755', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'OPAL SANTA ELENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('OPAL SANTA ELENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'CENTRAL' AND direccion = 'CALLE BOLIVAR ENTRE MARIANO BAPTISTA Y SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'CENTRAL', 'CALLE BOLIVAR ENTRE MARIANO BAPTISTA Y SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOTO TADEO DAVOR RAFAEL', '4070271', '60414298', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ESTRUCTURAS Y VIDRIERÍA EL REY MIDAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ESTRUCTURAS Y VIDRIERÍA EL REY MIDAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'COMUNIDAD DE SAN PEDRO LLAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'COMUNIDAD DE SAN PEDRO LLAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ACARAPI FLORES KATERIN', '7414499', '61830633', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GRANJA ESCOBAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GRANJA ESCOBAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'PETOT ENTRE AVENIDA ESPAÑA Y TOMÁS FRIAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'PETOT ENTRE AVENIDA ESPAÑA Y TOMÁS FRIAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROJAS MACHACA LUIS ALBERTO', '5763923', '72483366', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ACTIMATE MATES DEL ALTIPLANO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ACTIMATE MATES DEL ALTIPLANO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'VINTO AV. ALEJANDRO URQUIDI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'VINTO AV. ALEJANDRO URQUIDI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROQUE DIEGO LIZBET NAYDA', '7270206', '67247211', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REGALA VIDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REGALA VIDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'WIÑAYKUSI ZONA KANTUTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'WIÑAYKUSI ZONA KANTUTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARAYO MAMANI AURELIA', '7277196', '67232493', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARAYO MAMANI AURELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARAYO MAMANI AURELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'WIÑAYKUSI, ZONA KANTUTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'WIÑAYKUSI, ZONA KANTUTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE YUPANQUI VICTORIA ROXANA', '5074496', '72472697', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VICTORIA CHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VICTORIA CHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'UR. 2000' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'UR. 2000')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI LOPEZ CRISTINA', '15408168', '68334337', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRISTINA CONDORI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRISTINA CONDORI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'URB. 27 DE JUNIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'URB. 27 DE JUNIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALARCON FLORES DE MENDOZA PAULINA', '4429600', '741313108', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAULINA FLORES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAULINA FLORES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AV. ESPAÑA ENTRE 6 DE OCTUBRE Y SORIA GALVARRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AV. ESPAÑA ENTRE 6 DE OCTUBRE Y SORIA GALVARRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APAZA MARCE PAOLA ESTELA', '7281855', '65438470', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'WAYRA TOALLAS ECOLÓGICAS MENSTRUALES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('WAYRA TOALLAS ECOLÓGICAS MENSTRUALES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'PLAN 2000 LOTE 9 MANZANO D-6' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'PLAN 2000 LOTE 9 MANZANO D-6')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MORALES FRANCO LILY', '7862514', '67223195', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LILY MORALES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LILY MORALES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'GENERAL CARRASCO LA PAZ Y BARRIENTOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'GENERAL CARRASCO LA PAZ Y BARRIENTOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACHECO CHOQUE SEVERINA', '3070092', '72457361', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SEVERINA PACHECO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SEVERINA PACHECO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'DALENCE ENTRE ANTONIO PORREZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'DALENCE ENTRE ANTONIO PORREZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HERRERA MAMANI ALCIRA', '5768257', '72493196', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HERRERA MAMANI ALCIRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HERRERA MAMANI ALCIRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CUCHIRAYA 2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CUCHIRAYA 2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARZANA COLQUE VICENTA', '5727066', '71852350', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARZANA COLQUE VICENTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARZANA COLQUE VICENTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'GRAL. CARRASCO Nº138 ENTRE LA PAZ Y BARRIENTOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'GRAL. CARRASCO Nº138 ENTRE LA PAZ Y BARRIENTOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACHECO CHOQUE JESUSA ALICIA', '3118746', '70434248', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JESUSA PACHECO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JESUSA PACHECO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'PRESIDENTE MONTES ENTRE SANTA BARBARA Y JAEN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'PRESIDENTE MONTES ENTRE SANTA BARBARA Y JAEN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI CAPIA CARLA LORENA', '3538348', '60436602', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI CAPIA CARLA LORENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI CAPIA CARLA LORENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'GRAL. CARRASCO #151' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'GRAL. CARRASCO #151')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MIER VALENCIA AURORA SANDRA', '3090172', '70431798', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AUROMODAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AUROMODAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'CALAMA Y JAEN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'CALAMA Y JAEN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FULGUERA DE SILVESTRE MARIVEL', '7302264', '72479433', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FULGUERA DE SILVESTRE MARIBEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FULGUERA DE SILVESTRE MARIBEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'WASHINGTON Y MURGUIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'WASHINGTON Y MURGUIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TAPIA QUISPE MARIA CRISTINA', '4794782', '70536038', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TAPIA QUISPE MARIA CRISTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TAPIA QUISPE MARIA CRISTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'SUD' AND direccion = 'COMUNIDAD DE ANTAKAGUA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'SUD', 'COMUNIDAD DE ANTAKAGUA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUALCA CHUNGARA WALDO MARTIN', '5769754', '74334090', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'WALDO HUALCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('WALDO HUALCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'GILBERTO ROJAS Y MIGUEL LANZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'GILBERTO ROJAS Y MIGUEL LANZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ESPINOZA TORREZ HILDA MABEL', '7288959', '65410767', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HILDA ESPINOZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HILDA ESPINOZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE GRAL. CARRASCO #151 Y MENACHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE GRAL. CARRASCO #151 Y MENACHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MIER VALENCIA ELIZABETH', '3088913', '63003611', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BIOELY NATURAL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BIOELY NATURAL', NULLIF('3088913016',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'AV. BRASIL, ENTRE AYACUCHO Y EJERCITO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'AV. BRASIL, ENTRE AYACUCHO Y EJERCITO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROMAN CHOQUECALLATA EVA DANESSA', '5774515', '71847226', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EVA ROMAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EVA ROMAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'OESTE' AND direccion = 'FINAL AYACUCHO N°13 Y BAUTISTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'OESTE', 'FINAL AYACUCHO N°13 Y BAUTISTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BAUTISTA CRUZ BETY', '6867130', '79406274', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BETT BAUTISTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BETT BAUTISTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CALLE J.J. PEREZ - PSJE ITOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CALLE J.J. PEREZ - PSJE ITOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLE YAVE HEIDY MABEL', '4062929', '62800266', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HEIDY CALLE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HEIDY CALLE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'GILBERTO ROJAS Y MIGUEL LANZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'GILBERTO ROJAS Y MIGUEL LANZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ESPINOZA TORREZ PATRICIA PAOLA', '7383339', '60401280', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PATRICIA ESPINOZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PATRICIA ESPINOZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'URB. CIO 1 MZ Q-1 LOTE N°5' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'URB. CIO 1 MZ Q-1 LOTE N°5')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA PANIAGUA LITZY EVELIN', '7368322', '73809553', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LITZY GARCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LITZY GARCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'SANTA ANA 3B' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'SANTA ANA 3B')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AMPARO FUENTES JEANNETH', '3547303', '65407541', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JEANNETH FUENTES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JEANNETH FUENTES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'MONTESINOS ENTRE BRASIL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'MONTESINOS ENTRE BRASIL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ESPINOZA COPA JUDITH', '4060518', '63636596', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ESPINOZA COPA JUDITH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ESPINOZA COPA JUDITH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'AV. CIRCUNVALACIÓN N°14 Y ZENÓN QUINTANILLA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'AV. CIRCUNVALACIÓN N°14 Y ZENÓN QUINTANILLA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POMA LIMA PAOLA PETRONA', '7399073', '61829779', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'POMA LIMA PAOLA PETRONA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('POMA LIMA PAOLA PETRONA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'URB. SANTIAGO II MZ-D LT-3' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'URB. SANTIAGO II MZ-D LT-3')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RIOS CHOQUE IRENE MARISABEL', '5738746', '72263025', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IRENE MARISABEL RIOS CHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IRENE MARISABEL RIOS CHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB. LOS ANGELES MZ D3 L/S' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB. LOS ANGELES MZ D3 L/S')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HURTADO MAMANI TREICY HELLEN', '7269900', '72334518', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TREICY HELLEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TREICY HELLEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CALLE C 12 DE OCTUBRE Y AMÉRICA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CALLE C 12 DE OCTUBRE Y AMÉRICA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANACO MAYORGA CLAUDIA SOLVERANDA', '7311366', '79417277', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES SOL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES SOL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'URB, HUAJARA III MZ 35 LOTE 17' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'URB, HUAJARA III MZ 35 LOTE 17')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANTOS MAMANI ADALIZ ALIS', '6774541', '73805205', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SANTOS MAMANI ADALIZ ALIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SANTOS MAMANI ADALIZ ALIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'AROMA N°95 Y TEJERINA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'AROMA N°95 Y TEJERINA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARTINEZ CONDORI DE VASQUEZ MARY ISABEL', '3530356', '73800144', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARY ISABEL MARTINEZ CONDORI DE VASQUEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARY ISABEL MARTINEZ CONDORI DE VASQUEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'SANTA ANA 2 BELEN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'SANTA ANA 2 BELEN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BARRERA ATAHUCHI NOELIA', '7315045', '72339117', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BARRERA ATAHUCHI NOELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BARRERA ATAHUCHI NOELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NOR OESTE' AND direccion = 'CAMPAMENTO SAN JOSÉ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR OESTE', 'CAMPAMENTO SAN JOSÉ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ TORREZ FELIPA', '4056116', '71851457', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPA CRUZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPA CRUZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'SANTA ANA 2 BELEN MANZ 45' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'SANTA ANA 2 BELEN MANZ 45')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPA null JULIETA', '3471804', '68046837', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JULIETA COPA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JULIETA COPA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SANTA ANA' AND direccion = 'SANTA ANA #2 BELEN MANZANO 45 LOTE 1' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SANTA ANA', 'SANTA ANA #2 BELEN MANZANO 45 LOTE 1')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAMPOS COPA FABIOLA KATTERINE', '9861189', '62787618', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FABIOLA CAMPOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FABIOLA CAMPOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'TOMAS FRIAS ENTRE ALEJANDRO URQUIDI #327 A-2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'TOMAS FRIAS ENTRE ALEJANDRO URQUIDI #327 A-2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANDRADE ROCHA WILMA', '4063751', '72490666', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'WILMA ANDRADE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('WILMA ANDRADE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ARCE IQUIQUE Y PISAGUA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ARCE IQUIQUE Y PISAGUA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI CHOQUETICLLA RUTH NOEMI', '5721855', '69591971', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RUTH CONDORI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RUTH CONDORI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'BARRIO 23 DE JULIO CALLE ALEJANDRO TARTAWOSKY' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'BARRIO 23 DE JULIO CALLE ALEJANDRO TARTAWOSKY')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALARCON ROCHA WENDI NORKA', '5759834', '74925401', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'WENDI ALARCON' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('WENDI ALARCON', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE LA PAZ, HERRERA Y 1RO DE NOVIEMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE LA PAZ, HERRERA Y 1RO DE NOVIEMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ACALLE TOVAR SOFIA MARCELA', '3640391', '71854276', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOFIA ANCALLE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOFIA ANCALLE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'JAEN, TARAPACA Y TEJERINA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'JAEN, TARAPACA Y TEJERINA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BENITEZ AMPUERO DE PANOZO MARILY', '5129764', '72346180', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BENITEZ AMPUERO DE PANOZO MARILY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BENITEZ AMPUERO DE PANOZO MARILY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'WALTER KONG Y AV. ESPAÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'WALTER KONG Y AV. ESPAÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES HERRERA EVA GLORIA', '1839357', '63645633', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EVA FLORES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EVA FLORES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'URB. SAN CRISTOBAL N°121' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'URB. SAN CRISTOBAL N°121')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES ARUQUIPA ZULMA VERONICA', '5777913', '75453686', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZULMA FLORES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZULMA FLORES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SAN ISIDRO' AND direccion = 'URB. 7 DE MARZO MZ. 42 LT 26' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SAN ISIDRO', 'URB. 7 DE MARZO MZ. 42 LT 26')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES MARTINEZ EMMA', '7313795', '72482112', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES MARTINEZ EMMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES MARTINEZ EMMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'PACHACUTEC #11 URB. SAN CRISTOBAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'PACHACUTEC #11 URB. SAN CRISTOBAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES ARUQUIPA DE FLORES ROCIO ELIZABETH', '3511193', '72324682', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROCIO FLORES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROCIO FLORES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'PUMAS ANDINOS' AND direccion = 'URB. PUMAS ANDINOS MZ. 44 LOTE 2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'PUMAS ANDINOS', 'URB. PUMAS ANDINOS MZ. 44 LOTE 2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PARI TAMBO MERY VANEZA', '9391423', '74474811', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PARI TAMBO MERY VANEZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PARI TAMBO MERY VANEZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'MEJILLONES N° 1255 ASCENCIO PADILLA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'MEJILLONES N° 1255 ASCENCIO PADILLA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISBERTH VILLCA TATIANA KATERINNE', '7421624', '68382556', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TATIANA QUISBERTH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TATIANA QUISBERTH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'CAMACHO ENTRE WHASINGTON Y CALLE C' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'CAMACHO ENTRE WHASINGTON Y CALLE C')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENDOZA VIDAL MARIA GUADALUPE', '12400145', '74565570', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARIA MENDOZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARIA MENDOZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'COLÓN Y 6 DE OCTUBRE #285' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'COLÓN Y 6 DE OCTUBRE #285')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROQUE PALLY FLORA', '4074098', '62826106', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROQUE PALLY FLORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROQUE PALLY FLORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA NINA DANIELA LIZETH', '7329349', '68306767', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DANIELA NINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DANIELA NINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUEVEDO PACO CARMEN ROSA', '7393410', '63653125', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CARMEN QUEVEDO PACO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CARMEN QUEVEDO PACO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI YAVI MARIBEL', '12773143', '73841490', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARIBEL MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARIBEL MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA PINTO ANA ISABEL', '4062593', '72318619', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NINA PINTO ANA ISABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NINA PINTO ANA ISABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENDOZA MALLCU FABIANA JIMENA', '5748594', '71103197', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FABIANA MENDOZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FABIANA MENDOZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FLORES INES WILMA', '7345017', '65426361', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FLORES INES WILMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FLORES INES WILMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZUBIETA QUENA NANCY', '4073062', '67245975', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NANCY ZUBIETA Q.' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NANCY ZUBIETA Q.', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ESPINOZA CELIA', '7409730', '68242362', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI ESPINOZA CELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI ESPINOZA CELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YAVI CONDE MARY INGRITH', '7309416', '74105378', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARY INGRITH YAVI CONDE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARY INGRITH YAVI CONDE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAURA NINA MARIA ELENA', '7309433', '68337012', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARIA ELENA LAURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARIA ELENA LAURA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA TAPIA ELVIRA ELIZABETH', '7296228', '72379478', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ELVIRA ELIZABETH HUANCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ELVIRA ELIZABETH HUANCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MORALES CAPI TANIA', '7300282', '63068186', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MORALES CAPI TANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MORALES CAPI TANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE MAMANI MARIVEL', '7276168', '72343532', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARIVEL CHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARIVEL CHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TAQUICHIRI MUÑOZ LEONARDA', '3556462', '67259887', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TAQUICHIRI MUÑOZ LEONARDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TAQUICHIRI MUÑOZ LEONARDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE APIO BANESA JUDIT', '7422095', '67249558', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BANESA JUDIT CHOQUE APIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BANESA JUDIT CHOQUE APIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI DE ZUNA PORFIRIA', '3505646', '73899120', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PORFIRIA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PORFIRIA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ HERRERA NORKHA', '3530453', '72356769', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NORKHA GUTIERREZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NORKHA GUTIERREZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE CHARCAS Y BUSCH' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE CHARCAS Y BUSCH')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA ESPINOZA SILVIA', '7312376', '6043734', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SILVIA HUANCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SILVIA HUANCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ HUARACHI DOMITILA', '6782286', '71291265', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DOMITILA TORREZ HUARACHI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DOMITILA TORREZ HUARACHI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'ZONA SUD ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'ZONA SUD ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROQUE ROCHA JHOSSELYN NOHELIA', '7411830', '62761563', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROQUE ROCHA JHOSSELYN NOHELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROQUE ROCHA JHOSSELYN NOHELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'PUMAS ANDINOS' AND direccion = 'URB. PUMAS ANDINOS MZ. 107 LOTE 15' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'PUMAS ANDINOS', 'URB. PUMAS ANDINOS MZ. 107 LOTE 15')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TITO YUCRA HILDA INOCENCIA', '7363841', '73316870', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TITO YUCRA HILDA INOCENCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TITO YUCRA HILDA INOCENCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CAMACHO, TOMÁS FRIAS Y RENGEL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CAMACHO, TOMÁS FRIAS Y RENGEL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANTOS PAREDES FABIANA', '5773046', '76149993', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SANTOS PAREDES FABIANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SANTOS PAREDES FABIANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'CAMACHO N°3 ENTRE WASHINGTON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'CAMACHO N°3 ENTRE WASHINGTON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('IQUISE TAQUICHIRI NATIVIDAD REBECA', '5763439', '78617069', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NATIVIDAD IQUISE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NATIVIDAD IQUISE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD-ESTE' AND direccion = 'URB. 7 DE MARZO MZ. 11 LOTE 12' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD-ESTE', 'URB. 7 DE MARZO MZ. 11 LOTE 12')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOLEDO LOPEZ TANIA ROSIO', '3535417', '79406069', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TANIA TOLEDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TANIA TOLEDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'SAN PEDRO DE CHALLACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'SAN PEDRO DE CHALLACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAMBI JAIMES LEONOR', '674592', '71180720', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANÍAS SAN PEDRO DE CHALLACOLLO D 2' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANÍAS SAN PEDRO DE CHALLACOLLO D 2', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TOLEDO' AND zona = 'SUD' AND direccion = 'LA PAZ Y MELGAREJO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'SUD', 'LA PAZ Y MELGAREJO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ACAPA null MARIEL', '4059682', '73845561', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARIEL ACAPA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARIEL ACAPA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = 'NORTE' AND direccion = 'COMERCION ENTRE CAMPERO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'NORTE', 'COMERCION ENTRE CAMPERO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOLIZ PUÑA MIRIAM', '14369139', '73825959', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIRIAM SOLIZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIRIAM SOLIZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = 'ESTE' AND direccion = 'AVAROA Y CAMPERO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'ESTE', 'AVAROA Y CAMPERO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA CHOQUE TRIGIDIA', '3504422', '74148036', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TRIGIDIA VILLCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TRIGIDIA VILLCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = '' AND direccion = 'CALLE MURILLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', '', 'CALLE MURILLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CALLIZAYA ANA MARIA', '2794003', '72166903', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'A MARIA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('A MARIA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHOQUECOTA' AND zona = '' AND direccion = 'CHOQUECOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHOQUECOTA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHOQUECOTA', '', 'CHOQUECOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YAVI NINA NEMIA', '7395106', '73811928', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NEMIA YAVI NINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NEMIA YAVI NINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = '' AND direccion = 'TOLEDO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', '', 'TOLEDO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA IQUIZE ROSARIO BERTHA', '3041106', '72484170', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROSARIO YUCRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROSARIO YUCRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = 'NORTE' AND direccion = 'CAMPERO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'NORTE', 'CAMPERO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ CORIA ISIDORA', '3096514', '77156758', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ISIDORA LOPEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ISIDORA LOPEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = 'ESTE' AND direccion = 'CALLE IQUIQUE FINAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'ESTE', 'CALLE IQUIQUE FINAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JUANIQUINA FERNANDEZ CECILIA LUCRECIA', '5743554', '72391884', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CECILIA JUANIQUINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CECILIA JUANIQUINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = 'NORTE' AND direccion = 'SAN AGUSTIN Y COMERCIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'NORTE', 'SAN AGUSTIN Y COMERCIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE SACA PATRICIA JIMENA', '5772861', '68357208', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PATRICIA QUISPE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PATRICIA QUISPE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TOLEDO' AND zona = 'SUD' AND direccion = 'SAJAMA Y TUPIZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'SUD', 'SAJAMA Y TUPIZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAYOJA GUTIERREZ JUDITH', '7298870', '72495040', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JUDITH CAYOJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JUDITH CAYOJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = 'ESTE' AND direccion = 'CAMPERO AVAROA Y MELGAREJO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'ESTE', 'CAMPERO AVAROA Y MELGAREJO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LEON MOLLO FLORA', '3097443', '68289069', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORA LEON' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORA LEON', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'OQUENDO Y SAN AGUSTIN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'OQUENDO Y SAN AGUSTIN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('UÑO CALA IVANA AYDEE', '7260271', '72340771', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IVANA UÑO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IVANA UÑO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = 'OESTE' AND direccion = 'SAN FRANCISCO Y SAJAMA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'OESTE', 'SAN FRANCISCO Y SAJAMA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE BERNABE SOFIA SILVIA', '7273351', '72347736', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOFIA COLQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOFIA COLQUE', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = 'SUD- OESTE' AND direccion = 'AVAROA Y TARIJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD- OESTE', 'AVAROA Y TARIJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('IQUIZE MAMANI RUTH LEONOR', '7311580', '72314471', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RUTH IQUIZE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RUTH IQUIZE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TOLEDO' AND zona = '' AND direccion = 'COMERCIO ENTRE CAMPERO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', '', 'COMERCIO ENTRE CAMPERO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOLIZ PUÑA JHENY', '7325529', '67221106', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JHENY SOLIZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JHENY SOLIZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = 'NORTE' AND direccion = 'COMERCIO ENTRE CAMPERO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'NORTE', 'COMERCIO ENTRE CAMPERO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOLIZ PUÑA ERLINDA', '14369140', '76156822', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ERLINDA SOLIZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ERLINDA SOLIZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'AV. LITORAL Y SAJAMA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'AV. LITORAL Y SAJAMA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI AIMA TERESA', '5743555', '68299106', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TERESA CONDORI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TERESA CONDORI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOLEDO' AND zona = '' AND direccion = 'TOLEDO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', '', 'TOLEDO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CAYOJA WILMA', '3106088', '73835340', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'WILMA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('WILMA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = '' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CALLE PAGADOR ENTRE RENGEL Y TOMÁS FRIAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CALLE PAGADOR ENTRE RENGEL Y TOMÁS FRIAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MERCADO CAÑIPA NOEMI', '3117488', '73813246', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NOEMI MERCADO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NOEMI MERCADO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'AV. 24 DE JUNIO FRENTE CARTONBOL MANZANO N°7' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'AV. 24 DE JUNIO FRENTE CARTONBOL MANZANO N°7')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUIÑONES SARMIENTO MILTON CARLOS', '5733660', '62784325', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOLUCIONES EMPRESARIALES CARMILROS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOLUCIONES EMPRESARIALES CARMILROS', NULLIF('5733660015',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = 'CENTRAL' AND direccion = 'PRESIDENTE MONTES ENTRE AYACUCHO Y JUNÍN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'CENTRAL', 'PRESIDENTE MONTES ENTRE AYACUCHO Y JUNÍN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BLANCO MOLLO FILEMON', '4071880', '73845975', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DELISABORES LIDIA ACAPA GUTIERREZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DELISABORES LIDIA ACAPA GUTIERREZ', NULLIF('4066287010',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORESTE' AND direccion = 'CALLE 1 #540 GRAL. CARRASCO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORESTE', 'CALLE 1 #540 GRAL. CARRASCO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ELIAS LOPEZ PAOLA MARYAM', '7311393', '61663212', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARYS REPOSTERÍA  TU DULCE TENTACIÓN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARYS REPOSTERÍA  TU DULCE TENTACIÓN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'C. LA PLATA Y AMERICA - OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'C. LA PLATA Y AMERICA - OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MIRANDA NIGAÑEZ JHOSELIN CARLA', '13984169', '74147204', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIRANDA NIGAÑEZ JHOSELIN CARLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIRANDA NIGAÑEZ JHOSELIN CARLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO LOPEZ SONIA', '7300519', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SONIA LAZARO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SONIA LAZARO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = 'SAJAMA - BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', 'SAJAMA - BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI LOPEZ JASINTA', '7301670', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI LOPEZ JASINTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI LOPEZ JASINTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI LOPEZ YOSELIN HERMELINA', '7300576', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YOSELIN HUARACHI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YOSELIN HUARACHI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE LAZARO SONIA', '7304866', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SONIA FELIPE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SONIA FELIPE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO FELIPE REBECA', '5736207', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REBECA LAZARO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REBECA LAZARO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'INICIAL' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI LOPEZ JHEMY', '7393424', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JHEMY HUARACHI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JHEMY HUARACHI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'INICIAL' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI LAZARO ELIZA', '5747815', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ELIZA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ELIZA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE ALAVI WILMA DORA', '7328392', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'WILMA FELIPE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('WILMA FELIPE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALAVE QUISPE EMELIANA', '5749042', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EMILIANA ALAVE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EMILIANA ALAVE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'CALLE SAJAMA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'CALLE SAJAMA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE VILLCA LEOCADIA', '5739117', '68316651', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SUMA ALPAQUITA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SUMA ALPAQUITA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'INICIAL' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE MAMANI LUCIA', '7260551', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LUCIA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LUCIA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = 'HUALCANI' AND direccion = 'HUALCANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'HUALCANI', 'HUALCANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POQUECHOQUE ARIAS WALTER ROSENDO', '3076814', '67229768', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUINUA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUINUA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = 'CENTRAL' AND direccion = 'CHALLAPATA ZONA CENTRAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'CENTRAL', 'CHALLAPATA ZONA CENTRAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE HERRERA EDWIN', '4025259', '74158818', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GANADERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GANADERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAMPA AULLAGAS' AND zona = 'SUD' AND direccion = 'PAMPA AULLAGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAMPA AULLAGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAMPA AULLAGAS', 'SUD', 'PAMPA AULLAGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ENCINAS TORREZ GERARDO', '3046651', '74155837', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GERARDO ENCINAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GERARDO ENCINAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAMPA AULLAGAS' AND zona = 'SUD' AND direccion = 'NUEVA AMANECER' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAMPA AULLAGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAMPA AULLAGAS', 'SUD', 'NUEVA AMANECER')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MORALES ONOFRE GABINO D.', '5062094', '74147317', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ORGANIZACIÓN NUEVA AMANECER' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ORGANIZACIÓN NUEVA AMANECER', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI LENIZ SALOMON', '3076496', '74101552', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SALOMON CONDORI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SALOMON CONDORI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'COMUNIDAD HUAÑAKAWA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'COMUNIDAD HUAÑAKAWA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALCONCE YUCHA RUBEN', '5735678', '73834720', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RUBEN ALCONCE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RUBEN ALCONCE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TOLEDO' AND zona = '' AND direccion = 'TOLEDO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', '', 'TOLEDO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JIMENEZ FRANCO TRIGIDIA', '3059281', '72342724', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GRANJA SAMIRI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GRANJA SAMIRI', NULLIF('3059281017',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'VINTO' AND direccion = 'CARRETERA VINTO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VINTO', 'CARRETERA VINTO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BLANCO PAILLO NELLY MIRIAN', '3504704', '68339188', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTOS NUTRITIVOS A BASE DE QUINUA ELMI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTOS NUTRITIVOS A BASE DE QUINUA ELMI', NULLIF('3504704010',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'TACNA ARCE Y SAN FELIPE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'TACNA ARCE Y SAN FELIPE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CASTILLO YUCRA CAMILA ANGELINE', '13157889', '67219633', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CASTILLO YUCRA CAMILA ANGELINE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CASTILLO YUCRA CAMILA ANGELINE', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE 6 ROJAS. CALLE 9 Y CALLE B' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE 6 ROJAS. CALLE 9 Y CALLE B')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES LUNA EDSON RAFAEL', '13067100', '75715223', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES LUNA EDSON RAFAEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES LUNA EDSON RAFAEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SEQUEDA ALVAREZ AYDE', '7359228', '74145121', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SEQUEDA ALVAREZ AYDE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SEQUEDA ALVAREZ AYDE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'COMUNIDAD CALLO HALCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'COMUNIDAD CALLO HALCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHARALY MAYORGA DORA DELINA', '2763189', '73817653', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHARALY MAYORGA DORA DELINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHARALY MAYORGA DORA DELINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AV. NUÑEZ DEL PRADO Y VICUÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AV. NUÑEZ DEL PRADO Y VICUÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ LAIME LAURA', '7386702', '67576769', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUTIERREZ LAIME LAURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUTIERREZ LAIME LAURA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SANTIAGO DE HUARI' AND zona = '' AND direccion = 'SANTIAGO DE HUARI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTIAGO DE HUARI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTIAGO DE HUARI', '', 'SANTIAGO DE HUARI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TAQUIMALLCO HUARACHI SERGIO', '2787868', '74101784', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TAQUIMALLCO HUARACHI SERGIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TAQUIMALLCO HUARACHI SERGIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'ABTOFAGASTA Y EJERCITO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'ABTOFAGASTA Y EJERCITO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VARGAS QUISPE JHOSSELYN GABRIELA', '7356541', '72482801', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VARGAS QUISPE JHOSSELYN GABRIELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VARGAS QUISPE JHOSSELYN GABRIELA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE E. AVAROA N40 ENTRE AVENIDA TOMAS BARRON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE E. AVAROA N40 ENTRE AVENIDA TOMAS BARRON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PATIÑO MAMANI AMERICO JAVIER', '4042925', '76133297', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MUEBLES Y ARTESANIAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MUEBLES Y ARTESANIAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'CALLE ADOLFO MIER N254 PAGADOR Y VELASCO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'CALLE ADOLFO MIER N254 PAGADOR Y VELASCO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PLATA G SELING', '649562', '72465119', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ECOTURCO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ECOTURCO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CARRETRA CALA CALA N200' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CARRETRA CALA CALA N200')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLE LIMACHI NANCY', '5963426', '67010200', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'INDUSTRIA SLINERA BOLIVIANA S.R.L.' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('INDUSTRIA SLINERA BOLIVIANA S.R.L.', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE FORTIN BOQUERON N59 ENTRE MENACHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE FORTIN BOQUERON N59 ENTRE MENACHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ MAMANI AMELI STEFI', '7322740', '74471668', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAGIC' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAGIC', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CAMACHO N777 Y OBLITAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CAMACHO N777 Y OBLITAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROBLES MEJIA ERIKA NINOSKA', '4023681', '74103783', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VAN & DONUTS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VAN & DONUTS', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'CALLE SUCRE ENTRE BALLIVIAN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'CALLE SUCRE ENTRE BALLIVIAN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE LLANQUE MAURA', '5063940', '73824920', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE LLANQUE MAURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE LLANQUE MAURA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'AV PANAMERICANA Y LIBERTAD' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'AV PANAMERICANA Y LIBERTAD')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUMEREZ CHAVEZ MAURA', '7290534', '76141304', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUMEREZ CHAVEZ MAURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUMEREZ CHAVEZ MAURA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'PAZÑA' AND zona = 'CENTRAL' AND direccion = 'AV ABELLI ENTRE SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'CENTRAL', 'AV ABELLI ENTRE SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE GABRIEL MELANIA', '7316115', '74158334', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE GABRIEL MELANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE GABRIEL MELANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'URB HUAJARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'URB HUAJARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS QUISPE MAURICIA', '5720770', '71857251', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMOS QUISPE MAURICIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMOS QUISPE MAURICIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'PAZÑA' AND zona = 'ESTE' AND direccion = 'TUPAK KATARI ENTRE AVENIDA LAS AMERICAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'ESTE', 'TUPAK KATARI ENTRE AVENIDA LAS AMERICAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ TORREZ PAOLA', '7306854', '72339782', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ TORREZ PAOLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ TORREZ PAOLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'RESD PAZÑA PROV POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'RESD PAZÑA PROV POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI TORREZ SANDRA', '7278371', '72465314', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI TORREZ SANDRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI TORREZ SANDRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'ANDRES DE SANTA CRUZ PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'ANDRES DE SANTA CRUZ PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CASTRO GONZALES SHIRLEY', '7451841', '72309871', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CASTRO GONZALES SHIRLEY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CASTRO GONZALES SHIRLEY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'TUPAK KATARI Y BOLIVAR Y SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'TUPAK KATARI Y BOLIVAR Y SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ESCOBAR TEODOCIA', '3081790', '72472344', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI ESCOBAR TEODOCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI ESCOBAR TEODOCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'JOSE BALLIVIAN Y PANAMERICANA PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'JOSE BALLIVIAN Y PANAMERICANA PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BARRERA MAMANI OLIVIA ESTHER', '4054588', '73840375', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'INDUSTRIA DE ALIMENTOS BARRERA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('INDUSTRIA DE ALIMENTOS BARRERA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'SUCRE ENTRE ABELLI Y PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'SUCRE ENTRE ABELLI Y PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUENTAS CONDORI BEATRIZ', '3107281', '72479827', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CUENTAS CONDORI BEATRIZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CUENTAS CONDORI BEATRIZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = 'CENTRAL' AND direccion = 'URB. PLAN 500 MANCO KAPAC N197 Y SABALLA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'CENTRAL', 'URB. PLAN 500 MANCO KAPAC N197 Y SABALLA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHAMBI CARLA DIANA', '7415073', '73826015', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CHAMBI CARLA DIANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CHAMBI CARLA DIANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'CALLE SANTA CRUZ ENTRE TUPAC KATARI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'CALLE SANTA CRUZ ENTRE TUPAC KATARI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI  DANIELA CLAUDIA', '7451835', '73848956', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI  DANIELA CLAUDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI  DANIELA CLAUDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = 'CENTRAL' AND direccion = 'CALLE PAGADOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'CENTRAL', 'CALLE PAGADOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VARGAS CALIZAYA CAROLINA SUSANA', '7391901', '67247200', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VARGAS CALIZAYA CAROLINA SUSANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VARGAS CALIZAYA CAROLINA SUSANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'ANDRES DE SANTA CRUZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'ANDRES DE SANTA CRUZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR GONZALES DANIELA PATRICIA', '15656951', '71839861', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR GONZALES DANIELA PATRICIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR GONZALES DANIELA PATRICIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'RESD. PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'RESD. PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI COLQUE DARIA FLORA', '4024660', '72301949', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI COLQUE DARIA FLORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI COLQUE DARIA FLORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'PAZÑA' AND zona = 'CENTRAL' AND direccion = 'BOLIVAR Y ABELLI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'CENTRAL', 'BOLIVAR Y ABELLI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAMACHO CHAPARRO DUNIA MARCELA', '7313669', '72350931', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAMACHO CHAPARRO DUNIA MARCELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAMACHO CHAPARRO DUNIA MARCELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = 'CENTRAL' AND direccion = 'ABELLI SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'CENTRAL', 'ABELLI SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GONZALES  DORIS', '12369251', '74113825', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GONZALES  DORIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GONZALES  DORIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'PAZÑA' AND zona = 'SUDESTE' AND direccion = 'FINAL V. GALVARRO MIRONES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'SUDESTE', 'FINAL V. GALVARRO MIRONES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AYALA ONOFRE GUADALUPE', '3526837', '72336793', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AYALA ONOFRE GUADALUPE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AYALA ONOFRE GUADALUPE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'AV LAS AMERICAS Y LIBERTAD' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'AV LAS AMERICAS Y LIBERTAD')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE ACHO ISABEL PLACIDA', '7277871', '77907053', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE ACHO ISABEL PLACIDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE ACHO ISABEL PLACIDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'AV LAS AMERICAS Y TUPAK KATARI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'AV LAS AMERICAS Y TUPAK KATARI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR ESCOBAR MARIA ELENA', '7272221', '74111096', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR ESCOBAR MARIA ELENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR ESCOBAR MARIA ELENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'BOLIVAR ENTRE JOSE BALLIVIAN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'BOLIVAR ENTRE JOSE BALLIVIAN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ESCOBAR ALARCON MARIA', '2753941', '74149849', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ESCOBAR ALARCON MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ESCOBAR ALARCON MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'AV ABELLI ENTRE MARISCAL SANTA CRUZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'AV ABELLI ENTRE MARISCAL SANTA CRUZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HEREDIA COCAVIA MARTHA ANGELICA', '2775964', '71225993', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HEREDIA COCAVIA MARTHA ANGELICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HEREDIA COCAVIA MARTHA ANGELICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'CALLE SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'CALLE SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TADEO  DIONICIA', '4058473', '74105515', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TADEO  DIONICIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TADEO  DIONICIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'JOSE BALLIVIAN ESQ BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'JOSE BALLIVIAN ESQ BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAMACHO ESCOBAR LUZ NINOSKA', '4042036', '64079787', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAMACHO ESCOBAR LUZ NINOSKA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAMACHO ESCOBAR LUZ NINOSKA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'AV LAS AMERICAS Y TUPAK KATARI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'AV LAS AMERICAS Y TUPAK KATARI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR ESCOBAR VICTORIA', '7306899', '73801623', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR ESCOBAR VICTORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR ESCOBAR VICTORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'AV BRASIL N1352 ENTRE AYACUCHO Y JUNIN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'AV BRASIL N1352 ENTRE AYACUCHO Y JUNIN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ MARTINEZ ZULEMA JHANNET', '3540900', '67240372', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ MARTINEZ ZULEMA JHANNET' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ MARTINEZ ZULEMA JHANNET', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AV VILLAZON N300 ENTRE MARIA QUIROZ Y QUIROGA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AV VILLAZON N300 ENTRE MARIA QUIROZ Y QUIROGA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEÑAFIEL CONDORI DELICIA VILMA', '2755566', '71186648', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEÑAFIEL CONDORI DELICIA VILMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEÑAFIEL CONDORI DELICIA VILMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'VELASCO GALVARRO N5298 ENTRE 1 DE NOVIEMBRE Y LEON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'VELASCO GALVARRO N5298 ENTRE 1 DE NOVIEMBRE Y LEON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ MARTINEZ JAQUELINE', '5745875', '73832767', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ MARTINEZ JAQUELINE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ MARTINEZ JAQUELINE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'TTE VILLA N106 ENTRE 6 DE OCTUBRE Y POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'TTE VILLA N106 ENTRE 6 DE OCTUBRE Y POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CORIA GUTIERREZ LAURA MABEL', '5774273', '62793150', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CORIA GUTIERREZ LAURA MABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CORIA GUTIERREZ LAURA MABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORESTE' AND direccion = 'ALBORTA N15 ENTRE VILLARROEL Y OBLITAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORESTE', 'ALBORTA N15 ENTRE VILLARROEL Y OBLITAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ MARTINEZ LOURDEZ VERONICA', '3539341', '73829855', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ MARTINEZ LOURDEZ VERONICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ MARTINEZ LOURDEZ VERONICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUDESTE' AND direccion = 'URB SAN AGUSTIN MZ9 LOTE 8' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUDESTE', 'URB SAN AGUSTIN MZ9 LOTE 8')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEÑAFIEL QUISPE MARIA ELENA', '5722816', '67250253', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEÑAFIEL QUISPE MARIA ELENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEÑAFIEL QUISPE MARIA ELENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'AV TACNA N2133 ENTRE ARCE Y SANTA BARBARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'AV TACNA N2133 ENTRE ARCE Y SANTA BARBARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE REQUENA KATERIN IRIS', '7315010', '60412468', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE REQUENA KATERIN IRIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE REQUENA KATERIN IRIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'URB 7 DE MARZO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'URB 7 DE MARZO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI PEÑAFIEL ANA MARIA', '7352640', '78608145', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI PEÑAFIEL ANA MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI PEÑAFIEL ANA MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'AV TACNA N1967 ENTRE BOLIVAR Y SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'AV TACNA N1967 ENTRE BOLIVAR Y SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ONOFRE HERRERA NANCY', '5737427', '72488970', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ONOFRE HERRERA NANCY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ONOFRE HERRERA NANCY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'AV VILLAZON ENTREMARIA QUIROZ Y QUIROGA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'AV VILLAZON ENTREMARIA QUIROZ Y QUIROGA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HERRERA PEÑAFIEL MARILIN', '7373200', '63239451', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HERRERA PEÑAFIEL MARILIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HERRERA PEÑAFIEL MARILIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'PERALTA SORUCO JUNIN Y AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'PERALTA SORUCO JUNIN Y AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VALLEJOS  CORINA LUZMA', '5721598', '72303037', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VALLEJOS  CORINA LUZMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VALLEJOS  CORINA LUZMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'AV TACNA N2133 ENTRE ARCE Y SANTA BARBARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'AV TACNA N2133 ENTRE ARCE Y SANTA BARBARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('REQUENA LOREDO VERONICA', '3554847', '74113913', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REQUENA LOREDO VERONICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REQUENA LOREDO VERONICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'PETOT N1219 ESQ COCHABAMBA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'PETOT N1219 ESQ COCHABAMBA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ MAMANI DEYSI GIOVANA', '3527201', '68295661', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ MAMANI DEYSI GIOVANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ MAMANI DEYSI GIOVANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AV AMERICA ENTRE VELASCO GALVARRO ESQUINA AMERICA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AV AMERICA ENTRE VELASCO GALVARRO ESQUINA AMERICA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALA RODRIGUEZ EDITH MILENKA', '4020315', '60424599', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALA RODRIGUEZ EDITH MILENKA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALA RODRIGUEZ EDITH MILENKA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AV VILLARROEL ENTRE CALLE MARIA QUIROS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AV VILLARROEL ENTRE CALLE MARIA QUIROS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEÑAFIEL CONDORI CECILIA', '5984837', '63159423', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA RM' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA RM', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV HEROES DEL CHACO N33 Y SOLDADO BOLIVIANO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV HEROES DEL CHACO N33 Y SOLDADO BOLIVIANO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUNA VILLCA MARY ZULMA', '7383226', '69593502', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LUNA VILLCA MARY ZULMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LUNA VILLCA MARY ZULMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NOROESTE' AND direccion = 'FINAL TTE. LEON N6 ENTRE A. DE IBAÑEZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOROESTE', 'FINAL TTE. LEON N6 ENTRE A. DE IBAÑEZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI YUGAR ALISSON CAROLINA', '13093719', '68311849', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ATHENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ATHENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'PETOT N1219 Y COCHABAMBA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'PETOT N1219 Y COCHABAMBA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA CRUZ GLORIA DANIELA', '12773809', '73824951', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NINA CRUZ GLORIA DANIELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NINA CRUZ GLORIA DANIELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'FINAL CAÑADA STRONGEST N780 ENTRE 19 DE MARZO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'FINAL CAÑADA STRONGEST N780 ENTRE 19 DE MARZO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUERREROS MAMANI ZENOBIA', '3528068', '68300310', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUERREROS MAMANI ZENOBIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUERREROS MAMANI ZENOBIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'AV VILLARROEL Y CIRCUNVALACION' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'AV VILLARROEL Y CIRCUNVALACION')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CASTRO GONZALES GUADALUPE', '15044110', '72475136', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CASTRO GONZALES GUADALUPE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CASTRO GONZALES GUADALUPE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'PISAGUA ENTRE MONTECINOS Y HERRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'PISAGUA ENTRE MONTECINOS Y HERRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ CALIZAYA JOSE MARIA', '13825356', '72494585', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ CALIZAYA JOSE MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ CALIZAYA JOSE MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'SILES N23 OBLITAS Y LIRA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'SILES N23 OBLITAS Y LIRA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR ENRIQUEZ EVELIN TAMARA', '7322520', '74425351', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR ENRIQUEZ EVELIN TAMARA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR ENRIQUEZ EVELIN TAMARA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'PISAGUA ENTRE MONTECINOS Y HERRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'PISAGUA ENTRE MONTECINOS Y HERRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ FUENTES SOLAGNE GLORIA', '4049625', '74133106', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ FUENTES SOLAGNE GLORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ FUENTES SOLAGNE GLORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'AV TACNA N2133 ENTRE ARCE Y SANTA BARBARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'AV TACNA N2133 ENTRE ARCE Y SANTA BARBARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE REQUENA JHOSELIN', '7401733', '61838772', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE REQUENA JHOSELIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE REQUENA JHOSELIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'AV 6 DE AGOSTO Y VICUÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'AV 6 DE AGOSTO Y VICUÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLLARANA VILLANUEVA SUSANA', '3077299', '72486253', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLLARANA VILLANUEVA SUSANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLLARANA VILLANUEVA SUSANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = '6 DE OCTUBRE Y VILLARROEL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', '6 DE OCTUBRE Y VILLARROEL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TRUJILLO TARQUI CLOTILDE', '673744', '67240818', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TRUJILLO TARQUI CLOTILDE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TRUJILLO TARQUI CLOTILDE', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'JAEN NO.523 E.TACNA Y ARICA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'JAEN NO.523 E.TACNA Y ARICA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUILLEN  CASTRO JUANA MARIA', '3504960', '07381754', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUILLEN  CASTRO JUANA MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUILLEN  CASTRO JUANA MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AMERICA DEHENE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AMERICA DEHENE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE  RIVAS  DANIEL REMBERT', '7342960', '07289345', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE  RIVAS  DANIEL REMBERT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE  RIVAS  DANIEL REMBERT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'C. COCHABAMBA N 892 Y WASHINTON OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'C. COCHABAMBA N 892 Y WASHINTON OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AYLLON CALDERON MONICA VALERIA', '5728993', '72457000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AYLLON CALDERON MONICA VALERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AYLLON CALDERON MONICA VALERIA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'TOMAS BARRON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'TOMAS BARRON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FERNANDEZ FERNANDEZ LUCIO ROLANDO', '5743508', '61815243', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FERNANDEZ FERNANDEZ LUCIO ROLANDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FERNANDEZ FERNANDEZ LUCIO ROLANDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'J.J. PEREZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'J.J. PEREZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APAZA  SANCHEZ  INES', '4958315', '72351145', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION AICAT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION AICAT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CARACOLLO' AND zona = 'SUR' AND direccion = 'CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUR', 'CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROSALES  LIMA ARMANDO', '3099961', '69595537', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PACHA ASOCIACION DEPARTAMENTAL AGROECOLOGICO ORURO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PACHA ASOCIACION DEPARTAMENTAL AGROECOLOGICO ORURO', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'GRAL. CARRASCO NO. 151 E.CAMACHO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'GRAL. CARRASCO NO. 151 E.CAMACHO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR  MIER  NATHALI ELIZABETH', '7356697', '74275291', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR  MIER  NATHALI ELIZABETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR  MIER  NATHALI ELIZABETH', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'JANKOSALITA' AND direccion = 'AV DEL EJERCITO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'JANKOSALITA', 'AV DEL EJERCITO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA CONTRERAS MARIA ISABEL', '5724156', '74468454', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YUCRA CONTRERAS MARIA ISABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YUCRA CONTRERAS MARIA ISABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'JANCKOSALITA HUANUNI' AND direccion = 'ZONA JANCKOSALITA HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'JANCKOSALITA HUANUNI', 'ZONA JANCKOSALITA HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUIROZ ALEGRE ZUELEM', '3527129', '73841767', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUIROZ ALEGRE ZUELEM' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUIROZ ALEGRE ZUELEM', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'SAN PEDRO' AND direccion = 'RESD L. CABRERA N32' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAN PEDRO', 'RESD L. CABRERA N32')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENESES GUTIERREZ VICENTA', '5723773', '72359980', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MENESES GUTIERREZ VICENTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MENESES GUTIERREZ VICENTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'HUANUNI' AND zona = 'SAJSANI' AND direccion = 'CALLE ARCE N120 ENTRE PDTE MONTES Y SANTA BARBARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAJSANI', 'CALLE ARCE N120 ENTRE PDTE MONTES Y SANTA BARBARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SALINAS SAAVEDRA TANIA', '5749052', '60424056', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SALINAS SAAVEDRA TANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SALINAS SAAVEDRA TANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'COMUNIDAD URA CHAQUILLA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'COMUNIDAD URA CHAQUILLA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARTINEZ GUTIERREZ SEVERINA', '4060565', '71889511', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARTINEZ GUTIERREZ SEVERINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARTINEZ GUTIERREZ SEVERINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'VILUYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'VILUYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MACIAS JHESIKA LITZI', '4204681', '72310866', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI MACIAS JHESIKA LITZI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI MACIAS JHESIKA LITZI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'CENTRAL' AND direccion = 'CORAZON DE JESUS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CENTRAL', 'CORAZON DE JESUS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA RAMIREZ ZULMA', '7270066', '63646613', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YUCRA RAMIREZ ZULMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YUCRA RAMIREZ ZULMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'HUANUNI' AND zona = 'SAJSANI' AND direccion = 'BARRIO CHANCADORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAJSANI', 'BARRIO CHANCADORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PAREDES CANAVIRI WENCESLAO', '5741256', '79405820', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAREDES CANAVIRI WENCESLAO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAREDES CANAVIRI WENCESLAO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'JANKOSALITA' AND direccion = 'AV 10 DE NOVIEMBRE N34 HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'JANKOSALITA', 'AV 10 DE NOVIEMBRE N34 HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA FLORES ROSMERY SONIA', '5917682', '70141637', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA FLORES ROSMERY SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA FLORES ROSMERY SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA VICTORIA' AND direccion = 'URB VILLA COPACABANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA VICTORIA', 'URB VILLA COPACABANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARAYO MARTINEZ ROBERTA', '12901943', '65428676', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARAYO MARTINEZ ROBERTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARAYO MARTINEZ ROBERTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'ARAMANI' AND direccion = 'COMUNIDAD ARAMANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'ARAMANI', 'COMUNIDAD ARAMANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARENA BARRO MARGARITA', '10555082', '63638805', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARENA BARRO MARGARITA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARENA BARRO MARGARITA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'HUANUNI' AND zona = 'COMUNIDAD MACHACUYO' AND direccion = 'COMUNIDAD MACHACUYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'COMUNIDAD MACHACUYO', 'COMUNIDAD MACHACUYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARTINEZ CANAVIRI JULIA', '7409216', '73847102', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARTINEZ CANAVIRI JULIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARTINEZ CANAVIRI JULIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'JARDIN VILUYO' AND direccion = 'RESD VILUYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'JARDIN VILUYO', 'RESD VILUYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAIME MAMANI JHOVANA INGRID', '7262015', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAIME MAMANI JHOVANA INGRID' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAIME MAMANI JHOVANA INGRID', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'JARDIN VILUYO' AND direccion = 'RESD VILUYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'JARDIN VILUYO', 'RESD VILUYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA TORREZ JHOSELIN CLAUDIA', '7276091', '75710766', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YUCRA TORREZ JHOSELIN CLAUDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YUCRA TORREZ JHOSELIN CLAUDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'HUANUNI' AND zona = 'JARDIN VILUYO' AND direccion = 'RESD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'JARDIN VILUYO', 'RESD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE ESCOBAR AYDEE', '5741075', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE ESCOBAR AYDEE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE ESCOBAR AYDEE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'HUANUNI' AND zona = 'SAJSANI' AND direccion = 'CARRETERA PRINCIPAL HUANUNI-ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAJSANI', 'CARRETERA PRINCIPAL HUANUNI-ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARAYO FABRICA KAREN JUDITH', '7350045', '65440412', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARAYO FABRICA KAREN JUDITH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARAYO FABRICA KAREN JUDITH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'SAJSANI' AND direccion = 'CARRETERA A LA PAZ ENTRE SUCRE Y BOLIVIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAJSANI', 'CARRETERA A LA PAZ ENTRE SUCRE Y BOLIVIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BERMUDEZ VARGAS MARIA LUZ', '3115785', '71101353', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BERMUDEZ VARGAS MARIA LUZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BERMUDEZ VARGAS MARIA LUZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA VICTORIA' AND direccion = 'CALLE ALVARES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA VICTORIA', 'CALLE ALVARES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANTONIO FLORES JUDITH', '7413023', '73352861', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANTONIO FLORES JUDITH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANTONIO FLORES JUDITH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'SAN PEDRO' AND direccion = 'CALLE ALVAREZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAN PEDRO', 'CALLE ALVAREZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARTINEZ FLORES EBELIA', '7311290', '67261994', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARTINEZ FLORES EBELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARTINEZ FLORES EBELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA COPACABANA' AND direccion = 'ZONA VILLA COPACABANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA COPACABANA', 'ZONA VILLA COPACABANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANTONIO ALEGRE WILMA', '7289279', '72781449', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANTONIO ALEGRE WILMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANTONIO ALEGRE WILMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'HUANUNI' AND zona = 'SAN PEDRO' AND direccion = 'AV LADISLAO CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAN PEDRO', 'AV LADISLAO CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPEZ  CAROLINE', '3541355', '72319032', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPEZ  CAROLINE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPEZ  CAROLINE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'PRIMERO DE MAYO' AND direccion = 'AYLLU VILUYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'PRIMERO DE MAYO', 'AYLLU VILUYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TITO RIVERA NIEVES', '7272076', '71106350', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TITO RIVERA NIEVES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TITO RIVERA NIEVES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'AV DEL EJERCITO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'AV DEL EJERCITO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANTONIO ALEGRE SARAHI', '14075726', '73311869', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANTONIO ALEGRE SARAHI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANTONIO ALEGRE SARAHI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'MARIA FRANCISCA' AND direccion = 'RESD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'MARIA FRANCISCA', 'RESD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARAYO CONTRERAS ELIZABETH', '5736826', '67683333', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARAYO CONTRERAS ELIZABETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARAYO CONTRERAS ELIZABETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'MIRAFLORES' AND direccion = 'ZONA MIRAFLORES AV LIZARAGA LOCALIDAD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'MIRAFLORES', 'ZONA MIRAFLORES AV LIZARAGA LOCALIDAD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MIRANDA PACO TANIA', '4062728', '72313193', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIRANDA PACO TANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIRANDA PACO TANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'CENTRAL' AND direccion = 'CALLE LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CENTRAL', 'CALLE LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOROCHI COLQUE FLORIA MERY', '5067687', '67250993', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOROCHI COLQUE FLORIA MERY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOROCHI COLQUE FLORIA MERY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'VILACOLLO' AND direccion = 'RESD. VILACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILACOLLO', 'RESD. VILACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI VILLCA FRANCISCA', '4059743', '71851419', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI VILLCA FRANCISCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI VILLCA FRANCISCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA VICTORIA' AND direccion = 'CALLE ALVAREZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA VICTORIA', 'CALLE ALVAREZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANTONIO CRUZ GABRIELA', '7413027', '74145274', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANTONIO CRUZ GABRIELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANTONIO CRUZ GABRIELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA VICTORIA' AND direccion = 'CALLE ALVAREZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA VICTORIA', 'CALLE ALVAREZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANTONIO FLORES ALEJANDRA', '7413024', '71848398', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANTONIO FLORES ALEJANDRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANTONIO FLORES ALEJANDRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'SAJSANI' AND direccion = 'CARRETERA A ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAJSANI', 'CARRETERA A ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE FLORES MARIA LUISA', '7350410', '71853111', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE FLORES MARIA LUISA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE FLORES MARIA LUISA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA VICTORIA' AND direccion = 'AV ARCE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA VICTORIA', 'AV ARCE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FABRICA MARTINEZ MARLENE', '13284828', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FABRICA MARTINEZ MARLENE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FABRICA MARTINEZ MARLENE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'INICIAL' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'MUNICIPIO EL CHORO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'MUNICIPIO EL CHORO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUGAR  CALIZAYA ALBERTINA', '3070435', '64765533', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YUGAR  CALIZAYA ALBERTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YUGAR  CALIZAYA ALBERTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'INICIAL' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'C. IQUIQUE NO. 121 U JAEN - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'C. IQUIQUE NO. 121 U JAEN - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HIDALGO HUANCA DAVID', '12933812', '73887753', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HIDALGO HUANCA DAVID' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HIDALGO HUANCA DAVID', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SAJAMA GARCIA MARLINA', '7392734', '68335762', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SAJAMA GARCIA MARCELINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SAJAMA GARCIA MARCELINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = 'NORTE' AND direccion = 'PROVINCIA CARANGAS CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'NORTE', 'PROVINCIA CARANGAS CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACOMONI MAMANI LIDIA', '2765819', '72455941', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PACOMONI MAMANI LIDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PACOMONI MAMANI LIDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACO ZUBIETA LEONOR', '2750612', '74142775', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PACO ZUBIETA LEONOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PACO ZUBIETA LEONOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'CENTRO ARTESANAL MULTIDICIPLINARIO CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'CENTRO ARTESANAL MULTIDICIPLINARIO CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPA QUISPE PASCUALA', '5725575', '72343532', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CENTRO ARTESANAL MULTIDICIPLINARIO CORQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CENTRO ARTESANAL MULTIDICIPLINARIO CORQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TURCO' AND zona = 'ESTE' AND direccion = 'BARRIENTOS, ORURO Y SAJAMA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TURCO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TURCO', 'ESTE', 'BARRIENTOS, ORURO Y SAJAMA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE MOLLER ELENA', '3508557', '71188446', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'WAYNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('WAYNA', NULLIF('346137027',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'SUD' AND direccion = 'QUEWAYLLANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'SUD', 'QUEWAYLLANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHALLAPA A VILMA FANNY', '4421510', '72295828', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHALLAPA A VILMA FANNY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHALLAPA A VILMA FANNY', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'HUMATIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'HUMATIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANCHEZ HUMATIA CELINDA ROSMERY', '7279967', '74825812', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SANCHEZ HUMATIA CELINDA ROSMERY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SANCHEZ HUMATIA CELINDA ROSMERY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'SUD' AND direccion = 'UTB CHALLACOTA BELEN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'SUD', 'UTB CHALLACOTA BELEN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHALLAPA AGUILAR  VILMA', '4421510', '72295828', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'UTD CHALLACOTA BELEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('UTD CHALLACOTA BELEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CORQUE' AND zona = 'SUD' AND direccion = 'UTB' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUD', 'UTB')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TAQUICHIRI MUÑOZ LEONARDA', '4420315', '72395858', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'UTB CHALLACOTA BELEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('UTB CHALLACOTA BELEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'RESD. EN CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'RESD. EN CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES FLORES BENIGNA', '3005733', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES FLORES BENIGNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES FLORES BENIGNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CIRCUNVALACION, LA PLATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CIRCUNVALACION, LA PLATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YCONDEZ SANCHEZ REBECA', '7410233', '72497671', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YCONDEZ SANCHEZ REBECA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YCONDEZ SANCHEZ REBECA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'BARRIO SAN JOSE N730' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'BARRIO SAN JOSE N730')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES CORRALES JUAN CARLOS', '3528082', '76154888', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JC FLORES ARTE FOLCLORICO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JC FLORES ARTE FOLCLORICO', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'CAMPERO N1434 ENTRE JUNIN Y ADOLFO MIER' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'CAMPERO N1434 ENTRE JUNIN Y ADOLFO MIER')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ POPPE ATALIA ANGELA', '4078594', '62772618', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ POPPE ATALIA ANGELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ POPPE ATALIA ANGELA', NULLIF('4078594017',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'AV BRASIL N1319 AYACUCHO Y JUNIN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'AV BRASIL N1319 AYACUCHO Y JUNIN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BUSTILLOS TABOADA LILIAN ELGA', '3502770', '74146606', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SNACK LYM' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SNACK LYM', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. TORACA BAJA PROV. P. DALENCE-OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. TORACA BAJA PROV. P. DALENCE-OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PERALTA  ESPINOZA  CLAUDIA', '7399220', '73828859', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE GUARACHI  NABIL ARMANDO', '3118424', '72312215', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. TORACA BAJA PROV. P. DALENCE- OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. TORACA BAJA PROV. P. DALENCE- OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA CHOQUE REMBERTO', '7392428', '68307583', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'URB. SORA MZ. A-6 LOTE N1 -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'URB. SORA MZ. A-6 LOTE N1 -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ACHOCALLA  CONDORI CRISTINA SALOME', '4031691', '71857363', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. TORACA BAJA PROV. P. DALENCE - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. TORACA BAJA PROV. P. DALENCE - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE  MARIA DE LOS ANGELES', '12900563', '67240139', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE  MARIA DE LOS ANGELES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE  MARIA DE LOS ANGELES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. RODEO. PROV. L . CABRERA OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. RODEO. PROV. L . CABRERA OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI  ARCAYNE  REANET EMILDA', '12489283', '72341314', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA  BERNABE GERMAN', '4062379', '61816841', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'U. P. TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('U. P. TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. EN TORACA BAJA PROV. P. DALENCE - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. EN TORACA BAJA PROV. P. DALENCE - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE   GESSELY NAJHET', '12869950', '67218274', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE   GESSELY NAJHET' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE   GESSELY NAJHET', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. MACHACAMARCA ZONA FERROVIARIA NO. 11 - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. MACHACAMARCA ZONA FERROVIARIA NO. 11 - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LISIDRO  TARQUI ELISABETH', '12459589', '76159599', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE  PORTILLO  LUZ ANDREA', '7420529', '68326184', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHINO CHOQUE LIDIA JULIA', '5759917', '73524306', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHINO CHOQUE LIDIA JULIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHINO CHOQUE LIDIA JULIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. EN TORACA BAJO - PROV. P. DALENCE - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. EN TORACA BAJO - PROV. P. DALENCE - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA ROJAS OLIVIA HELEN', '17584246', '71702588', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. CANTON HUACANAPI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. CANTON HUACANAPI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LARA VILLCA DE BUSTILLOS ENRIQUETA', '6122360', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LARA VILLCA DE BUSTILLOS ENRIQUETA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LARA VILLCA DE BUSTILLOS ENRIQUETA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. MACHACAMARCA PRO. P. DALENCE - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. MACHACAMARCA PRO. P. DALENCE - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES CHOQUEVILLCA CRESENCIA', '4130995', '74209801', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES CHOQUEVILLCA CRESENCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES CHOQUEVILLCA CRESENCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'CALLE ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'CALLE ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HERBAS GUTIERREZ SILVIA ANGELICA', '7378008', '63646103', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. YARAQUE PROVINCIA SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. YARAQUE PROVINCIA SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLE SANCHEZ GREGORIO', '5992728', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALLE SANCHEZ GREGORIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALLE SANCHEZ GREGORIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'URB. HUAJARA I. -MZ. 90 LOTE 8 OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'URB. HUAJARA I. -MZ. 90 LOTE 8 OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA JACINTO TATIANA IRENE', '5761911', '73814346', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE GUTIERREZ  GERTRUDES', '3515693', '73807754', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. TORACA BAJA PROV. P. DALENCE -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. TORACA BAJA PROV. P. DALENCE -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE  JUAN CARLOS', '7332142', '72324473', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE ARTESANOS TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE ARTESANOS TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA  CHOQUE VALERIANA', '3109652', '73814346', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YUCRA  CHOQUE VALERIANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YUCRA  CHOQUE VALERIANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ  LOPEZ XIMENA', '5257026', '72495621', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ  LOPEZ XIMENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ  LOPEZ XIMENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA CHOQUE  SABINA', '3110648', '71444333', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = 'FERROVIARIA' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', 'FERROVIARIA', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LEQUE  BERNAL  ADELA ISABEL', '4044089', '74115989', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JACINTO MAMANI ROSARIO', '7054935', '72703492', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAZO CRUZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAZO CRUZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'TORACA BAJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'TORACA BAJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JACINTO MAMANI IRENE', '2775686', '74791485', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VENTURA DELGADO LINO', '822754', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VENTURA DELGADO LINO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VENTURA DELGADO LINO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA SANCHEZ DAVID VERGILIO', '5721953', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA SANCHEZ DAVID VERGILIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA SANCHEZ DAVID VERGILIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'INICIAL' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALANI ATAHUICHI ROSMERY', '7318709', '63649582', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALANI ATAHUICHI ROSMERY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALANI ATAHUICHI ROSMERY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOZANO VILLCA CANDELARIA', '7304044', '74359371', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOZANO VILLCA CANDELARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOZANO VILLCA CANDELARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DELGADO VENTURA MARCELINO', '5746773', '73822680', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DELGADO VENTURA MARCELINO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DELGADO VENTURA MARCELINO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'URB LOS PINOS MZ J LT13' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'URB LOS PINOS MZ J LT13')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA LARA JANNETH MARISOL', '5724318', '68294993', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA LARA JANNETH MARISOL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA LARA JANNETH MARISOL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS VICENTE SANDRA', '13291707', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMOS VICENTE SANDRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMOS VICENTE SANDRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LARA VILLAZON GUARDO', '3558978', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LARA VILLAZON GUARDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LARA VILLAZON GUARDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE GODOY DARIA', '3528602', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE GODOY DARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE GODOY DARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CALANI JHONATAN', '12548572', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE CALANI JHONATAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE CALANI JHONATAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DELGADO VENTURA SERGIO', '3092735', '71285080', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DELGADO VENTURA SERGIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DELGADO VENTURA SERGIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LARA MAMANI MIGUEL ANGEL', '4029732', '72336274', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LARA MAMANI MIGUEL ANGEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LARA MAMANI MIGUEL ANGEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV.SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV.SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE VENTURA NESTOR HUGO', '5721049', '67231113', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE VENTURA NESTOR HUGO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE VENTURA NESTOR HUGO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE VILLCA NORMA', '7318710', '67255272', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE VILLCA NORMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE VILLCA NORMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BUSTILLOS LARA LUIS ARMANDO', '12518887', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BUSTILLOS LARA LUIS ARMANDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BUSTILLOS LARA LUIS ARMANDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LARA LARA JAVIER', '622591', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LARA LARA JAVIER' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LARA LARA JAVIER', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BUSTILLOS MARCA COSME', '6759435', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BUSTILLOS MARCA COSME' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BUSTILLOS MARCA COSME', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HERRERA MITA ANGELICA', '6010705', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HERRERA MITA ANGELICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HERRERA MITA ANGELICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LARA CANAVIRI WINSTON', '7369203', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LARA CANAVIRI WINSTON' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LARA CANAVIRI WINSTON', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VENTURA VILLCA CRISTINA', '7299054', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VENTURA VILLCA CRISTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VENTURA VILLCA CRISTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LARA CANAVIRI RONALD', '7318705', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LARA CANAVIRI RONALD' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LARA CANAVIRI RONALD', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BUSTILLOS MARCA NILDA CRISTINA', '7267667', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BUSTILLOS MARCA NILDA CRISTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BUSTILLOS MARCA NILDA CRISTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CANAVIRI VILLCA MARTHA', '5222836', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CANAVIRI VILLCA MARTHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CANAVIRI VILLCA MARTHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'TOTORA' AND zona = '' AND direccion = 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOTORA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOTORA', '', 'RESD. HUACANAPI PROV. SAN PEDRO DE TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LARA BUSTILLOS ALDO', '12901756', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LARA BUSTILLOS ALDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LARA BUSTILLOS ALDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = 'OESTE' AND direccion = 'CALLE ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', 'OESTE', 'CALLE ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JACINTO  MAMANI GIMENA', '5766867', '74057074', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. TORACA BAJO PROV. P. DALENCE -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. TORACA BAJO PROV. P. DALENCE -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROJAS  ODILIA', '5931344', '72351283', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = 'SUD' AND direccion = 'AV. FERROVIARIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', 'SUD', 'AV. FERROVIARIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUZMAN  CAYO ALEJANDRINA', '7265725', '68310928', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORACA BAJA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORACA BAJA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'AV. FERROVIARIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'AV. FERROVIARIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JACINTO MAMANI ISIDORA', '3110128', '73807721', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JACINTO MAMANI ISIDORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JACINTO MAMANI ISIDORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'MACHACAMARCA' AND zona = '' AND direccion = 'RESD. EN MACHACAMARCA PROV. PANTALEON DALENCE -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'MACHACAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('MACHACAMARCA', '', 'RESD. EN MACHACAMARCA PROV. PANTALEON DALENCE -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AJHUACHO ARO BACILIA', '4020626', '73801452', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AJHUACHO ARO BACILIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AJHUACHO ARO BACILIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'CALLE AROMA N650 Y LA PAZ Y SORIA GALVARRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'CALLE AROMA N650 Y LA PAZ Y SORIA GALVARRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ECHEVERRIA CALDERON JORGE EDUARDO', '2788165', '75700004', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ECHEVERRIA CALDERON JORGE EDUARDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ECHEVERRIA CALDERON JORGE EDUARDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'POTOSI ESQUINA SANTA BARBARA N6782' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'POTOSI ESQUINA SANTA BARBARA N6782')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AMONZABEL ARANCIBIA ELENA VICTORIA', '13982388', '70438688', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AMONZABEL ARANCIBIA ELENA VICTORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AMONZABEL ARANCIBIA ELENA VICTORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = 'CHIPAYA - PRURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', 'CHIPAYA - PRURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE HUARACHI LUCIA', '4072619', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPE HUARACHI LUCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPE HUARACHI LUCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'SOLRIA GALVARRO, OBLITA Y LIRA N178' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'SOLRIA GALVARRO, OBLITA Y LIRA N178')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACHECO GARECA SILVIA', '8606589', '78612087', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES SANTY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES SANTY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = 'CENTRAL' AND direccion = 'RESD. EN EUCALIPTUS - C. CAMACHO Y ORURO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', 'CENTRAL', 'RESD. EN EUCALIPTUS - C. CAMACHO Y ORURO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GABRIEL HERRERA MARTHA', '2198569', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GABRIEL HERRERA MARTHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GABRIEL HERRERA MARTHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RIVERA ALTA - PROV. GUALBERTO VILLARROEL - LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RIVERA ALTA - PROV. GUALBERTO VILLARROEL - LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MAMANI ANGELINO', '6888275', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI MAMANI ANGELINO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI MAMANI ANGELINO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'SABAYA - CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'SABAYA - CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ CONDORI JUSTA', '5747809', '68357786', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ CONDORI JUSTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ CONDORI JUSTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'SAN GERONIMO ENTRE POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'SAN GERONIMO ENTRE POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ MAMANI MARIBEL', '7301651', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ MAMANI MARIBEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ MAMANI MARIBEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'SABAYA - CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'SABAYA - CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FELIPE FAUSTA FILOMENA', '12369561', '67233621', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FELIPE FAUSTA FILOMENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FELIPE FAUSTA FILOMENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = 'CHIPAYA - ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', 'CHIPAYA - ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FELIPE FLORA', '5745806', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FELIPE FLORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FELIPE FLORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'SABAYA - CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'SABAYA - CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FELIPE TEOFILA LUCE', '7324849', '68317968', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FELIPE TEOFILA LUCE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FELIPE TEOFILA LUCE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'NORTE' AND direccion = 'GALVARO ENTRE BENI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'NORTE', 'GALVARO ENTRE BENI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI LAZARO NADE NOEMI', '7293394', '68335906', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI LAZARO NADE NOEMI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI LAZARO NADE NOEMI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'CENTRAL' AND direccion = 'CHIPAYA - ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'CENTRAL', 'CHIPAYA - ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE FELIPE MARINA', '7300550', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE FELIPE MARINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE FELIPE MARINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = 'CHIPAYA - ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', 'CHIPAYA - ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPA LOPEZ MARIA', '5747890', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COPA LOPEZ MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COPA LOPEZ MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'ORURO-SABAYA-CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'ORURO-SABAYA-CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI QUISPE EFEGENIA', '5747833', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI QUISPE EFEGENIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI QUISPE EFEGENIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = 'RESD SALINAS DE GARCI MEDOZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', 'RESD SALINAS DE GARCI MEDOZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI MAMANI DELMIRA', '7406212', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI MAMANI DELMIRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI MAMANI DELMIRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'PAGADOR Y GALVARRO - CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'PAGADOR Y GALVARRO - CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO LAZARO YOLINDA', '7427333', '67297206', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAZARO LAZARO YOLINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAZARO LAZARO YOLINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'RESD. EN CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'RESD. EN CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI ANCASI PAOLA', '7307779', '68339192', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI ANCASI PAOLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI ANCASI PAOLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'SABAYA - CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'SABAYA - CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BELTRAN MAMANI ADA MAJHUMI', '7298323', '73826065', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BELTRAN MAMANI ADA MAJHUMI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BELTRAN MAMANI ADA MAJHUMI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = '6 DE AGOSTO ENTRE SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', '6 DE AGOSTO ENTRE SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLLO CONDORI FILOMENO', '6183424', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOLLO CONDORI FILOMENO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOLLO CONDORI FILOMENO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = 'CENTRAL' AND direccion = 'RESD. EN CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'CENTRAL', 'RESD. EN CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ LAZARO CLARA', '5747793', '72302024', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ LAZARO CLARA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ LAZARO CLARA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'AV ORURO ENTRE SAN AGUSTIN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'AV ORURO ENTRE SAN AGUSTIN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PAREDES M VITORIA', '5733326', '72351426', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAREDES MAMANI VICTORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAREDES MAMANI VICTORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'SABAYA - CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'SABAYA - CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE LAZARO LIDIA', '4046923', '72338514', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE LAZARO LIDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE LAZARO LIDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'CALLE COCHAVAMPA ENTRE SAN AGUSTIN ASIA OSESTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'CALLE COCHAVAMPA ENTRE SAN AGUSTIN ASIA OSESTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI F SONIA', '5722767', '74135907', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FELIPE SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FELIPE SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = 'CALLE BOLIVAR ENTRE SUCRE Y 6 DE AGOSTO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', 'CALLE BOLIVAR ENTRE SUCRE Y 6 DE AGOSTO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLLO LOZA SIMON VICENTE', '5747803', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOLLO LOZA SIMON VICENTE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOLLO LOZA SIMON VICENTE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'NORTE' AND direccion = 'RESD CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'NORTE', 'RESD CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLLO FELIPE JANETH MARTHA', '5747832', '68356952', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOLLO FELIPE JANETH MARTHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOLLO FELIPE JANETH MARTHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'ARICA- BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'ARICA- BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO L SONIA', '7300519', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAZARO LOPEZ SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAZARO LOPEZ SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'CENTRAL' AND direccion = 'CALLE ROSARIO ENTRE COPACABANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'CENTRAL', 'CALLE ROSARIO ENTRE COPACABANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI L JHENNY', '7393424', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI LOPEZ JHENNY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI LOPEZ JHENNY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'CALLE GERONIMO ENTRE POTOSI - LOC CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'CALLE GERONIMO ENTRE POTOSI - LOC CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE L VIVIANA', '5068874', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPE L VIVIANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPE L VIVIANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'RESD. CHIPAYA PROV. SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'RESD. CHIPAYA PROV. SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPA  EULALIA', '3515620', '71881715', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COPA  EULALIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COPA  EULALIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = 'SAJAMA - BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', 'SAJAMA - BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI  JASINTA', '7301670', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI  JASINTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI  JASINTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'NORTE' AND direccion = 'HUERMOLLUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'NORTE', 'HUERMOLLUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PAREDES MOLLO SEGUNDINA', '5735326', '63660760', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAREDES MOLLO SEGUNDINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAREDES MOLLO SEGUNDINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'SAN JOSE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'SAN JOSE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE CONDORI HOLGA', '5747899', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE CONDORI HOLGA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE CONDORI HOLGA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLLO QUISPE SEBASTIANA', '5747855', '72457631', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOLLO QUISPE SEBASTIANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOLLO QUISPE SEBASTIANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN SALINAS DE GARCI MENDOZA - PROV. L CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN SALINAS DE GARCI MENDOZA - PROV. L CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PANAMA  JUAN CARLOS', '5067786', '72391217', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PANAMA  JUAN CARLOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PANAMA  JUAN CARLOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE COPA NILDA', '7324827', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE COPA NILDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE COPA NILDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'OESTE' AND direccion = 'CALLE ROSARIO AVENIDA ARICA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'OESTE', 'CALLE ROSARIO AVENIDA ARICA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE CONDORI ELIZA', '7324813', '68297004', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE CONDORI ELIZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE CONDORI ELIZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = 'SABAYA - CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', 'SABAYA - CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE LAZARO CONCEPCION', '5736217', '71886933', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPE LAZARO CONCEPCION' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPE LAZARO CONCEPCION', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'SAJAMA - BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'SAJAMA - BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPA QUISPE JOSE MANUEL', '5770720', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COPA QUISPE JOSE MANUEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COPA QUISPE JOSE MANUEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'SUD' AND direccion = 'BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'SUD', 'BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE HUARACHI CELINDA', '7396452', '67216891', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPE HUARACHI CELINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPE HUARACHI CELINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'PUCARA GRANDE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'PUCARA GRANDE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CACERES RIOS RAIMUNDO', '3060240', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CACERES RIOS RAIMUNDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CACERES RIOS RAIMUNDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = 'ESTE' AND direccion = 'RESD. EUCALIPTUS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', 'ESTE', 'RESD. EUCALIPTUS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VALDEZ SANDOVAL JUAN', '7391808', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VALDEZ SANDOVAL JUAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VALDEZ SANDOVAL JUAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. ALCAMARCA PROV. TOMAS. BARRON - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. ALCAMARCA PROV. TOMAS. BARRON - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE MAMANI MAXIMO', '2775285', '72453647', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE MAMANI MAXIMO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE MAMANI MAXIMO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = 'SUD' AND direccion = 'RESD. EN EUCALIPTUS - PROV. TOMAS  BARRON - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', 'SUD', 'RESD. EN EUCALIPTUS - PROV. TOMAS  BARRON - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAMBI CABEZAS JUDITH FLORA', '7281559', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAMBI CABEZAS JUDITH FLORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAMBI CABEZAS JUDITH FLORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = 'CENTRAL' AND direccion = 'RESD. EN EUCALIPTUS - PROV. TOMAS BARRON - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', 'CENTRAL', 'RESD. EN EUCALIPTUS - PROV. TOMAS BARRON - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CABEZAS HERRERA DE SOLARES LORENZA', '3085776', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CABEZAS HERRERA DE SOLARES LORENZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CABEZAS HERRERA DE SOLARES LORENZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. UNOPATA PROV. GUALBERTO VILLARROEL - LAPAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. UNOPATA PROV. GUALBERTO VILLARROEL - LAPAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VEIZAN GABRIEL ELENA', '5943667', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VEIZAN GABRIEL ELENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VEIZAN GABRIEL ELENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. EN COM. ALCAMARCA - EUCALIPTUS PROV. T. BARRON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. EN COM. ALCAMARCA - EUCALIPTUS PROV. T. BARRON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ARROYO FREDDY FRANCISCO', '7339925', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI ARROYO FREDDY FRANCISCO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI ARROYO FREDDY FRANCISCO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'EUCALIPTOS - TOMAS BARRON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'EUCALIPTOS - TOMAS BARRON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROMAN SOLIZ BILGAI', '7272931', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROMAN SOLIZ BILGAI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROMAN SOLIZ BILGAI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'AV R VASQUEZ ENTRE CALLE M Y R N366' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'AV R VASQUEZ ENTRE CALLE M Y R N366')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZARATE MAGNE FRANZ NELSON', '3544816', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZARATE MAGNE FRANZ NELSON' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZARATE MAGNE FRANZ NELSON', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. ALCAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. ALCAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ARROYO SANTUSA', '7394080', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI ARROYO SANTUSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI ARROYO SANTUSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. EUCALIPTUS PROV. TOMAS BARRON - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. EUCALIPTUS PROV. TOMAS BARRON - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PINAYA COLQUE VICTOR', '5737348', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PINAYA COLQUE VICTOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PINAYA COLQUE VICTOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. ALCAMARCA PROV. TOMAS BARRON - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. ALCAMARCA PROV. TOMAS BARRON - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PINAYA COLQUE CLAUDINA', '7312692', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PINAYA COLQUE CLAUDINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PINAYA COLQUE CLAUDINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. EUCALIPTUS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. EUCALIPTUS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZARATE VARGAS ESPERANZA', '2767722', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZARATE VARGAS ESPERANZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZARATE VARGAS ESPERANZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. EN QUELCATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. EN QUELCATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZARATE CUBA SONIA', '8068632', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZARATE CUBA SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZARATE CUBA SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. EN CHAPICOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. EN CHAPICOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOVERA CABEZAS PAULINO', '7344361', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOVERA CABEZAS PAULINO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOVERA CABEZAS PAULINO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'INICIAL' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. CHAPICOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. CHAPICOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ CALLE NIEVES', '7344324', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ CALLE NIEVES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ CALLE NIEVES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. EN COM. MACHACAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. EN COM. MACHACAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GABRIEL CABEZAS FLORENCIO', '2193235', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GABRIEL CABEZAS FLORENCIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GABRIEL CABEZAS FLORENCIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. AMACHUMA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. AMACHUMA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES CRUZ ROLANDO', '3559041', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES CRUZ ROLANDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES CRUZ ROLANDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. EUCALIPTUS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. EUCALIPTUS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOLARES CHAMBI FLORINDA', '5758016', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOLARES CHAMBI FLORINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOLARES CHAMBI FLORINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'AV. PANAMERICANA N 306 - CARACOLLO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'AV. PANAMERICANA N 306 - CARACOLLO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHIARA CATARI ROMER NILO', '5765659', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROMER NILO CHIARA C' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROMER NILO CHIARA C', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'EUCALIPTUS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'EUCALIPTUS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOLARES CHAMBI RUFINA', '7310824', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOLARES CHAMBI RUFINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOLARES CHAMBI RUFINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'EUCALIPTUS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'EUCALIPTUS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACHECO TOLEDO JHONY', '3119309', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PACHECO TOLEDO JHONY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PACHECO TOLEDO JHONY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'AYACUCHO N569 ESQUINA SORIA GALVARRO Y 6 DE OCTUBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'AYACUCHO N569 ESQUINA SORIA GALVARRO Y 6 DE OCTUBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUENTAS BELLIDO JAIME', '3558612', '62574611', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CANALIZA 3D' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CANALIZA 3D', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. COM. RIBERALTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. COM. RIBERALTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DONAIRE BELTRAN SILVIA BEATRIZ', '6648671', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DONAIRE BELTRAN SILVIA BEATRIZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DONAIRE BELTRAN SILVIA BEATRIZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. LOC. RIVERA ALTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. LOC. RIVERA ALTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZARATE MAMANI FRANCISCA', '13061651', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZARATE MAMANI FRANCISCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZARATE MAMANI FRANCISCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. COLQUECHACA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. COLQUECHACA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARIAS ROQUE LUIS', '5542239', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARIAS ROQUE LUIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARIAS ROQUE LUIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'RESD. LOC. CARACOLLO - PROV CERCADO OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'RESD. LOC. CARACOLLO - PROV CERCADO OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PINAYA CHOQUE BETZABE DELIA', '4052990', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PINAYA CHOQUE BETZABE DELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PINAYA CHOQUE BETZABE DELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. EN MACHACAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. EN MACHACAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUZMAN CORANI AMALIA', '2198648', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUZMAN CORANI AMALIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUZMAN CORANI AMALIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'A. ZAMUDIO N6 R. CHAVEZ Z NORTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'A. ZAMUDIO N6 R. CHAVEZ Z NORTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHURA CRUZ ERICA', '5756405', '78607828', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHURA CRUZ ERICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHURA CRUZ ERICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = '16 DE JULIO SN ENTRE BUSH' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', '16 DE JULIO SN ENTRE BUSH')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLANUEVA CABEZAS BASILIA', '7272132', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLANUEVA CABEZAS BASILIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLANUEVA CABEZAS BASILIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. EUCALIPTUS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. EUCALIPTUS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TUSCO CHOQUE SABINA MARA', '3541428', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TUSCO CHOQUE SABINA MARA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TUSCO CHOQUE SABINA MARA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. AVAROA PROV. SUR CARANGAS -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. AVAROA PROV. SUR CARANGAS -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMIREZ HUANACO LOURDES', '7396916', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMIREZ HUANACO LOURDES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMIREZ HUANACO LOURDES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'EUCALIPTUS' AND zona = '' AND direccion = 'RESD. EUCALIPTUS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EUCALIPTUS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EUCALIPTUS', '', 'RESD. EUCALIPTUS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FERNANDEZ FERNANDEZ HET HUMBERTO', '7299441', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FERNANDEZ FERNANDEZ HET HUMBERTO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FERNANDEZ FERNANDEZ HET HUMBERTO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN SALINAS DE GARCI MENDOZA - PROV. L. CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN SALINAS DE GARCI MENDOZA - PROV. L. CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI  LUTINA  AYDDE FIDELIA', '7261701', '67249386', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI  LUTINA  AYDDE FIDELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI  LUTINA  AYDDE FIDELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. SALINAS DE GARCI MENDOZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. SALINAS DE GARCI MENDOZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA LAURA GIMENA', '4023073', '73061024', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CENTRO ARTESANAL CASA HUTARI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CENTRO ARTESANAL CASA HUTARI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'C, CAMACHO ENTRE POTOSI NO 176 ZONA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'C, CAMACHO ENTRE POTOSI NO 176 ZONA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SILVESTRE  MORALES MAYTE MICAHELA', '10543232', '68436462', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SILVESTRE  MORALES MAYTE MICAHELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SILVESTRE  MORALES MAYTE MICAHELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'BATALLON COLORADOS' AND direccion = 'RESD SALINAS DE GARCI MENDOZA PROV. L. CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'BATALLON COLORADOS', 'RESD SALINAS DE GARCI MENDOZA PROV. L. CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUIÑONES  LUTINA  VICTORIA WENDDY', '7308092', '74112879', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUIÑONES  LUTINA  VICTORIA WENDDY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUIÑONES  LUTINA  VICTORIA WENDDY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'C.CBBA - Y PSJ.KANTUTA - CHALLAPATA - OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'C.CBBA - Y PSJ.KANTUTA - CHALLAPATA - OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POMA  HUARACHI  SUSI', '4072179', '72496728', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'POMA  HUARACHI  SUSI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('POMA  HUARACHI  SUSI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'C. AMERICA Y L. CABRERA - HUARI - OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'C. AMERICA Y L. CABRERA - HUARI - OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI VELIZ ARMINDA', '4061088', '72335608', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI VELIZ ARMINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI VELIZ ARMINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'C. AMERICA Y SORIA GALVARRO N 7449 OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'C. AMERICA Y SORIA GALVARRO N 7449 OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHILA TITO LOURDES ROSEMARY', '7395543', '67075359', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHILA TITO LOURDES ROSEMARY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHILA TITO LOURDES ROSEMARY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'C. REYES CARDONA NRO 24 - SANTA CRUZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'C. REYES CARDONA NRO 24 - SANTA CRUZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TITO  MARIA ESTHER', '6421676', '74908377', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CENTRO ARTESANAL CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CENTRO ARTESANAL CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. AROMA PROV. LADISLAO CABRERA -  OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. AROMA PROV. LADISLAO CABRERA -  OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ BONIFACIO ARMINDA', '7338896', '68304237', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS ARMINDA OMETAMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS ARMINDA OMETAMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. SALINAS DE GARCI MENDOZA- PROV LADISLAO CABRERA OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. SALINAS DE GARCI MENDOZA- PROV LADISLAO CABRERA OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA GARCIA NORKA', '5720876', '72382020', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CENTRO ARTEZANAL CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CENTRO ARTEZANAL CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RES. SALINAS DE GARCI MENDOZA  PROV. L. CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RES. SALINAS DE GARCI MENDOZA  PROV. L. CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA  IBARRA NELLY', '3682644', '73825991', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA  IBARRA NELLY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA  IBARRA NELLY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'SALINAS DE GARCI MENDOZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'SALINAS DE GARCI MENDOZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALANEZ BARCO ELSA', '2769727', '71715806', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALANEZ BARCO ELSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALANEZ BARCO ELSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'C. GERMAN BUSCH Y RENGEL -CHALLAPATA - OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'C. GERMAN BUSCH Y RENGEL -CHALLAPATA - OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SALLAMA CHOQUE CILA', '7270471', '67244424', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SALLAMA CHOQUE CILA OMETAMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SALLAMA CHOQUE CILA OMETAMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD EN SALINAS DE GARCI MENDOZA PROV. L. CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD EN SALINAS DE GARCI MENDOZA PROV. L. CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA IGNACIO RELMI', '7343081', '72301897', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA IGNACIO RELMI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA IGNACIO RELMI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. CATUYO - PROV. LADISLAO CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. CATUYO - PROV. LADISLAO CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI MAMANI CARMEN', '5755275', '67103173', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI MAMANI CARMEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI MAMANI CARMEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'SALINAS DE GARCI MENDOZA - PROV, L. CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'SALINAS DE GARCI MENDOZA - PROV, L. CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUTINA FLORES CAROLA ADELA', '7343257', '71848921', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LUTINA FLORES CAROLA ADELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LUTINA FLORES CAROLA ADELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CATUYO - PROV. L. CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CATUYO - PROV. L. CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POMA HUARACHI  LOURDEZ', '4072180', '74855973', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'POMA HUARACHI  LOURDEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('POMA HUARACHI  LOURDEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN COM. AROMA - PROV. L. CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN COM. AROMA - PROV. L. CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RODRIGUEZ  GERONIMO  AYDA', '4050160', '67930498', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RODRIGUEZ  GERONIMO  AYDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RODRIGUEZ  GERONIMO  AYDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'BATALLON COLORADOS' AND direccion = 'RESD. EN SALINAS DE GARCI MENDOZA  - PROV. L.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'BATALLON COLORADOS', 'RESD. EN SALINAS DE GARCI MENDOZA  - PROV. L.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ GARCIA AYDDE ASUNTA', '5736807', '67228076', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ GARCIA AYDDE ASUNTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ GARCIA AYDDE ASUNTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. SALINAS DE GARCI MENDOZA - PROV L. CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. SALINAS DE GARCI MENDOZA - PROV L. CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI RAMOS MARIA ESTHELA', '5732748', '73839205', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI RAMOS MARIA ESTHELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI RAMOS MARIA ESTHELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'SALINAS DE GARCI MENDOZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'SALINAS DE GARCI MENDOZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ  QUISPE  APOLINAR', '2769615', '72821409', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CENTRO ARTESANAL CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CENTRO ARTESANAL CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. SALINAS DE GARCI MENDOZA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. SALINAS DE GARCI MENDOZA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ   FAUSTINA', '671208', '74115308', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ   FAUSTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ   FAUSTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. SALINAS DE GARCI MENDOZA - ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. SALINAS DE GARCI MENDOZA - ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA  QUISPE MARIELA', '7301710', '68353523', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CENTRO ARTESANAL CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CENTRO ARTESANAL CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'C.G. RILLARIEL E. ORURO - SALINAS DE G. MENDOZA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'C.G. RILLARIEL E. ORURO - SALINAS DE G. MENDOZA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZUÑIGA SILVESTRE SANDRA ADITA', '5727245', '71106082', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CENTRO ARTESANAL CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CENTRO ARTESANAL CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'C. PISAGUA E. ORURO S.N - CHALLAPATA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'C. PISAGUA E. ORURO S.N - CHALLAPATA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUETOPA  MAMANI NELIDA', '5720857', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUETOPA  MAMANI NELIDA OMETAMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUETOPA  MAMANI NELIDA OMETAMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN SALINAS DE GARCI MENDOZA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN SALINAS DE GARCI MENDOZA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE VASQUEZ MARIA ELENA', '3539263', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE VASQUEZ MARIA ELENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE VASQUEZ MARIA ELENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALHUA - PROV. L. CABRERA OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALHUA - PROV. L. CABRERA OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI VELIZ SULMA MERY', '7371080', '73819558', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI VELIZ SULMA MERY ARTESANIAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI VELIZ SULMA MERY ARTESANIAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. CATUYO PROV. L. CABRERA - OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. CATUYO PROV. L. CABRERA - OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHOQUETOPA FAVIA', '4046910', '73529812', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CHOQUETOPA FAVIA SALINAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CHOQUETOPA FAVIA SALINAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'SUD' AND direccion = 'RESD. CHALLAGUA PROV. L. CABRERA -OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'SUD', 'RESD. CHALLAGUA PROV. L. CABRERA -OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POMA HUARACHI SARA', '6061248', '73529822', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'POMA HUARACHI SARA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('POMA HUARACHI SARA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'SABAYA-CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'SABAYA-CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI LOPEZ SONIA', '5747823', '67260531', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI LOPEZ SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI LOPEZ SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'NORTE' AND direccion = 'CALLE SIN NOMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'NORTE', 'CALLE SIN NOMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FABRICA CHAJMI SANTUSA', '5564136', '74137586', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FABRICA CHAJMI SANTUSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FABRICA CHAJMI SANTUSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'SEBASTIAN PAGADOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'SEBASTIAN PAGADOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FELIPE NEMIA FLORA', '7300535', '73886737', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FELIPE NEMIA FLORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FELIPE NEMIA FLORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'OESTE' AND direccion = 'ANTOFAGASTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'OESTE', 'ANTOFAGASTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUBA CAQUETA ROSALIA', '12376001', '67248287', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CUBA CAQUETA ROSALIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CUBA CAQUETA ROSALIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'CALLE SIN NOMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'CALLE SIN NOMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE MAMANI VANESSA', '7300569', '74118382', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPE MAMANI VANESSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPE MAMANI VANESSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'CALLE COMERCIO ENTRE CALLE COMUJO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'CALLE COMERCIO ENTRE CALLE COMUJO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GONZALES CONDORI MILENA', '7391662', '68338605', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GONZALES CONDORI MILENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GONZALES CONDORI MILENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'NORTE' AND direccion = 'AVENIDA COMERCIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'NORTE', 'AVENIDA COMERCIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ MAMANI MARY ISABEL', '12899940', '72313822', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ MAMANI MARY ISABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ MAMANI MARY ISABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'OESTE' AND direccion = 'VIVIENDA EN LA ESCUELA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'OESTE', 'VIVIENDA EN LA ESCUELA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAYOJA CALLIZAYA LAURA OBET', '12519761', '72463025', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAYOJA CALLIZAYA LAURA OBET' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAYOJA CALLIZAYA LAURA OBET', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = '' AND direccion = 'RESD CABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', '', 'RESD CABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANDOVAL VILLCA JUANI NINFA', '7269694', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SANDOVAL VILLCA JUANI NINFA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SANDOVAL VILLCA JUANI NINFA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'RESD SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'RESD SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CARDENAS ALANOCA JHOSELIN', '11542139', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CARDENAS ALANOCA JHOSELIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CARDENAS ALANOCA JHOSELIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'RESD SABAYA, CALLE SIN NOMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'RESD SABAYA, CALLE SIN NOMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAYME NICOLAS ISABEL MODESTA', '3508003', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAYME NICOLAS ISABEL MODESTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAYME NICOLAS ISABEL MODESTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'INICIAL' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'RESD SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'RESD SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MICHAGA IRENE', '7384719', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI MICHAGA IRENE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI MICHAGA IRENE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'RESD SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'RESD SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLLO MAMANI GERTRUDIS', '7307471', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOLLO MAMANI GERTRUDIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOLLO MAMANI GERTRUDIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'RESD SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'RESD SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE JANCACHI FLORA', '7339672', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE JANCACHI FLORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE JANCACHI FLORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'INICIAL' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'RESD SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'RESD SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI PORTUGAL EULOGIA', '14508840', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI PORTUGAL EULOGIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI PORTUGAL EULOGIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'ESTE' AND direccion = 'AVAROA Y BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'ESTE', 'AVAROA Y BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE HUALLPA ELIZABETH', '8588892', '73810986', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE HUALLPA ELIZABETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE HUALLPA ELIZABETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'RESD SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'RESD SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARCAYNE VILLCA ELIZABETH', '3098392', '68541922', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARCAYNE VILLCA ELIZABETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARCAYNE VILLCA ELIZABETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOYA CHOQUE DEYSI ISABEL', '5778900', '72469025', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOYA CHOQUE DEYSI ISABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOYA CHOQUE DEYSI ISABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'NORTE' AND direccion = 'AV COMERCIO N10 SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'NORTE', 'AV COMERCIO N10 SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHAMBI CARMEN ROSA', '7415880', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CHAMBI CARMEN ROSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CHAMBI CARMEN ROSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'LOC COACHARI, CHARCAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'LOC COACHARI, CHARCAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHACA AYAVIRI DELIA', '14172732', '74155087', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHACA AYAVIRI DELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHACA AYAVIRI DELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'ESTE' AND direccion = 'SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'ESTE', 'SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHOQUE CAREN ZULMA', '7272669', '72320193', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CHOQUE CAREN ZULMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CHOQUE CAREN ZULMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'OESTE' AND direccion = 'CALLE SIN NOMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'OESTE', 'CALLE SIN NOMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POZO FERNANDEZ SARA JUAQUINA', '3069845', '74141494', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'POZO FERNANDEZ SARA JUAQUINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('POZO FERNANDEZ SARA JUAQUINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = '' AND direccion = 'CALLE SIN NOMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', '', 'CALLE SIN NOMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHAJMI SOFIA', '12551272', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CHAJMI SOFIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CHAJMI SOFIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VEGA CONDORI BEREÑA NATALI', '12818306', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VEGA CONDORI BEREÑA NATALI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VEGA CONDORI BEREÑA NATALI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FELIPE SANDRA JHANETT', '7324850', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FELIPE SANDRA JHANETT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FELIPE SANDRA JHANETT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'INICIAL' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAPUMA FLORES BENERICTA', '3544571', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAPUMA FLORES BENERICTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAPUMA FLORES BENERICTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SABAYA' AND zona = 'SUD' AND direccion = 'RESD SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', 'SUD', 'RESD SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZARATE AGUILAR GABY YASMIL', '7347776', '68282968', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZARATE AGUILAR GABY YASMIL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZARATE AGUILAR GABY YASMIL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'SANTIAGO DE HUARI' AND zona = '' AND direccion = 'RESD. LLAPA LLAPANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTIAGO DE HUARI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTIAGO DE HUARI', '', 'RESD. LLAPA LLAPANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CANAVIRI DE QUISPE  MAURICIA', '5067067', '63653865', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CANAVIRI DE QUISPE  MAURICIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CANAVIRI DE QUISPE  MAURICIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'SUD' AND direccion = 'AVENIDA MARISCAL SANTA CRUZ Y SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'SUD', 'AVENIDA MARISCAL SANTA CRUZ Y SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MANUEL PEREZ FIDELIA ELENA', '3516175', '67241613', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MANUEL PEREZ FIDELIA ELENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MANUEL PEREZ FIDELIA ELENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUIRRE PEREZ EVELIN', '14080956', '68309822', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUIRRE PEREZ EVELIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUIRRE PEREZ EVELIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'CALLE SUCRE ENTRE LA PAZ N24' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'CALLE SUCRE ENTRE LA PAZ N24')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE MAMANI DORA', '5765955', '63642104', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE MAMANI DORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE MAMANI DORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'ESTE' AND direccion = 'RESD CULTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'ESTE', 'RESD CULTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA MAMANI YOLANDA', '7287063', '67218442', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA MAMANI YOLANDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA MAMANI YOLANDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ CASTRO YOHOVANA', '4072283', '71888058', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ CASTRO YOHOVANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ CASTRO YOHOVANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'SUD' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'SUD', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUIRRE IGNACIO YESENIA', '7364229', '68312913', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUIRRE IGNACIO YESENIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUIRRE IGNACIO YESENIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'SUD' AND direccion = 'BOLIVAR Y LITORAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'SUD', 'BOLIVAR Y LITORAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ FLORES YESSICA', '7346292', '67914901', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ FLORES YESSICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ FLORES YESSICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'OESTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'OESTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FERNANDEZ CHIRI VIRGINA', '7347850', '63167393', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FERNANDEZ CHIRI VIRGINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FERNANDEZ CHIRI VIRGINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ MANUEL VIATRIS GEIDY', '13125639', '64767768', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ MANUEL VIATRIS GEIDY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ MANUEL VIATRIS GEIDY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA MOREIRA SONIA ANGELICA', '7264189', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA MOREIRA SONIA ANGELICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA MOREIRA SONIA ANGELICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'SUD' AND direccion = 'BOLIVAR Y LITORAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'SUD', 'BOLIVAR Y LITORAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES COLQUE PRIMA', '2760921', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES COLQUE PRIMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES COLQUE PRIMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ATORA ROJAS PRIMA', '4075229', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ATORA ROJAS PRIMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ATORA ROJAS PRIMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACO BALLESTEROS MARTHA', '12548241', '74433094', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PACO BALLESTE MARTHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PACO BALLESTE MARTHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE MORALES LOURDES GUISELA', '7310979', '72422842', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE MORALES LOURDES GUISELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE MORALES LOURDES GUISELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'OESTE' AND direccion = 'RESD SABAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'OESTE', 'RESD SABAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AYCA CRUZ LISET PAMELA', '6566877', '63707273', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AYCA CRUZ LISET PAMELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AYCA CRUZ LISET PAMELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'OESTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'OESTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MANUEL  LILIAN', '7295954', '67264854', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MANUEL  LILIAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MANUEL  LILIAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'OESTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'OESTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA PEREZ JHOSELIN', '7314511', '72499780', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA PEREZ JHOSELIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA PEREZ JHOSELIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'AV MARISCAL SANTA CRUZ ENTRE SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'AV MARISCAL SANTA CRUZ ENTRE SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROJAS MANUEL ISABEL', '7350813', '72322362', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROJAS MANUEL ISABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROJAS MANUEL ISABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'COIPASA' AND zona = 'SUD' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'SUD', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GOMEZ MARCA GUIDO JAVIER', '7929517', '63650438', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GOMEZ MARCA GUIDO JAVIER' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GOMEZ MARCA GUIDO JAVIER', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'ESTE' AND direccion = 'AVENIDA MARISCAL SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'ESTE', 'AVENIDA MARISCAL SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA PEREZ GLORIA', '2460234', '72499780', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA PEREZ GLORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA PEREZ GLORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'SUD' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'SUD', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI PEREZ FRECIA', '7345455', '68303224', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI PEREZ FRECIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI PEREZ FRECIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BLAZ CHUNGARA FABIOLA', '14331962', '67933657', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BLAZ CHUNGARA FABIOLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BLAZ CHUNGARA FABIOLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'OESTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'OESTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ GARNICA ESTRELLA', '12446342', '68327687', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ GARNICA ESTRELLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ GARNICA ESTRELLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'CALLE SUCRE ENTRE LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'CALLE SUCRE ENTRE LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MANUEL PEREZ ESTELA SONIA', '3516172', '73811047', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MANUEL PEREZ ESTELA SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MANUEL PEREZ ESTELA SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'COIPASA' AND zona = 'ESTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'ESTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARELLANO HUARACHI ELSA CECILIA', '3554171', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARELLANO HUARACHI ELSA CECILIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARELLANO HUARACHI ELSA CECILIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'CALLE LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'CALLE LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MANUEL FERNANDEZ DEMECIA LUCINDA', '4062769', '68299184', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MANUEL FERNANDEZ DEMECIA LUCINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MANUEL FERNANDEZ DEMECIA LUCINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'ESTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'ESTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUIRRE IGNACIO BRISAYDA', '7364230', '71885051', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUIRRE IGNACIO BRISAYDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUIRRE IGNACIO BRISAYDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'NORTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'NORTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ACAPA AIMA BETTY LIDIA', '2793937', '72334876', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ACAPA AIMA BETTY LIDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ACAPA AIMA BETTY LIDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'ESTE' AND direccion = 'LITORAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'ESTE', 'LITORAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPA MANUEL BENITA', '5554175', '67218049', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COPA MANUEL BENITA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COPA MANUEL BENITA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'ESTE' AND direccion = 'RESD COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'ESTE', 'RESD COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA SOLIZ ARMINDA', '4077770', '74107000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA SOLIZ ARMINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA SOLIZ ARMINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. EN CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. EN CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAMBI MAMANI ARACELI', '7309365', '72507638', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAMBI MAMANI ARACELI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAMBI MAMANI ARACELI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = 'OESTE' AND direccion = 'SIN NOMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'OESTE', 'SIN NOMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANCO LAURA ADELA CRISTINA', '4847602', '75803376', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANCO LAURA ADELA CRISTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANCO LAURA ADELA CRISTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB CHALLAPAMPITA MZ 33 LOTE 5' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB CHALLAPAMPITA MZ 33 LOTE 5')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANJINES VIÑAYA NORMA', '13092809', '74151585', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONFECCION A TEXTIL DOÑA NORMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONFECCION A TEXTIL DOÑA NORMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SANTIAGO DE HUARI' AND zona = 'OESTE' AND direccion = 'CALLE TARIJA SN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTIAGO DE HUARI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTIAGO DE HUARI', 'OESTE', 'CALLE TARIJA SN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DELGADO AGUILAR JHOVANA ANGELICA', '5060685', '67788743', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AND''S FRUT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AND''S FRUT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'C. TEJERINA Y JAEN ENTRE TOMAS FRIAS NO. 2310 -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'C. TEJERINA Y JAEN ENTRE TOMAS FRIAS NO. 2310 -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CHUGAR JHAN CARLOS', '7311629', '68282401', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE CHUGAR JHAN CARLOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE CHUGAR JHAN CARLOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ADOLFO MIER PAGADOR Y POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ADOLFO MIER PAGADOR Y POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARIAS RODRIGUEZ WILLY MARCELO', '3544315', '60410086', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYAS ESMERALDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYAS ESMERALDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'POTOSI ESQUINA ADOLFO MIER' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'POTOSI ESQUINA ADOLFO MIER')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARROYO BENITO ELIAS ANTONIO', '3516203', '72475447', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYAS NHASHIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYAS NHASHIA', NULLIF('3516203012',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = '6 DE OCTUBRE Y CHARCAS NO. 4248 ZONA NORTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', '6 DE OCTUBRE Y CHARCAS NO. 4248 ZONA NORTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BLANCO AGUILAR GABRIEL HUGO', '7269604', '75711035', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BLANCO AGUILAR GABRIEL HUGO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BLANCO AGUILAR GABRIEL HUGO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'BARRIO MAGISTERIO Z.NORTE NO 18 - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'BARRIO MAGISTERIO Z.NORTE NO 18 - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUNA CONDORI PORFIDIO CARLOS', '3099912', '73822232', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYAS TURMALIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYAS TURMALIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'PAGADOR ADOLFO MIER Y POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'PAGADOR ADOLFO MIER Y POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOLIZ RODRIGUEZ JHONNY RAUL', '3108794', '74130724', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYAS VICTORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYAS VICTORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER POTOSI Y PAGADOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER POTOSI Y PAGADOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ VASQUEZ IRINEO MARCOS', '3525205', '79409227', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'J & D JOYA Y DISEÑO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('J & D JOYA Y DISEÑO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'C. SUCRE NO 673 E. AV TACNA Y ARICA- ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'C. SUCRE NO 673 E. AV TACNA Y ARICA- ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HEREDIA  CARLOS', '586492', '77146621', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HEREDIA  CARLOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HEREDIA  CARLOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER NO. 366 PAGADOR Y POTOSI - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER NO. 366 PAGADOR Y POTOSI - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUNA CONDORI OSVALDO', '3514045', '72341576', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYAS DE LUNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYAS DE LUNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'POTOSI ADOLFO MIER Y JUNIN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'POTOSI ADOLFO MIER Y JUNIN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI HINOJOSA EDGAR', '3543191', '72457347', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA YISEEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA YISEEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'POTOSI Y ADOLFO MIER' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'POTOSI Y ADOLFO MIER')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('OCHOA CAZANA MARCELO ADALID', '5067518', '79418876', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA ROS MAR OCHOA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA ROS MAR OCHOA', NULLIF('5067518012',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'C. SALAZAR NO 1 - 2 -A E. RAMOS Y CESPEDES - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'C. SALAZAR NO 1 - 2 -A E. RAMOS Y CESPEDES - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APAZA VILLANUEVA JOSE INDALICIO', '596449', '73332092', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'APAZA VILLANUEVA JOSE INDALICIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('APAZA VILLANUEVA JOSE INDALICIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'AV. DE LAS AMERICAS N.50 ENTRE LINARES Y BAPTISTA OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'AV. DE LAS AMERICAS N.50 ENTRE LINARES Y BAPTISTA OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ GUTIERREZ JUSTINIANO JESUS', '3513639', '79712932', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYAS JL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYAS JL', NULLIF('3513639019',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER 6 DE OCTUBRE POTOSI #446' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER 6 DE OCTUBRE POTOSI #446')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BLANCO AGUILAR RONALD HUGO', '5728020', '60438228', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYAS SELECT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYAS SELECT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'C. LA SALLE Y PASAJE VICUÑA Y GERMANIA NO. 10 - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'C. LA SALLE Y PASAJE VICUÑA Y GERMANIA NO. 10 - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROCHA AGUILAR TITO GREGORIO', '3524631', '76156525', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROCHA AGUILAR TITO GREGORIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROCHA AGUILAR TITO GREGORIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER N. 5984 ESQ. POTOSI OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER N. 5984 ESQ. POTOSI OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS BLANCO MELISSA SUSAN', '7354535', '75712418', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMOS BLANCO MELISSA SUSAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMOS BLANCO MELISSA SUSAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER Y PAGADOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER Y PAGADOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS BLANCO JOSE CRISTHIAN', '7390388', '75404339', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMOS BLANCO JOSE CRISTHIAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMOS BLANCO JOSE CRISTHIAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = '6 DE OCTUBRE CASI ESQUINA ADOLFO MIER' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', '6 DE OCTUBRE CASI ESQUINA ADOLFO MIER')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHUGAR COLQUE ANTONIA DELIA', '3535160', '60401743', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHUGAR COLQUE ANTONIA DELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHUGAR COLQUE ANTONIA DELIA', NULLIF('3530439018',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER ENTRE POTOSI Y 6 DE OCTUBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER ENTRE POTOSI Y 6 DE OCTUBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARTINEZ ZURITA ROLANDO', '7339250', '61818779', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA ROMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA ROMA', NULLIF('7339250010',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER ENTRE 6 DE OCTUBRE Y POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER ENTRE 6 DE OCTUBRE Y POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('EULATE CHACON GROVER MARCELO', '4028102', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA ROSSDER' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA ROSSDER', NULLIF('4028102016',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ADOLFO MIER 497, ENTRE  6 DE OCTUBRE Y POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ADOLFO MIER 497, ENTRE  6 DE OCTUBRE Y POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SILES VERDUGUEZ VICTOR', '3510693', '71844395', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA ROVIC' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA ROVIC', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER POTOSI Y 6 DE OCTUBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER POTOSI Y 6 DE OCTUBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOZANO TINTARES FRANKLIN OMAR', '4761075', '75407563', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA SAN ELOY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA SAN ELOY', NULLIF('4761075019',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'C. AYACUCHO ESQ. IQUIQUE N 793 - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'C. AYACUCHO ESQ. IQUIQUE N 793 - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ LAZARTE ROBERT GIL', '3531219', '69575445', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYAS ALONDRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYAS ALONDRA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'C. 6 DE OCTUBRE N 502 Y ADOLFO MIER - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'C. 6 DE OCTUBRE N 502 Y ADOLFO MIER - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE FERRUFINO JUAN CARLOS', '3530439', '72325575', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA CRISTAL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA CRISTAL', NULLIF('3530439018',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;



COMMIT;
