-- SCRIPT AUTOGENERADO DESDE EXCEL
BEGIN;
INSERT INTO public.rubro (nombre_rubro) VALUES ('ALIMENTOS') ON CONFLICT (nombre_rubro) DO NOTHING;
INSERT INTO public.rubro (nombre_rubro) VALUES ('TEXTIL') ON CONFLICT (nombre_rubro) DO NOTHING;
INSERT INTO public.rubro (nombre_rubro) VALUES ('ARTESANIAS') ON CONFLICT (nombre_rubro) DO NOTHING;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'HUANUNI' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'HUANUNI', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CARTAGENA TRUJILLO ROSSIE PAMELA', '5771164', '68353626', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CARTAGENA TRUJILLO ROSSIE PAMELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CARTAGENA TRUJILLO ROSSIE PAMELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'PAZÑA' AND zona = 'NORTE' AND direccion = 'URB. CALA CAJA MZ - X - H' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'NORTE', 'URB. CALA CAJA MZ - X - H')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUELLAR MORAZ PRIMA', '4047050', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'F.G.B' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('F.G.B', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'V. GALVARRO, 12 DE OCTUBRE Y ARICA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'V. GALVARRO, 12 DE OCTUBRE Y ARICA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NAVARRO ZURITA DE CHAMBI GLADIZ', '3533318', '74106277', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COMO PEZ EN EL AGUA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COMO PEZ EN EL AGUA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'VILLA CHALLACOLLO' AND direccion = 'VILLA CHALLACOLLO, AV. ENNIS Nº 1210' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VILLA CHALLACOLLO', 'VILLA CHALLACOLLO, AV. ENNIS Nº 1210')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALIZAYA TRONCOSO DE MAMANI NILA', '657265', '72305359', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALIZAYA TRONCOSO DE MAMANI NILA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALIZAYA TRONCOSO DE MAMANI NILA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CORQUE' AND zona = 'CORQUE' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'CORQUE', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE ALA TOMAS', '582234', '71106507', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SARTAÑANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SARTAÑANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'CALLE POTOSI ENTRE SANTA BARBARA N 2240' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'CALLE POTOSI ENTRE SANTA BARBARA N 2240')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAMAS SOTO PRUDENCIA', '1034421', '5276821', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PANADERIA HELENICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PANADERIA HELENICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'INCA POZO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'INCA POZO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUGAR MAMANI ROSARIO', '4047917', '61823507', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS DISEÑOS ROUSY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS DISEÑOS ROUSY', NULLIF('4047917',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MALLCU HUARACHI MIRTHA LEYDI', '7384584', '63632907', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MALLCU HUARACHI MIRTHA LEYDI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MALLCU HUARACHI MIRTHA LEYDI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'FINAL RIEL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'FINAL RIEL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLAHUARA TOLA ALISON', '14294732', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALLAHUARA TOLA ALISON' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALLAHUARA TOLA ALISON', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'CIRCUNVALACION' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'CIRCUNVALACION')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MALLCU PATZI RUTH CAROLAIN', '13028783', '71105159', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MALLCU PATZI RUTH CAROLAIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MALLCU PATZI RUTH CAROLAIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'OESTE' AND direccion = 'RESD SANTUARIO DE QUILLACAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'OESTE', 'RESD SANTUARIO DE QUILLACAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUETICLLA CALLAHUARA FLORENCIA', '7277846', '74150435', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUETICLLA CALLAHUARA FLORENCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUETICLLA CALLAHUARA FLORENCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'ARCE Y AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'ARCE Y AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JALLAZA MAMANI DE GARCIA EGBERTA', '5760483', '72489673', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JALLAZA MAMANI DE GARCIA EGBERTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JALLAZA MAMANI DE GARCIA EGBERTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'AYACUCHO Y ARCE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'AYACUCHO Y ARCE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOTO MATURANO MACARIA', '5272705', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOTO MATURANO MACARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOTO MATURANO MACARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'ARCE Y AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'ARCE Y AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA JALLAZA MARIA', '7384614', '72454014', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA JALLAZA MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA JALLAZA MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'PLAZA SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'PLAZA SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI MALLCO MAXIMA', '3509334', '74159044 - 74157400', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI MALLCO MAXIMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI MALLCO MAXIMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'MARY' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'MARY')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PATZI PACOLLA MARCOSIA', '7694756', '72613726', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PATZI PACOLLA MARCOSIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PATZI PACOLLA MARCOSIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'NORTE' AND direccion = 'LADISLAO CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'NORTE', 'LADISLAO CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA CHOQUE PRIMA', '4065254', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA CHOQUE PRIMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA CHOQUE PRIMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'SUD' AND direccion = 'FINAL RIEL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'SUD', 'FINAL RIEL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOLA MARTINEZ ELIZABETH', '7341048', '72708120', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TOLA MARTINES ELIZABETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TOLA MARTINES ELIZABETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLAHUARA JALLAZA ROSALI', '7371869', '78646437', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIADA A CREQUINUASBOL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIADA A CREQUINUASBOL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'PAGADOR ENTRE BOLIVAR Y AVAROA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'PAGADOR ENTRE BOLIVAR Y AVAROA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUETICLLA YUPANQUI MARIBEL', '6224928', '74157408', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUETICLLA YUPANQUI MARIBEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUETICLLA YUPANQUI MARIBEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'NORTE' AND direccion = 'FERROVIARIA Y BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'NORTE', 'FERROVIARIA Y BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLAHUARA MALLCU YHOVANNA', '7289253', '73832439', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALLAHUARA MALLCU YHOVANNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALLAHUARA MALLCU YHOVANNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'LITORAL Y JUNIN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'LITORAL Y JUNIN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARCOS LIA EUFRACIA', '7312874', '72420614', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARCOS LIA EUFRACIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARCOS LIA EUFRACIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'NORTE' AND direccion = '12 DE OCTUBRE ENTRE CAP. BARRIGA Y GERMANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'NORTE', '12 DE OCTUBRE ENTRE CAP. BARRIGA Y GERMANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARIAS ORTIZ DESIDERIO', '640159', '77141118', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DICK SWART' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DICK SWART', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'URB. SAN MIGUEL 1' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'URB. SAN MIGUEL 1')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VASQUEZ NINA RICHARD WILSON', '4062325', '73834234 - 72528525', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUINUAS BOLIVIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUINUAS BOLIVIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'SANTA BARBARA, TOCOPILLA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'SANTA BARBARA, TOCOPILLA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI CHINO CARMEN', '4313194', '73817250', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CARMEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CARMEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'PAGADOR Y CALLE C' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'PAGADOR Y CALLE C')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS TITO EINNELL FATIMA', '7420610', '72355231', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MODA MEDICA VADE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MODA MEDICA VADE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'PAZÑA' AND zona = 'CAÑAGA' AND direccion = 'MUNICIPIO DE PAZÑA DEL DEPARTAMENTO DE ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'CAÑAGA', 'MUNICIPIO DE PAZÑA DEL DEPARTAMENTO DE ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE COLQUE NELSON', '7452292', '63752678', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LACTEOS SANTA ROSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LACTEOS SANTA ROSA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'C. R. PAREDEZ - N2 VILLAMIL Y W. ZEBALLOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'C. R. PAREDEZ - N2 VILLAMIL Y W. ZEBALLOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMIREZ CONDORI ABIGAIL', '7279204', '67223997', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES ABI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES ABI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'JAEN 781 IQUIQUE Y PISAGUA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'JAEN 781 IQUIQUE Y PISAGUA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLAPA LIMACHI LILIAN', '7270179', '65427097', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA MAZLIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA MAZLIN', NULLIF('7270179013',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRO' AND direccion = 'COCHABAMBA, PAGADOR Y VELASCO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRO', 'COCHABAMBA, PAGADOR Y VELASCO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HIDALGO DE MENDOZA SONIA YAVI', '3075766', '72352566', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MANOS CREADORAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MANOS CREADORAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'PDTE. MONTES, TUPIZA N950' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'PDTE. MONTES, TUPIZA N950')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ESCOBAR BENIC RUTH LILY', '591676', '74479758', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ATELIER IRIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ATELIER IRIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'OESTE' AND direccion = 'FINAL JUNIN PIE DE GALLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'OESTE', 'FINAL JUNIN PIE DE GALLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MANZANEDA PERALTA JUANA', '2756865', '70436811', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREADORES KADY MALENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREADORES KADY MALENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB. CORDEOR MZO A4 LOTE 6' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB. CORDEOR MZO A4 LOTE 6')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('OSSORIO CONDORI CARLOS ALEX', '4368758', '74567274', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LEGADOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LEGADOS', NULLIF('4368758019',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'NORTE' AND direccion = 'BENI ENTRE PAGADOR Y POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'NORTE', 'BENI ENTRE PAGADOR Y POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHOQUE FELISA', '2756976', '60421001', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES GABRIEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES GABRIEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'J.J. TORREZ Y RAMIREZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'J.J. TORREZ Y RAMIREZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TICONA CACERES LUCELIA', '4066456', '65423714', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IMPRESIONES R&L' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IMPRESIONES R&L', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SORACACHI' AND zona = '' AND direccion = 'TERMINAL NUEVA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SORACACHI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SORACACHI', '', 'TERMINAL NUEVA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPAJA ALCON ROMULO', '3358392', '74022270', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DAYPAC' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DAYPAC', NULLIF('4849913091',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'SUD ESTE' AND direccion = '6 DE OCTUBRE ESQ. SANTA BARBARA #2299' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'SUD ESTE', '6 DE OCTUBRE ESQ. SANTA BARBARA #2299')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('OROZCO JALDIN MARIANA', '5747331', '65435781', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIAS CREACIONES M Y B' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIAS CREACIONES M Y B', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'PISAGUA, EJERCITO Y AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'PISAGUA, EJERCITO Y AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VELIZ RODRIGUEZ PABLO ARIEL', '7298723', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUAVEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUAVEZ', NULLIF('7298723012',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'A. ZAMUDIO #20 T. BARRON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'A. ZAMUDIO #20 T. BARRON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PUÑA BLANCO ILSE', '7451324', '65407097', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PRODUCTO ELMI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PRODUCTO ELMI', NULLIF('35047040',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AV. ESPAÑA ENTRE MADRID Y TOLEDO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AV. ESPAÑA ENTRE MADRID Y TOLEDO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DONAIRE ZURITA MONICA', '4432151', '73096734', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTEC BOLIVIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTEC BOLIVIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB. LA AURORA K-11' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB. LA AURORA K-11')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES AYALA JENNY MARIA', '3096404', '71842081', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES AYALA JENNY MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES AYALA JENNY MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'AV AL VALLE CALLE #3' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'AV AL VALLE CALLE #3')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROJAS QUISPE CARLA CLAUDIA', '7304087', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROJAS QUISPE CARLA CLAUDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROJAS QUISPE CARLA CLAUDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'ZANJA DE CORONACION Y BAPTISTA #11' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'ZANJA DE CORONACION Y BAPTISTA #11')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CASAS BENAVIDES CARLA KAREN', '6798541', '61813415', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA CASAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA CASAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = '6 DE OCTUBRE Y SOTOMAYOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', '6 DE OCTUBRE Y SOTOMAYOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLEJAS LEDEZMA HANS EDDY', '7263489', '72466203', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PASTELERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PASTELERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'URB. SAN ISIDRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'URB. SAN ISIDRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VASQUEZ NINA NORMA YOLANDA', '5066069', '72302659', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LA REAL BLANCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LA REAL BLANCA', NULLIF('5066069010',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'AV. TTE. VILLA Y L. OQUENDO N° 704' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'AV. TTE. VILLA Y L. OQUENDO N° 704')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLANUEVA LAURA LUCILA', '5066432', '79115512', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PRODUCTOS MELANY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PRODUCTOS MELANY', NULLIF('5066432019',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'UGARTE ESQ. CAMACHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'UGARTE ESQ. CAMACHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CORIA POMA EUGENIA', '4047849', '75416149', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS AMIQUILINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS AMIQUILINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARANGAS' AND zona = '' AND direccion = 'CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARANGAS', '', 'CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARICA MAMANI YONILDA', '5069577', '72332164', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CLAUDY - TEX' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CLAUDY - TEX', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'NORTE' AND direccion = 'URB. LA AURORA J-9' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'NORTE', 'URB. LA AURORA J-9')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES AYALA MARIA DEL CARMEN', '5723657', '69577521', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES AYALA MARIA DEL CARMEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES AYALA MARIA DEL CARMEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'SUD ESTE' AND direccion = 'BOLIVAR, PISAGUA Y ANTOFAGASTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'SUD ESTE', 'BOLIVAR, PISAGUA Y ANTOFAGASTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BARRERA CONDORI FELIPA', '2728360', '75400775', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA SANTA LUCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA SANTA LUCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'NORTE' AND direccion = '6 DE OCTUBRE Y SOTOMAYOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'NORTE', '6 DE OCTUBRE Y SOTOMAYOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HERMOSO IBARRA MARIA ALEJANDRA', '7310424', '76154580', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PASTELERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PASTELERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'NORTE' AND direccion = 'AV TOMAS BARRON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'NORTE', 'AV TOMAS BARRON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CASAS MARAÑON PAOLA JIMENA', '9230351', '61666895', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAOLA JIMENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAOLA JIMENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = 'SUD' AND direccion = 'AV ESPAÑA, VILLAZON Y DEHENE #242' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', 'SUD', 'AV ESPAÑA, VILLAZON Y DEHENE #242')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GONZALES ARIAS JUDITH LILIAN', '3508261', '72325287', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA MANOS CREATIVAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA MANOS CREATIVAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CALLE VILLAZON, CARLOS PALENQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CALLE VILLAZON, CARLOS PALENQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MEDRANO COLQUE FLORENCIO', '604222', '72486127', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PRO SAVI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PRO SAVI', NULLIF('604222015',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CORAZON DE JESUS' AND direccion = 'ILLAMPU #13 ENTRE AROMA Y RODRIGUEZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CORAZON DE JESUS', 'ILLAMPU #13 ENTRE AROMA Y RODRIGUEZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PARDO VEIZAGA CARLOS VICTOR', '4039588', '75715166', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOLINOS DOÑA BERTHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOLINOS DOÑA BERTHA', NULLIF('4039588012',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AGUILAR DE SANCHEZ LUCRECIA', '1345760', '67231000', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAIME FLORES ABIMAEL RICHAR', '7302248', '67238148', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI CHALLACOTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI CHALLACOTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'UTD CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'UTD CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RODRIGUEZ CAHUANA ELENA', '5364873', '63637653', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI null JHOSELINE', '7351904', '73820916', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'COMUNIDAD PUCAÑA TINTA MARIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'COMUNIDAD PUCAÑA TINTA MARIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE FLORES ABDON', '7398906', '72316986', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EMPRENDIMIENTO DE TURISMO QHATZ Q''HOT Z''OÑI URUS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EMPRENDIMIENTO DE TURISMO QHATZ Q''HOT Z''OÑI URUS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTUARIO DE QUILLACAS' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTUARIO DE QUILLACAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTUARIO DE QUILLACAS', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALANOCA null TEODORO PRECILIANO', '609532', '63661508', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES SANCHEZ ABAD', '602245', '72471596', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARKA CHALLACOTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARKA CHALLACOTA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    VALUES ('CRUZ MOLLO HILDA', '5061114', '73831771', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOCOPA DE ALANOCA FERMINA', NULL, '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIAS INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIAS INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'UTD CHALLACOTA' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'UTD CHALLACOTA', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES MAMANI SILVIO FELIX', '5430182', '68336050', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE null ISIDORA', '71100553', '0', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES MAMANI FLORA', '3073936', '0', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'PRIMARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAIME CHALLAPA TEODORA', NULL, '72495090', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANCHEZ R. CARMEN', '12740506', '0', v_id_formacion, v_id_estado_civil)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MEJIA DE RODRIGUEZ BIGDONIA', NULL, '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAIME FLORES MIGUEL ANGEL', '7313515', '63667711', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GANADERO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GANADERO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RODRIGUEZ CAHUARA RICHARD', '7332498', '64073486', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'UTD CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'UTD CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES null LEONIDA MARTHA', '3553428', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARETSANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARETSANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'MARKA CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'MARKA CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARTINEZ MAMANI HERNAN', '665421', '71658870', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI MARKA CHALLACOTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI MARKA CHALLACOTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CHOQUE CRECILDA', '4068460', '72359745', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JANCO null ALFONSO', '5726923', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    VALUES ('CHOQUE null LUCY', '7275380', '73821283', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MONTOYA FLORES LORENZA', '12777294', '71103057', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GANADERO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GANADERO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES SANCHEZ SEBASTIAN', '993651', '6722436', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION INTI CHALLACOTA GANADERO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION INTI CHALLACOTA GANADERO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'UTD CHALLACOTA' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'UTD CHALLACOTA', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JANCO AGUILAR CARLOS', '4038824', '72309133', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'UTD CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'UTD CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAURA MENDIZABAL JHOSSELYN ESTEFANI', '8791526', '63876519', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES SANCHEZ ELENA CONSTANCIA', NULL, '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MARCA DEFINA', NULL, '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AMA DE CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AMA DE CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'UTD CHALLACOTA' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'UTD CHALLACOTA', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JANCO AXXXX LUIS', '576891', '72997173', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA INTI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA INTI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CHALLACOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CHALLACOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES MAMANI REYNALDO', '5764872', '71182520', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORES MAMANI REYNALDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORES MAMANI REYNALDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'JAEN Y POTOSI #515' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'JAEN Y POTOSI #515')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MERCADO CAÑIPA JAHEL', '2772348', '71856972', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HECHO A MANO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HECHO A MANO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = '' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', '')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MEDINA CONDORI GLADIS R.', '5738344', '67239839', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MEDINA CONDORI GLADIS R.' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MEDINA CONDORI GLADIS R.', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI AQUINO INGRID', '5702938', '71883017', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI AQUINO INGRID' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI AQUINO INGRID', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'CASA LOPEZ' AND direccion = 'CAMINO HUAYRAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CASA LOPEZ', 'CAMINO HUAYRAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ GXXXX DANITZA', NULL, '68336788', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PEREZ DANITZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PEREZ DANITZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOLANO FLORES HUGO', '7264153', '75428570', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOLANO FLORES HUGO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOLANO FLORES HUGO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'MIRA FLORES' AND direccion = 'CALLE LIZARRAGA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'MIRA FLORES', 'CALLE LIZARRAGA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERRES CHAMBI CLAUDINA', '7341960', '68336788', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUTIERRES CHAMBI CLAUDINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUTIERRES CHAMBI CLAUDINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'FINAL AGRONOMIA - VILLA CHALLACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'FINAL AGRONOMIA - VILLA CHALLACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHILE MIRANDA MARIEL DELIA', '5746784', '73313515', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUIQUE SPORT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUIQUE SPORT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'TOMAS FRIAS, ANTOFAGASTA Y PISAGUA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'TOMAS FRIAS, ANTOFAGASTA Y PISAGUA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ MAMANI MARIZA BALVINA', '3719907', '71851577', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANTOELE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANTOELE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'VILLA SANTIAGUITO Nº 19' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'VILLA SANTIAGUITO Nº 19', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOLIZ ANCASI ALEJANDRINA', '5730831', '67254935', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOLIZ ANCASI ALEJANDRINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOLIZ ANCASI ALEJANDRINA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'REYNALDO VASQUEZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'REYNALDO VASQUEZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ASTETE ENCINAS EDITH HELEN', '7260205', '72458850', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA RUBI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA RUBI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'TOLEDO' AND zona = 'TOLEDO' AND direccion = 'AV. DEL ESTUDIANTE Nº 135' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'TOLEDO', 'AV. DEL ESTUDIANTE Nº 135')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAMBI VINCENTI LIZET SHIRLEY', '4040457', '72344088', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE PRODUCCION DE CAÑAHUA DE TOLEDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE PRODUCCION DE CAÑAHUA DE TOLEDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'TOLEDO' AND zona = 'TOLEDO' AND direccion = 'AV. DEL ESTUDIANTE Nº 135' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', 'TOLEDO', 'AV. DEL ESTUDIANTE Nº 135')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VINCENTI VICENTE ELIZABETH', '3537397', '73816440', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION DE PRODUCCION DE CAÑAHUA DE TOLEDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION DE PRODUCCION DE CAÑAHUA DE TOLEDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB. CALA CAJA MZ. X LT. 22' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB. CALA CAJA MZ. X LT. 22')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUELLAR HARAZ PRIMA', '4047050', '67256103', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'F.G.B. GASTRONOMIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('F.G.B. GASTRONOMIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'LEON 156 V. GALVARRO Y 6 DE AGOSTO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'LEON 156 V. GALVARRO Y 6 DE AGOSTO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE ESPINOZA DE CORRALES ZULMA', '3100046', '72457116', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE ESPINOZA DE CORRALES ZULMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE ESPINOZA DE CORRALES ZULMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = '6 DE OCTUBRE HERRERA Y MONTESINOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', '6 DE OCTUBRE HERRERA Y MONTESINOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NAVA VILLARROEL FERNANDO MARTIN', '3071790', '74461916', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NAVA VILLARROEL FERNANDO MARTIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NAVA VILLARROEL FERNANDO MARTIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'POTOSI CASI ESQ. SANTA BARBARA Nº 6782' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'POTOSI CASI ESQ. SANTA BARBARA Nº 6782')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARANCIBIA LAMAS SUSAN GABRIELA', '3502828', '79406335', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARANCIBIA LAMAS SUSAN GABRIELA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARANCIBIA LAMAS SUSAN GABRIELA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'WASHINGTON Y BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'WASHINGTON Y BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FUENTES SOLIZ RAUL LUIS', '3420264', '73220579', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA QUIRQUINCHO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA QUIRQUINCHO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'RAYKA BACOVICK ENTRE AROMA Y VILLARROEL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'RAYKA BACOVICK ENTRE AROMA Y VILLARROEL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MALLCU FRIAS DAYSI JUDITH', '7267862', '68291862', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EPDEOR EMPRESA PUBLICA DEPARTAMENTAL DE ORURO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EPDEOR EMPRESA PUBLICA DEPARTAMENTAL DE ORURO', NULLIF('209122026',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'C TARIJA Y SANTA BARBARA Y JAEN #149' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'C TARIJA Y SANTA BARBARA Y JAEN #149')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HIDALGO CHOQUE MARINA', '2721908', '79404548', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISEÑOS MARINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISEÑOS MARINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'OESTE' AND direccion = 'C. BAPTISTA NO 8 FINAL JUNIN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'OESTE', 'C. BAPTISTA NO 8 FINAL JUNIN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VARGAS AGUILAR BLANCA', '2739939', '75713032', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TALLER GUBBIA S HOUSE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TALLER GUBBIA S HOUSE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'LEON PAGADOR , POTOSI Y VELASCO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'LEON PAGADOR , POTOSI Y VELASCO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI COLQUE DALIA', '7290705', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI COLQUE DALIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI COLQUE DALIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB SAN PABLO MZO U LOTE 4' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB SAN PABLO MZO U LOTE 4')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BALTAZAR GUARACHI DE COLQUE CARMEN', '7275491', '72307743', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOCIACION MADRES LIDERES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOCIACION MADRES LIDERES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'TEJERINA, JAEN Y TOMAS FRIAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'TEJERINA, JAEN Y TOMAS FRIAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAMACHO DE BERNABE MARIA DEL CARMEN', '7274849', '76150509', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'UNARDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('UNARDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'REYNALDO VASQUEZ ESQ J' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'REYNALDO VASQUEZ ESQ J')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES CHOQUE ANA MARIA', '5767583', '73842101', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS FLORES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS FLORES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'VELASCO Y OBLITAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'VELASCO Y OBLITAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ OROZCO DELIA', '4046480', '67208131', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA D Y D' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA D Y D', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'C. LINARES ESQ. ADOLFO MIER' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'C. LINARES ESQ. ADOLFO MIER')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DAZA YUCRA GABRIELA CRISTINA', '7307365', '68358649', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ASOMARS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ASOMARS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'OESTE' AND direccion = 'JUNIN, FRANCISCO MORALES Y AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'OESTE', 'JUNIN, FRANCISCO MORALES Y AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AJHUACHO LOVERA FANNY SUSANA', '4059847', '72466697', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIAS Y CREACIONES LOVERA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIAS Y CREACIONES LOVERA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'SN PEDRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'SN PEDRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA TERAN ROSA', '4058544', '61660662', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GARCIA TERAN ROSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GARCIA TERAN ROSA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'LINARES Y ADOLFO MIER #10' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'LINARES Y ADOLFO MIER #10')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA CABALLERO CLAUDIA ELVIRA', '1106814', '72472753', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES GADAYU' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES GADAYU', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'VINTO' AND direccion = 'C MARICAL BRAUN #11 ARCE Y BOLIVAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VINTO', 'C MARICAL BRAUN #11 ARCE Y BOLIVAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RODRIGUEZ SEVILLA AIDEE', '2764880', '68314584', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTE BONITO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTE BONITO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'BENJAMIN GUZMAN, AV SANTA ANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'BENJAMIN GUZMAN, AV SANTA ANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARELLANO FLORES TERESA', '3533962', '72335085', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES TERESA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES TERESA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'OESTE' AND direccion = 'AV. MAXIMILIANO PAREDES C. BALDIVIESO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'OESTE', 'AV. MAXIMILIANO PAREDES C. BALDIVIESO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VELIZ NINA LUIS HECTOR', '7179642', '77147732', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EPACR JACHA URU' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EPACR JACHA URU', NULLIF('415772024',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'SANTA ELENA' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SANTA ELENA', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VARGAS LACA BENANCIA', '4059720', '72303710', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VARGAS LACA BENANCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VARGAS LACA BENANCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SANTA ELENA' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SANTA ELENA', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI ABASTO IVONNE', NULL, '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI ABASTO IVONNE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI ABASTO IVONNE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'SANTA MARIA II' AND direccion = 'PASAJE ESTUDIANTIL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SANTA MARIA II', 'PASAJE ESTUDIANTIL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('IGNACIO OCAÑA LAURA', '5736813', '67208356', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IGNACIO OCAÑA LAURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IGNACIO OCAÑA LAURA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOLAMONTAÑO VDA. DE CRUZ ELIZABETH FLORA', '7283990', '72466070', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TOLAMONTAÑO VDA. DE CRUZ ELIZABETH FLORA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TOLAMONTAÑO VDA. DE CRUZ ELIZABETH FLORA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI CALLE SANDRA MARIBEL', '5749817', '68287384', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI CALLE SANDRA MARIBEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI CALLE SANDRA MARIBEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'SANTA ELENA' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SANTA ELENA', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ORIHUELA PADILLA VERONICA', '5768003', '75701718', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ORIHUELA PADILLA VERONICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ORIHUELA PADILLA VERONICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'SANTA ELENA, CALLE SUCRE' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SANTA ELENA, CALLE SUCRE', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUECALLATA HURTADO EULOGIA SEBASTIANA', '5910563', '68302523', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUECALLATA HURTADO EULOGIA S.' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUECALLATA HURTADO EULOGIA S.', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'RESD, HUANUNI CALLEM. BARZOLA Y 27 DE JULIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'RESD, HUANUNI CALLEM. BARZOLA Y 27 DE JULIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA VASQUEZ CRISTINA', '5724098', '60427845', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA VASQUEZ CRISTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA VASQUEZ CRISTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'SAN PEDRO C. LADISLOY' AND direccion = 'SAN PEDRO C. DALISLOY HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAN PEDRO C. LADISLOY', 'SAN PEDRO C. DALISLOY HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRISPIN MENDOZA SABINA', '3104554', '71186651', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRISPIN MENDOZA SABINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRISPIN MENDOZA SABINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'ADUARDO AVAROA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'ADUARDO AVAROA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE PARI MARY LUZ', '4063583', '72300737', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FAMILIAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FAMILIAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'SAJSANI' AND direccion = '' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAJSANI', '')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MANZANO PACO JHESICA', '7372317', '67266619', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MANZANO PACO JHESICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MANZANO PACO JHESICA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'SANTA MARIA' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SANTA MARIA', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NEGRETTY B. MARIA YSABEL', NULL, '71850542', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NEGRETTY B. MARIA YSABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NEGRETTY B. MARIA YSABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'JALAKERY' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'JALAKERY', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI null LEONARDA', '3358109', '72311135', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI LEONARDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI LEONARDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'PLAZA DEL ESTUDIANTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'PLAZA DEL ESTUDIANTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE PARI ROXANA', '5065304', '71886878', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE PARI ROXANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE PARI ROXANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'SANTA ELENA' AND direccion = 'ZONA SANTA ELENA CALLE POSOKONI - HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SANTA ELENA', 'ZONA SANTA ELENA CALLE POSOKONI - HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PORTUGAL ORIHUELA NAYELI JOSHEBETH', '7420785', '62829003', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PORTUGAL ORIHUELA NAYELI JOSHEBETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PORTUGAL ORIHUELA NAYELI JOSHEBETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'HUANUNI' AND direccion = 'PLAZA DEL ESTUDIANTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'HUANUNI', 'PLAZA DEL ESTUDIANTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA QUISPE NELLY', '7308471', '72351055', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FAMILIAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FAMILIAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'CASA LOPEZ' AND direccion = 'FISCALIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CASA LOPEZ', 'FISCALIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA SIÑANI MISHEL NICOL', NULL, '69594880', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUANCA SIÑANI MISHEL NICOL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUANCA SIÑANI MISHEL NICOL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'CASA LOPEZ' AND direccion = 'PLAZA DEL ESTUDIANTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CASA LOPEZ', 'PLAZA DEL ESTUDIANTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA CHOQUERIVE DANIT', '13189142', '78616474', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YUCRA CHOQUERIVE DANIT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YUCRA CHOQUERIVE DANIT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'SAJSANI' AND direccion = 'SAJSANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAJSANI', 'SAJSANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CAMACHO ELVA RAQUEL', '7395576', '67233567', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CAMACHO ELVA RAQUEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CAMACHO ELVA RAQUEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'HUANUNI, ZONA CASA LOPEZ' AND direccion = 'ZONA CASA LOPEZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'HUANUNI, ZONA CASA LOPEZ', 'ZONA CASA LOPEZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOTIÑO RIVERA MIRIAN VANIA', '12369863', '75412669', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FAMILIAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FAMILIAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'PLAZA DEL ESTUDIANTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'PLAZA DEL ESTUDIANTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA QUISPE LIZETH NOELIA', '12837451', '73818940', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'YUCRA QUISPE LIZETH NOELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('YUCRA QUISPE LIZETH NOELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'PLAZA DEL ESTUDIANTE' AND direccion = 'A LADO DEL BAÑO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'PLAZA DEL ESTUDIANTE', 'A LADO DEL BAÑO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LLANQUE null LUZMILA', NULL, '73819614', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LLANQUE LUZMILA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LLANQUE LUZMILA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'CASA LOPEZ' AND direccion = 'FISCALIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CASA LOPEZ', 'FISCALIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA SIÑANI JOSSETH JAQUELIN', '7298914', '76132501', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUANCA SIÑANI JOSSETH JAQUELIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUANCA SIÑANI JOSSETH JAQUELIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'SAJSANI' AND direccion = 'SAJSANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'SAJSANI', 'SAJSANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POLICARPIO MAMANI BELINDA', NULL, '74103454', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'POLICARPIO MAMANI BELINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('POLICARPIO MAMANI BELINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CASA LOPEZ' AND direccion = 'CASA LOPEZ AV. 16 DE JULIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CASA LOPEZ', 'CASA LOPEZ AV. 16 DE JULIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA CABRERA TANIA', '5763819', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FAMILIAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FAMILIAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'HUANUNI - CASA LOPE AV. 16' AND direccion = 'CASALOPEZ AV. 16 DE JULIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'HUANUNI - CASA LOPE AV. 16', 'CASALOPEZ AV. 16 DE JULIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA CHOQUE NEISY PAMELA', '5749838', '67202562', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FAMILIAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FAMILIAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'BARRIO NUEVO Nº 208' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'BARRIO NUEVO Nº 208', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRESPO AGUILAR JUDITH MARISOL', '5773796', '67230392', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRESPO AGUILAR JUDITH MARISOL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRESPO AGUILAR JUDITH MARISOL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'HUANUNI' AND direccion = 'Z. RINCON SAN PEDRO- HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'HUANUNI', 'Z. RINCON SAN PEDRO- HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CONDORI DE ESCOBAR SANDRA', '5767905', '72473736', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI CONDORI DE ESCOBAR SANDRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI CONDORI DE ESCOBAR SANDRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUZMAN CRUZ MARIBEL', '6645983', '63041031', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUZMAN CRUZ MARIBEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUZMAN CRUZ MARIBEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'HUANUNI' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'HUANUNI', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ GONZALES MARIA ISABEL', '3112915', '71883288', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORREZ GONZALES MARIA ISABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORREZ GONZALES MARIA ISABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = '' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', '', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ESTALLANI LOURDEZ', '6163943', '73847429', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI ESTALLANI LOURDEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI ESTALLANI LOURDEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'CASA PELEZ II CAMINO H.' AND direccion = 'CAMINO HUAYRAPATA ZONA CASA LOPEZ 2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CASA PELEZ II CAMINO H.', 'CAMINO HUAYRAPATA ZONA CASA LOPEZ 2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FABRICA SEVERINA', '4060588', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FABRICA SEVERINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FABRICA SEVERINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'SAJSANI' AND direccion = 'SAJSANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAJSANI', 'SAJSANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CANAVIRI HERRERA EDELMIRA', '7453822', '68353347', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CANAVIRI HERRERA EDELMIRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CANAVIRI HERRERA EDELMIRA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'CENTRAL CALLE SUCRE' AND direccion = 'CASA DE LA CULTURA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CENTRAL CALLE SUCRE', 'CASA DE LA CULTURA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE FLORES EMELIN', '7307950', '62753377', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE FLORES EMELIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE FLORES EMELIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'JALAKERY' AND direccion = 'ZONA JALAKERI (CALLE AROMA)' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'JALAKERY', 'ZONA JALAKERI (CALLE AROMA)')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA GUZMAN SONIA', '7303896', '68315010', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA GUZMAN SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA GUZMAN SONIA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'HUANUNI' AND zona = 'MERCADO CAMPESINO' AND direccion = 'HUANUNI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'MERCADO CAMPESINO', 'HUANUNI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONTRERAS CAMA FLORINDA', '3555538', '71180821', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONTRERAS CAMA FLORINDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONTRERAS CAMA FLORINDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'HUANUNI' AND zona = 'CASA LOPEZ' AND direccion = 'FRANZ TAMAYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'CASA LOPEZ', 'FRANZ TAMAYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA SIÑANI LIZ KAREN', '7343265', '77158356', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUANCA SIÑANI LIZ KAREN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUANCA SIÑANI LIZ KAREN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'SAN PEDRO' AND direccion = 'ZONA SAN PEDRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'SAN PEDRO', 'ZONA SAN PEDRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPEZ TINTAYA CAROLINA', '3541355', '72319032', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPEZ TINTAYA CAROLINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPEZ TINTAYA CAROLINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUANUNI' AND zona = 'NORTE' AND direccion = 'GRAL. CARRASCO Nº 151 ESQ. MENACHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUANUNI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUANUNI', 'NORTE', 'GRAL. CARRASCO Nº 151 ESQ. MENACHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MIER VALENCIA JANNETH DORA', '3088912', '71201200', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AURO FLOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AURO FLOR', NULLIF('3088912014',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'HUAYLLAMARCA' AND zona = 'COMUNIDAD RUMER UMA' AND direccion = 'RUMER UMA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'HUAYLLAMARCA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('HUAYLLAMARCA', 'COMUNIDAD RUMER UMA', 'RUMER UMA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMIREZ ORTIZ MARTHA', '2752285', '73820672', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMIREZ ORTIZ MARTHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMIREZ ORTIZ MARTHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CAÑADA STONGEST, PLATA Y PRESIDENTE MONTES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CAÑADA STONGEST, PLATA Y PRESIDENTE MONTES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MORALES ALCAZAR GRACIELA', '2368721', '72458254', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS LUCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS LUCIA', NULLIF('2368721011',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CALLE SAN FRANCISCO ENTRE MARIANO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CALLE SAN FRANCISCO ENTRE MARIANO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CARRION TICONA TANIA', '3501151', '67248881', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS TCT, TEJIDOS CREATIVOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS TCT, TEJIDOS CREATIVOS', NULLIF('3501151016',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'URB.  HUAJRA II MZ. 10 LOTE 15' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'URB.  HUAJRA II MZ. 10 LOTE 15')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZEBALLOS ROJAS DE VALDEZ DOLORES', '3078726', '70428516', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES VERSY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES VERSY', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHOQUECOTA' AND zona = 'COMUNIDAD CRUZAN' AND direccion = 'COMUNIDAD CRUZANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHOQUECOTA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHOQUECOTA', 'COMUNIDAD CRUZAN', 'COMUNIDAD CRUZANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONTRERAS MOLINA VICENTA', '3060869', '71181114', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PARRILLADA DON ROBERTO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PARRILLADA DON ROBERTO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = '6 DE AGOSTO ENTRE LIRA Y CONDARCO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', '6 DE AGOSTO ENTRE LIRA Y CONDARCO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ SALAS DE PEREIRA FELICIDAD', '5728091', '45876', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES GENESIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES GENESIS', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'HUAJARA 3' AND direccion = 'MZO 16 LOTE 18' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'HUAJARA 3', 'MZO 16 LOTE 18')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ESPINOZA CHOQUE FELIX FERNANDO ERICO', '4301711', '68294159', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SAN FRANCISCO DE ASIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SAN FRANCISCO DE ASIS', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'HUANCANE' AND direccion = 'HUANCANE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'HUANCANE', 'HUANCANE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BARRERA CONDORI REMIGIO', '626603', '72481625', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUESOS HUANCANE CHALLAPATA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUESOS HUANCANE CHALLAPATA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CALLE LA SALLE Nº 3 ESQ. VILLAZON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CALLE LA SALLE Nº 3 ESQ. VILLAZON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VARGAS GUACHALLA LUZ GRETHEL', '7317896', '74124650', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRIOLLITO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRIOLLITO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHOQUECOTA' AND zona = '' AND direccion = 'CHOQUECOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHOQUECOTA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHOQUECOTA', '', 'CHOQUECOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS COLQUE EVARISTA', '3061228', '72333161', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMOS COLQUE EVARISTA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMOS COLQUE EVARISTA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ANTEQUERA' AND zona = 'ANTEQUERA' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'ANTEQUERA', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SAUCE CHAVARRIA SABINO', '7417170', '73849532', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SAUCE CHAVARRIA SABINO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SAUCE CHAVARRIA SABINO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAIRANA SOLIZ JULIA', '4456149', '68321864', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAIRANA SOLIZ JULIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAIRANA SOLIZ JULIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ANTEQUERA' AND zona = '' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', '', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('EUGENIO CAYHUARA YSABEL', '7317827', '67264211', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EUGENIO CAYHUARA YSABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EUGENIO CAYHUARA YSABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
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
    VALUES ('RUIZ null MARGARITA JANETTE', '4022145', '72494832', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RUIZ  MARGARITA JANETTE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RUIZ  MARGARITA JANETTE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'RICON MIRAFLORES' AND direccion = 'ANTEQUERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'RICON MIRAFLORES', 'ANTEQUERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BAUTISTA ARELY FILOMENA', '6576435', '72481161', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VARIAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VARIAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JANCO HURTADO ANA MARIA', '3072358', '73834046', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'TOLEDO' AND zona = '' AND direccion = 'TOLEDO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TOLEDO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TOLEDO', '', 'TOLEDO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZENTENO MAMANI MARIA ISABEL', '7268980', '72349529', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZENTENO MAMANI MARIA ISABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZENTENO MAMANI MARIA ISABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ANTEQUERA' AND zona = 'ANTEQUERA' AND direccion = 'PEÑAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ANTEQUERA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ANTEQUERA', 'ANTEQUERA', 'PEÑAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FERNANDEZ PACHECO JUSTINA', '2724952', '67228198', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS JUSTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS JUSTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE MARTINEZ  AURELIA', '5747243', '68286666', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE MARTINEZ  AURELIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE MARTINEZ  AURELIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACHECO CONDORI DILMA', NULL, '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PACHECO CONDORI DILMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PACHECO CONDORI DILMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'PAGADOR Nº 4722 SGTO. FLORES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'PAGADOR Nº 4722 SGTO. FLORES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAMPOS ROSALES MARIA CRISTINA', '3521545', '70414668', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PACHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PACHA', NULLIF('3521545012',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'ENRIQUE N. KEMD. MDO. B. MAGISTERIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'ENRIQUE N. KEMD. MDO. B. MAGISTERIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LEON GUZMAN VICTORIA', '3100369', '72344364', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONFECCIONES TELAFE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONFECCIONES TELAFE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PAREDEZ HUARACHI SANTUZA', '4062034', '74135478', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FAMILIAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FAMILIAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU MANAZAYA' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU MANAZAYA', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PAREDES HUARACHI MIGUEL', '12677181', '72457250', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAREDES HUARACHI MIGUEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAREDES HUARACHI MIGUEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU WISTULLANI' AND direccion = 'AYLLU WISTULLANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU WISTULLANI', 'AYLLU WISTULLANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ LAZARO ROXANA', '5747792', '63642041', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ LAZARO ROXANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ LAZARO ROXANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU AYPARAVI' AND direccion = 'AYLLU AYPARAVI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU AYPARAVI', 'AYLLU AYPARAVI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHINO CONDORI MARCELINA', '5747921', '67227283', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHINO CONDORI MARCELINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHINO CONDORI MARCELINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU WISTULLANI' AND direccion = 'AYLLU WISTULLANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU WISTULLANI', 'AYLLU WISTULLANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI FELIPE BENEDICTO', '5747804', '72359521', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI FELIPE BENEDICTO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI FELIPE BENEDICTO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO MAMANI BENEDICTA', '3541438', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    VALUES ('QUISPE CONDORI ELIZA', '703812430', '71889578', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LABORES DE CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LABORES DE CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
DECLARE
    v_id_persona INT;
    v_id_empresa INT;
    v_id_formacion INT;
    v_id_estado_civil INT;
    v_id_rubro INT;
    v_id_ubicacion INT;
BEGIN
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
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
    VALUES ('CONDORI MAMANI MARIA', '3547254', '67263361', v_id_formacion, v_id_estado_civil)
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
    VALUES ('MAMANI FELIPE SONIA', '5722767', '71105183', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LABORES DE CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LABORES DE CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    VALUES ('MAMANI LOZA ESTEFANIA', '5747327', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AMA DE CASA Y AGRICULTURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AMA DE CASA Y AGRICULTURA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU MANANSAYA' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU MANANSAYA', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FELIPE LAZARO VIVIANA', '5068874', '73810249', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELIPE LAZARO VIVIANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELIPE LAZARO VIVIANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU WISTRULLANI' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU WISTRULLANI', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI CONDORI MANAZA', '3519729', '68317605', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI CONDORI MANAZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI CONDORI MANAZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU ARANSAYA' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU ARANSAYA', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ CONDORI VIRGINIA', '5060847', '68297930', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ CONDORI VIRGINIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ CONDORI VIRGINIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO QUISTE MARCELINA', '3553938', '74120076', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LABORES DE CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LABORES DE CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = 'CHIPAYA' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'CHIPAYA', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI QUISPE JHEIDY LOURDEZ', '12676594', '68325998', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS BASICOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS BASICOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI CONDORI ZULMA', '5747882', '67949994', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI CONDORI ZULMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI CONDORI ZULMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO VILLA NATALIA', '4078291', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LABORES DE CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LABORES DE CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPA LOPEZ EULALIA', '3515620', '71887115', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LABORES DE CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LABORES DE CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOZA MAMANI CARLOS', '272896', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGRICULTOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGRICULTOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = 'CHIPAYA' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'CHIPAYA', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO VILLCA JASINTA', '4066811', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FAMILIAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FAMILIAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ MAMANI LIDIA', '5721591', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FAMILIAR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FAMILIAR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI LOZA EPIFANIO', '4060775', '74118569', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGRICULTURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGRICULTURA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES LAZARO SANTIAGO', '5738371', '68309179', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGRICULTOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGRICULTOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PAREDEZ MOLLO LUIS', '5747786', '68316972', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGRICULTURA Y TRANSPORTE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGRICULTURA Y TRANSPORTE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU WISTULLANI' AND direccion = 'AYLLU WISTULLANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU WISTULLANI', 'AYLLU WISTULLANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ MAMANI MAXIMA', '2758835', '72337390', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ MAMANI MAXIMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ MAMANI MAXIMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU MANASAYA' AND direccion = 'AYLLU MANASAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU MANASAYA', 'AYLLU MANASAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VIZA GONZALES DINA', '4049249', '73844298', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VIZA GONZALES DINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VIZA GONZALES DINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANO CONDORI ALICIA ALVINA', '7300537', '73837298', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LABORES DE CASA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LABORES DE CASA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU MANASAYA' AND direccion = 'AYLLU MANASAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU MANASAYA', 'AYLLU MANASAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ CONDORI MARIA', '4026810', '68303586', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ CONDORI MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ CONDORI MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLUAYPARAVI' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLUAYPARAVI', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI CONDORI VIRGINIA', '5747918', '67209680', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONDORI CONDORI VIRGINIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONDORI CONDORI VIRGINIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PAREDEZ HUARACHI RUBEN', '7300588', '74211677', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAREDEZ HUARACHI RUBEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAREDEZ HUARACHI RUBEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = 'CHIPAYA' AND direccion = 'SALON DE GAYOC' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'CHIPAYA', 'SALON DE GAYOC')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI LOPEZ JENNY', '7393424', '63654263', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI LOPEZ JENNY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI LOPEZ JENNY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU MANASAYA' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU MANASAYA', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ CONDORI SOFIA', '7300484', '67216748', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ CONDORI SOFIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ CONDORI SOFIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU AYCARAVI' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU AYCARAVI', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PAREDEZ MAMANI VICTORIA', '5733326', '72351426', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAREDEZ MAMANI VICTORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAREDEZ MAMANI VICTORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = 'AYLLU ARANSAYA' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', 'AYLLU ARANSAYA', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAZARO MAMANI NATIVIDAD', '7377657', '68140268', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAZARO MAMANI NATIVIDAD' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAZARO MAMANI NATIVIDAD', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHIPAYA' AND zona = '' AND direccion = 'CHIPAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHIPAYA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHIPAYA', '', 'CHIPAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI MAMANI SANTOS', '7336221', '71390416', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGRICULTOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGRICULTOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    VALUES ('FELIPE QUISPE MARINELA', '7421232', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARINELA FELIPE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARINELA FELIPE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'VINTO' AND direccion = 'CALLE 27 - CALLE 1' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VINTO', 'CALLE 27 - CALLE 1')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE MIRANDA MIGUEL ANGEL', '5759012', '67256188', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUIRK BEER CERVEZA ARTESANAL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUIRK BEER CERVEZA ARTESANAL', NULLIF('5759012019',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'DEHENE NO.103, ALAMASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'DEHENE NO.103, ALAMASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CARRIZO YAVI GONZALO', '7349213', '62786110', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA EN MADERA TRUPAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA EN MADERA TRUPAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'GENOVENA RIOS, JUAN MINOR #2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'GENOVENA RIOS, JUAN MINOR #2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI PEREZ LIDIA SARA', '7304979', '64782778', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONFECCIONES LUZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONFECCIONES LUZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'BULLAIN ESQUINA VICUÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'BULLAIN ESQUINA VICUÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CHOQUE ROGELIA ROSALIA', '4079567', '76131756', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROGELIA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROGELIA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'SORIA GALVARRO LIRA Y OBLITAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'SORIA GALVARRO LIRA Y OBLITAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUIROGA LAIME JUAN ROGER', '7389809', '75421211', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JUAN QUIROGA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JUAN QUIROGA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'COLÓN ARMANDO ROSAS Y ILLAMPU' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'COLÓN ARMANDO ROSAS Y ILLAMPU')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LLAMPA SACAMA JUSTINA', '7395992', '63194493', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JUSTINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JUSTINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'CENTRAL' AND direccion = 'COMUNIDAD SAN PEDRO PUNI LLAVE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'CENTRAL', 'COMUNIDAD SAN PEDRO PUNI LLAVE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHUNGARA MAMANI CASIMIRO', '2730300', '74938076', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CASIMIRO CHUNGARA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CASIMIRO CHUNGARA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'EX - TERMINAL' AND direccion = 'RODRIGUEZ 181, TARAPACA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'EX - TERMINAL', 'RODRIGUEZ 181, TARAPACA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUJAN CHAVEZ RAMIRO', '2762678', '72317807', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DESTILERIA DON DIABLO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DESTILERIA DON DIABLO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'PASAJE X N°575 ENTRE LIRA Y OBLITAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'PASAJE X N°575 ENTRE LIRA Y OBLITAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GONGORA SARMIENTO MIRTA ROXANA', '3514388', '72491062', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BETOS - SPORT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BETOS - SPORT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'GENOVENA RIOS, JUAN MINOR #2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'GENOVENA RIOS, JUAN MINOR #2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ ALEJO DE MAMANI ANDREA', '4282718', '73884131', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONFECCIONES LUZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONFECCIONES LUZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'CALLE POTOSÍ Y SOLEDAD' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'CALLE POTOSÍ Y SOLEDAD')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MARCA JOSÉ LUIS', '7423570', '77146565', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL - CORTE CONFECCIÓN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL - CORTE CONFECCIÓN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'CALLE BRASIL Y ADOLFO MIER' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'CALLE BRASIL Y ADOLFO MIER')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE LIMA ANTONIETA', '5353678', '72470748', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANTONIETA CHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANTONIETA CHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'WIÑAYKUSI ZONA KANTUTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'WIÑAYKUSI ZONA KANTUTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUETICLLA ORDOÑEZ FANNY', '3075280', '73838782', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FANNY CHOQUETICLLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FANNY CHOQUETICLLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'PROLONG. S. GALVARRO N°221 E/CHARCAS Y SOTO MAYOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'PROLONG. S. GALVARRO N°221 E/CHARCAS Y SOTO MAYOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MEDRANO VILLEGAS ALEJANDRO FRANCISCO', NULL, '77287064', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOS VINGOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOS VINGOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB. MILLENIUM ISRAEL Nº3' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB. MILLENIUM ISRAEL Nº3')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHURQUI CHILA RICHARD BORIS', '4975908', '76147852', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHURQUI CHILA RICHARD BORIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHURQUI CHILA RICHARD BORIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'URB. 9 DE JUNIO MZ 19 LOTE 2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'URB. 9 DE JUNIO MZ 19 LOTE 2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAYO CACERES ALEJANDRO JHAIR', '7329833', '61657833', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAYO CACERES ALEJANDRO JHAIR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAYO CACERES ALEJANDRO JHAIR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'PUMAS ANDINOS' AND direccion = 'URB. PUMAS ANDINOS L/18 MZ 137' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'PUMAS ANDINOS', 'URB. PUMAS ANDINOS L/18 MZ 137')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SEQUEIROS QUISPE FELIX', '680773', '68311527', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SEQUEIROS QUISPE FELIX' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SEQUEIROS QUISPE FELIX', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'PERALTA SORUCO ESQ. AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'PERALTA SORUCO ESQ. AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ FLORES LIDIA', '4034306', '73823822', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUTIERREZ FLORES LIDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUTIERREZ FLORES LIDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE LA PAZ Y GENERAL CARRASCO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE LA PAZ Y GENERAL CARRASCO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VIRACA PACHECO MARIA ISABEL', '5740093', '60430520', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VIRACA PACHECO MARIA ISABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VIRACA PACHECO MARIA ISABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'URB. SANTA ROSA #5' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'URB. SANTA ROSA #5')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANACALLE GUTIERREZ ALEJANDRA', '3551855', '70434567', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANACALLE GUTIERREZ ALEJANDRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANACALLE GUTIERREZ ALEJANDRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'VILLA VISCACHANI' AND direccion = 'URB. VILLA VISCACHANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VILLA VISCACHANI', 'URB. VILLA VISCACHANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MARTINEZ ALEJANDRA', '10565929', '67248623', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE SANCHEZ NARVAEZ Nº 2 LA TABLADA Y G. RIOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE SANCHEZ NARVAEZ Nº 2 LA TABLADA Y G. RIOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI BALTAZAR IVAN', '5764768', '76154276', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IVAN CONDORI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IVAN CONDORI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'MURGUIA ENTRE SORIA GALVARRO Y 6 DE OCTUBRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'MURGUIA ENTRE SORIA GALVARRO Y 6 DE OCTUBRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SILVA SAAVEDRA FERNANDO', '7692304', '78618012', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FERNANDO SILVA SAAVEDRA SALÓN FASHION LOOK' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FERNANDO SILVA SAAVEDRA SALÓN FASHION LOOK', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'AV. TACNA S/N JAEN Y TARAPACA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'AV. TACNA S/N JAEN Y TARAPACA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FERNANDEZ FLORES JORGE ENRRIQUE', '4023522', '71183558', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JORGE FERNANDEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JORGE FERNANDEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'TACNA ENTRE ARCE Y SAN FELIPE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'TACNA ENTRE ARCE Y SAN FELIPE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ESCALERA JAIMES KARLA PATRICIA', '3538169', '72482691', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES KARLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES KARLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'VILLA VISCACHANI' AND direccion = 'URB. VILLA VISCACHANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VILLA VISCACHANI', 'URB. VILLA VISCACHANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUCHO MAMANI VITALIA', '12589619', '74123230', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'EX TERMINAL' AND direccion = 'SEBASTIAN PAGADOR (BENI Y 2 DE AGOSTO)' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'EX TERMINAL', 'SEBASTIAN PAGADOR (BENI Y 2 DE AGOSTO)')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DELGADO MAMANI DE MAMANI FABIA', '634854', '72457842', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANÍAS SANTIAGO DE HUARI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANÍAS SANTIAGO DE HUARI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'PASAJE SAN MARTIN ENTRE LEON Y RODRIGUEZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'PASAJE SAN MARTIN ENTRE LEON Y RODRIGUEZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GOMEZ GARCIA MACKAY JESSICA NEDDA', '7416346', '63984698', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BIOK COSMETICA NATURAL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BIOK COSMETICA NATURAL', NULLIF('7280932015',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'PLAZA MURPHY' AND direccion = 'FINAL AV. PLAZA MURPHY' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'PLAZA MURPHY', 'FINAL AV. PLAZA MURPHY')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOTO QUISPE KARINA ROSARIO', '12772635', '68313870', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA', NULLIF('0',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'TARIJA ENTRE COLÓN Y VILLAZÓN #659' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'TARIJA ENTRE COLÓN Y VILLAZÓN #659')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MONTOYA CHOQUE GINES JOSÉ', '2752311', '71106064', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTOS ANDINOS NATURALES DEL SUR ANDESUR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTOS ANDINOS NATURALES DEL SUR ANDESUR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'C COLQUIRI N 24' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'C COLQUIRI N 24')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PONGO ROCHA ISABEL', '7298043', '71105267', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HELADOS LÁCTEOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HELADOS LÁCTEOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'PAGADOR #4722 ENTRE SARGENTO FLORES Y OBLITAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'PAGADOR #4722 ENTRE SARGENTO FLORES Y OBLITAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RODRIGUEZ MAMANI JHELDY NADIR', '9986049', '65432720', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SAZONADORES MUNAY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SAZONADORES MUNAY', NULLIF('3521545012',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'TURCO' AND zona = 'CENTRAL' AND direccion = 'ORURO Y MARLIN QUISPE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'TURCO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('TURCO', 'CENTRAL', 'ORURO Y MARLIN QUISPE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLLO FLORES BRIGIDA ROSS MARY', '7260203', '74157894', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ADEPASUT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ADEPASUT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'URB. CORDEOR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'URB. CORDEOR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VICENTE FLORES SILVIA', '4052398', '75403864', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SILVIA VICENTE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SILVIA VICENTE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'POOPO' AND direccion = 'CAMPERO Y OBLITAS POTOSÍ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'POOPO', 'CAMPERO Y OBLITAS POTOSÍ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GONZALES BOLAÑOS ELMER REYNALDO', '5064476', '68293989', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ELMER GONZALES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ELMER GONZALES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'VILLANUEVA Y CONDARCO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'VILLANUEVA Y CONDARCO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AMBROSIO PICACHURI MARGARA', '3546102', '69253464', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARGARA AMBROSIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARGARA AMBROSIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'TARAPACÁ ENTRE CALLE E Y F' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'TARAPACÁ ENTRE CALLE E Y F')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOTO MANZANO MARGARITA', '5062351', '69477515', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS CON AMOR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS CON AMOR', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'VILLA PUENTE' AND direccion = 'AV. PANAMERICANA Y CALLE SOLEDAD' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VILLA PUENTE', 'AV. PANAMERICANA Y CALLE SOLEDAD')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVAREZ HINOJOSA XIMENA', '13842303', '71188546', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTACIÓN REPOSTERÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTACIÓN REPOSTERÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'URBANIZACIÓN 2000' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'URBANIZACIÓN 2000')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TARQUI MARCA OLGA', '9955702', '72305376', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'OLGA TARQUI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('OLGA TARQUI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'PANAMERICANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'PANAMERICANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHINO TITO AURORA', '5739524', '72357942', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'AV. DE LA INTEGRACIÓN - FRENTE RADIO BAAIS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'AV. DE LA INTEGRACIÓN - FRENTE RADIO BAAIS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ ROJAS ROSMERY', '3082639', '72318053', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'AV. PANAMERICANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'AV. PANAMERICANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE AJNO MARIA', '4245011', '71856356', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA FINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA FINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CARRETERA A COCHABAMBA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CARRETERA A COCHABAMBA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PASCUAL CHIARA JAVIER', '4074516', '68285737', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TALLER DE CONFECCIÓN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TALLER DE CONFECCIÓN', NULLIF('4074516',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CAÑADA STRONGUEST' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CAÑADA STRONGUEST')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARTINEZ LOPEZ BENIGNA', '4056033', '71109681', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARTINEZ LOPEZ BENIGNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARTINEZ LOPEZ BENIGNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'AV. INTEGRACIÓN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'AV. INTEGRACIÓN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ PINAYA NILDA', '7380457', '72499895', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA', NULLIF('0',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    VALUES ('QUISPE PACAJE FELISA', '620323', '67063473', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FELISA QUISPE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FELISA QUISPE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CURAHUARA DE CARANGAS' AND zona = '' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CURAHUARA DE CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CURAHUARA DE CARANGAS', '', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA QUISPE MIGUEL ANGEL', '2423967', '72488384', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SAN LORENZO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SAN LORENZO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARCA LLAVE FIDELIA FILEMONA', '3548827', '67259155', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FIDELIA MARCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FIDELIA MARCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'COMUNIDAD HUALLCHAPI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'COMUNIDAD HUALLCHAPI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES CUIZARA ROSA', '3545508', '73817393', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANÍA EN ARCILLA HUALLCHAPI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANÍA EN ARCILLA HUALLCHAPI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AQUINO DE CHOQUETICLLA PRIMITIVA', '3044605', '73842633', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PRIMITIVA AQUINO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PRIMITIVA AQUINO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'TOLOMA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'TOLOMA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARCA ALCALA GUMERCINDA', '3559558', '72463008', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUMERCINDA MARCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUMERCINDA MARCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AQUINO CHOQUETICLLA MAXIMA', '3044609', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAXIMA AQUINO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAXIMA AQUINO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA SASANCA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA SASANCA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ ESPINOZA DE RAMOS ISIDORA', '5732654', '67205827', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ISIDORA CRUZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ISIDORA CRUZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA VITO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA VITO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE LLAVE FLORENCIA', '645582', '67215698', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORENCIA COLQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORENCIA COLQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI AQUINO JUANA EVARISTA', '4077549', '72306882', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JUANA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JUANA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'AV. DEL MINERO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'AV. DEL MINERO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZENTENO HUANCA DE MORALES JULIETA', '5748009', '74253408', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZENTENO HUANCA JULIETA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZENTENO HUANCA JULIETA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUETICLLA ALVAREZ GABY LOURDES', '12997980', '77146414', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GABY CHOQUETICLLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GABY CHOQUETICLLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RIOS CANAVIRI PAULINA', '651020', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PAULINA RIOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PAULINA RIOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'SILLOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'SILLOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE VILLCA FRANCISCO', '2774486', '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FRANCISCO QUISPE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FRANCISCO QUISPE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'SILLOTA VITO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'SILLOTA VITO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI AGUILAR REMIGIO', '3091803', '76152650', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REMIGIO MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REMIGIO MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'SILLOTA TOLOMA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'SILLOTA TOLOMA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS AROJA LEONARDA', '4069062', '75408594', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LEONARDA RAMOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LEONARDA RAMOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVAREZ AQUINO AMALIA', '7282219', '69579204', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AMALIA ALVAREZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AMALIA ALVAREZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUETICLLA FERNANDEZ POLIGINA', '3543817', '71103654', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'POLIGINA CHOQUETICLLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('POLIGINA CHOQUETICLLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VALENTE CHAMBI FRANCISCA', '2784881', '73808614', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FRANCISCA VALENTE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FRANCISCA VALENTE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARCA AQUINO VERONICA', '7286589', '69576520', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VERONICA MARCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VERONICA MARCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVAREZ AQUINO JUANA EMMA', '7395056', '74148533', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JUANA ALVAREZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JUANA ALVAREZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA ANCASI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA ANCASI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS NINA JHOVANNA', '7412819', '73842633', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JHOVANNA RAMOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JHOVANNA RAMOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'CENTRAL' AND direccion = 'CALLE LA PAZ Y AVENIDA LADISLAO CABRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'CENTRAL', 'CALLE LA PAZ Y AVENIDA LADISLAO CABRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MUNZÓN MAMANI MARIBEL', '4058476', '72496744', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LÁCTEOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LÁCTEOS', NULLIF('0',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CESAR ACHAVAL N°21 A Y FRANCISCO MANCHEGO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CESAR ACHAVAL N°21 A Y FRANCISCO MANCHEGO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARCE SANCHEZ DE BOHORQUEZ ROSARIO DEL CARMEN', '3108087', '72340681', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CARMEN ARCE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CARMEN ARCE', NULLIF('0',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '1RO DE MAYO' AND direccion = 'MANUEL MOLINA Y BUSTAMANTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '1RO DE MAYO', 'MANUEL MOLINA Y BUSTAMANTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI BOLAÑOS FORTUNATA', '7344207', '68290081', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FORTUNATA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FORTUNATA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'VINTO' AND direccion = 'PISAGUA ENTRE ALTO DE LA ALIANZA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VINTO', 'PISAGUA ENTRE ALTO DE LA ALIANZA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUINTANILLA MAMANI ELIZABETH', '8638502', '67239461', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ELIZABETH Q.' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ELIZABETH Q.', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'VILLA VISCACHANI' AND direccion = 'URB. VILLA VISCACHANI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VILLA VISCACHANI', 'URB. VILLA VISCACHANI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUCHO MAMANI CARMEN ROSA', '8588841', '67253119', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TAPIA ZERBANTES JESUSA', '640521', '77148046', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TAPIA ZERBANTES JESUSA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TAPIA ZERBANTES JESUSA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'ALTO SAN PEDRO ZACONETA RAMOS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'ALTO SAN PEDRO ZACONETA RAMOS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOROCO VILLEGAS JAHEL PAOLA', '7262316', '73845609', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JAEL MOROCO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JAEL MOROCO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'SORIA GALVARRO MONTECINOS Y HERRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'SORIA GALVARRO MONTECINOS Y HERRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOTO HUERTA DAYSI JACQUELINE', '3090349', '70423043', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DAYSI SOTO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DAYSI SOTO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SANTA ANA II' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SANTA ANA II', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AVERANGA CABALLERO MARGARITA', '7486023', '78606568', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARGARITA AVERANGA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARGARITA AVERANGA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NOR OESTE' AND direccion = 'PARQUE ECOLOGICO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR OESTE', 'PARQUE ECOLOGICO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ HUANCA MARTHA', '5061615', '73846688', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARTHA CRUZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARTHA CRUZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'SEBASTIAN PAGADOR FASE II' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'SEBASTIAN PAGADOR FASE II')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ LUQUE ZULEMA RAQUEL', '8297037', '74108157', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ZULEMA CRUZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ZULEMA CRUZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AMERICA MADRID' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AMERICA MADRID')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE QUISPE MARIA', '3100102', '71106857', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARIA CHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARIA CHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'EL PARAISO (SUD)' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'EL PARAISO (SUD)', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ACHACOLLO CHARQUE KARINA MAGALÍ', '132456999', '72304055', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'KARINA ACHACOLLO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('KARINA ACHACOLLO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'TOTORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'TOTORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('OROZCO TORREZ MARIA EUGENIA', '3068254', '71189966', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARIA OROZCO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARIA OROZCO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'PERALTA SORUCO ESQ. ARCE #274' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'PERALTA SORUCO ESQ. ARCE #274')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RUEDA PAREDES MARCELINO', '3117498', '71852999', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONFECCIÓN DE TRAJES MARCEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONFECCIÓN DE TRAJES MARCEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'MURGUIA #443, 6 DE OCTUBRE Y POTOSÍ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'MURGUIA #443, 6 DE OCTUBRE Y POTOSÍ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FIORILO BARRIOS ERIKA ROSEMARIE', '2762777', '73811431', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ACES SPORTS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ACES SPORTS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'VINTO' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VINTO', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AYANOME CORDOVA JACINTA', '6710208', '67238003', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JACINTA AYANOME' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JACINTA AYANOME', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'URB. PARAISO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'URB. PARAISO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LAIME FLORES JOSE LUIS', '3506970', '73845524', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CAPACITADOR MAQUINAS TEXTILES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CAPACITADOR MAQUINAS TEXTILES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CORAZÓN DE JESÚS' AND direccion = 'SAN JOSÉ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CORAZÓN DE JESÚS', 'SAN JOSÉ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZAMUDIO VILLCA FIDELIA', '8560981', '63596873', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FIDELIA ZAMUDIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FIDELIA ZAMUDIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'VINTO' AND direccion = 'PANTALEÓN DALENCE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VINTO', 'PANTALEÓN DALENCE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ SERPA AGUSTINA', '7872983', '67218584', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AGUSTINA GUTIERREZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AGUSTINA GUTIERREZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'PAMPA SORA' AND direccion = 'URB. UMANCOLLO PAMPA SORA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'PAMPA SORA', 'URB. UMANCOLLO PAMPA SORA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE NAVILLO MAXIMA', NULL, '63378459', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'TARAPACÁ, JAÉN Y SANTA BARBARA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'TARAPACÁ, JAÉN Y SANTA BARBARA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEDREGAL BECERRA ALFREDO', '2740742', '72307530', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'INSATEX' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('INSATEX', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'COCHABAMBA Y CAMPO JORDAN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'COCHABAMBA Y CAMPO JORDAN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE MAMANI GROVER', NULL, '71776256', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SARTAÑANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SARTAÑANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SAN FELIPE DE  AUSTRIA' AND direccion = 'SAN FELIPE, URQUIDI Y CALLE 400' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SAN FELIPE DE  AUSTRIA', 'SAN FELIPE, URQUIDI Y CALLE 400')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CANAZA TRONCOSO FLORENCIO', '625855', '68324044', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORENCIO CANAZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORENCIO CANAZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CALLE KENNEDY' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CALLE KENNEDY')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES LOPEZ DE RAMOS GLORIA MARIA', '3063859', '72309630', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GLORIA FLORES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GLORIA FLORES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'BELTRAN Y SANTA CRUZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'BELTRAN Y SANTA CRUZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TICONA COLQUECHUYMA ABRIL', '6665589', '72723791', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ABRIL TICONA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ABRIL TICONA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'JAÉN N°781 IQUIQUE PISAGUA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'JAÉN N°781 IQUIQUE PISAGUA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LIMACHI SILVESTRE MARIA', '2754570', '74152557', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANÍAS MAZLIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANÍAS MAZLIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'ARICA Y TOMÁS FRIAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'ARICA Y TOMÁS FRIAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VICTORIA CALLAPA RODOLFO', '3041360', '68355780', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RODOLFO VICTORIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RODOLFO VICTORIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CORAZÓN DE JESÚS' AND direccion = 'FINAL PETOT' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CORAZÓN DE JESÚS', 'FINAL PETOT')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PICACHURI CALLA MARTHA', '5133057', '73842179', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARTHA PICACHURI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARTHA PICACHURI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = '12 DE OCTUBRE Y DEHENE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', '12 DE OCTUBRE Y DEHENE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ACAPA CHINCHE GABRIELA', '3523148', '73835240', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'APDECAM' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('APDECAM', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SEPARADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'TUPIZA Y AV. PANAMERICANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'TUPIZA Y AV. PANAMERICANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CASTELLÓN RAMIREZ CRISTINA', '3075520', '63639209', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CRISTINA CASTELLÓN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CRISTINA CASTELLÓN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'SANTA BARBARA ENTRE PAGADOR Y POTOSÍ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'SANTA BARBARA ENTRE PAGADOR Y POTOSÍ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RUEDA CHECA MAXIMA', '2735733', '74100684', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MÁXIMA RUEDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MÁXIMA RUEDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CARMEN' AND direccion = 'URBANIZACION EL CARMEN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CARMEN', 'URBANIZACION EL CARMEN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINA MAMANI SIMONIE', '3345280', '72314542', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SIMIONA NINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SIMIONA NINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '1RO DE MAYO' AND direccion = 'PROLONGACIÓN CAMPO JORDÁN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '1RO DE MAYO', 'PROLONGACIÓN CAMPO JORDÁN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ORTIZ CHOQUE MIGUELINA', '3074589', '71882066', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIGUELINA ORTIZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIGUELINA ORTIZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD - PLAN 500' AND direccion = 'TUPAC KATARI Y MAMAOCLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD - PLAN 500', 'TUPAC KATARI Y MAMAOCLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI JUANIQUINA BERTHA', '7302224', '69577378', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS BERTHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS BERTHA', NULLIF('',''), TRUE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'AV. PANAMERICANA, CALLE OBDULIA CALLEJAS Y TARIJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'AV. PANAMERICANA, CALLE OBDULIA CALLEJAS Y TARIJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLATA AROJA LIZETH PATTY', '7419367', '78608152', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL ARTESANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL ARTESANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'AEROPUERTO' AND direccion = 'URB. LOS ROSALES 1 LOTE #9' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'AEROPUERTO', 'URB. LOS ROSALES 1 LOTE #9')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GARCIA VARGAS ILDA', '5134196', '67248864', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANÍAS EN PALILLOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANÍAS EN PALILLOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'SILLOTA VITO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'SILLOTA VITO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MAMANI MIRIAM', '7410935', '63655562', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIRIAM MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIRIAM MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'TENIENTE LEÓN ESQ. LUIS ESPINAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'TENIENTE LEÓN ESQ. LUIS ESPINAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOLINA NINAJA ANGELA DANITZA', '5756213', '62843035', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALEGNA GRAFTS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALEGNA GRAFTS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'POTOSÍ ENTRE MONTESINOS Y HERRERA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'POTOSÍ ENTRE MONTESINOS Y HERRERA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MURIEL PERALTA NEIZA', '5279562', '62729066', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TRONQUITO DORADO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TRONQUITO DORADO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV. PANAMERICANA ENTRE OBLITAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV. PANAMERICANA ENTRE OBLITAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ OCAMPO EMILIA RAQUEL', '10463234', '67239316', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTES CRUZ MANRIQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTES CRUZ MANRIQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'OESTE' AND direccion = 'FINAL SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'OESTE', 'FINAL SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARCE CABRERA VICTORIA', '7398479', '74159613', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANÍA DE YESO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANÍA DE YESO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'NOR ESTE' AND direccion = '16 DE JULIO ENTRE ESTANISLAO URQUIETA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NOR ESTE', '16 DE JULIO ENTRE ESTANISLAO URQUIETA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HERRERA VILLCA RAMÓN', '8443216', '72338836', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMÓN HERRERA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMÓN HERRERA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'CALLE ASCARRUNZ SAN ANDRÉS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'CALLE ASCARRUNZ SAN ANDRÉS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ AROJA ROGELIO', '7270687', '67385846', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL  COSTURA  SERIGRAFÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL  COSTURA  SERIGRAFÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'AV. PANAMERICANA Y AV. BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'AV. PANAMERICANA Y AV. BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE CLEMENTE BACILIA', '2766426', '76151552', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COLQUE CLEMENTE BACILIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COLQUE CLEMENTE BACILIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'SUD' AND direccion = 'CALLE AYACUCHO, ORURO Y LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUD', 'CALLE AYACUCHO, ORURO Y LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ORELLANA ESCALANTE BENEDICTA', '11069689', '68352474', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PANIFICADORES DE SAN NICOLAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PANIFICADORES DE SAN NICOLAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'AV. PANAMERICANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'AV. PANAMERICANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUALLPA CACERES INÉS', '7311787', '75716637', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTOS Y GASTRONOMÍA Y REPOSTERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTOS Y GASTRONOMÍA Y REPOSTERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'CALLE YUNGAS Y CALLE ORURO Y TARIJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'CALLE YUNGAS Y CALLE ORURO Y TARIJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ AROJA LUCY', '7380346', '64143594', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTOS  GASTRONOMÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTOS  GASTRONOMÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'AV. BERNAL, ORURO Y AV. PANAMERICÁNA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'AV. BERNAL, ORURO Y AV. PANAMERICÁNA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PINAYA ALVAREZ JOVITA JUDITH', '7264307', '68327421', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'AV. BERNAL Y LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'AV. BERNAL Y LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUIZARA PINAYA DAYNOR EMILIO', '7381582', '68321221', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'WILLA PUENTE' AND direccion = 'FRENTE A LA CETHA CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'WILLA PUENTE', 'FRENTE A LA CETHA CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROSALES MAMANI DELIA ALICIA', '7350304', '63601880', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'SOLTERO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV. BERNAL Y LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV. BERNAL Y LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PINAYA ALVAREZ MARLENY', '3558637', '78605683', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'AV. COCHABAMBA S/N' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'AV. COCHABAMBA S/N')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHIARA CANAVIRI PAMELA', '7381648', '62969936', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PRODUCCIÓN DE ALIMENTOS Y REPOSTERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PRODUCCIÓN DE ALIMENTOS Y REPOSTERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'AV. BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'AV. BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHIARA CANAVIRI SANDIVEL', '7381653', '73832865', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HELADOS A LA PLANCHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HELADOS A LA PLANCHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CAMINO ANTIGUO A CBBA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CAMINO ANTIGUO A CBBA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOZANO VILLCA LUCIO', '2903902', '67264470', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HELADERÍA LOZMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HELADERÍA LOZMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CAMINO ANTIGUO A COCHABAMBA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CAMINO ANTIGUO A COCHABAMBA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOZANO MAMANI GROVER LUIS', '5767049', '76152345', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HELADERIA TOÑITO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HELADERIA TOÑITO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CALLE AMÉRICA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CALLE AMÉRICA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOZANO MAMANI MARY CRUZ', '5767050', '62804279', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HELADERIA JHOEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HELADERIA JHOEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVAREZ NINA SONIA', '5764956', '73833652', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALVAREZ NINA SONIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALVAREZ NINA SONIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CARRETERA COCHABAMBA Y AV. COLQUIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CARRETERA COCHABAMBA Y AV. COLQUIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VARGAS ZENTENO KARLA ALISON', '8113163', '63313409', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DONALIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DONALIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'AV. BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'AV. BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AROJA ALVAREZ MARISOL', '7380147', '67228824', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTOS CHARQUEKANERÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTOS CHARQUEKANERÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CARRETERA COCHABAMBA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CARRETERA COCHABAMBA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVAREZ TORREZ VALENTIN', '3543138', '67211229', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALVAREZ TORREZ VALENTIN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALVAREZ TORREZ VALENTIN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'CALLE SUCRE Y CALLE S/N' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'CALLE SUCRE Y CALLE S/N')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CANDANO ALVINA', '2793578', '71887286', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'SECUNDARIA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'ANTOFAGASTA TOMÁS FRÍAS Y LIZÁRRAGA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'ANTOFAGASTA TOMÁS FRÍAS Y LIZÁRRAGA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI HUARACHI ELIZABETH', '4054752', '67160723', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ELIZABETH HUARACHI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ELIZABETH HUARACHI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'ALTO CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'ALTO CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CANAVIRI AROJA MARIA ELENA', '3543159', '73826243', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHICHARRONES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHICHARRONES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'CENTRAL' AND direccion = 'FERIA CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'CENTRAL', 'FERIA CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BORRAS CUEVAS ROSMERY', '7265008', '72348776', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTACIÓN REPOSTERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTACIÓN REPOSTERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CALLE AMÉRICA #262' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CALLE AMÉRICA #262')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOZANO MAMANI JUSTA LUCERO', '7338663', '68314011', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HELADERIA JHEYDAN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HELADERIA JHEYDAN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'SUD' AND direccion = 'CALLE AYACUCHO ENTRE ORURO Y LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUD', 'CALLE AYACUCHO ENTRE ORURO Y LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PINAYA SALINAS MIRIAM', '4053854', '64127851', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIRIAM PINAYA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIRIAM PINAYA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CRUCE VILLA PUENTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CRUCE VILLA PUENTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MAMANI KAREN ANDREINA', '7281115', '60411053', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES KAREN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES KAREN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'CALLE BOLIVAR S/N' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'CALLE BOLIVAR S/N')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ PARRA MARIA ANGÉLICA', '4045876', '73317825', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTILERIA MARY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTILERIA MARY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'DOBLE VIA ENTRE CALLE AYACUCHO Y CALLE TARIJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'DOBLE VIA ENTRE CALLE AYACUCHO Y CALLE TARIJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PADILLA CALLATA MELANIA', '6824376', '63665279', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PADILLA CALLATA MELANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PADILLA CALLATA MELANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NICASIO MAMANI GLADIS', '4046656', '67255991', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERÍA ALIMENTOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERÍA ALIMENTOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'AV. PANAMERICANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'AV. PANAMERICANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CALLE DE GUTIERREZ ALICIA CELIA', '14461289', '74122241', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTOS GASTRONOMÍA Y REPOSTERÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTOS GASTRONOMÍA Y REPOSTERÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDARCO CONDORI NORKA', '7287838', '72451371', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RESPOTERÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RESPOTERÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'CALLE AZCARRUNA Y SAN ANDRÉS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'CALLE AZCARRUNA Y SAN ANDRÉS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NICOLAS CATARI DELMA', '5765668', '67203087', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTACIÓN CHOCOLATERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTACIÓN CHOCOLATERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CARACOLLO VILLA PUENTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CARACOLLO VILLA PUENTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HINOJOSA PINAYA ELIZABETH', '3556846', '77140765', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL GASTRONOMÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL GASTRONOMÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'CALLE LA PAZ ENTRE SOLEDAD Y S. ANDRES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'CALLE LA PAZ ENTRE SOLEDAD Y S. ANDRES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SALAS COPA DANITZA', '4053509', '74112944', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'JANKU UYU' AND direccion = 'JANKU UYU KM. 14' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'JANKU UYU', 'JANKU UYU KM. 14')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NICOLAS CORREA EMILIO', '5749692', '72308514', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'NICOLAS CORREA EMILIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('NICOLAS CORREA EMILIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'AVENIDA COLQUIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'AVENIDA COLQUIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROMAN ACARAPI NORAH', '7961128', '63650802', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTOS CHOCOLATERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTOS CHOCOLATERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'CALLE LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'CALLE LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAMBI SALAS JOSUE JOSAHIN', '7404424', '74112930', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOSUE CHAMBI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOSUE CHAMBI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'CALLE LA PAZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'CALLE LA PAZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHAMBI FLORES REYNALDO', '4055253', '73845083', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHAMBI FLORES REYNALDO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHAMBI FLORES REYNALDO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'AV. PANAMERICANA /14 DE SEPTIEMBRE Y ROSARIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'AV. PANAMERICANA /14 DE SEPTIEMBRE Y ROSARIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANCALLE CRUZ EUGENIA', '5739130', '73805802', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTACIÓN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTACIÓN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'PUENTE ANTIGUO EN PLENA ESQUINA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'PUENTE ANTIGUO EN PLENA ESQUINA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROMAN ACARAPI FABIOLA PATRICIA', '7420057', '62977978', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CALLE AMÉRICAN°262' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CALLE AMÉRICAN°262')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOZANO MAMANI ANA ROSA', '7312457', '72403855', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HELADERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HELADERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'AV. PANAMERICANA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'AV. PANAMERICANA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUELLAR CONDORI CARMEN', '5761705', '73824749', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RELLENOS DOÑA CARMEN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RELLENOS DOÑA CARMEN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'CALLE S/N ENTRE COLEDO Y AV. BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'CALLE S/N ENTRE COLEDO Y AV. BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MANCILLA CONDORI MARIA', '4028522', '71101293', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL ARTESANÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL ARTESANÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'PANAMERICANA Y AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'PANAMERICANA Y AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA CUELLAR MAGNELY', '7296526', '71108922', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS ARAÑITA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS ARAÑITA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'SUD' AND direccion = 'FINAL AV. BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUD', 'FINAL AV. BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANCALLE CRUZ FIDEL', '3524442', '74105300', v_id_formacion, v_id_estado_civil)
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
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'SUD' AND direccion = 'CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUD', 'CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARZA COPA EULOGIO', '3072539', '71185928', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EULOGIO MARZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EULOGIO MARZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'SUD' AND direccion = 'CALLE S.N' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'SUD', 'CALLE S.N')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MAMANI CARLA RITA', '7262649', '72454852', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CARLA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CARLA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'AV. COLQUIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'AV. COLQUIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MONTAÑO CHOQUE LIZBETH NELLY', '7381659', '72486260', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL  CORTE Y CONFECCIÓN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL  CORTE Y CONFECCIÓN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'SUD' AND direccion = 'AV. COLQUIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUD', 'AV. COLQUIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CABEZAS SILVIA', '5772397', '74213847', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL  TEJIDOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL  TEJIDOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CAMINO A COLQUIRI ANTIGUO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CAMINO A COLQUIRI ANTIGUO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('THOLA APAZA MARIA HERMINIA', '4054340', '71771923', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GASTRONOMIA  TEXTIL  TEJIDOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GASTRONOMIA  TEXTIL  TEJIDOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'HOGAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'HOGAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI COLQUE GRAVELINA', '9921855', '68307156', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL  TEJIDOS A MANO, CROCHET' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL  TEJIDOS A MANO, CROCHET', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'CALLE TARIJA Y SAN ANDRÉS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'CALLE TARIJA Y SAN ANDRÉS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ TOLA MARTHA', '4034971', '67207483', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARTHA TORREZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARTHA TORREZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'SEPTIEMBRE Y ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'SEPTIEMBRE Y ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUNA CRUZ ADELAIDA VALENTINA', '5740378', '72967915', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ADELAIDA LUNA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ADELAIDA LUNA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'ANTOFAGASTA TOMÁS FRIAS Y LIZÁRRAGA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'ANTOFAGASTA TOMÁS FRIAS Y LIZÁRRAGA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('IGNACIO MAMANI JESÚS', '4039701', '74156049', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HELADO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HELADO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'PAZÑA' AND zona = 'CENTRAL' AND direccion = 'CALLE SUCRE ENTRE PAGADOR Y POTOSÍ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'PAZÑA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('PAZÑA', 'CENTRAL', 'CALLE SUCRE ENTRE PAGADOR Y POTOSÍ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TADEO CHACA DIONICIA ARMINDA', '4058473', '74105515', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DERIVADOS LACTEOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DERIVADOS LACTEOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'SUD' AND direccion = 'FINAL AV. BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUD', 'FINAL AV. BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANCALLE CHOQUE MARIA FERNANDA', '7384467', '62771064', v_id_formacion, v_id_estado_civil)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'HOGAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'HOGAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SORIA CARBAJAL MARIA', '7504908', '65373957', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL TEJIDO A MANO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL TEJIDO A MANO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'SUD' AND direccion = 'PLAZA MURPHY FINAL BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUD', 'PLAZA MURPHY FINAL BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANCALLE CHOQUE MIGUEL LAURENTH', '7297465', '68100422', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'TECNICO' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CRUCE VILLA PUENTE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CRUCE VILLA PUENTE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CRUZ LUCY', '3506895', '60437171', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CONFECCIONES LUCY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CONFECCIONES LUCY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'NORTE' AND direccion = 'CALLE BOLIVAR S/N' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'NORTE', 'CALLE BOLIVAR S/N')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CRUZ ARIEL RAMIRO', '4048822', '60419449', v_id_formacion, v_id_estado_civil)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ARTESANIAS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CARRETERA LAPAZ ORURO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CARRETERA LAPAZ ORURO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CONDORI CLAUDIO', '3110065', '74258682', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TALLE DE METAL MECÁNICA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TALLE DE METAL MECÁNICA', NULLIF('3110065',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'SUD' AND direccion = 'FINAL BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUD', 'FINAL BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ANCALLE CRUZ JHONNY', '3524441', '71885914', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IAN SPORT' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IAN SPORT', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'HOGAR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'HOGAR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI GARCIA MARTHA', '7341504', '72360677', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS TEXTIL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS TEXTIL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'CASA AV. COLQUIRI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'CASA AV. COLQUIRI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CRUZ SALAMANCA MARGARITA REYNA', '7676144', '73013649', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARGARITA CRUZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARGARITA CRUZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CORQUE (HOGAR)' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CORQUE (HOGAR)')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE TAPIA WILMA RITA', '5771834', '74111929', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'TENIENTE LEON  N. 781' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'TENIENTE LEON  N. 781')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('APAZA ALA DE SAJAMA EDITH JUDITH', '7317314', '68289234', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EDITH APAZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EDITH APAZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'AYACUCHO Y TEJERINA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'AYACUCHO Y TEJERINA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CAYOJA CHOQUE MARTINA', '2746514', '75400352', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTILES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTILES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'KENEDY Y TARIJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'KENEDY Y TARIJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RUFINO ESPINOZA FLORENCIA', '638097', '73833272', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RUFINO ESPINOZA FLORENCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RUFINO ESPINOZA FLORENCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'AV. BOLIVIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'AV. BOLIVIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALIZAYA MAMANI AMELIA', '641140', '5257596', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTILES TEJIDOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTILES TEJIDOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'TOMAS BARRON' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'TOMAS BARRON')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOLA GUTIERREZ RAMIRO', '8702968', '73827836', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RAMIRO TOLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RAMIRO TOLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CHARCAS VASQUEZ NRO 42' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CHARCAS VASQUEZ NRO 42')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GOMEZ AYLLON MARIA JOSE KATHWEEN', '7319600', '61833347', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS KI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS KI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB NUEVO MILENIUM' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB NUEVO MILENIUM')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GOMEZ ZENTENO LOURDES', '13294574', '74460436', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOURDES GOMEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOURDES GOMEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALAMA NRO 17' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALAMA NRO 17')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUANCA HUARITO MARTHA', '7266961', '73819489', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARTHA HUANCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARTHA HUANCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV. AL VALLE CALLE 8' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV. AL VALLE CALLE 8')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARCA MAMANI FRANCIA', '8429663', '72331745', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FRANCIA MARCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FRANCIA MARCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CHARCAS Y BUSCH' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CHARCAS Y BUSCH')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('NINACHOQUE HUANCA BEATRIZ', '9962780', '63238727', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BEATRIZ NINACHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BEATRIZ NINACHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AV. AL VALLE Y TACNA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AV. AL VALLE Y TACNA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BARRETO ROQUE ROGELIA', '9185007', '75411307', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROGELIA BARRETO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROGELIA BARRETO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'MURGUÍA #200 PAGADOR Y VELASCO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'MURGUÍA #200 PAGADOR Y VELASCO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS PASTOR AYMÉ MARLENE', '3045754', '72312590', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES BRAVO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES BRAVO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'INCA POZO BLANCO ROMERO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'INCA POZO BLANCO ROMERO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUALLPA CHAMBI ESTEFANÍA', '7335288', '67246637', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ESTEFANÍA HUALLPA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ESTEFANÍA HUALLPA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'CALLE CAMACHO N1770 ENTRE SUCRE Y MURGUIA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'CALLE CAMACHO N1770 ENTRE SUCRE Y MURGUIA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MOYA LOPEZ DIONICIA FLORENCIA', '2788660', '77958665', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MOYA LOPEZ DIONICIA FLORENCIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MOYA LOPEZ DIONICIA FLORENCIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'WIÑAYKUSI ZONA KANTUTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'WIÑAYKUSI ZONA KANTUTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROJAS GONZALES MARTHA CARMEN', '3505180', '72468524', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARTHA ROJAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARTHA ROJAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'PASAJE BRASIL ENTRE Q - I' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'PASAJE BRASIL ENTRE Q - I')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACHECO RENTERÍA FRANZ DANIEL', '5731197', '73830286', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PLANET PIZZAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PLANET PIZZAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'CENTRAL' AND direccion = 'COCHABAMBA PASAJE PEÑA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'CENTRAL', 'COCHABAMBA PASAJE PEÑA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZENTENO null MIGUEL ANGEL', '5753827', '74518416', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIGUEL ZENTENO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIGUEL ZENTENO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = 'CENTRAL' AND direccion = 'GERMAN BUSCH #30' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'CENTRAL', 'GERMAN BUSCH #30')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI MAGNE FRANZ RAMIRO', '5741943', '79146582', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAMANI MAGNE FRANZ RAMIRO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAMANI MAGNE FRANZ RAMIRO', NULLIF('5741943017',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'COMUNIDAD PORVENIR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'COMUNIDAD PORVENIR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALANI HURTADO FREDDY', '4044855', '72155611', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CALANI HURTADO FREDDY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CALANI HURTADO FREDDY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'VILLA CHALLACOLLO' AND direccion = 'MISTRAL ENTRE EDWIN KITTY Y TOMAS MONJE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VILLA CHALLACOLLO', 'MISTRAL ENTRE EDWIN KITTY Y TOMAS MONJE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI CAHUANA MICKI RUTH', '7295232', '72352186', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CORQUE' AND zona = '' AND direccion = 'CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', '', 'CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE TORREZ HILDA', '5772114', '72344642', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CHOQUE TORREZ HILDA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CHOQUE TORREZ HILDA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'URB. 3 DE MAYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'URB. 3 DE MAYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BARRA ARIAS JULIA', '7279349', '73829890', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTILES DE LANA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTILES DE LANA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    VALUES ('YAVI CHAMBI MAYDE', '7388930', '74145598', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAYDE YAVI CHAMBI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAYDE YAVI CHAMBI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    VALUES ('CHOQUE APIO SAYDA YANET', '7300288', '73872648', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SAYDA CHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SAYDA CHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'LEÓN #329 ENTRE PAGADOR Y POTOSÍ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'LEÓN #329 ENTRE PAGADOR Y POTOSÍ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI ESPINO LUCILA', '5482914', '75411193', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LUCILA MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LUCILA MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'URB. PEDRO FERRARI, MANZANO B-35, LOTE-1' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'URB. PEDRO FERRARI, MANZANO B-35, LOTE-1')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUCANA CONDORI DE CHOQUETICLLA FATIMA ZULMA', '4039995', '73834224', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EMPRESA DE ALIMENTOS AGRISUR' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EMPRESA DE ALIMENTOS AGRISUR', NULLIF('4039995014',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = '' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'CARACOLLO' AND direccion = '' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CARACOLLO', '')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI QUISPE ELENA', '5064356', '74156807', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTOS', NULLIF('50643556014',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = '' AND direccion = 'CARACOLLO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', '', 'CARACOLLO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ARCANI SOTO DANIEL', '4062611', '67218604', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DANIEL ARCANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DANIEL ARCANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTIAGO DE HUARI' AND zona = '' AND direccion = 'SANTIAGO DE HUARI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTIAGO DE HUARI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTIAGO DE HUARI', '', 'SANTIAGO DE HUARI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARCAYA LISANO FRANCISCA', '15515691', '67248302', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FRANCISCA HUARCAYA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FRANCISCA HUARCAYA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CHALLAPATA' AND zona = 'NORTE' AND direccion = 'ORURO VILLAROEL Y ATAHUALLPA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', 'NORTE', 'ORURO VILLAROEL Y ATAHUALLPA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ACNA CALLAPA WILY LEONCIO', '9363839', '71407165', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIL AMORES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIL AMORES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'AV. AL VALLE URB. SANTIAGO 2 Nº7' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'AV. AL VALLE URB. SANTIAGO 2 Nº7')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HUARACHI GABRIEL GUILLERMO GONZALO', '5762212', '72467495', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HUARACHI GABRIEL GUILLERMO GONZALO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HUARACHI GABRIEL GUILLERMO GONZALO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'SAN FELIPE Y POTOSÍ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'SAN FELIPE Y POTOSÍ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RODRIGUEZ PAIVA EMILENE TANIA', '4074938', '74230485', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EMILENE RODRIGUEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EMILENE RODRIGUEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB. MILENIO MZ 1 LOTE 5' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB. MILENIO MZ 1 LOTE 5')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('RAMOS ALEJO EUGENIA', '5067230', '72459247', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EUGENIA RAMOS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EUGENIA RAMOS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV. URQUIDI S/N ENTRE CAMPO JORDAN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV. URQUIDI S/N ENTRE CAMPO JORDAN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VALERIANO CRISPIN ANAY SILVIA', '7047547', '75404585', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANAY VALERIANO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANAY VALERIANO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'VILLA PUENTE' AND direccion = 'AVENINDA PANAMERICANA Y AV. SOLEDAD' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'VILLA PUENTE', 'AVENINDA PANAMERICANA Y AV. SOLEDAD')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AROJA HINOJOSA ANA KAREN', '7419631', '71888695', v_id_formacion, v_id_estado_civil)
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
    SELECT id_formacion INTO v_id_formacion FROM public.formacion WHERE nombre = 'LICENCIATURA' LIMIT 1;
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'ALIMENTOS' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV. BOLIVIA CIRCUNVALACIÓN CASCO MINERO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV. BOLIVIA CIRCUNVALACIÓN CASCO MINERO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GUTIERREZ CANAZA NENA VILMA', '3515333', '73816504', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GUTIERREZ CANAZA NENA VILMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GUTIERREZ CANAZA NENA VILMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'SOLDADO BOLIVIANO NRO 4 ENTRE ZELAYA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'SOLDADO BOLIVIANO NRO 4 ENTRE ZELAYA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CUIZARA PAREDES GLADIS', '5749729', '72495096', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CUIZARA PAREDES GLADIS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CUIZARA PAREDES GLADIS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'MONTECINOS ENTRE PETOT Y LINARES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'MONTECINOS ENTRE PETOT Y LINARES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA MIRANDA ISABEL', '4057099', '70417224', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VILLCA MIRANDA ISABEL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VILLCA MIRANDA ISABEL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'URB. SANTA ANA 3B MZ 42 LOTE 2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'URB. SANTA ANA 3B MZ 42 LOTE 2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COPA GUZMAN MARIA EUGENIA', '4062714', '60412766', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'COPA GUZMAN MARIA EUGENIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('COPA GUZMAN MARIA EUGENIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'TOMAS FRÍAS Y URQUIDI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'TOMAS FRÍAS Y URQUIDI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VIA FLORES MARTHA', '3551787', '69587830', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARTHA VIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARTHA VIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'WASHINGTON - MURGUIA - SUCRE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'WASHINGTON - MURGUIA - SUCRE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LOPEZ FUENTES WANDA IBETH', '7262444', '71186005', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOPEZ FUENTES WANDA IBETH' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOPEZ FUENTES WANDA IBETH', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV. CIRCUNVALACIÓN Y HEROES DEL CHACO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV. CIRCUNVALACIÓN Y HEROES DEL CHACO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ RAMOS MARISABEL', '7400872', '63642958', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARISABEL TORREZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARISABEL TORREZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'PAMPITA 3 CALLE CESPEDES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'PAMPITA 3 CALLE CESPEDES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VELASQUEZ MAMANI FLORIA ANGELA', '7354199', '73841816', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FLORIA VELASQUEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FLORIA VELASQUEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'MILENA ESTRADA NRO 12' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'MILENA ESTRADA NRO 12')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('DURÁN VIRACOCHEA VANESA', '12920846', '73817588', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DURÁN VIRACOCHEA VANESA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DURÁN VIRACOCHEA VANESA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AV. DEHENE FRENTE A LA FACULTAD DE INGENIERÍA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AV. DEHENE FRENTE A LA FACULTAD DE INGENIERÍA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VEDIA null ANAHÍ', '7454486', '70460811', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ANAHÍ VEDIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ANAHÍ VEDIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'CAMACHO Nº131 AROMA Y BELZU' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'CAMACHO Nº131 AROMA Y BELZU')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('POMA QUISPE CELIA JHANNET', '4022465', '71185949', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CELIA POMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CELIA POMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CIRCUNVALACIÓN URB. MILLEIUM' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CIRCUNVALACIÓN URB. MILLEIUM')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TORREZ RAMOS JEANNETTE', '7400874', '72459247', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TORREZ RAMOS JEANNETTE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TORREZ RAMOS JEANNETTE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV. DEPORTISTA CALLE 7 Y 8' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV. DEPORTISTA CALLE 7 Y 8')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SOTO ARNEZ ANA MARIA', '5063990', '75415594', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SOTO ARNEZ ANA MARIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SOTO ARNEZ ANA MARIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SOCAVÓN II' AND direccion = 'ZONA DEL SOCAVON II' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SOCAVÓN II', 'ZONA DEL SOCAVON II')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('QUISPE ZULETA DORKAS MIRIAM', '7425356', '60404385', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'QUISPE ZULETA DORKAS MIRIAM' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('QUISPE ZULETA DORKAS MIRIAM', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'TAPIA Y PERALTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'TAPIA Y PERALTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALÁ ALVAREZ GREGORIO', '2770767', '71188338', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'K''ACHA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('K''ACHA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'BALLIVIAN 482 ENTRE POTOSÍ PASAJE VELASCO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'BALLIVIAN 482 ENTRE POTOSÍ PASAJE VELASCO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MALDONADO URIA SILVIA INES', '3081395', '71181550', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SILVIA MALDONADO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SILVIA MALDONADO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AMERICA Y POTOSI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AMERICA Y POTOSI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AROJA ALVAREZ LUISA MERCEDEZ', '7409479', '74131360', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL  COSTURA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL  COSTURA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'ALTO SAN PEDRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'ALTO SAN PEDRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CATARI GLADYS FLORINDA', '7369183', '78609661', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'GLADYS CHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('GLADYS CHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'BOLIVAR Y TARAPACA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'BOLIVAR Y TARAPACA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COAQUIRA TOMAS PRIMITIVA', '4065654', '68291209', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PRIMITIVA COAQUIRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PRIMITIVA COAQUIRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'CALLE ARICA, EJERCITO Y AYACUCHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'CALLE ARICA, EJERCITO Y AYACUCHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE GONZALES ALEJANDRINA', '2736465', '72464110', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALEJANDRINA CHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALEJANDRINA CHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CALLE KENNEDY ENTRE PETOT Y PSJE. CAMACHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CALLE KENNEDY ENTRE PETOT Y PSJE. CAMACHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JAUREGUI MENDOZA DELIA', '7361947', '72478760', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DELIA JAUREGUI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DELIA JAUREGUI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'ALTO SAN PEDRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'ALTO SAN PEDRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALA CALLE VERONICA', '7317386', '67223019', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VERÓNICA ALA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VERÓNICA ALA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'PASAJE X N°791 ENTRE LIRA Y OBLITAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'PASAJE X N°791 ENTRE LIRA Y OBLITAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAMANI CONDORI EVELYN XIMENA', '7275732', '72467428', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EVELYN MAMANI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EVELYN MAMANI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'OBLITAS ILLAMPU' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'OBLITAS ILLAMPU')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES PACO JESSICA CRISTINA', '7334013', '63640253', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DISEÑOS JESS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DISEÑOS JESS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'VINTO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'VINTO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOLA VILLA VIVIANO', '7872982', '68505693', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VIVIANO TOLA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VIVIANO TOLA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'BELZU S/N Y SORIA GALVARRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'BELZU S/N Y SORIA GALVARRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SANCHEZ ALCAZAR MAGALI JANETT', '4048153', '73802720', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MAGALI SANCHEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MAGALI SANCHEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'CALLE BENJAMIN GUZMAN Y CIRCUNVALACIÓN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'CALLE BENJAMIN GUZMAN Y CIRCUNVALACIÓN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CONDORI COAQUIRA ROXANA', '7339392', '74103238', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROXANA CONDORI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROXANA CONDORI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB. 2000 CALLE B Y C' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB. 2000 CALLE B Y C')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE MAMANI DE NINA AURORA', '5732453', '71428936', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AURORA CHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AURORA CHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'CALLE 1 #2 ENTRE BENI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'CALLE 1 #2 ENTRE BENI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('HERRERA YUCRA MARIOLY BETZABE', '5743838', '71857798', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEJIDOS MARIOLY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEJIDOS MARIOLY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'SANTA ANA NRO 2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'SANTA ANA NRO 2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CHOQUE DAYSI', '7313689', '68317354', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DAYSI CHOQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DAYSI CHOQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'PASAJE SANCHEZ Y URQUIDI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'PASAJE SANCHEZ Y URQUIDI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PACO LAZARTE EVA', '7344584', '67230168', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EVA PACO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EVA PACO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'VILLAROEL Y ANTOFAGASTA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'VILLAROEL Y ANTOFAGASTA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('COLQUE OROZCO MABEL LUISA', '7303049', '65409458', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MABEL COLQUE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MABEL COLQUE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'C. G. RIOS Y CALLE 2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'C. G. RIOS Y CALLE 2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('FLORES CRUZ AURORA', '7333937', '68665214', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'AURORA FLORES' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('AURORA FLORES', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'DISTRITO 3 LOS ANGELES' AND direccion = 'LOS ANGELES VILLA HUANUNI MZ. 10' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'DISTRITO 3 LOS ANGELES', 'LOS ANGELES VILLA HUANUNI MZ. 10')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VILLCA MACIAS WALTER', '7293591', '74153485', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'LA SALLE Y CIRCUNVALACIÓN' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'LA SALLE Y CIRCUNVALACIÓN')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JAUREGUI SACAMA IRENE', '5745585', '73835211', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'IRENE JAUREGUI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('IRENE JAUREGUI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'B. LITORAL C/4 Nº11 ENTRE 5' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'B. LITORAL C/4 Nº11 ENTRE 5')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GERONIMO MIRANDA CELIA', '7419234', '72327614', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CELIA GERÓNIMO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CELIA GERÓNIMO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'BARRIO SAN FELIPE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'BARRIO SAN FELIPE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUE CHOQUE FLAVIA', '7309023', '72316597', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'FOGLAM' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('FOGLAM', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CORQUE' AND zona = 'SUR' AND direccion = 'PLAZA CORQUE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CORQUE' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CORQUE', 'SUR', 'PLAZA CORQUE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('EUGENIA NINA SILVIA', '7335735', '74109155', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SILVIA NINA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SILVIA NINA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'VIUDO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'CALLES 1 #2 ENTRE BENI' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'CALLES 1 #2 ENTRE BENI')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA YUGAR DE HERRERA JUANA ROSA', '2747444', '71853686', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JUANA YUCRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JUANA YUCRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB. AURORA M-C-L12' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB. AURORA M-C-L12')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AMBROCIO PICACHURI HERMEREGILDO', '3507690', '63676002', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'HEMEREGILDO AMBROCIO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('HEMEREGILDO AMBROCIO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'URB. 9 DE JUNIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'URB. 9 DE JUNIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEDRO MAMANI DEMECIA', '5533248', 'S/N', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DEMECIA PEDRO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DEMECIA PEDRO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SALINAS DE GARCI MENDOZA' AND zona = 'ANCOYO' AND direccion = 'COMUNIDAD DE ANCOYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SALINAS DE GARCI MENDOZA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SALINAS DE GARCI MENDOZA', 'ANCOYO', 'COMUNIDAD DE ANCOYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAYORGA null BEATRIZ', '3417010', '67462955', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ECOQUINUA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ECOQUINUA', NULLIF('3417020016',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'ESPAÑA 1RO DE MAYO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'ESPAÑA 1RO DE MAYO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ORDOÑEZ TICLLA ROSMERY', '3556831', '61662916', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ROSMERY ORDOÑEZ' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ROSMERY ORDOÑEZ', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'INCA POZO BLANCO ROMERO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'INCA POZO BLANCO ROMERO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ESPINOZA CHAMBI OLGA LUZMILA', '7324634', '73801412', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'OLGA ESPINOZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('OLGA ESPINOZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'CORDEOR' AND direccion = 'AV. 3 Y AV. A S/N' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CORDEOR', 'AV. 3 Y AV. A S/N')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CASTRO FERNANDEZ SANTUSA', '5069485', '72480058', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SANTUSA CASTRO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SANTUSA CASTRO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARANGAS' AND zona = 'NORTE' AND direccion = 'CURAHUARA DE CARANGAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARANGAS' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARANGAS', 'NORTE', 'CURAHUARA DE CARANGAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MARCA AGUILAR JULIA FLORA', '5064878', '68290554', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'DOÑA JULIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('DOÑA JULIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CALLE CALAMA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CALLE CALAMA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SILVESTRE NINA JOSE ORLANDO', '7391453', '68296054', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JOSE SILVESTRE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JOSE SILVESTRE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV. TOMAS BARRÓN NRO 70 Y E. VALLE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV. TOMAS BARRÓN NRO 70 Y E. VALLE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALCALA CHOQUETICLLA BETTY', '6760916', '5244207', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BETTY ALCALA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BETTY ALCALA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = '' AND direccion = 'URB. SIERRA MIER N10' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', '', 'URB. SIERRA MIER N10')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CHOQUEHUANCA null BRIGIDA', '6120435', '75706400', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BRIGIDA CHOQUEHUANCA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BRIGIDA CHOQUEHUANCA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'HERNANDO SILES PASAJE LONDRES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'HERNANDO SILES PASAJE LONDRES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AYALA HERRERA EDUARDO', '3088024', '71107062', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EDUARDO AYALA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EDUARDO AYALA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'PEDRO FERRARI Y MAX FERNANDEZ' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'PEDRO FERRARI Y MAX FERNANDEZ')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JAUREGUI CHOQUE SALUSTIANA SALOME', '736193715', '72354996', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SALUSTIANA JAUREGUI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SALUSTIANA JAUREGUI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'VILLAZÓN EDUARDO AVAROA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'VILLAZÓN EDUARDO AVAROA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JAUREGUI LLAMPA ALVARO', '7454585', '68304232', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALVARO JAUREGUI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALVARO JAUREGUI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'AV. AL VALLE CALLE 6' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'AV. AL VALLE CALLE 6')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CALLE CUIZARA DEMETRIA', '7365262', '67240017', v_id_formacion, v_id_estado_civil)
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
    SELECT id_estado_civil INTO v_id_estado_civil FROM public.estado_civil WHERE nombre = 'CASADO(A)' LIMIT 1;
    SELECT id_rubro INTO v_id_rubro FROM public.rubro WHERE nombre_rubro = 'TEXTIL' LIMIT 1;
    
    -- Manejo de Ubicacion
    SELECT id_ubicacion INTO v_id_ubicacion FROM public.ubicacion 
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CALLE VICUÑA Y ALFREDO BELLOT' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CALLE VICUÑA Y ALFREDO BELLOT')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JAUREGUI GUTIERREZ EUSEBIO', '2740925', '682290484', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'EUSEBIO JAUREGUI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('EUSEBIO JAUREGUI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD ESTE' AND direccion = 'URB. PUMAS ANDINOS M. 300 L17' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD ESTE', 'URB. PUMAS ANDINOS M. 300 L17')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('VIRACOCHEA TITO MIRIAN RENILDA', '5753625', '64833838', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MIRIAN SN' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MIRIAN SN', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'GRAL. CARRASCO #151 MENACHO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'GRAL. CARRASCO #151 MENACHO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TAPIA MIER DARCY SAMUEL', '4037843', '63339566', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LAS DONAS DE HOMERO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LAS DONAS DE HOMERO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'AV. VELASCO GALVARRO ENTRE SAN FELIPE Y ARCE N°6626' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'AV. VELASCO GALVARRO ENTRE SAN FELIPE Y ARCE N°6626')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('BURGOS MURGUIA ALEJANDRA NOHEMI', '7372819', '72581833', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'BISUTERIA DRAMI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('BISUTERIA DRAMI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'SANTIAGO DE HUARI' AND zona = 'ESTE' AND direccion = 'URB. SANTA ANA II MZ-47 LOTE N°6-OR' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'SANTIAGO DE HUARI' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('SANTIAGO DE HUARI', 'ESTE', 'URB. SANTA ANA II MZ-47 LOTE N°6-OR')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOCOCARI ZARATE RITA NATALIA', '8517208', '72396403', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'RITA TOCOCARI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('RITA TOCOCARI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CARACOLLO' AND zona = 'SUD' AND direccion = 'FINAL BERNAL' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUD', 'FINAL BERNAL')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MANZERA SOLARES JULIA', '3543444', '72327042', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REPOSTERIA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REPOSTERIA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'ALTO CARACOLLO' AND direccion = 'AV. PANAMERICANA /14 DE SEP Y ROSARIO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'ALTO CARACOLLO', 'AV. PANAMERICANA /14 DE SEP Y ROSARIO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MAYTA ANCALLE DANER LEONEL', '12997018', '67212365', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ALIMENTACION' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ALIMENTACION', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'CHALLAPATA' AND zona = '' AND direccion = 'CHALLAPATA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CHALLAPATA' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CHALLAPATA', '', 'CHALLAPATA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TICLLA VILLCA MAXIMA', '6617169', '73842617', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TICLLA VILLCA MAXIMA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TICLLA VILLCA MAXIMA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'OESTE' AND direccion = 'CORAZON DE JESUS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'OESTE', 'CORAZON DE JESUS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('JANAYO ZAMUDIO MARLENI', NULL, '0', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARLENI JANAYO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARLENI JANAYO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'LIZARRAGA Y TOMÁS FRIAS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'LIZARRAGA Y TOMÁS FRIAS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('TOMÁS MENDOZA LOURDES', '15488733', '74143885', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'LOURDES TOMÁS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('LOURDES TOMÁS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NOR ESTE' AND direccion = 'CONDARCO Y LAURA VILLANUEVA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR ESTE', 'CONDARCO Y LAURA VILLANUEVA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ROJAS CALLA PATRICIO', '3546101', '74127595', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PATRICIO ROJAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PATRICIO ROJAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'VICHULOMA' AND direccion = 'TRANCA VICHULOMA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'VICHULOMA', 'TRANCA VICHULOMA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ZAMUDIO COPACURO FLORENCIA', '5133064', '77247873', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'ARTESANÍA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('ARTESANÍA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NOR OESTE' AND direccion = 'CHANCADORA #3 FINAL PARQUE ECOLÓGICO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR OESTE', 'CHANCADORA #3 FINAL PARQUE ECOLÓGICO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('LUQUE HUAYTA LEONARDA RUFINA', '3115011', '68337075', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'TEXTIL TEJIDO DE PRENDAS' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('TEXTIL TEJIDO DE PRENDAS', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'POTOSÍ, SOTOMAYOR Y SARGENTO FLORES' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'POTOSÍ, SOTOMAYOR Y SARGENTO FLORES')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('GODOY ARAOZ MARIA DEL CARMEN', '2763220', '72486809', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CREACIONES Y DETALLITOS MARY' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CREACIONES Y DETALLITOS MARY', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CALLE G Y LA SALLE' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CALLE G Y LA SALLE')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('MENDOZA QUISPE VALERIA', '4065634', '73802446', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VALERIA MENDOZA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VALERIA MENDOZA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'CENTRAL' AND direccion = 'OBLITAS #777 LAPAZ SORIA GALVARRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'CENTRAL', 'OBLITAS #777 LAPAZ SORIA GALVARRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALIAGA CAMACHO PATRICIA CLARIBEL', '3091573', '73830833', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'PATRICIA ALIAGA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('PATRICIA ALIAGA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'SEBASTIÁN PAGADOR FASE 2' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'SEBASTIÁN PAGADOR FASE 2')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CANCHARI VEIZAN SILVIA', '3068431', '72356556', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'SILVIA CANCHARI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('SILVIA CANCHARI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'HUAJARA 1' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'HUAJARA 1')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALVARADO ORIHUELA JAEL JIOVANA', '6644923', '75703900', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'JAEL ALVARADO' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('JAEL ALVARADO', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'ESTE' AND direccion = 'CALLE ARCE N°280 Y VELASCO GALVARRO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'ESTE', 'CALLE ARCE N°280 Y VELASCO GALVARRO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('PEREZ RIOS REYNA ELIZABETH', '2757424', '71108769', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'WARA COF' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('WARA COF', NULLIF('2757424010',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'NOR-ESTE' AND direccion = '1RO DE MAYO MILAGROS' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NOR-ESTE', '1RO DE MAYO MILAGROS')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('CARTAGENA TERÁN DE HUAYLLA REINA ISABEL', '3556288', '63667508', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'REINA CARTAGENA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('REINA CARTAGENA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'EDMUNDO MIRONES CEALLE TOLEDO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'EDMUNDO MIRONES CEALLE TOLEDO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('YUCRA JAUREGUI CLARIBEL', '7361936', '63632980', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CLARIBEL YUCRA' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CLARIBEL YUCRA', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


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
    WHERE municipio = 'ORURO' AND zona = 'NORTE' AND direccion = 'BARRIO SAN LUÍS PATICO' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'NORTE', 'BARRIO SAN LUÍS PATICO')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('ALAVI ARO DE TOLEDO VIRGINIA', '3543929', '71888625', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'VIRGINIA ALAVI' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('VIRGINIA ALAVI', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'ORURO' AND zona = 'SUD' AND direccion = 'CAPITAN BARRIGA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'ORURO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('ORURO', 'SUD', 'CAPITAN BARRIGA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('SAJAMA LOPEZ MARLENE', '7361934', '71188799', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'MARLENE' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('MARLENE', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;


DO $$
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
    WHERE municipio = 'CARACOLLO' AND zona = 'SUD' AND direccion = 'AV. PANAMERICANA CALLE 14 DE SEPTIEMBRE Y TARIJA' LIMIT 1;
    
    IF v_id_ubicacion IS NULL AND 'CARACOLLO' != '' THEN
        INSERT INTO public.ubicacion (municipio, zona, direccion) VALUES ('CARACOLLO', 'SUD', 'AV. PANAMERICANA CALLE 14 DE SEPTIEMBRE Y TARIJA')
        RETURNING id_ubicacion INTO v_id_ubicacion;
    END IF;

    -- Insertar Persona
    INSERT INTO public.persona (nombre_completo, dip, celular, id_formacion, id_estado_civil)
    VALUES ('AROJA GARCIA BERTHA', '7284951', '71684169', v_id_formacion, v_id_estado_civil)
    RETURNING id_persona INTO v_id_persona;
    
    -- Insertar Empresa
    IF 'CENTRO DE MODAS SALE M' != '' THEN
        INSERT INTO public.empresa (nombre_empresa, nit, usa_banca_movil, id_rubro, id_ubicacion)
        VALUES ('CENTRO DE MODAS SALE M', NULLIF('',''), FALSE, v_id_rubro, v_id_ubicacion)
        RETURNING id_empresa INTO v_id_empresa;
        
        -- Relacion
        INSERT INTO public.emprendimiento_persona (id_persona, id_empresa, es_titular)
        VALUES (v_id_persona, v_id_empresa, TRUE);
    END IF;
    
EXCEPTION WHEN OTHERS THEN
    -- Ignore duplicate dip errors or others
END $$;



COMMIT;
