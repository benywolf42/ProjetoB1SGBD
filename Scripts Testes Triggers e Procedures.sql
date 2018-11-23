INSERT INTO `AutoEscola`.`Funcionario` (nome, salario) VALUES ("Funcionário Teste", 1000);
INSERT INTO `AutoEscola`.`Funcionario` (nome, salario) VALUES ("Funcionário Teste2", 2000);

SELECT * FROM  `AutoEscola`.`Funcionario`;

-- testar primeira procedure
CALL Pro_Pagar_Funcionarios;
SELECT * FROM  `AutoEscola`.`Salarios`;

-- Testar primeira trigger
INSERT INTO `AutoEscola`.`Matricula`
(tipoCnh, statusExameMedico, statusExameCfc, statusMatricula, 
dataRegistro, id_Aluno, valorMonetario)
VALUES ('A', 1, 1, 1, now(), 1, 1100);
SELECT * FROM `AutoEscola`.`Matricula`;
SELECT * FROM `AutoEscola`.`DinheiroEntrar`;
SELECT SUM(DinheiroEntrar.VALOR) FROM `AutoEscola`.`DinheiroEntrar`;

-- Testar insersao valida na tabela FLuxoDeCaixaMensalHistorico
INSERT INTO  `autoescola`.`FLuxoDeCaixaMensalHistorico` (mesReferente , entrada, saida) VALUES ('2018-01-01', 1000, 2000);
-- testar sugunda trigger (insert que gera o erro handle modificado)
INSERT INTO  `autoescola`.`FLuxoDeCaixaMensalHistorico` (mesReferente , entrada, saida) VALUES ('2018-01-02', 1000, 2000);
SELECT * FROM `autoescola`.`FLuxoDeCaixaMensalHistorico`;

-- testar segunda procedure
	-- Inserindo dados para testar 
	INSERT INTO DinheiroEntrar (Valor, Descricao, id_Matricula, statusPagamento, dataPagamento) VALUES (500, 'Dividendo adicional usado para teste', 1, 1, '2018-11-17');
	INSERT INTO DinheiroEntrar (Valor, Descricao, id_Matricula, statusPagamento, dataPagamento) VALUES (500, 'Dividendo adicional usado para teste', 1, 1, '2018-11-17');
	INSERT INTO DinheiroEntrar (Valor, Descricao, id_Matricula, statusPagamento, dataPagamento) VALUES (500, 'Dividendo adicional usado para teste', 1, 1, '2018-10-17');
CALL  Pro_Agregar_FLuxoDeCaixaMensalHistorico('201811');
SELECT * FROM `AutoEscola`.`FLuxoDeCaixaMensalHistorico`;
