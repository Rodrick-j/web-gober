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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ADOLFO MIER Y 6 DE OCTUBRE #461' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ADOLFO MIER Y 6 DE OCTUBRE #461')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('EULATE CHACON ROLANDO JORGE', '3522277', '72493803', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA CORONA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA CORONA', NULLIF('3522277011',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER POTOSI Y 6 DE OCTUBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER POTOSI Y 6 DE OCTUBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BENITEZ GUIERREZ IVAN HERNANDO', '4076690', '63434188', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA LOPEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA LOPEZ', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER 467' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER 467')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ CARRILLO  NELIO ANTONIO', '5898716', '68817332', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'D NELIOS JOYERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('D NELIOS JOYERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER POTOSI Y PAGADOR N 378 - OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER POTOSI Y PAGADOR N 378 - OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CLAVIJO HUMEREZ PABLO ORCAR', '7417760', '72491010', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIAS CIFFEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIAS CIFFEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ADOLFO MIER ENTRE POTOSI Y PAGADR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ADOLFO MIER ENTRE POTOSI Y PAGADR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BURGOA SANDY MIGUEL ANGEL', '7376293', '68333943', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BURGOA SANDY MIGUEL ANGEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BURGOA SANDY MIGUEL ANGEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER Y POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER Y POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('EULATE CHACON CARLOS CRISTHIAN', '3559902', '69576621', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TALLERISTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TALLERISTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER ENTRE POTOSI Y 6 DE OCTUBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER ENTRE POTOSI Y 6 DE OCTUBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ FERNANDEZ MILTHON MIGUEL', '5773407', '69590770', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA ALMIX' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA ALMIX', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER PAGADOR Y POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER PAGADOR Y POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAFUENTE ROCHA ADHEMAR RAMIRO', '13061783', '74115335', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOYERIA LA FUENTE DE LAS JOYAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOYERIA LA FUENTE DE LAS JOYAS', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'ADOLFO MIER NO 391 POTOSI Y PAGADOR - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'ADOLFO MIER NO 391 POTOSI Y PAGADOR - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUMEREZ MORALES LOURDES SUSANA', '3042883', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUMEREZ MORALES LOURDES SUSANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUMEREZ MORALES LOURDES SUSANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. EN VILAÑEQUE - PROV. AVAROA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. EN VILAÑEQUE - PROV. AVAROA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVARO MOYA TORIBIA', '3530761', '74919513', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE MUJERES ARTESANIAS URUS VILAÑEQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE MUJERES ARTESANIAS URUS VILAÑEQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'C. LOPEZ E. GRAUN - CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'C. LOPEZ E. GRAUN - CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VALERO ALVARO GENOVEVA', '12368627', '74148860', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MUJERES DE ARTESANIAS DE URUS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MUJERES DE ARTESANIAS DE URUS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. EN CHALLAPATA CLL. PAZ DEL CHACO ENTRE LAPAZ - OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. EN CHALLAPATA CLL. PAZ DEL CHACO ENTRE LAPAZ - OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DAGA HUMEREZ ELISA', '5063787', '68325119', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE MUJERES ARTESANAS URUS VILAÑEQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE MUJERES ARTESANAS URUS VILAÑEQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. VILAÑEQUE - PROV AVAROA-OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. VILAÑEQUE - PROV AVAROA-OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA CHOQUE BEATRIZ MARIBEL', '7365149', '72346717', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION ATESANAS URUS VILAÑEQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION ATESANAS URUS VILAÑEQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. EN VILAÑEQUE - PROV. AVAROA - OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. EN VILAÑEQUE - PROV. AVAROA - OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVAREZ VALERO VIRGINIA', '7301083', '63647874', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALVAREZ VALERO VIRGINIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALVAREZ VALERO VIRGINIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'COM. VILAÑEQUE - PROV. AVAROA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'COM. VILAÑEQUE - PROV. AVAROA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAURICIO RIVA EULOGIA', '3042942', '72320497', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE MUJERES URUS VILAÑEQUE LAGO POOPO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE MUJERES URUS VILAÑEQUE LAGO POOPO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. EN VILLAÑEQUE - PROV. AVAROA - ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. EN VILLAÑEQUE - PROV. AVAROA - ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAURICIO FLORES  CECILIA', '5066140', '74113767', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAURICIO FLORES  CECILIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAURICIO FLORES  CECILIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVARES SEQUEDA PORFIDIA', '12489515', '72310073', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALVARES SEQUEDA PORFIDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALVARES SEQUEDA PORFIDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VALERO MAURICIO INES', '7397694', '72493008', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE MUJERES ARTESANAS URUS VILAÑEQUE DEL LAGO POOPO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE MUJERES ARTESANAS URUS VILAÑEQUE DEL LAGO POOPO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. EN VILAÑEQUE - PROV. AVAROA - OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. EN VILAÑEQUE - PROV. AVAROA - OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZUNA AGUILAR DIONICIA', '7273045', '74159037', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZUNA AGUILAR DIONICIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZUNA AGUILAR DIONICIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAURICIO CHOQUE  PAULINA', '7397853', '73883367', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE MUJERES ARTESANAS URUS VILAÑEQUE DEL LAGO POOPO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE MUJERES ARTESANAS URUS VILAÑEQUE DEL LAGO POOPO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CONDE ANABEL', '12805969', '73804870', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE CONDE ANABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE CONDE ANABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESID. EN CAPAJ AMAYA - PROV. AVAROA - ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESID. EN CAPAJ AMAYA - PROV. AVAROA - ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VALERO MAURICIO FRANCISCA', '5738715', '74113230', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE ARTESANAS URUS VILAÑEQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE ARTESANAS URUS VILAÑEQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SEQUEDA ALVARO BETTY', '7410089', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE MUJERES ARTESANAS URUS VILAÑEQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE MUJERES ARTESANAS URUS VILAÑEQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. LLAPALLANI PROV. S. PAGADOR OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. LLAPALLANI PROV. S. PAGADOR OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CONDE FLORA', '7397853', '72478391', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE MUJERES ARTESABALES URUS VILAÑEQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE MUJERES ARTESABALES URUS VILAÑEQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VALERO MAMANI LUISA', '7365101', '14128348', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION VILAÑEQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION VILAÑEQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'VILLAÑEQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'VILLAÑEQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVAREZ VALERO MARIO', '7273104', '73835419', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALVAREZ VALERO MARIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALVAREZ VALERO MARIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVAREZ RIVAS HILDA', '7420108', '74116034', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALVAREZ RIVAS HILDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALVAREZ RIVAS HILDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. EN VILAÑEQUE PROV. AVAROA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. EN VILAÑEQUE PROV. AVAROA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RIVAS MIRANDA MARINA', '7361681', '74116034', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE MUJERES ARTESANAS URUS VILAÑEQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE MUJERES ARTESANAS URUS VILAÑEQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. VILAÑEQUE PROV. AVARO - ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. VILAÑEQUE PROV. AVARO - ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VALERO LUCIANO SABASTA', '7303753', '74465057', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VALERO LUCIANO SABASTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VALERO LUCIANO SABASTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. EN VILAÑEQUE - PROV. AVAROA -ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. EN VILAÑEQUE - PROV. AVAROA -ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RIOS VALERO ELEUTERIA', '7301589', '67207114', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE MUJERES URUS VILAÑEQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE MUJERES URUS VILAÑEQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SEQUEDA CHOQUE OCTAVIA', '4070171', '68340171', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SEQUEDA CHOQUE OCTAVIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SEQUEDA CHOQUE OCTAVIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD. MACHACAMARCA PROV. P. DALENCE - OR7188' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD. MACHACAMARCA PROV. P. DALENCE - OR7188')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES IGNACIO ANGELICA', '607127', '71882357', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES IGNACIO ANGELICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES IGNACIO ANGELICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'PAMPA ALAMASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'PAMPA ALAMASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES CALIZAYA FLORIA', '3557719', '64774762', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIAS FLOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIAS FLOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'POMANCHALLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'POMANCHALLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI IQUISE CORNELIA', '5725309', '72356634', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI IQUISE CORNELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI IQUISE CORNELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'VILLA CHALLACOLLO S.N ESPINAL Y SANTA CRUZ - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'VILLA CHALLACOLLO S.N ESPINAL Y SANTA CRUZ - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAMACHO MAMANI NOEMI', '13984049', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAMACHO MAMANI NOEMI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAMACHO MAMANI NOEMI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'C. PSJE. CAPITAN BARRIGA NO. 1 E.  VICUÑA D Y C - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'C. PSJE. CAPITAN BARRIGA NO. 1 E.  VICUÑA D Y C - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES FLORES JANNETH', '3554323', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES FLORES JANNETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES FLORES JANNETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SABAYA' AND zona = '' AND direccion = 'RESD. CHIPAYA - PROV. SABAYA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SABAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SABAYA', '', 'RESD. CHIPAYA - PROV. SABAYA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE MAMANI CELINDA', '7300571', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPE MAMANI CELINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPE MAMANI CELINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'RESD. CHALLACOLLO PROV. CERCADO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'RESD. CHALLACOLLO PROV. CERCADO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CARACILA COTAÑA ADEMAR', '12997779', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CARACILA COTAÑA ADEMAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CARACILA COTAÑA ADEMAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'RESD. CHALLACOLLO - MUN. EL CHORO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'RESD. CHALLACOLLO - MUN. EL CHORO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JUANIQUINA MAMANI JUANA', '3557908', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JUANIQUINA MAMANI JUANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JUANIQUINA MAMANI JUANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'SAN PEDRO DE CHALLACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'SAN PEDRO DE CHALLACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAMACHO MAMANI DEYSI', '16211668', '66110668', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAMACHO MAMANI DEYSI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAMACHO MAMANI DEYSI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'RESD. EN CHALLACOLLO C. CALAMA Y TUNARI - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'RESD. EN CHALLACOLLO C. CALAMA Y TUNARI - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALIZAYA AQUINO FELIZA', '4028715', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALIZAYA AQUINO FELIZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALIZAYA AQUINO FELIZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'VILLA CHALLACOLLO S.N C.ESPINAL Y SANTA CRUZ - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'VILLA CHALLACOLLO S.N C.ESPINAL Y SANTA CRUZ - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI QUISPE JUANA', '5771660', '71852596', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI QUISPE JUANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI QUISPE JUANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ESPINAL ENTRE SANTA CRUZ S.N VILLA CHALLACOLLO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ESPINAL ENTRE SANTA CRUZ S.N VILLA CHALLACOLLO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAMACHO  MAMANI MARYBEL', '13984252', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAMACHO  MAMANI MARYBEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAMACHO  MAMANI MARYBEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'RESD. EN CHALLACOLLO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'RESD. EN CHALLACOLLO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALIZAYA AJHUACHO MARIA', '3860077', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALIZAYA AJHUACHO MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALIZAYA AJHUACHO MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'CHALLACOLLO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'CHALLACOLLO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AJHUACHO VILLCA JHOSELIN', '13574078', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AJHUACHO VILLCA JHOSELIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AJHUACHO VILLCA JHOSELIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB. 9 DE JUNIO MZ 1LT 5. Z. SUD. OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB. 9 DE JUNIO MZ 1LT 5. Z. SUD. OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GOYTIA GUTIERREZ ISRAEL', '14964649', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GOYTIA GUTIERREZ ISRAEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GOYTIA GUTIERREZ ISRAEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'RESD. SAN PDRO DE CHALLACOLLO PROV. CERCADO OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'RESD. SAN PDRO DE CHALLACOLLO PROV. CERCADO OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ  CLEMENCIA', '12933703', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUTIERREZ  CLEMENCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUTIERREZ  CLEMENCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CAMACHO Y VICUÑA NO. 9 - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CAMACHO Y VICUÑA NO. 9 - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARRATIA TAPIA RUTH MARIA', '3524114', '73831513', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARRATIA TAPIA RUTH MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARRATIA TAPIA RUTH MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'RESD. EN CHALLACOLLO C. BOLIVAR - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'RESD. EN CHALLACOLLO C. BOLIVAR - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COTAÑA MAMANI SUSANA', '7333952', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COTAÑA MAMANI SUSANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COTAÑA MAMANI SUSANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'COLEGIO JOSE BALLIVIAN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'COLEGIO JOSE BALLIVIAN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AJHUACHO CHOQUE LUISA', '2791764', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AJHUACHO CHOQUE LUISA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AJHUACHO CHOQUE LUISA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = 'SUD' AND direccion = 'URB. VILLA CHALLACOLLO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', 'SUD', 'URB. VILLA CHALLACOLLO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHALLA LAYME FLORINDA', '2754333', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHALLA LAYME FLORINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHALLA LAYME FLORINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CALLE 12 DE OCTUBRE NO. 500 ESQUINA ACHA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CALLE 12 DE OCTUBRE NO. 500 ESQUINA ACHA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALANI ZUÑIGA CARMEN', '667134', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALANI ZUÑIGA CARMEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALANI ZUÑIGA CARMEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'EL CHORO' AND zona = 'SUD' AND direccion = 'AV DEHENE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', 'SUD', 'AV DEHENE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COSME MAMANI DE SOLIZ NICOLASA', '3517558', '73819443', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COSME MAMANI DE SOLIZ NICOLASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COSME MAMANI DE SOLIZ NICOLASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'RESD. SAN PEDRO DE CHALLACOLO MUN. EL CHORO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'RESD. SAN PEDRO DE CHALLACOLO MUN. EL CHORO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALIZAYA CALANI RUTH GIOVANA', '4022954', '724349003', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALIZAYA CALANI RUTH GIOVANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALIZAYA CALANI RUTH GIOVANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'EL CHORO' AND zona = '' AND direccion = 'CHALLACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'EL CHORO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('EL CHORO', '', 'CHALLACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAMBI HUAYTA ROSS MARY', '3506108', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAMBI HUAYTA ROSS MARY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAMBI HUAYTA ROSS MARY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'PETOT NO. 1150 COCHABAMBA Y LINARES OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'PETOT NO. 1150 COCHABAMBA Y LINARES OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARROYO ORELLANA RODRIGO', '7287049', '68308549', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARROYO ORELLANA RODRIGO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARROYO ORELLANA RODRIGO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CNTRAL' AND direccion = 'ADOLFO MIER Y PAGADOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CNTRAL', 'ADOLFO MIER Y PAGADOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS RAMIREZ MARCO ANTONIO', '3521690', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMOS RAMIREZ MARCO ANTONIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMOS RAMIREZ MARCO ANTONIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'PAGADOR Y BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'PAGADOR Y BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AYALA PACHECO FELICIDAD VICTORIA', '4050249', '70421857', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS FELICIDAD' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS FELICIDAD', NULLIF('4050249012',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'PAGADOR ENTRE BOLIVAR Y SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'PAGADOR ENTRE BOLIVAR Y SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AYALA PACHECO VERONICA', '4056976', '72453921', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZONA BLU' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZONA BLU', NULLIF('4056976',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SORACACHI' AND zona = '' AND direccion = 'HUAYÑA PASTO GRANDE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SORACACHI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SORACACHI', '', 'HUAYÑA PASTO GRANDE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FERNANDEZ MAMANI BRAULIA', '7327653', '73811975', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EL PARAISO DEL ARTE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EL PARAISO DEL ARTE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUDESTE' AND direccion = 'LOC. COQUECHACA PT.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUDESTE', 'LOC. COQUECHACA PT.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUCAS  MAMANI  TEODOCIA', '12846945', '72312375', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LUCAS  MAMANI  TEODOCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LUCAS  MAMANI  TEODOCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AV. VILLAZON ESQ. ARMANDO ROSAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AV. VILLAZON ESQ. ARMANDO ROSAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CADIMA VALDA MARINA KARINA', '2732385', '73801151', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTES K' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTES K', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CALLE 6 DE OCTUBRE N2299 ESQ SANTA BARBARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CALLE 6 DE OCTUBRE N2299 ESQ SANTA BARBARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JALDIN GARCIA MARIA ELENA', '2721003', '71882587', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIAS BELEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIAS BELEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'LIRA ESQUINA WASHINTON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'LIRA ESQUINA WASHINTON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUNA RAMOS GABRIELA', '3529094', '76130446', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GABRIELLA ALTA COSTURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GABRIELLA ALTA COSTURA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CALLE WASHINTON N224 Y CHARCAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CALLE WASHINTON N224 Y CHARCAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ GARCIA ELIZABETH ROXANA', '3541319', '72317689', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIAS PANIAGUA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIAS PANIAGUA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'OESTE' AND direccion = 'AVENIDA 1 DE MAYO N116 ZONA CORAZON DE JESUS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'OESTE', 'AVENIDA 1 DE MAYO N116 ZONA CORAZON DE JESUS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARCA CHOQUE NIELS WILHELM', '5062882', '72314063', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARCELO CALLAPA NICOLAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARCELO CALLAPA NICOLAS', NULLIF('5755831016',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'URB. BARRIOS ITOS MZ7 LT5' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'URB. BARRIOS ITOS MZ7 LT5')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SABIDO VALLE LUISA', '3713532', '63659624', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SABIDO VALLE LUISA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SABIDO VALLE LUISA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'JUNIN Y POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'JUNIN Y POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PARDO LEDEZMA ROSA MARIA', '7304452', '68366770', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ESTILO ROSS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ESTILO ROSS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'TURCO' AND zona = 'NORTE' AND direccion = 'FINAL MARTIN QUISPE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TURCO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TURCO', 'NORTE', 'FINAL MARTIN QUISPE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CABITA AGUSTINA', '3089117', '72497751', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIS LLAMAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIS LLAMAS', NULLIF('3089117012',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE POTOSI N4862 VILLARROEL Y OBLITAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE POTOSI N4862 VILLARROEL Y OBLITAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GAMBOA RODRIGUEZ REYNALDO', '3074007', '79408892', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'WALYSUMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('WALYSUMA', NULLIF('3056780',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV MARTIN QUISPE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV MARTIN QUISPE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CONDE PORFIRIO', '3119866', '63659218', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PICALTU' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PICALTU', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'FINAL TTE. LEON NO. 100 -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'FINAL TTE. LEON NO. 100 -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MALLCU FRANZ OSMAR', '7332161', '69151036', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CITRIC' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CITRIC', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUR' AND direccion = 'AVENIDA ESPAÑA ENTRE CAPITABANGA NO. 5277' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUR', 'AVENIDA ESPAÑA ENTRE CAPITABANGA NO. 5277')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BENITEZ FLORES SAUL', '4062617', '74003501', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BENITEZ FLORES SAUL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BENITEZ FLORES SAUL', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE LOPEZ ELISEO', '5729112', '71850446', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VIVERO NAYRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VIVERO NAYRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'URBANIZACION KASSO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'URBANIZACION KASSO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CANAVIRI NIETO SANDRA LUPE', '3104646', '72458864', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BISUTERIA VIVIAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BISUTERIA VIVIAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AMERICA NO 2 ENTRE DEHENE Y SALAMANCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AMERICA NO 2 ENTRE DEHENE Y SALAMANCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLAPA RAMOS ABIGAIL JOSELIN', '13857239', '68327744', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ABISSAL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ABISSAL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'C. ALDANA NO. 945 Y WHASHINTON - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'C. ALDANA NO. 945 Y WHASHINTON - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARECA RODRIGUEZ EDGAR RAMIRO', '658576', '63659674', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMIS ARTESANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMIS ARTESANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI COLQUE MONICA AGUSTINA', '7277522', '72478209', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI COLQUE MONICA AGUSTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI COLQUE MONICA AGUSTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORESTE' AND direccion = 'HUAJARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORESTE', 'HUAJARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI  TOMASA', '3536435', '67234403', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI  TOMASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI  TOMASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI LAZARO FRANCI', '7324828', '72320585', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI LAZARO FRANCI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI LAZARO FRANCI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BLANCO PINAYA FELIX', '5725440', '74133682', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BLANCO PINAYA FELIX' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BLANCO PINAYA FELIX', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ANCARI VLADIMIR', '3537821', '73835098', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI ANCARI VLADIMIR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI ANCARI VLADIMIR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = 'NORTE' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'NORTE', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHINO COPA DAVID', '3559876', '71105849', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHINO COPA DAVID' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHINO COPA DAVID', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PAREDES  SANTUSA', '4062034', '74135478', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAREDES  SANTUSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAREDES  SANTUSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CONDORI JHENICA', '14671085', '65047943', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CONDORI JHENICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CONDORI JHENICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALAVI FELIPE ODOLIA', '3089350', '71885997', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALAVI FELIPE ODOLIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALAVI FELIPE ODOLIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO VILLCA REYNALDO', '3508731', '67157351', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAZARO VILLCA REYNALDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAZARO VILLCA REYNALDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHINO BALERIA', '5747917', '71850590', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CHINO BALERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CHINO BALERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FELIPE YELZA', '7298942', '68331380', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FELIPE YELZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FELIPE YELZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU  AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU  AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE ALAVI CARLOS', '5747871', '72300820', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPE ALAVI CARLOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPE ALAVI CARLOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI MAMANI MARIA', '5747872', '68288784', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI MAMANI MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI MAMANI MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO  NATALIA', '4078291', '68369435', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAZARO  NATALIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAZARO  NATALIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE CONDORI MAGDALENA', '7300595', '63651932', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE CONDORI MAGDALENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE CONDORI MAGDALENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA CALLE ARTURO ADRIAN', '3551440', '63648345', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YUCRA CALLE ARTURO ADRIAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YUCRA CALLE ARTURO ADRIAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI  VIRGINIA', '5747918', '67209680', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI  VIRGINIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI  VIRGINIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHINO PAREDES JANETH', '7324833', '67208295', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHINO PAREDES JANETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHINO PAREDES JANETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = 'OESTE' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'OESTE', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPA MAMANI CLAUDIA', '7324841', '71857892', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COPA MAMANI CLAUDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COPA MAMANI CLAUDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARACVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARACVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO MAMANI NORMA', '7263578', '67212948', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAZARO MAMANI NORMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAZARO MAMANI NORMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI LOPEZ LIZETH', '7419187', '72306547', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI LOPEZ LIZETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI LOPEZ LIZETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'ESTE' AND direccion = 'CERCA DEL COMEDOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'ESTE', 'CERCA DEL COMEDOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BLANCO ROSAS VICTORIA', '7272114', '74140790', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BLANCO ROSAS VICTORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BLANCO ROSAS VICTORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVAREZ COAQUIRA DANIEL', '5756135', '67392213', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALVAREZ COAQUIRA DANIEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALVAREZ COAQUIRA DANIEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE ANAYA MARLENE', '5725393', '71104522', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE ANAYA MARLENE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE ANAYA MARLENE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'PUENTE TOPATER' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'PUENTE TOPATER')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE ALAVI GABRIEL', '5747870', '74143740', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPE ALAVI GABRIEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPE ALAVI GABRIEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PIZARRO CONDORI JUAN ADOLFO', '5765329', '72333450', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PIZARRO CONDORI JUAN ADOLFO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PIZARRO CONDORI JUAN ADOLFO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CEA URU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CEA URU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE LAZARO ANASTACIA', '3516020', '72486945', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE LAZARO ANASTACIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE LAZARO ANASTACIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'UNIDAD EDUCATIVA PUENTE TOPATER' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'UNIDAD EDUCATIVA PUENTE TOPATER')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPA CONDORI SALOME', '7457007', '68286195', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COPA CONDORI SALOME' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COPA CONDORI SALOME', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ZONA LOS ANGELES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ZONA LOS ANGELES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHOQUE LUCINDA', '5744465', '72480811', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CHOQUE LUCINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CHOQUE LUCINDA', NULLIF('5744465',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTIAGO DE HUARI' AND zona = '' AND direccion = 'RESID. EN HUARI - PROV. S. PAGADOR - ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTIAGO DE HUARI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTIAGO DE HUARI', '', 'RESID. EN HUARI - PROV. S. PAGADOR - ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PANOZO  BERNA', '4023911', '73875562', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PANOZO  BERNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PANOZO  BERNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'BARRIO KANTUTA ENTRE C Y D Y TACNA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'BARRIO KANTUTA ENTRE C Y D Y TACNA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENA CONDORI ROSSEMARY', '4058127', '72300136', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS ROSSY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS ROSSY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB PAMPITA III ENTRE COLLASUYO Y SIMON BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB PAMPITA III ENTRE COLLASUYO Y SIMON BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANCHEZ CHALLAPA KATHERINE HELEN', '7365741', '63645159', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS BONITOS CATTALEYA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS BONITOS CATTALEYA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV EVARISTO VALLE N  200 Y SANTOS VARGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV EVARISTO VALLE N  200 Y SANTOS VARGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI LIMA ZAIDA SARAH', '5748868', '72304892', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS S Y M DISEOS A TU ESTILO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS S Y M DISEOS A TU ESTILO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'AV DEL EJERCITO N 1290' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'AV DEL EJERCITO N 1290')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES EUGENIO ELIZABETH', '4065869', '72344317', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SINGULAR COMO TU' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SINGULAR COMO TU', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CARNTONBOL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CARNTONBOL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE HURTADO ROXANA', '5729602', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FASHION ELEGANT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FASHION ELEGANT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTES' AND direccion = 'URB VILLA DORINA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTES', 'URB VILLA DORINA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VARGAS MAMANI NICOL SALOME', '7415671', '63662011', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'UN DULCE SABOR V Y M' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('UN DULCE SABOR V Y M', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORESTE' AND direccion = 'URB VILLA DORINA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORESTE', 'URB VILLA DORINA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOMAS TOTOCALA ROXANA', '3505246', '72486262', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PASTELERIA DULCE SABOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PASTELERIA DULCE SABOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB FRANCISCA LAFUENTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB FRANCISCA LAFUENTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES ARO MARIA TERESA', '12458524', '72582804', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERY DELICIUS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERY DELICIUS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'FINAL BOQUERON N8' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'FINAL BOQUERON N8')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CASTILLO RIOS NICOLE DANIELA', '7311228', '60406098', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROLLOS DE CANELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROLLOS DE CANELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'RESD EN SALLALLI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'RESD EN SALLALLI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA MAMANI RITA FLORA', '7028210', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB COCHIRAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB COCHIRAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI FERNANDEZ TANIA', '13933300', '67236333', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA SALUDABLE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA SALUDABLE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB SANTA ELENA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB SANTA ELENA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUIZARA CENA MARCIA', '6824537', '72305969', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS MARY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS MARY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB NUEVA ESPERANZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB NUEVA ESPERANZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LLANQUE VILLEGAS DANIELA', '7397480', '72476878', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISEÑOS Y CREACIONES A LA MODA DANY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISEÑOS Y CREACIONES A LA MODA DANY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'URB BOLIVAR EXMETABOL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'URB BOLIVAR EXMETABOL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE PEÑAFIEL MARICRUZ', '7270805', '74103223', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISEÑO Y MODA MARI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISEÑO Y MODA MARI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV HEROES DEL CHACO QUINTANILLA Y DALENCE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV HEROES DEL CHACO QUINTANILLA Y DALENCE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARTE CALIZAYA BASILIA', '3539601', '63653836', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB NUEVA ESPERANZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB NUEVA ESPERANZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOLA POMA LIDIA NOEMI', '7322081', '68299638', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TOLA POMA LIDIA NOEMI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TOLA POMA LIDIA NOEMI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB LOS PINOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB LOS PINOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALAVE PEREZ REMEDIOS', '8265361', '67231622', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALAVE PEREZ REMEDIOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALAVE PEREZ REMEDIOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ALTO ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ALTO ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE MAMANI VANIA LIZETH', '7298664', '72341888', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MODA Y ESTILO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MODA Y ESTILO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'AV TACNA N14 ENTRE C Y D' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'AV TACNA N14 ENTRE C Y D')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CORIA LOVERA MERY', '7366514', '72488485', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CORIA TEJIDO A MAQUINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CORIA TEJIDO A MAQUINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CALLE 500 N8 ENTRE PDTE MONTES ALTO ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CALLE 500 N8 ENTRE PDTE MONTES ALTO ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHOQUE IGNACIA', '3556375', '71883061', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'MELVIN JONES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'MELVIN JONES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MONTECINOS VIDAL HELEN MARGARITA', '12740596', '74151088', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PASTELERIA Y VARIEDADES DE QUEQUES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PASTELERIA Y VARIEDADES DE QUEQUES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB AURORA PLAN JUSTO JUEZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB AURORA PLAN JUSTO JUEZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VEGA SORUCO INGRID NIDIA', '7176420', '61861542', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DULCE FONDANT TENTACION' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DULCE FONDANT TENTACION', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB SEBASTIAN PAGADOR FACE I' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB SEBASTIAN PAGADOR FACE I')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE TINTA SENAYDA', '8017994', '67212337', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES LA PACEÑITA DOÑA SENAYDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES LA PACEÑITA DOÑA SENAYDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB VILLA DORINA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB VILLA DORINA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LIMA QUISPE GARY SERGIO', '14460470', '69596501', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RESTAURANT KARIOKA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RESTAURANT KARIOKA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'PSJE PEÑARANDA Y AV HEROES DEL CHACO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'PSJE PEÑARANDA Y AV HEROES DEL CHACO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE FLORES VANIA ROSA', '4039876', '61837131', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PASTELERIA BUEN GUSTO SALUDABLE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PASTELERIA BUEN GUSTO SALUDABLE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB LA PAMPITA 3' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB LA PAMPITA 3')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POCA FLORES VIRGINIA', '3530839', '72306566', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MI BEBE CARIÑOSITO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MI BEBE CARIÑOSITO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'KENNEDY, VILLAZON Y MARIA DE LA GOLLA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'KENNEDY, VILLAZON Y MARIA DE LA GOLLA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUENAIRA ALARCON WARA ALEXANDRA', '7365347', '724488556', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS A MAQUINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS A MAQUINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'RAMIREZ N 30 HEROES DEL CHACO Y CESAR ACHAVAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'RAMIREZ N 30 HEROES DEL CHACO Y CESAR ACHAVAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI PACA VERONICA BETHY', '5721997', '72492392', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PASTELERIA DIMALU' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PASTELERIA DIMALU', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB CAJA NACIONAL DE SALUD' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB CAJA NACIONAL DE SALUD')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POCA FERNANDEZ PATRICIA', '7081649', '70108703', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PASTELITOS SWEET' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PASTELITOS SWEET', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE RAMIREZ SOLDADO BOLIVIANO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE RAMIREZ SOLDADO BOLIVIANO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUETICLLA PANIAGUA PAOLA FABIOLA', '4042401', '67208309', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DULCE TENTACION' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DULCE TENTACION', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB VILLA DORINA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB VILLA DORINA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE  ALICIA', '14804843', '76136977', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PASTELITOS BELEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PASTELITOS BELEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'SORIA GALVARRO N 5261 ESQ TUPIZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'SORIA GALVARRO N 5261 ESQ TUPIZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUILO BALLESTEROS EMMA NANCY', '3069577', '72497379', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONFECCIONES DUQUESA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONFECCIONES DUQUESA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB COLONIA MZ 7 LT 16' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB COLONIA MZ 7 LT 16')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARCA CUENCA RUTH', '7346716', '73050672', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'POLLERERIA MARCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('POLLERERIA MARCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB NUEVA ESPERANZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB NUEVA ESPERANZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MANCILLA FIGUEREDO JOSE LUIS', '7342632', '72491807', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISEÑOS Y CONFECCIONES JOSE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISEÑOS Y CONFECCIONES JOSE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV TOMAS BARRON N 20' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV TOMAS BARRON N 20')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VELASCO MAMANI ROSMERY', '7304461', '72215860', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS ROSSY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS ROSSY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV HEROES DEL CHACO N 10' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV HEROES DEL CHACO N 10')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LLAVE SANTOS GRACIELA', '4038097', '63214525', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MODAS GRACE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MODAS GRACE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'BARRIO 3 DE MAYO NORTE COCHIRAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'BARRIO 3 DE MAYO NORTE COCHIRAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SALVADOR FLORES YOLANDA', '7282600', '72452038', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONFECCIONES YOLIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONFECCIONES YOLIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB SAN JUAN PAMPA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB SAN JUAN PAMPA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CENA RAMOS HERMINIA', '7028227', '68599802', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS ERLINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS ERLINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALATAYUD N 700' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALATAYUD N 700')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUACOTA REQUENA BRIGIDA MATILDE', '4061690', '68325216', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA VALE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA VALE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CALLE 5 ENTRE BENI Y CALLE E N 12' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CALLE 5 ENTRE BENI Y CALLE E N 12')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ MAMANI SARAI DANIELA', '14459678', '74019715', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BOULEVAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BOULEVAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'URB SAN JUAN PAMPA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'URB SAN JUAN PAMPA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES ALAVI JUANA', '11069612', '63954883', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS JUANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS JUANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB FRANCISCA LA FUENTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB FRANCISCA LA FUENTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUALLPA CONDORI MATILDA', '7415800', '64146319', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS MATILDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS MATILDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'ZONA LOS PINOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'ZONA LOS PINOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUNA ALA EDILBA DINA', '5761089', '71715025', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LUNACOL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LUNACOL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALANI JANCO ELSA', '13061297', '94210049', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ELSA CALANI J.' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ELSA CALANI J.', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'PAZÑA IRUPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'PAZÑA IRUPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAUREANO MICAZO SANTOS', '7274199', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'UTB IRUPATA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('UTB IRUPATA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'DISTRITO URMIRI PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'DISTRITO URMIRI PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ  SOLANGE', '4049625', '7413306', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISTRITO URMIRI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISTRITO URMIRI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'URMIRI PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'URMIRI PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLLARANA  SUSANA', '3077299', '72486253', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLLARANA  SUSANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLLARANA  SUSANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'RESD PAZÑA EN CANASLUPE PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'RESD PAZÑA EN CANASLUPE PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GONZALES  FELIX ARMINDA', '5739238', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GONZALES  FELIX ARMINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GONZALES  FELIX ARMINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = 'UTB THALOKO' AND direccion = 'URMIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'UTB THALOKO', 'URMIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FERNANDEZ  PEÑAFIEL BASILIA BRAULIA', '4062370', '73848239', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISTRITO URMIRI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISTRITO URMIRI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'CANASLUPE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'CANASLUPE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALANI  CLETO FREDDY', '4044855', '74155611', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAMPERITO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAMPERITO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'IRUPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'IRUPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAUREANO SAUCA DEYSI ELIZABETH', '14057763', '68325193', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'UTB IRUPATA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('UTB IRUPATA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = 'URMIRI' AND direccion = 'URMIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'URMIRI', 'URMIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI GOMEZ ELVIRA', '4031518', '62765610', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISTRITO URMIRI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISTRITO URMIRI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = 'CENTRAL' AND direccion = 'DISTRITO URMIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'CENTRAL', 'DISTRITO URMIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HEREDIA COPA DE MARTINEZ FILOMENA LILY', '3535464', '63645888', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HEREDIA COPA DE MARTINEZ FILOMENA LILY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HEREDIA COPA DE MARTINEZ FILOMENA LILY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = 'SUD' AND direccion = 'URMIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'SUD', 'URMIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MONDOCORRE MAMANI GENOVEVA JIMENA', '73811741', '73811741', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISTRITO URMIRI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISTRITO URMIRI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'RESD PAZÑA PROVINCIA POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'RESD PAZÑA PROVINCIA POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MONDOCORRE  MAMANI GERTRUDIS MARIBEL', '7313673', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MONDOCORRE  MAMANI GERTRUDIS MARIBEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MONDOCORRE  MAMANI GERTRUDIS MARIBEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = 'PALCA DOS' AND direccion = 'URMIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'PALCA DOS', 'URMIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ  MIRANDA DE HURTADO GUMERCINDA', '652116', '74105197', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISTRITO URMIRI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISTRITO URMIRI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VASQUEZ  IGNACIO JOSE LUIS', '5552536', '74147825', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VASQUEZ  IGNACIO JOSE LUIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VASQUEZ  IGNACIO JOSE LUIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = 'THALOKO' AND direccion = 'THALOKO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'THALOKO', 'THALOKO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FERNANDEZ JOSUE ABEL', '7317546', '60415534', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FERNANDEZ JOSUE ABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FERNANDEZ JOSUE ABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'URMIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'URMIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI  YUCRA DE GUTIERREZ LENY JHOBANA', '7325358', '72904857', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI  YUCRA DE GUTIERREZ LENY JHOBANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI  YUCRA DE GUTIERREZ LENY JHOBANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = 'CENTRO' AND direccion = 'RESD PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'CENTRO', 'RESD PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR  MARIA', '7272221', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR  MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR  MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'URMIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'URMIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEÑAFIEL MAMANI MERY DEYSI', '3077391', '72481634', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEÑAFIEL MAMANI MERY DEYSI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEÑAFIEL MAMANI MERY DEYSI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'PAZÑA URMIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'PAZÑA URMIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR  VICTORIA', '7306899', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR  VICTORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR  VICTORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAIME  MIGUEL ANGEL', '7313515', '63667711', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIGUEL A. LAIME FL.' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIGUEL A. LAIME FL.', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = 'HUARI' AND direccion = 'DISTRITO HURMIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'HUARI', 'DISTRITO HURMIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAPARRO  NORAH', '4046966', '7414893', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISTRITO URMIRI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISTRITO URMIRI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = 'PAZÑA' AND direccion = 'RESID PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'PAZÑA', 'RESID PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAPARRO ARROYO PAZZIS', '7332587', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAPARRO ARROYO PAZZIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAPARRO ARROYO PAZZIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'URMIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'URMIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUIZARA ACARAPI RODRIGO', '7316179', '7413395', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CUIZARA ACARAPI RODRIGO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CUIZARA ACARAPI RODRIGO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = '' AND direccion = 'PAZÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', '', 'PAZÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HEREDIA COPA ROLANDO', '3049040', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HEREDIA COPA ROLANDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HEREDIA COPA ROLANDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'HUAYRAPATA' AND direccion = 'ANTEQUERA ZONA HUAYRAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'HUAYRAPATA', 'ANTEQUERA ZONA HUAYRAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CRUZ GLADYS', '5741883', '73860578', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PENSIÓN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PENSIÓN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROJAS NINA GREGORIO ALFREDO', '7302731', '72342658', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROJAS NINA GREGORIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROJAS NINA GREGORIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PINAYA  CARTAGENA ASAREL FERNANDA', '7266886', '73403454', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PINAYA  CARTAGENA ASAREL FERNANDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PINAYA  CARTAGENA ASAREL FERNANDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHILA  MOREJON BRIGIDA NELCY', '7422399', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHILA  MOREJON BRIGIDA NELCY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHILA  MOREJON BRIGIDA NELCY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI LOPEZ CENIA LITZI', '5068694', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CENIA LITZI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CENIA LITZI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'MIL GRADAS' AND direccion = 'RESSID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'MIL GRADAS', 'RESSID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FERNANDEZ BEJARANO DE ROCHA ELIANA', '4079841', '67232685', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FERNANDEZ ELIANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FERNANDEZ ELIANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LLANQUE MAMANI LUCIA', '7302732', '68254887', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LLANQUE MAMANI LUCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LLANQUE MAMANI LUCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ RIVERO JIMENA', '7403027', '74119815', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TIENDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TIENDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RUIZ DE RAMOS MARGARITA', '4022145', '72494832', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONFITERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONFITERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MITA MARCA MARIELA TATIANA', '6142475', '72453581', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MITA MARCA MARIELA TATIANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MITA MARCA MARIELA TATIANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CABRERA CHOQUECALLATA MINELVA', '7413733', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CABRERA CHOQUECALLATA MINELVA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CABRERA CHOQUECALLATA MINELVA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ DE LUNA MIREA N', '5748559', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ DE LUNA MIREA N' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ DE LUNA MIREA N', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAMA CHOQUECALLATA MIRIAM', '4074380', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAMA CHOQUECALLATA MIRIAM' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAMA CHOQUECALLATA MIRIAM', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'NORTE' AND direccion = 'BARRIO ENTRE RIOS -1' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'NORTE', 'BARRIO ENTRE RIOS -1')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES LOPEZ DE QUISPE RILDA', '14851955', '68353685', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES LOPEZ RILDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES LOPEZ RILDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'NORTE' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'NORTE', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MAMANI RITA', '4049666', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI MAMANI RITA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI MAMANI RITA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAURA  CONDORI ROSY', '12789308', '73801903', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAURA  CONDORI ROSY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAURA  CONDORI ROSY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUECALLATA FLORES SALOME', '8070795', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUECALLATA FLORES SALOME' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUECALLATA FLORES SALOME', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ GABRIEL SANTUSA', '13826590', '67228805', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ GABRIEL SANTUSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ GABRIEL SANTUSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESD ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESD ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLLARANA MARTINEZ SIMONA', '3027122', '73846766', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLLARANA MARTINEZ SIMONA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLLARANA MARTINEZ SIMONA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE BLANCO TANIA NAYRA', '14463421', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE BLANCO TANIA NAYRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE BLANCO TANIA NAYRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI SANCA DE QUISPE TEODORA', '6633622', '68352959', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI SANCA DE QUISPE TEODORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI SANCA DE QUISPE TEODORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE  VICTORIA ROXANA', '5074496', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE  VICTORIA ROXANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE  VICTORIA ROXANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'SUD' AND direccion = 'ENTRE RIOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'SUD', 'ENTRE RIOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PRADA  MARIA MAGDALENA', '7335859', '73837532', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PRADA  MARIA MAGDALENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PRADA  MARIA MAGDALENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'PISAGUA SAN FELIPE Y ARCE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'PISAGUA SAN FELIPE Y ARCE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE  HILARIA', '4072642', '63637737', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE  HILARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE  HILARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'FINAL CALLE COMERCIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'FINAL CALLE COMERCIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VINAYA GUTIERREZ JEIMMY SCARLET', '4056643', '68288677', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VINAYA GUTIERREZ JEIMMY SCARLET' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VINAYA GUTIERREZ JEIMMY SCARLET', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'CALLE COCHABAMBA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'CALLE COCHABAMBA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUIZA SANCHEZ SILVIA', '7864900', '72308804', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUIZA SANCHEZ SILVIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUIZA SANCHEZ SILVIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ENTRE RIOS - LAS LOMAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ENTRE RIOS - LAS LOMAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLLARANA SANCHEZ BEYDA ROCIO', '13906593', '67249696', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLLARANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLLARANA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ENTRE RIOS - LAS LOMAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ENTRE RIOS - LAS LOMAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANCHEZ  GRISELDA', '450590', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SANCHEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SANCHEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'HUAYRAPATA' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'HUAYRAPATA', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ARIAS ELEUTERIA', '2782659', '72461033', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI ARIAS ELEUTERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI ARIAS ELEUTERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ RAMOS AMBROCIA', '2772154', '72327996', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORREZ RAMOS AMBROCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORREZ RAMOS AMBROCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALEJANDRO JANCO LEONOR', '3523691', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALEJANDRO JANCO LEONOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALEJANDRO JANCO LEONOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GONZALES NICOLAS DE MAGNE IBETH', '4063939', '76155877', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GONZALES NICOLAS DE MAGNE IBETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GONZALES NICOLAS DE MAGNE IBETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESID ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESID ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLLO MARCA JHOANA DEINA', '12519537', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOLLO MARCA JHOANA DEINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOLLO MARCA JHOANA DEINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'ANTEQUERA' AND direccion = 'PASAJE CESAR VILLCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'ANTEQUERA', 'PASAJE CESAR VILLCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ DEALEGRIA GREGORIA', '8560914', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ DEALEGRIA GREGORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ DEALEGRIA GREGORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'CALLE CAMACHO' AND direccion = 'RESD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CALLE CAMACHO', 'RESD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JAUREGUI RODRIGUEZ NOEMY', '12773920', '70430019', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JAUREGUI RODRIGUEZ NOEMY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JAUREGUI RODRIGUEZ NOEMY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'CASA LOPEZ' AND direccion = 'RESD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CASA LOPEZ', 'RESD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA   NEYSI PAMELA', '5749838', '67202562', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUANCA   NEYSI PAMELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUANCA   NEYSI PAMELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA COPACABANA' AND direccion = 'RADIO HORIZONTES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA COPACABANA', 'RADIO HORIZONTES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('OCAÑA PATY DE IGNACIO MATILDE', '5744815', '74773852', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'OCAÑA PATY DE IGNACIO MATILDE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('OCAÑA PATY DE IGNACIO MATILDE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'LAKETA' AND direccion = 'RESD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'LAKETA', 'RESD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANCASI TOMAS MARTHA', '7269836', '6514405', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANCASI TOMAS MARTHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANCASI TOMAS MARTHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'SAN PEDRO' AND direccion = 'RADIO HORIZONTES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAN PEDRO', 'RADIO HORIZONTES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI QUISPE MARIEL FIDELIA', '5093390', '74143238', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI QUISPE MARIEL FIDELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI QUISPE MARIEL FIDELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'SAN PEDRO' AND direccion = 'C A E P' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAN PEDRO', 'C A E P')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA  ROSA', '4058544', '61660662', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA  ROSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA  ROSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'CALLE HORIZONTES CAEP' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'CALLE HORIZONTES CAEP')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MIRANDA MONTOYA RICHARD', '9971242', '671943934', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIRANDA MONTOYA RICHARD' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIRANDA MONTOYA RICHARD', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'JALAKARY' AND direccion = 'MERCADO BARTOLINA SISA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'JALAKARY', 'MERCADO BARTOLINA SISA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LLANOS MAMANI RAQUEL ANDREA', '7321197', '75411402', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LLANOS MAMANI RAQUEL ANDREA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LLANOS MAMANI RAQUEL ANDREA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'LUKETA' AND direccion = 'ZONA LUKETA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'LUKETA', 'ZONA LUKETA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANCASI TOMAS DE ROJAS PAULA', '3536147', '68289558', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANCASI TOMAS DE ROJAS PAULA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANCASI TOMAS DE ROJAS PAULA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'JALAKERY' AND direccion = 'FEDERACION DE MUJERES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'JALAKERY', 'FEDERACION DE MUJERES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BARRIONUEVO MONTAÑODE LACA NIRKA NISNOSCA', '4070206', '73812415', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COMERCIANTE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COMERCIANTE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'VISCACHANI' AND direccion = 'PLAZA FERMIN LOPEZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VISCACHANI', 'PLAZA FERMIN LOPEZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('IGNACIO OCAÑA MARIA ELENA', '7303798', '68311378', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IGNACIO OCAÑA MARIA ELENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IGNACIO OCAÑA MARIA ELENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'CASA LOPEZ' AND direccion = 'CASA LOPEZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CASA LOPEZ', 'CASA LOPEZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI DE VILLANUEVA LOURDES', '6163943', '73847429', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI DE VILLANUEVA LOURDES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI DE VILLANUEVA LOURDES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'PLAZA PRINCIPAL CAEP' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'PLAZA PRINCIPAL CAEP')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANDRADE DE ANCALLE MIRIAM', '3506696', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANDRADE DE ANCALLE MIRIAM' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANDRADE DE ANCALLE MIRIAM', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'LUKETA' AND direccion = 'RESD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'LUKETA', 'RESD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR GONZALES KARINA YSABEL', '3553985', '62656113', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR GONZALES KARINA YSABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR GONZALES KARINA YSABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'SAN PEDRO' AND direccion = 'PLAZA FERMIN LOPEZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAN PEDRO', 'PLAZA FERMIN LOPEZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GONZALES MAMANI JUSTINA', '8561185', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GONZALES MAMANI JUSTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GONZALES MAMANI JUSTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'BARRIO NUEVO N 208' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'BARRIO NUEVO N 208')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRESPO  JUDITH MARISOL', '5773796', '67230392', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRESPO  JUDITH MARISOL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRESPO  JUDITH MARISOL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'LIZARRAGA' AND direccion = 'FINAL LIZARRAGA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'LIZARRAGA', 'FINAL LIZARRAGA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE MIRANDA JERSON DOUGLAS', '14146682', '74146504', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE MIRANDA JERSON DOUGLAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE MIRANDA JERSON DOUGLAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'CASA LOPEZ' AND direccion = 'RESD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CASA LOPEZ', 'RESD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA CHOQUE IRMA', '7414238', '72474031', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUANCA CHOQUE IRMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUANCA CHOQUE IRMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'CASA LOPEZ' AND direccion = 'AVENIDA LIZARRAGA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CASA LOPEZ', 'AVENIDA LIZARRAGA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE MENDOZA IRENE', '5234762', '76962065', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE MENDOZA IRENE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE MENDOZA IRENE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'RESD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'RESD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ JORGE ESTEFANIA', '5504283', '72829851', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ JORGE ESTEFANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ JORGE ESTEFANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'SAN PEDRO' AND direccion = 'RESD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAN PEDRO', 'RESD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI VILLCA ELY SANDRA', '5773587', '71857585', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI VILLCA ELY SANDRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI VILLCA ELY SANDRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'SAN PEDRO' AND direccion = 'AVENIDA LIZARRAGA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAN PEDRO', 'AVENIDA LIZARRAGA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GIL COLQUE DIMELSA SORAIDA', '5726292', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GIL COLQUE DIMELSA SORAIDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GIL COLQUE DIMELSA SORAIDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'RESD, HUANUNI CALLE M. BARZOLA Y 27 DE JULIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'RESD, HUANUNI CALLE M. BARZOLA Y 27 DE JULIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA  CRISTINA', '5724098', '60427845', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA  CRISTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA  CRISTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'LOKETA' AND direccion = 'CAMPAMENTO LOQUETA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'LOKETA', 'CAMPAMENTO LOQUETA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANCASI TOMAS CELIA', '7269349', '64070451', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANCASI TOMAS CELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANCASI TOMAS CELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA VICTORIA' AND direccion = 'FINAL SANTA MARIA MERCADO GERMAN BUSCH' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA VICTORIA', 'FINAL SANTA MARIA MERCADO GERMAN BUSCH')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BRAÑEZ ROJAS AGUSTINA', '3538459', '72344510', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BRAÑEZ ROJAS AGUSTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BRAÑEZ ROJAS AGUSTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA SANTIAGUITO' AND direccion = 'HUANUNI VILLA SANTIAGUITO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA SANTIAGUITO', 'HUANUNI VILLA SANTIAGUITO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOLIZ A ALEJANDRINA', '5730831', '67254935', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOLIZ ALEJANDRINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOLIZ ALEJANDRINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'LOKETA' AND direccion = 'RESID HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'LOKETA', 'RESID HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE CORIA DE COLQUE BEDONIA', '7334576', '68301983', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE CORIA BEDONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE CORIA BEDONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA COPACABANA' AND direccion = 'RESD HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA COPACABANA', 'RESD HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUZMAN MARTINEZ SILVIA EUGENIA', '7267823', '77961800', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUZMAN MARTINEZ SILVIA EUGENIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUZMAN MARTINEZ SILVIA EUGENIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESD. ANTEQUERA PROV. POOPO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESD. ANTEQUERA PROV. POOPO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOBO CONDORI IRINEO JAVIER', '7316143', '67236859', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOBO CONDORI IRINEO JAVIER' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOBO CONDORI IRINEO JAVIER', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESD. EN ANTEQUERA PROV. POOPO - ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESD. EN ANTEQUERA PROV. POOPO - ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAURA JANCO NAZARET', '7399997', '63665944', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAURA JANCO NAZARET' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAURA JANCO NAZARET', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESD. ANTEQUERA PROVINCIA POOPO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESD. ANTEQUERA PROVINCIA POOPO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JANCO  ANA MARIA', '3072358', '73834046', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JANCO  ANA MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JANCO  ANA MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESD. EN CHALLUMAYU -PROV. POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESD. EN CHALLUMAYU -PROV. POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APAZA ORTIZ MIRIAM', '13029819', '69357956', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'APAZA ORTIZ MIRIAM' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('APAZA ORTIZ MIRIAM', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUZMAN ESPINDOLA GROVER', '7381650', '67242721', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'OFREDDY 9 DE ABRIL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'OFREDDY 9 DE ABRIL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALIZAYA CHACA ABIGAIL GIOVANNA', '14669428', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALIZAYA CHACA ABIGAIL GIOVANNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALIZAYA CHACA ABIGAIL GIOVANNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DE LA CRUZ VALENCIA ALAN ARTURO', '7327371', '76145699', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DE LA CRUZ VALENCIA ALAN ARTURO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DE LA CRUZ VALENCIA ALAN ARTURO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESD CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESD CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR FELICIANO BEATRIZ', '4050144', '73316508', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR FELICIANO BEATRIZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR FELICIANO BEATRIZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'SUD' AND direccion = 'RESD CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'SUD', 'RESD CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI  CANCIO IRINEO', '679856', '67215854', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALFA ALFA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALFA ALFA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'COMUNIDAD PIQUISIRCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'COMUNIDAD PIQUISIRCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUIZARA MARZE CACILDA', '2744690', '73807063', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CUIZARA MARZE CACILDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CUIZARA MARZE CACILDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'REGANTES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'REGANTES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI QUISPIA CLAUDIA DINA', '7408007', '68281679', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI QUISPIA CLAUDIA DINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI QUISPIA CLAUDIA DINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'PIQUISIRCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'PIQUISIRCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARITA ATANACIO DANIA LAURA', '7373724', '63257057', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARITA ATANACIO DANIA LAURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARITA ATANACIO DANIA LAURA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESID CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESID CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHACA GARISTO DANIELA', '7372894', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHACA GARISTO DANIELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHACA GARISTO DANIELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESID CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESID CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAMBI VALERIANO EDITH BETTY', '7308896', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAMBI VALERIANO EDITH BETTY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAMBI VALERIANO EDITH BETTY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'AVAROA CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'AVAROA CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HERRERA MAMANI EDITH NINFA', '5766256', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HERRERA MAMANI EDITH NINFA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HERRERA MAMANI EDITH NINFA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'VILLARROEL ENTRE DORADO Y OFREDDY' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'VILLARROEL ENTRE DORADO Y OFREDDY')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SALAZAR QUISPE ELIANA', '5777974', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SALAZAR QUISPE ELIANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SALAZAR QUISPE ELIANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'SUD' AND direccion = 'THOLAPUJRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'SUD', 'THOLAPUJRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPIA COLQUE EVELIN ELIZABETH', '7372288', '73828690', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPIA COLQUE EVELIN ELIZABETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPIA COLQUE EVELIN ELIZABETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESID CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESID CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARISTO ACHÁ FERMINA', '3974421', '72498553', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARISTO ACHÁ FERMINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARISTO ACHÁ FERMINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESID CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESID CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUAYTA ZEBALLOS FRANCISCO', '5731109', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUAYTA ZEBALLOS FRANCISCO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUAYTA ZEBALLOS FRANCISCO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'COMUNIDAD VILLA BLANCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'COMUNIDAD VILLA BLANCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI MAMANI HILDA', '5090674', '73331560', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI MAMANI HILDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI MAMANI HILDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESID CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESID CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUILLO PILLCO HUGO', '3044293', '61823382', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUILLO PILLCO HUGO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUILLO PILLCO HUGO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESID CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESID CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARCANI TORRICO INGRID', '7338406', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARCANI TORRICO INGRID' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARCANI TORRICO INGRID', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA CHOQUE DE SOTO JUANA FELICIDAD', '4912657', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NINA CHOQUE DE SOTO JUANA FELICIDAD' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NINA CHOQUE DE SOTO JUANA FELICIDAD', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'SUD' AND direccion = 'COMUNIDAD ANTACAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'SUD', 'COMUNIDAD ANTACAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE ARIAS DE PILLCO JULIA', '2784921', '72493281', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE ARIAS DE PILLCO JULIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE ARIAS DE PILLCO JULIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESID CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESID CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ PATZI KARLA PAOLA', '4062681', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ PATZI KARLA PAOLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ PATZI KARLA PAOLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'COMUNIDAD CATORIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'COMUNIDAD CATORIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHAMBI LIDIA', '5515390', '74127582', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CHAMBI LIDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CHAMBI LIDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'COMUNIDAD PIQUISIRCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'COMUNIDAD PIQUISIRCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHACA HURTADO LUISA', '3112287', '72466490', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHACA HURTADO LUISA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHACA HURTADO LUISA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'REGANTES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'REGANTES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHACA YAPURI MARIA SALOME', '7424065', '74100545', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHACA YAPURI MARIA SALOME' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHACA YAPURI MARIA SALOME', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'RESID CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'RESID CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARCANI SOTO MARTHA MARIBEL', '5069248', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARCANI SOTO MARTHA MARIBEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARCANI SOTO MARTHA MARIBEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'RESID CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'RESID CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALCONCE HUARITA POLICARPIO', '3539708', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALCONCE HUARITA POLICARPIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALCONCE HUARITA POLICARPIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'JANKUAGA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'JANKUAGA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA HURTADO REYNA', '7315278', '72496235', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA HURTADO REYNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA HURTADO REYNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'ESTE' AND direccion = 'AVENIDA LADISLAO CABRERA ENTRE LA PAZ Y CHUQUISACA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'ESTE', 'AVENIDA LADISLAO CABRERA ENTRE LA PAZ Y CHUQUISACA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE MOLLO SILVIA', '4063422', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE MOLLO SILVIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE MOLLO SILVIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHACA JAQUE RUTH', '4064101', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHACA JAQUE RUTH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHACA JAQUE RUTH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE VILLCA SANDRA', '4066967', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE VILLCA SANDRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE VILLCA SANDRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ZONA ENTRE RIOS KARAMAYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ZONA ENTRE RIOS KARAMAYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES SILES VIRGINA TERESA', '7331574', '71103212', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES SILES VIRGINA TERESA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES SILES VIRGINA TERESA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'BARRIOS NUEVOS CASAS AJULES CAMPAMENTO MINERO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'BARRIOS NUEVOS CASAS AJULES CAMPAMENTO MINERO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JANCO MURILLO CELIA', '5068888', '72488914', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JANCO MURILLO CELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JANCO MURILLO CELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'BARRIO NUEVO CAMPAMENTO MINERO CESES AJULES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'BARRIO NUEVO CAMPAMENTO MINERO CESES AJULES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE PORCO VIRGILIO', '3527604', '72492188', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE PORCO VIRGILIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE PORCO VIRGILIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'URB VILLA DORINA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'URB VILLA DORINA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ REBOZO FRANCISCA', '3504011', '72492455', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISEÑOS FANCY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISEÑOS FANCY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB 27 DE JUNIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB 27 DE JUNIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUIZARA LOPEZ MARISOL', '12519824', '64777521', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS MARY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS MARY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB SIERRA MIER' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB SIERRA MIER')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI TARQUI NATIVIDAD', '7345605', '72772417', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACION MATI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACION MATI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'C. SAN FELIPE NO. 54 Y QUINTANA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'C. SAN FELIPE NO. 54 Y QUINTANA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE FLORES MERY', '7423622', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE FLORES MERY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE FLORES MERY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESD. ANTEQUERA - PROV. POOPO OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESD. ANTEQUERA - PROV. POOPO OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAPARRO ARROYO NORAH', '4046966', '74142893', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAPARRO ARROYO NORAH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAPARRO ARROYO NORAH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESD. ANTEQUERA - PROV. POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESD. ANTEQUERA - PROV. POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BAUTISTA  FILOMENA', '6576435', '72481161', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BAUTISTA  FILOMENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BAUTISTA  FILOMENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'BARRIO SAN JOSE N28 URB CASAS BLANCAS -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'BARRIO SAN JOSE N28 URB CASAS BLANCAS -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ORELLANA ALCAZAR CARINA CATI', '5733738', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CARINA CATI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CARINA CATI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'CALLE COCHABAMBA NO.3' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'CALLE COCHABAMBA NO.3')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUIZA VARGAS SILVIA', '7864900', '72308804', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUIZA VARGAS SILVIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUIZA VARGAS SILVIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'SEIS DE AGOSTO' AND direccion = 'RESD. ANTEQUERA PROV. POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'SEIS DE AGOSTO', 'RESD. ANTEQUERA PROV. POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALEGRIA ESCOBAR SIMON', '3106465', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALEGRIA ESCOBAR SIMON' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALEGRIA ESCOBAR SIMON', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'ENTRE RIOS' AND direccion = 'CASA COMUNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'ENTRE RIOS', 'CASA COMUNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAFAEL TORREZ SANIA', '7417825', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAFAEL TORREZ SANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAFAEL TORREZ SANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESD. ANTQUERA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESD. ANTQUERA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAPARRO CHALLA OLIMPIA', '2209834', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAPARRO CHALLA OLIMPIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAPARRO CHALLA OLIMPIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ZONA RIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ZONA RIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE FLORES LAURA', '7454860', '71104794', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE FLORES LAURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE FLORES LAURA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RODRIGUEZ  RICHARD GIOVANI', '7332498', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RODRIGUEZ  RICHARD GIOVANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RODRIGUEZ  RICHARD GIOVANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'CALLE CAMPERO E. OBLITAS S.N. POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'CALLE CAMPERO E. OBLITAS S.N. POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOCOMPIS BUSTOS ISRAEL', '7347521', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOCOMPIS BUSTOS ISRAEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOCOMPIS BUSTOS ISRAEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'C. 1RO DE MAYO NO. 313 Y VICUÑA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'C. 1RO DE MAYO NO. 313 Y VICUÑA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES  FLORA', '3073936', '67251108', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES  FLORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES  FLORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALLACOTA - PROV. L. CABRERA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALLACOTA - PROV. L. CABRERA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LIZITE CHALLAPA JULIA RITA', '3348345', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JULIA RITA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JULIA RITA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALLACOTA - PROV. LADISLAO CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALLACOTA - PROV. LADISLAO CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR LAIME ARMINDA', '7346952', '67251714', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR LAIME ARMINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR LAIME ARMINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALLACOTA -  L. CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALLACOTA -  L. CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANCHEZ  CARMEN', '12740506', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SANCHEZ  CARMEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SANCHEZ  CARMEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALLACOTA - PROV. LADISLAO CABRERA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALLACOTA - PROV. LADISLAO CABRERA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MONTOYA  LORENZA', '12777294', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MONTOYA  LORENZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MONTOYA  LORENZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RODRIGUEZ MONTOYA VICTOR HUGO', '8855775', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VICTOR HUGO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VICTOR HUGO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALLACOTA- L CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALLACOTA- L CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALAN RODRIGUEZ ALEJANDRO ALAN', '8720183', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALEJANDRO ALAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALEJANDRO ALAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. CHALLACOTA PROV. LADISLAO CABRERA OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. CHALLACOTA PROV. LADISLAO CABRERA OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JANCO TITO JORGE', '3542908', '73817395', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JJ. SRL.' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JJ. SRL.', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'VICUÑA C. NO. 20 LA SALLE Y BULLAIN -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'VICUÑA C. NO. 20 LA SALLE Y BULLAIN -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MUÑOZ RODRIGUEZ IVER JULIAN', '5770969', '62833779', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IMER J.' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IMER J.', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'CALLE CAMPERO E. OBLITAS S.N. POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'CALLE CAMPERO E. OBLITAS S.N. POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOCOMPIS BUSTOS ISRAEL', '7347521', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOCOMPIS BUSTOS ISRAEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOCOMPIS BUSTOS ISRAEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOYA COLQUE BIGDONIA', '5755151', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BIGDONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BIGDONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB. V. CHALLACOLLO. ALAMASI .CALLE D-E. MZ 17 -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB. V. CHALLACOLLO. ALAMASI .CALLE D-E. MZ 17 -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES SANCHEZ GERMAN', '7263439', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES SANCHEZ GERMAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES SANCHEZ GERMAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'MARKA TAYPI CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'MARKA TAYPI CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LIZARASU ROJAS MARLENE', '7950792', '67475666', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LIZARASU ROJAS MARLENE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LIZARASU ROJAS MARLENE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'UTD.  CHALLACOTA BELEN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'UTD.  CHALLACOTA BELEN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANCHEZ AGUILAR SANTOS FELIPE', '5828853', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SANCHEZ AGUILAR SANTOS FELIPE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SANCHEZ AGUILAR SANTOS FELIPE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'TAYPI CHALLACOTA' AND direccion = 'RESD. CHALLACOTA PROV. L. CABRERA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'TAYPI CHALLACOTA', 'RESD. CHALLACOTA PROV. L. CABRERA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RODRIGUEZ MONTOYA DEYVI ROXANA', '5906207', '67467774', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RODRIGUEZ MONTOYA DEYVI ROXANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RODRIGUEZ MONTOYA DEYVI ROXANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JANCO AGUILAR LUIS', '5768291', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JANCO AGUILAR LUIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JANCO AGUILAR LUIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALLACOTA - PROV. L. CABRERA- OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALLACOTA - PROV. L. CABRERA- OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR JANCO VICTOR', '648868', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUILAR JANCO VICTOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUILAR JANCO VICTOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MUÑOZ AGUILAR CANCIO', '993305', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MUÑOZ AGUILAR CANCIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MUÑOZ AGUILAR CANCIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALLACOTA -MUN. SALINAS DE GRARCI MENDOZA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALLACOTA -MUN. SALINAS DE GRARCI MENDOZA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHUNGARA CEPEDA JUANA', '3118571', '68336453', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHUNGARA CEPEDA JUANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHUNGARA CEPEDA JUANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'C. VILLAZON NO. 69 Y AUTONOMIA ZONA SUD OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'C. VILLAZON NO. 69 Y AUTONOMIA ZONA SUD OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RODRIGUEZ COPA DARIO', '3081320', '67205714', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RODRIGUEZ COPA DARIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RODRIGUEZ COPA DARIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. CHALLACOTA - L. CABREA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. CHALLACOTA - L. CABREA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAPIA CERRO NATALIA', '3018986', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAPIA CERRO NATALIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAPIA CERRO NATALIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALLACOTA -PROV. LADISLAO CABRERA - ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALLACOTA -PROV. LADISLAO CABRERA - ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES SANCHEZ DE LAIME ELENA CONSTANCIA', '4075400', '72350139', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES SANCHEZ DE LAIME ELENA CONSTANCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES SANCHEZ DE LAIME ELENA CONSTANCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'URB. VILLA CHALLACOLLO MZ. A-12 LOTE 12 OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'URB. VILLA CHALLACOLLO MZ. A-12 LOTE 12 OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BLANCO FLORES FLAVIO', '649305', '73840082', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLAVIO SRL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLAVIO SRL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALLACOTA -L. CABRERA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALLACOTA -L. CABRERA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE CHALLAPA ISIDORA', '2771364', '67518236', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE CHALLAPA ISIDORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE CHALLAPA ISIDORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'Z. SUD LOS OLIVOS NO. 3 E. PEDRO BARRAUN -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'Z. SUD LOS OLIVOS NO. 3 E. PEDRO BARRAUN -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JANCO CALLE SANTOS MARIN', '7398130', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JANCO CALLE SANTOS MARIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JANCO CALLE SANTOS MARIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN BELN DE ANDAMARCA, PROV. SUR CARANGAS - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN BELN DE ANDAMARCA, PROV. SUR CARANGAS - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TITO VILLEGAS EDDY', '5312130', '72342174', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TITO SRL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TITO SRL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD. EN CHALLACOTA OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD. EN CHALLACOTA OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHALLAPA AGUILAR SOFIA', '641331', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHALLAPA AGUILAR SOFIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHALLAPA AGUILAR SOFIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'PASAJE CESAR VILLCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'PASAJE CESAR VILLCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLINA ARCE FELICIDAD SANTUSA', '4068932', '72347418', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOLINA ARCE FELICIDAD SANTUSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOLINA ARCE FELICIDAD SANTUSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'PISAGUA SAN FELIPE Y ARCE NO. 5 - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'PISAGUA SAN FELIPE Y ARCE NO. 5 - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE PABA HILARIA', '4072642', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE PABA HILARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE PABA HILARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'AV. TACNA NO. 1 ESQ. LIRA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'AV. TACNA NO. 1 ESQ. LIRA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARTINEZ FERNANDEZ GONZALO', '7392970', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GONZALO MARTINEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GONZALO MARTINEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOBO AGUILAR PAMELA LOBO', '7369064', '62800171', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOBO AGUILAR PAMELA LOBO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOBO AGUILAR PAMELA LOBO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APAZA ORTIZ JUDITH', '13029818', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'APAZA ORTIZ JUDITH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('APAZA ORTIZ JUDITH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESD. ANTEQUERA PROVINCIA POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESD. ANTEQUERA PROVINCIA POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ GOMEZ DE LUNA MIREA NIRDA', '5748559', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIREA NIRDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIREA NIRDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'RESD. ANTEQUERA PROVINCIA POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'RESD. ANTEQUERA PROVINCIA POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APAZA ORTIZ GLADYS', '7313707', '67235708', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'APAZA ORTIZ GLADYS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('APAZA ORTIZ GLADYS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ENTRE RIOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ENTRE RIOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PUSARICO ZUBICA LIZETH ZEYLA', '8057481', '78615444', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PUSARICO ZUBICA LIZETH ZEYLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PUSARICO ZUBICA LIZETH ZEYLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ESPINOZA TAQUICHIRI PAMELA', '7387274', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ESPINOZA TAQUICHIRI PAMELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ESPINOZA TAQUICHIRI PAMELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ENTRE RIOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ENTRE RIOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAGDALENA PRADA MARIA', '7335859', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAGDALENA PRADA MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAGDALENA PRADA MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'CALLE COCHABAMBA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'CALLE COCHABAMBA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PAREDES HUIZA MAGALY', '9449936', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAREDES HUIZA MAGALY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAREDES HUIZA MAGALY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'AV. LADISLAO CABRERA ESQ. 9 DE ABRIL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'AV. LADISLAO CABRERA ESQ. 9 DE ABRIL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BUSTAMANTE CHANATO INGRID', '3969820', '60422714', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BUSTAMANTE INGRID' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BUSTAMANTE INGRID', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'C. TARIJA NO. 619 Y COLON -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'C. TARIJA NO. 619 Y COLON -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MORALES PEÑALOZA TANIA DANIELA', '7416490', '67203746', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MORALES PEÑALOZA TANIA DANIELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MORALES PEÑALOZA TANIA DANIELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'HUAYRAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'HUAYRAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAPARRO  MARIELA ALEJANDRO', '7296785', '74119501', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAPARRO  MARIELA ALEJANDRO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAPARRO  MARIELA ALEJANDRO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ENTRE RIOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ENTRE RIOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANCHEZ TORREZ DE COLLARANA GRISELDA', '4505900', '65424166', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SANCHEZ TORREZ DE COLLARANA GRISELDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SANCHEZ TORREZ DE COLLARANA GRISELDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = 'TATA SANTIAGO' AND direccion = 'TATA SANTIAGO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', 'TATA SANTIAGO', 'TATA SANTIAGO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLE PORCO REBECA', '7265440', '76723385', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REBECA CALLE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REBECA CALLE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLE PORCO BEATRIZ RAQUEL', '7350282', '67258842', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CIMAT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CIMAT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROBLES DURAN MARIELA', '8134630', '64069818', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROBLES DURAN MARIELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROBLES DURAN MARIELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI LUNA PRIMITIVA', '2798515', '73717572', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI LUNA PRIMITIVA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI LUNA PRIMITIVA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE NINA QUINTINA', '3072605', '68414567', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE NINA QUINTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE NINA QUINTINA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'SEIS DE AGOSTO' AND direccion = 'PASAJE CESAR VILLCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'SEIS DE AGOSTO', 'PASAJE CESAR VILLCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ ARO GREGORIA', '8560914', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ ARO GREGORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ ARO GREGORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI APATA ROSA ANGELICA', '5738150', '63188760', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI APATA ROSA ANGELICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI APATA ROSA ANGELICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMIREZ NINA JIMENA', '7357705', '62438903', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMIREZ NINA JIMENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMIREZ NINA JIMENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = 'NORTE' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', 'NORTE', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAÑARI PORTILLO GLADYS CECILIA', '6066465', '72020319', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAÑARI PORTILLO GLADYS CECILIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAÑARI PORTILLO GLADYS CECILIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APATA MOYA EUGENIA', '5067096', '74144552', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'APATA MOYA EUGENIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('APATA MOYA EUGENIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APATA CONDORI SANDRA', '7309068', '74097858', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'APATA CONDORI SANDRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('APATA CONDORI SANDRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = 'NORTE' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', 'NORTE', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRISPIN CRISPIN EVARISTA', '3052088', '63639606', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CIMAT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CIMAT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI LUNA FANNY LEONOR', '7360299', '75404379', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI LUNA FANNY LEONOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI LUNA FANNY LEONOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ALVAREZ FRANCISCA', '4033463', '72319989', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI ALVAREZ FRANCISCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI ALVAREZ FRANCISCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI APATA CARMEN ROSA', '5738152', '0000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI APATA CARMEN ROSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI APATA CARMEN ROSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = 'NORTE' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', 'NORTE', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARCA VADILLO SANTUSA', '7299071', '68284299', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARCA VADILLO SANTUSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARCA VADILLO SANTUSA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NUÑEZ NUÑEZ FRANCIA', '2756228', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NUÑEZ NUÑEZ FRANCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NUÑEZ NUÑEZ FRANCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'PASAJE 3 DE MAYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'PASAJE 3 DE MAYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ORIHUELA MENDOZA ABIGAIL CATHERINE', '6779116', '69742488', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ORIHUELA MENDOZA ABIGAIL CATHERINE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ORIHUELA MENDOZA ABIGAIL CATHERINE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'SANTA BARBARA PRIMERO DE NOVIEMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'SANTA BARBARA PRIMERO DE NOVIEMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENDOZA ARCOS ADELA FELICIDAD', '7319445', '67207128', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MENDOZA ARCOS ADELA FELICIDAD' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MENDOZA ARCOS ADELA FELICIDAD', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'SANTUARIO DE QUILLACAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'SANTUARIO DE QUILLACAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUAYLLA MENDOZA ANAI', '7412871', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUAYLLA MENDOZA ANAI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUAYLLA MENDOZA ANAI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'SANTUARIO DE QUILLACAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'SANTUARIO DE QUILLACAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VALENCIA ARI AYDA', '5753570', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VALENCIA ARI AYDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VALENCIA ARI AYDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'SANTUARIO DE QUILLACAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'SANTUARIO DE QUILLACAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENDOZA HUARACHI BETZABE', '7297855', '74103730', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MENDOZA HUARACHI BETZABE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MENDOZA HUARACHI BETZABE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'CALLE AVAROA N5 ENTRE LA PAZ Y BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'CALLE AVAROA N5 ENTRE LA PAZ Y BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE PATZI CARLA', '7268877', '62826798', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE PATZI CARLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE PATZI CARLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'POTOSI ENTRE POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'POTOSI ENTRE POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MALLCU FLORES CELESTINA CELIA', '2758973', '6366860', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MALLCU FLORES CELESTINA CELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MALLCU FLORES CELESTINA CELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'OESTE' AND direccion = 'FINCA SIN NOMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'OESTE', 'FINCA SIN NOMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUAYLLA CALISAYA DAMACIA', '5296658', '74137422', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUAYLLA CALISAYA DAMACIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUAYLLA CALISAYA DAMACIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'FINAL CIRCUNVALACION ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'FINAL CIRCUNVALACION ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUAYLLAS RAMOS DANITZA', '12547522', '73846671', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUAYLLAS RAMOS DANITZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUAYLLAS RAMOS DANITZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'SANTA BARBARA ENTRE PRIMERO DE NOVIEMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'SANTA BARBARA ENTRE PRIMERO DE NOVIEMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE AYALA DEMETRIO', '7346541', '67208852', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE AYALA DEMETRIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE AYALA DEMETRIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = '3 DE MAYO Y SANTA BARBARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', '3 DE MAYO Y SANTA BARBARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENDOZA ARCOS ELIZABETH', '7372158', '72461366', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MENDOZA ARCOS ELIZABETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MENDOZA ARCOS ELIZABETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'LADISLAO CABRERA FINAL POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'LADISLAO CABRERA FINAL POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI CRUZ ESTHER OLGA', '3046521', '72482893', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI CRUZ ESTHER OLGA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI CRUZ ESTHER OLGA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'SANTA BARBARA ENTRE 3 DE MAYO Y PRIMERO DE NOVIEMBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'SANTA BARBARA ENTRE 3 DE MAYO Y PRIMERO DE NOVIEMBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENDOZA ARCOS FELIPE', '4072126', '71103191', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MENDOZA ARCOS FELIPE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MENDOZA ARCOS FELIPE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'AVENIDA AVAROA ENTRE BOLIVAR Y LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'AVENIDA AVAROA ENTRE BOLIVAR Y LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLAHUARA LIA FLORA', '1259400', '72496020', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALLAHUARA LIA FLORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALLAHUARA LIA FLORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'OESTE' AND direccion = 'LADISLAO CABRERA Y POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'OESTE', 'LADISLAO CABRERA Y POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI CRUZ FREDDY ROGER', '7271858', '74109233', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI CRUZ FREDDY ROGER' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI CRUZ FREDDY ROGER', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'CALLE ORURO ENTRE VIZALLA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'CALLE ORURO ENTRE VIZALLA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RIOS CHOQUETICLLA HEDELMA', '4044493', '72468203', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RIOS CHOQUETICLLA HEDELMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RIOS CHOQUETICLLA HEDELMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'FINAL POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'FINAL POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ENCINAS GONZALES LEYDI', '7307456', '7264914', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ENCINAS GONZALES LEYDI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ENCINAS GONZALES LEYDI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'FINAL AVENIDA CIRCUNVALACION' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'FINAL AVENIDA CIRCUNVALACION')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUAYLLA CALIZAYA LIMBER', '7298897', '74106696', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUAYLLA CALIZAYA LIMBER' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUAYLLA CALIZAYA LIMBER', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'NUMERO UNO' AND direccion = 'CALLER POOPO ENTRE POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'NUMERO UNO', 'CALLER POOPO ENTRE POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOAYZA VARGAS LUIS MIGUEL', '10463751', '73324203', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOAYZA VARGAS LUIS MIGUEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOAYZA VARGAS LUIS MIGUEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'SANTUARIO DE QUILLACAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'SANTUARIO DE QUILLACAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUETICLLA HUAYLLAS MARCIA', '3046581', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUETICLLA HUAYLLAS MARCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUETICLLA HUAYLLAS MARCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'OESTE' AND direccion = 'CALLE POTOSI ENTRE CIRCUNVALACION OESTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'OESTE', 'CALLE POTOSI ENTRE CIRCUNVALACION OESTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ CHOQUETICLLA MARIA ISABEL', '5720987', '67245498', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORREZ CHOQUETICLLA MARIA ISABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORREZ CHOQUETICLLA MARIA ISABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'CALLE POOPO ENTRE POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'CALLE POOPO ENTRE POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOAYZA VARGAS DE HUAYLLAS MARIBEL', '6656309', '74226238', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOAYZA VARGAS DE HUAYLLAS MARIBEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOAYZA VARGAS DE HUAYLLAS MARIBEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'CALLE ORURO ENTRE POTOSI, SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'CALLE ORURO ENTRE POTOSI, SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS GUTIERREZ MARTHA', '1350759', '68102052', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMOS GUTIERREZ MARTHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMOS GUTIERREZ MARTHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'SANTA BARBARA ENTRE CALLE 3 MAYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'SANTA BARBARA ENTRE CALLE 3 MAYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENDOZA ARCOS MATEO', '7319446', '68366691', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MENDOZA ARCOS MATEO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MENDOZA ARCOS MATEO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'OESTE' AND direccion = 'CALLE LADISLAO CABRERA Y POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'OESTE', 'CALLE LADISLAO CABRERA Y POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MORALES CARVAJAL NATALIA', '7273246', '72475525', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MORALES CARVAJAL NATALIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MORALES CARVAJAL NATALIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'CALLE POTOSI ENTRE CALLE POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'CALLE POTOSI ENTRE CALLE POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUAYLLAS LLANTO MIGUEL', '2782605', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUAYLLAS LLANTO MIGUEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUAYLLAS LLANTO MIGUEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'PRIMERO DE NOVIEMBRE ENTRE CALLE SANTA BARBARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'PRIMERO DE NOVIEMBRE ENTRE CALLE SANTA BARBARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUETOPA GONZALES NELLY', '7307454', '72483192', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUETOPA GONZALES NELLY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUETOPA GONZALES NELLY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'CALLE POTOSI ENTRE CALLE ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'CALLE POTOSI ENTRE CALLE ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLAHUARA HUAYLLA SONIA', '5747249', '73505754', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALLAHUARA HUAYLLA SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALLAHUARA HUAYLLA SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'CALLE POTOSI ENTRE CALLE ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'CALLE POTOSI ENTRE CALLE ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLAHUARA  VITALIANO', '609783', '72468233', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALLAHUARA  VITALIANO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALLAHUARA  VITALIANO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. COIPASA -PROV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. COIPASA -PROV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA  ARMINDA', '4077770', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA  ARMINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA  ARMINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. COIPASA PROV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. COIPASA PROV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ ROJAS NORAH', '2760136', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ ROJAS NORAH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ ROJAS NORAH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. EN COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. EN COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROJAS DE CONDORI FLORA', '624321', '72455821', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROJAS DE CONDORI FLORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROJAS DE CONDORI FLORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. COIPASA PROV. SABAYA OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. COIPASA PROV. SABAYA OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA ATORA GUISEL ZULEMA', '14078457', '67265403', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA ATORA GUISEL ZULEMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA ATORA GUISEL ZULEMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AYCA CRUZ ISABEL JASMIN', '13357253', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AYCA CRUZ ISABEL JASMIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AYCA CRUZ ISABEL JASMIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. EN COIPASA - PROV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. EN COIPASA - PROV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ AUCA CARLA CRISTINA', '14957316', '72483870', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ AUCA CARLA CRISTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ AUCA CARLA CRISTINA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUSI SERRUDO ROSARIO', '5725435', '68311749', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CUSI SERRUDO ROSARIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CUSI SERRUDO ROSARIO', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. COIPASA PROV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. COIPASA PROV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROJAS MAMANI JHENDELYN', '14143958', '72347085', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROJAS MAMANI JHENDELYN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROJAS MAMANI JHENDELYN', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOTO CHIRI AMALIA', '16219002', '63647313', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOTO CHIRI AMALIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOTO CHIRI AMALIA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. COIPASA MUN. COIPASA -PROV. SABAYA OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. COIPASA MUN. COIPASA -PROV. SABAYA OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MANUEL HERRERA SANTIAGO', '3515550', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MANUEL HERRERA SANTIAGO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MANUEL HERRERA SANTIAGO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. COIPASA PROV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. COIPASA PROV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA GARCIA MADELEIN SONIA', '12428849', '74145721', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA GARCIA MADELEIN SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA GARCIA MADELEIN SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FERNANDEZ CARLOS VIDAL', '5739454', '72320775', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FERNANDEZ CARLOS VIDAL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FERNANDEZ CARLOS VIDAL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COTA YUCRA KAREN CLAUDIA', '7323963', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COTA YUCRA KAREN CLAUDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COTA YUCRA KAREN CLAUDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = 'SUD' AND direccion = 'RESD. C. CIRCUNVALACION NO. 57 Y AMERICA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'SUD', 'RESD. C. CIRCUNVALACION NO. 57 Y AMERICA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAHUANA TAPIA HILDA', '5722800', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAHUANA TAPIA HILDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAHUANA TAPIA HILDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE ANTONIO RUBEN', '5727423', '73845598', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE ANTONIO RUBEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE ANTONIO RUBEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. COIPASA -PROV. SABYA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. COIPASA -PROV. SABYA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ GARNICA JHOEL CLEDY', '12447599', '62814895', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ GARNICA JHOEL CLEDY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ GARNICA JHOEL CLEDY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = 'SUD' AND direccion = 'FINAL CIRCUNVALACION' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', 'SUD', 'FINAL CIRCUNVALACION')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GOMEZ  GUIDO JAVEIR', '7929517', '63650438', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GOMEZ  GUIDO JAVEIR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GOMEZ  GUIDO JAVEIR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. EN COIPASA PROV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. EN COIPASA PROV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ VALLEJOS VICTOR', '4387729', '63651934', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ VALLEJOS VICTOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ VALLEJOS VICTOR', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. LOC. COIPASA -PORV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. LOC. COIPASA -PORV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALCON PEREZ EVY MARINA', '5767566', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALCON PEREZ EVY MARINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALCON PEREZ EVY MARINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE  LOURDES GUISELA', '7310979', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE  LOURDES GUISELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE  LOURDES GUISELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. COIPASA PROV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. COIPASA PROV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ACAPA  BETTY LIDIA', '2793937', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ACAPA  BETTY LIDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ACAPA  BETTY LIDIA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. COIPASA PROV. SABAYA - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. COIPASA PROV. SABAYA - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA  SONIA ANGELICA', '7264189', '67033843', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA  SONIA ANGELICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA  SONIA ANGELICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. LOC. COIPASA -PROV. SABAYA OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. LOC. COIPASA -PROV. SABAYA OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROJAS MANUEL HUMBERTO', '5755024', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROJAS MANUEL HUMBERTO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROJAS MANUEL HUMBERTO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. EN COIPASA -PROV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. EN COIPASA -PROV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA  MARCOS', '7391181', '72355597', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA  MARCOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA  MARCOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. COIPASA PROV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. COIPASA PROV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ZARATE MAX HONORIO', '3516157', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI ZARATE MAX HONORIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI ZARATE MAX HONORIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'COIPASA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'COIPASA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ  YOHOVANA', '4072283', '71888058', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ  YOHOVANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ  YOHOVANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'COIPASA' AND zona = '' AND direccion = 'RESD. EN COIPASA. PROV. SABAYA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'COIPASA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('COIPASA', '', 'RESD. EN COIPASA. PROV. SABAYA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA GARCIA MADAID KARLA', '12428848', '72492487', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA GARCIA MADAID KARLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA GARCIA MADAID KARLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'Z. SAN MATIAS C. ANTOFAGASTA NO. 504 - SUCRE.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'Z. SAN MATIAS C. ANTOFAGASTA NO. 504 - SUCRE.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NOGALES VALENZUELA ROSEBERT CECILIA IRACEMA', '5761379', '73433024', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROSEBET CECILIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROSEBET CECILIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'C. AVAROA E. ORURO - POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'C. AVAROA E. ORURO - POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLA NUEVA FUENTES NELY LIDIA', '5770555', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLA NUEVA FUENTES NELY LIDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLA NUEVA FUENTES NELY LIDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'C. BELZU. S.N. Y FRONTANILLA -POOPO - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'C. BELZU. S.N. Y FRONTANILLA -POOPO - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RUEDA MUÑOZ ANA MARIA', '7389841', '71887290', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RUEDA MUÑOZ ANA MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RUEDA MUÑOZ ANA MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'C. BELZU S.N. Y FRONTANILLA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'C. BELZU S.N. Y FRONTANILLA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MUÑOZ GUZMAN DE RUDA HILARIA', '7347809', '72303578', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MUÑOZ GUZMAN DE RUDA HILARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MUÑOZ GUZMAN DE RUDA HILARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. POOPO PROV. POOPO -OR,' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. POOPO PROV. POOPO -OR,')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE RUEDA VICTORIA', '4074570', '72318500', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE RUEDA VICTORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE RUEDA VICTORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARANCIBIA YAMPASA CENIA ADREINA', '7303934', '74579848', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARANCIBIA YAMPASA CENIA ADREINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARANCIBIA YAMPASA CENIA ADREINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLE BOLAÑOS SABINA', '7277911', '78654537', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALLE BOLAÑOS SABINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALLE BOLAÑOS SABINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'MENACHO Y BOQUERON ENTREE CAP. USTAREZ NO. 113 -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'MENACHO Y BOQUERON ENTREE CAP. USTAREZ NO. 113 -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI ARGOLLO ANGELA ABRIL', '12868835', '72310021', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI ARGOLLO ANGELA ABRIL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI ARGOLLO ANGELA ABRIL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'VILLA POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'VILLA POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HINOJOSA HIDALGO FANNY', '8038524', '67250328', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HINOJOSA HIDALGO FANNY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HINOJOSA HIDALGO FANNY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'C. TARAPACA. NO. 2164 A ENTRE  ARCE Y SANTA BARBARA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'C. TARAPACA. NO. 2164 A ENTRE  ARCE Y SANTA BARBARA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAGNE RIOS DE ESCOBAR DOMINGA', '633005', '72333422', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAGNE RIOS DE ESCOBAR DOMINGA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAGNE RIOS DE ESCOBAR DOMINGA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VELASCO YAMPAZA DE FERNANDEZ ERIKA TELMA', '5139456', '72343217', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VELASCO YAMPAZA DE FERNANDEZ ERIKA TELMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VELASCO YAMPAZA DE FERNANDEZ ERIKA TELMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. POOPO PROV. POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. POOPO PROV. POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES CALLAPA JUSTINA', '3063941', '72471737', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES CALLAPA JUSTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES CALLAPA JUSTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. POOPO C. FINAL AVAROA PROV. POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. POOPO C. FINAL AVAROA PROV. POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE CONDORI DE SALAZAR SILVERIA', '692788', '72329180', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE CONDORI DE SALAZAR SILVERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE CONDORI DE SALAZAR SILVERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'POTOSI S.N, Y OBLITAS EN POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'POTOSI S.N, Y OBLITAS EN POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AZTETE FLORES HEYDI JHOSELINNE', '7337818', '72471737', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AZTETE FLORES HEYDI JHOSELINNE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AZTETE FLORES HEYDI JHOSELINNE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. LOC. VILLA POOPO -PROV. POOPO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. LOC. VILLA POOPO -PROV. POOPO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAPARRO ANCALLE DE QUISPE NATALIA', '2773903', '67225152', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAPARRO ANCALLE DE QUISPE NATALIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAPARRO ANCALLE DE QUISPE NATALIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. EN QUELLIA PROV. POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. EN QUELLIA PROV. POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAPARRO ANCALLE AURELIA', '3505297', '74100558', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAPARRO ANCALLE AURELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAPARRO ANCALLE AURELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. VILLA POOPO. PROV. POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. VILLA POOPO. PROV. POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAPURATA COPA DE CHOQUE LEONARDA', '626596', '62800516', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAPURATA COPA DE CHOQUE LEONARDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAPURATA COPA DE CHOQUE LEONARDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'C. PUERTO RICO NO. 17 Z. 3 DE MAYO - VENTILLA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'C. PUERTO RICO NO. 17 Z. 3 DE MAYO - VENTILLA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE TAPIA MAERIA LEONORA', '7081446', '72338141', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE TAPIA MAERIA LEONORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE TAPIA MAERIA LEONORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. EN POOPO PROV. POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. EN POOPO PROV. POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA  SINIONA', '3345280', '72314542', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NINA  SINIONA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NINA  SINIONA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. POOPO C. MONTES DE OCA, PAVON Y RODRIGUEZ -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. POOPO C. MONTES DE OCA, PAVON Y RODRIGUEZ -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI BARRETA DE CHOQUE MARGARITA', '3528199', '72347283', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARGARITA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARGARITA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. POOPO C. PABON Y MONTES DE OCA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. POOPO C. PABON Y MONTES DE OCA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA SANTOS VILMA', '7349214', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUANCA SANTOS VILMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUANCA SANTOS VILMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'C.OBLITAS S.N. Y ORURO -POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'C.OBLITAS S.N. Y ORURO -POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE LIMA DE COLQUE SEGUNDINA RICARDA', '5774776', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SEGUNDINA R.' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SEGUNDINA R.', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'C. AVAROA ENTRE MONTES DE OCA LOC. POOPO -ORURO.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'C. AVAROA ENTRE MONTES DE OCA LOC. POOPO -ORURO.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHECA TORREJON DE BENITO NANCY', '6904056', '72309413', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHECA  NANCY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHECA  NANCY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. EN POOPO C. AVAROA Y MONTES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. EN POOPO C. AVAROA Y MONTES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALANI QUISPE DE BENITO EDITH SONIA', '4078037', '72310021', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EDITH SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EDITH SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'RESD. EN POOPO - PROV. POOPO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'RESD. EN POOPO - PROV. POOPO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BLAS MENACHO AMERICA YOLANDA', '14667499', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AMERICA YOLANDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AMERICA YOLANDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'POOPO' AND zona = '' AND direccion = 'FRANCISCO TOLEDO NO. 8 E. ANTOFAGASTA -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'POOPO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('POOPO', '', 'FRANCISCO TOLEDO NO. 8 E. ANTOFAGASTA -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BELTRAN ANTONIO DE PARI CEILA ELSA', '7313291', '72488914', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BELTRAN CEILA ELSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BELTRAN CEILA ELSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CALLE UYUNI ENTRE ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CALLE UYUNI ENTRE ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA BUKSMAN IRIS ARACELI', '6773849', '73001588', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NINA BUKSMAN IRIS ARACELI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NINA BUKSMAN IRIS ARACELI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'JORGE OBLITAS Y JUNIN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'JORGE OBLITAS Y JUNIN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA DE IGNACIO GIMENA', '4023073', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA DE IGNACIO GIMENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA DE IGNACIO GIMENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'CASA ARTESANAL POBLACION CIVIL DE ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'CASA ARTESANAL POBLACION CIVIL DE ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ GOMEZ NIRDA', '5748559', '72316727', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ GOMEZ NIRDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ GOMEZ NIRDA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CAMANA DEL AYLLU THUNUPA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CAMANA DEL AYLLU THUNUPA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SILVESTRE PANAMA CLINIO JUAN', '3708805', '72422721', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SILVESTRE PANAMA CLINIO JUAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SILVESTRE PANAMA CLINIO JUAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CAMANA UTR THUNUPA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CAMANA UTR THUNUPA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAMBI MAMANI ZULEMA REYNA', '4066386', '72329181', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAMBI MAMANI ZULEMA REYNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAMBI MAMANI ZULEMA REYNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'LADISLAO CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'LADISLAO CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ GARCIA DE FLORES ALICIA', '2799310', '67212499', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ GARCIA DE FLORES ALICIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ GARCIA DE FLORES ALICIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'IDELFONSO MURGUIA Y JORGE OBLITAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'IDELFONSO MURGUIA Y JORGE OBLITAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LINEZ CALIZAYA BLUMEN DELMA', '7334794', '63660759', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LINEZ CALIZAYA BLUMEN DELMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LINEZ CALIZAYA BLUMEN DELMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'LADISLAO CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'LADISLAO CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CANAVIRI BELLO CARLA PATRICIA', '7308138', '77823560', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CANAVIRI BELLO CARLA PATRICIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CANAVIRI BELLO CARLA PATRICIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'LADISLAO CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'LADISLAO CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA BUKSMAN WIÑAY', '7086316', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NINA BUKSMAN WIÑAY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NINA BUKSMAN WIÑAY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'LADISLAO CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'LADISLAO CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA BUKSMAN WIÑAY', '7086316', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NINA BUKSMAN WIÑAY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NINA BUKSMAN WIÑAY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'LADISLAO CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'LADISLAO CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LLANOS FLORES VIRGINIA', '7467150', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LLANOS FLORES VIRGINIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LLANOS FLORES VIRGINIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'LADISLAO CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'LADISLAO CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA MAMANI SEGUNDINA', '7344559', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA MAMANI SEGUNDINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA MAMANI SEGUNDINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CALLE ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CALLE ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POMA  SARA', '5061248', '67241211', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'POMA  SARA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('POMA  SARA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'OESTE' AND direccion = 'JORGE OBLITAS Y JUNIN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'OESTE', 'JORGE OBLITAS Y JUNIN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('IGNACIO GARCIA RONALD', '5288640', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IGNACIO GARCIA RONALD' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IGNACIO GARCIA RONALD', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'AVENIDA ANTOFAGASTA EQUINA ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'AVENIDA ANTOFAGASTA EQUINA ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MONTOYA AIZACAYO RODNEY HUBERT', '7417819', '75423377', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MONTOYA AIZACAYO RODNEY HUBERT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MONTOYA AIZACAYO RODNEY HUBERT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'SAN PEDRO' AND direccion = 'UTD THUNUPA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'SAN PEDRO', 'UTD THUNUPA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA IBARRA NELLY', '73825991', '73825991', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA IBARRA NELLY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA IBARRA NELLY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'PRESIDENTE MONTES CALLE JUNCITO PINTO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'PRESIDENTE MONTES CALLE JUNCITO PINTO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SILVESTRE BARCO MONICA', '5753446', '72333529', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SILVESTRE BARCO MONICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SILVESTRE BARCO MONICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'POTOSI ETRE DANIEL CAMPOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'POTOSI ETRE DANIEL CAMPOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GONZALES HUANCA DE BARCO MERCEDEZ', '1362727', '73887010', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GONZALES HUANCA MERCEDEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GONZALES HUANCA MERCEDEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'SUD' AND direccion = 'CIRCUNVALACION' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'SUD', 'CIRCUNVALACION')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FERNANDEZ AJALLI MELINA', '7333542', '77146706', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FERNANDEZ AJALLI MELINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FERNANDEZ AJALLI MELINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD SALINAS DE GARCI MENDOZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD SALINAS DE GARCI MENDOZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ  MELANIA CAROLINA', '5770481', '00000000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUTIERREZ  MELANIA CAROLINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUTIERREZ  MELANIA CAROLINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'AVENIDA ANTOFAGASTA ESQUINA ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'AVENIDA ANTOFAGASTA ESQUINA ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SILVESTRE  MAYTE MICAHELA', '10543232', '68436462', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SILVESTRE  MAYTE MICAHELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SILVESTRE  MAYTE MICAHELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CALLE UYUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CALLE UYUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ SILVESTRE LOIDA NOEMI', '5961594', '67007592', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ SILVESTRE LOIDA NOEMI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ SILVESTRE LOIDA NOEMI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'BATALLON COLORADO Y CIRCUNVALACION' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'BATALLON COLORADO Y CIRCUNVALACION')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GOMEZ GARISTO LIDIA', '5760139', '72332468', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GOMEZ GARISTO LIDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GOMEZ GARISTO LIDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'VILLA PAGADOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'VILLA PAGADOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA JANCO KAREN MARIBEL', '13098418', '65755139', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NINA JANCO KAREN MARIBEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NINA JANCO KAREN MARIBEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'SALINAS DE GARCI MENDOZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'SALINAS DE GARCI MENDOZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISBERTH HUANCA JUDITH', '3242922', '63653551', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISBERTH HUANCA JUDITH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISBERTH HUANCA JUDITH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'FINAL ANTOFAGASTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'FINAL ANTOFAGASTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA LAURA GREGORIA RUTY', '4071476', '72499141', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA LAURA GREGORIA RUTY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA LAURA GREGORIA RUTY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'RESD SALINAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'RESD SALINAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PREZ  FAUS TINA', '671208', '74115308', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PREZ  FAUS TINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PREZ  FAUS TINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'CALLE ORURO S.N.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'CALLE ORURO S.N.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANCASI MAMANI MARIA ELENA', '5761884', '72306653', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANCASI MAMANI MARIA ELENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANCASI MAMANI MARIA ELENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CARRETERA COCHABAMBA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CARRETERA COCHABAMBA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUACAÑA  ELIZABETH', '3542036', '00000000', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'AV INTEGRACION ENTRE CALLE SOLEDAD' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'AV INTEGRACION ENTRE CALLE SOLEDAD')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ  NILDA', '7380457', '72499895', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'CALLE POTOSI Y SOLEDAD' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'CALLE POTOSI Y SOLEDAD')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BARRIENTOS POMA SINDY ZENAIDA', '8395609', '68354589', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BARRIENTOS POMA SINDY ZENAIDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BARRIENTOS POMA SINDY ZENAIDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'G.A.M. HUAYLLAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'G.A.M. HUAYLLAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE MAMANI GABRIEL', '3064930', '74109107', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE MAMANI GABRIEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE MAMANI GABRIEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'RESD. EN HUAYLLAMARCA -PROV. NOR CARANGAS OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'RESD. EN HUAYLLAMARCA -PROV. NOR CARANGAS OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TANGARA TORREZ NICET', '7396566', '72478977', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TANGARA TORREZ NICET' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TANGARA TORREZ NICET', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'RESD. ROMERO HUMA PROV. NOR CARANGAS -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'RESD. ROMERO HUMA PROV. NOR CARANGAS -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE AYVIRI MADAI REBECA', '7403294', '73839539', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE AYVIRI MADAI REBECA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE AYVIRI MADAI REBECA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'RESD. EN PHAQHAWA. PROV. GUALBERTO VILLARRUEL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'RESD. EN PHAQHAWA. PROV. GUALBERTO VILLARRUEL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI ALELUYA CRISTOFFER JORGE', '9066556', '71264783', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRISTOFFER JORGE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRISTOFFER JORGE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'CHARCAS N. 177 E. AV. DEL MAESTRO -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'CHARCAS N. 177 E. AV. DEL MAESTRO -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAVEZ PANIAGUA JIMY JUAN', '5747604', '72492808', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JIMY JUAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JIMY JUAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'RESD. HUAYLLAMARCA PROV. NOR. CARANGAS -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'RESD. HUAYLLAMARCA PROV. NOR. CARANGAS -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AYAVIRI CANQUI DE CHOQUE VALERIA', '7372266', '74159938', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AYAVIRI CANQUI DE CHOQUE VALERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AYAVIRI CANQUI DE CHOQUE VALERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'C. FINAL BOLIVAR NO. 16 Z. OESTE -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'C. FINAL BOLIVAR NO. 16 Z. OESTE -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES FERNANDEZ EDUARDO', '3057917', '73800616', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES FERNANDEZ EDUARDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES FERNANDEZ EDUARDO', NULLIF('3057917',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'RESD. HUAYLLAMARCA - PROV. NOR CARANGAS -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'RESD. HUAYLLAMARCA - PROV. NOR CARANGAS -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROCHA MOLINA NOEMI GLADYS', '14147132', '72352489', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROCHA MOLINA NOEMI GLADYS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROCHA MOLINA NOEMI GLADYS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'RESD. EN HUAYLLAMARCA - PROV. NOR CARANGAS -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'RESD. EN HUAYLLAMARCA - PROV. NOR CARANGAS -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GOMEZ COPA NEYSA MILENKA', '13124705', '71102631', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NEYSA MILENKA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NEYSA MILENKA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'SALON ROJO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'SALON ROJO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUELLAR QUISPE ANGELICA', '11546400', '63213728', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CUELLAR QUISPE ANGELICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CUELLAR QUISPE ANGELICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'RESD. HUAYLLAMARCA - PROV . NOR CARANGAS -OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'RESD. HUAYLLAMARCA - PROV . NOR CARANGAS -OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE AYAVIRI DENILSON ABIMAEL', '7403295', '63636587', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE AYAVIRI DENILSON ABIMAEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE AYAVIRI DENILSON ABIMAEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'CALLE ORURO S.N' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'CALLE ORURO S.N')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOCO NINA TANIA TOMASA', '3068323', '72499786', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TOCO NINA TANIA TOMASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TOCO NINA TANIA TOMASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'SALON ROJO ALCALDIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'SALON ROJO ALCALDIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ RIVERA SONIA ESTEFA', '7364872', '72302760', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRUZ RIVERA SONIA ESTEFA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRUZ RIVERA SONIA ESTEFA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'RESD. SAN MIGUEL PROV. NOR CARANGAS OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'RESD. SAN MIGUEL PROV. NOR CARANGAS OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('IBARRA CHOQUE DAMIAN', '2737297', '72312160', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IBARRA CHOQUE DAMIAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IBARRA CHOQUE DAMIAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = 'NORTE' AND direccion = 'CALLE LAPAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', 'NORTE', 'CALLE LAPAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GOMEZ SUARES POLICARPIO', '3021719', '68499844', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GOMEZ SUARES POLICARPIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GOMEZ SUARES POLICARPIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'RESD. HUAYLLAMARCA PROV. NOR CARANGAS - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'RESD. HUAYLLAMARCA PROV. NOR CARANGAS - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APAZA BUSTILLOS LUIS BARTOLOME', '3531360', '71988439', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'APAZA BUSTILLOS LUIS BARTOLOME' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('APAZA BUSTILLOS LUIS BARTOLOME', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'HUAYLLAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'HUAYLLAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SALINAS QUISPE WILMA', '4035112', '74143125', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SALINAS QUISPE WILMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SALINAS QUISPE WILMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'RESD. ROMERO HUMA PROV. NOR CARANGAS - OR.' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'RESD. ROMERO HUMA PROV. NOR CARANGAS - OR.')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE AYAVIRI ABIEZER ABIDAN', '7403299', '67255077', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE AYAVIRI ABIEZER ABIDAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE AYAVIRI ABIEZER ABIDAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'HUAYLLAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'HUAYLLAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MORON CORTEZ ALISSON KELLY', '7367902', '75709390', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALISSON KELLY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALISSON KELLY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'HUAYLLAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'HUAYLLAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES DELGADO MARLENE', '5720899', '65411215', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES DELGADO MARLENE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES DELGADO MARLENE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'LA JOYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'LA JOYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES DELGADO MELISA', '7450552', '61839578', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES DELGADO MELISA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES DELGADO MELISA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'HUAYLLAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'HUAYLLAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DELGADO VENTURA NELLY MARTHA', '2777771', '73800615', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DELGADO VENTURA NELLY MARTHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DELGADO VENTURA NELLY MARTHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = '' AND direccion = 'HUAYLLAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', '', 'HUAYLLAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES DELGADO EVERD WLADIMIR', '7264526', '68303346', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES DELGADO EVERD WLADIMIR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES DELGADO EVERD WLADIMIR', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUAYLLAMARCA' AND zona = 'NORTEQ' AND direccion = 'G. A. M. S. DE HUAYLLAMARCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', 'NORTEQ', 'G. A. M. S. DE HUAYLLAMARCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FERNANDEZ HUAYGUA CELIDA', '7403308', '72342728', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FERNANDEZ HUAYGUA CELIDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FERNANDEZ HUAYGUA CELIDA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PINAYA MANZEIA SARAI MEYLIN', '14241696', '6723145', v_id_formacion, v_id_estado_civil)
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
    VALUES ('CONDORI CONDORI CLAUDIA', '7364293', '67264943', v_id_formacion, v_id_estado_civil)
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
    VALUES ('HINOJOSA FERNANDEZ CLAUDINA', '7261703', '60415903', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'PANAMERICANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'PANAMERICANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI CHOQUE ERMINIA', '2772623', '73839540', v_id_formacion, v_id_estado_civil)
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
    VALUES ('PADILLA CORIA IDELIA', '7386127', '64770185', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
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
    VALUES ('PINAYA HUARACHI ERIKA', '14351427', '63639130', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
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
    VALUES ('FERNANDEZ PADILLA CLAUDIA', '8205377', '64778497', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
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
    VALUES ('RAMIREZ SANCHEZ BANESA', '7312467', '69584820', v_id_formacion, v_id_estado_civil)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
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
    VALUES ('PADILLA CORIA LIZETT', '7385880', '74121282', v_id_formacion, v_id_estado_civil)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CONVIVIENTE' LIMIT 1;
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
    VALUES ('CHIARA  PAMELA', '7381648', '62969936', v_id_formacion, v_id_estado_civil)
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
    VALUES ('MAMANI CHAVEZ NORA', '3553403', '67256369', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
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
    VALUES ('CHOQUE  JUDITH CARMEN', '7386176', '67233642', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE  JUDITH CARMEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE  JUDITH CARMEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACCI CUIAZARA DANIEL', '7381665', '63638129', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
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
    VALUES ('HUACAÑA LUNA ASENCIA', '605390', '72570997', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUACAÑA LUNA ASENCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUACAÑA LUNA ASENCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'AV ANTIGUA COLQUIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'AV ANTIGUA COLQUIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CABEZAS CONDORI OLIVIA', '11094569', '73802117', v_id_formacion, v_id_estado_civil)
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
    VALUES ('GUZMAN QUISPE LEONOR', '4047736', '72530842', v_id_formacion, v_id_estado_civil)
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



COMMIT;
