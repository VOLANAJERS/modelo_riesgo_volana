SELECT 	consultas.id_distribuidor, 
		cuentas.*
FROM
 (SELECT 
	folioConsulta as 'folio', 
	sum(SaldoVencido) as 'saldo_vencido_total', 
    sum(NumeroPagosVencidos) as 'pagos_vencidos',
    count(folioConsulta) as 'creditos_totales',
    count(ClavePrevencion) as 'creditos_con_claves_prevencion',
    COUNT(IF(SaldoVencido = 0, NULL, 1)) as 'creditos_completados_con_atraso',
    COUNT(IF(SaldoVencido = 0, 1, NULL)) as 'creditos_completados_sin_atraso'
 FROM cc_prospectos_creditos 
 group by folioConsulta ) as cuentas 
 left join (select max(folioConsulta) as 'folio', idCliente as 'id_distribuidor' from cc_prospectos_folios group by idCliente) as consultas
 ON cuentas.folio = consultas.folio

 
 
 