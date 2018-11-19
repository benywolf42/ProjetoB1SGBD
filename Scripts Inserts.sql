INSERT INTO `AutoEscola`.`Funcionario` (nome, salario) VALUES ("Funcionário Teste", 1000);
INSERT INTO `AutoEscola`.`Funcionario` (nome, salario) VALUES ("Funcionário Teste2", 2000);

SELECT * FROM  `AutoEscola`.`Funcionario`;

CALL Pro_Pagar_Funcionarios;

SELECT * FROM  `AutoEscola`.`Salarios`;

INSERT INTO `AutoEscola`.`Salarios` (Valor, id_Funcionario, statusPagamento, pagamentoReferenteA, dataPagamento) VALUES (1000, 1 ,1 ,'2018-10-01', '2018-10-18');

INSERT INTO `AutoEscola`.`Aluno` (nome,  cpf, rg, email, dataNascimento, dataRegistro) VALUES ("Aluno Teste", "12345612342", "521425235", "teste@email.com", "1990-01-01", now());

SELECT * FROM `AutoEscola`.`Aluno`;

INSERT INTO `AutoEscola`.`Matricula`
(tipoCnh, statusExameMedico, statusExameCfc, statusMatricula, 
dataRegistro, id_Aluno, valorMonetario)
VALUES ('A', 1, 1, 1, now(), 1, 1100);

SELECT * FROM `AutoEscola`.`Matricula`;

SELECT * FROM `AutoEscola`.`DinheiroEntrar`;

SELECT SUM(DinheiroEntrar.VALOR) FROM `AutoEscola`.`DinheiroEntrar`;

INSERT INTO DinheiroEntrar (Valor, Descricao, id_Matricula, statusPagamento, dataPagamento) VALUES (500, 'Dividendo adicional usado para teste', 1, 1, '2018-11-17');

INSERT INTO DinheiroEntrar (Valor, Descricao, id_Matricula, statusPagamento, dataPagamento) VALUES (500, 'Dividendo adicional usado para teste', 1, 1, '2018-10-17');

DELETE FROM `AutoEscola`.`Matricula` where idMatricula = 10;

INSERT INTO  `autoescola`.`FLuxoDeCaixaMensalHistorico` (mesReferente , entrada, saida) VALUES ('2018-01-01', 1000, 2000);

SELECT * FROM `autoescola`.`FLuxoDeCaixaMensalHistorico`;

SELECT SUBSTR(mesReferente, 9, 2) FROM `autoescola`.`FLuxoDeCaixaMensalHistorico`;

-- teste de insert que gera o erro handle modificado na segunda trigger criada
INSERT INTO  `autoescola`.`FLuxoDeCaixaMensalHistorico` (mesReferente , entrada, saida) VALUES ('2018-01-02', 1000, 2000);

CALL  Pro_Agregar_FLuxoDeCaixaMensalHistorico('201811');

SELECT * FROM `AutoEscola`.`FLuxoDeCaixaMensalHistorico`;
