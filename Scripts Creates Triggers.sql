-- Adiciona valor inserido na tabela de matricula do aluno na tabela DinheiroEntrar como um pagamento ainda não feito
DELIMITER $$
CREATE TRIGGER AFTER_MATRICULA_INSERT
AFTER INSERT ON `AutoEscola`.`Matricula`
FOR EACH ROW
BEGIN
	insert into `AutoEscola`.`DinheiroEntrar` (Valor, Descricao, id_Matricula, statusPagamento) values 
    (new.valorMonetario , "Dividendo gerado pela criacao da matricula", new.idMatricula, 0);
END$$
DELIMITER ;

-- Validação na inserção em FLuxoDeCaixaMensalHistorico se o dia é igual ao dia primeiro
DELIMITER $$
CREATE TRIGGER BEFORE_FLuxoDeCaixaMensalHistorico_INSERT 
BEFORE INSERT ON FLuxoDeCaixaMensalHistorico 
FOR EACH ROW 
BEGIN
  IF (SUBSTR(new.mesReferente, 9, 2) != '01') THEN
	signal sqlstate '45000' SET MESSAGE_TEXT = "Inserção válida apenas para o dia 1 de cada mês";
  END IF;
END $$
DELIMITER ;