-- Propula Tabela de salários de acordo com a tabela de funcionários (pagamento referente a 2018-11-01 representa o mes 2018-11 inteiro de trabalho)
delimiter $$
CREATE PROCEDURE `Pro_Pagar_Funcionarios` ()
BEGIN
	INSERT INTO `AutoEscola`.`Salarios` (Valor, id_Funcionario, statusPagamento, pagamentoReferenteA, dataPagamento)(
		select salario,
                idFuncionario,
                1,
                CONCAT(SUBSTR(now(),1,7),'-01'),
                now()
		from `AutoEscola`.`Funcionario`);
END $$
delimiter ;


-- Agrega fluxo de caixa e o inseri na  tabela FLuxoDeCaixaMensalHistorico
delimiter $$
CREATE PROCEDURE `Pro_Agregar_FLuxoDeCaixaMensalHistorico` (IN yyyymm VARCHAR(6))
BEGIN
	INSERT INTO `AutoEscola`.`FLuxoDeCaixaMensalHistorico` (mesReferente, entrada, saida)(
		select 
				CONCAT(SUBSTR(yyyymm,1,4),'-',SUBSTR(yyyymm,5,2),'-01'),
                coalesce(SUM(DinheiroEntrar.Valor),0),
				(select 
					coalesce(SUM(Salarios.Valor),0) 
					from `AutoEscola`.`Salarios` 
                    where statusPagamento = 1 
                    and CONCAT(SUBSTR(Salarios.dataPagamento,1,4), SUBSTR(Salarios.dataPagamento,6,2)) = yyyymm
				)
		from `AutoEscola`.`DinheiroEntrar`
        where statusPagamento = 1
        and CONCAT(SUBSTR(DinheiroEntrar.dataPagamento,1,4), SUBSTR(DinheiroEntrar.dataPagamento,6,2)) = yyyymm);
END $$
delimiter ;

-- drop procedure Pro_Agregar_FLuxoDeCaixaMensalHistorico;