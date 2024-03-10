SELECT consultas.id_distribuidor, cuentas.*
FROM
 (SELECT 
	folio, 
	sum(SaldoVencido) as 'saldo_vencido_total', 
    sum(NumeroPagosVencidos) as 'pagos_vencidos',
    count(folioOtorgante) as 'creditos_totales',
    count(ClavePrevencion) as 'creditos_con_claves_prevencion',
    COUNT(IF(SaldoVencido = 0, NULL, 1)) as 'creditos_completados_con_atraso',
    COUNT(IF(SaldoVencido = 0, 1, NULL)) as 'creditos_completados_sin_atraso'
 FROM cc_cuentas
 GROUP BY folio) as cuentas
JOIN (select max(folio) as 'folio', id_distribuidor from cc_consultas_efectuadas group by id_distribuidor) as consultas
 ON cuentas.folio = consultas.folio
 
 
 