 SELECT * FROM
    (select id, fecha_nacimiento,
           ocupacion, estado, sucursal, 
           escolaridad, estado_civil, dependientes, tipo_vivienda,
            sexo,
           tiempo_vivienda, ingreso_neto, experiencia,
           tipo_negocio, tiempo_op_negocio,capacidad_pago_semanal
           from demograficos_distribuidores 
    UNION
    select id, fecha_nacimiento,
           ocupacion, estado, sucursal, 
           escolaridad, estado_civil, dependientes, tipo_vivienda,
           sexo,
           tiempo_vivienda, ingreso_neto, experiencia,
           tipo_negocio, tiempo_op_negocio, capacidad_pago_semanal
           from cc_prospectos_demograficos
    ) as pen
     where
    pen.id in ('100002')