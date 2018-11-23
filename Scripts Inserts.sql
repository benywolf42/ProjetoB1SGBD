use autoescola;

insert into veiculo values (null, 'A', 'Normal', 'ABC-1234', 'Hyundai', 'HB20', 2018);

insert into veiculo values (null, 'A', 'Normal', 'ABC-1334', 'H0nda', 'MODELOX', 2018);

insert into funcionario values(null, 'José Mourinho', 2500.00);

insert into funcionario values(null, 'Maria Aparecida', 2000.00);

insert into funcionario values(null, 'João Carreiro', 800.00);

INSERT INTO `AutoEscola`.`Funcionario` (nome, salario) VALUES ("Funcionário Teste", 1000);

INSERT INTO `AutoEscola`.`Funcionario` (nome, salario) VALUES ("Funcionário Teste2", 2000);

insert into aluno values (null, 'Gabriel Barbosa', '50880762667', '2354386301', 'gabigol@gmail.com', '1990-12-01', '2018-11-18 12:01:30');

insert into aluno values (null, 'Bruno Teteu', '39240779722', '4839616708', 'teteu@hotmail.com', '1993-02-01', '2018-11-20 10:26:30');

INSERT INTO `AutoEscola`.`Aluno` (nome,  cpf, rg, email, dataNascimento, dataRegistro) VALUES ("Aluno Teste", "12345612342", "521425235", "teste@email.com", "1990-01-01", now());

insert into instrutor values (null, '12345678', 'A', 1);

insert into instrutor values (null, '88888888', 'A', 2);

insert into instrutor values (null, '87654321', 'AB', 3);

insert into matricula values (null, 'A', 1, 1, 1, 0, '2018-11-18', 1, 1500.00);

insert into matricula values (null, 'A', 0, 0, 0, 0, '2018-11-18', 2, 1300.00);

insert into telefone values (null, '4002-8922', 1);

insert into professor values (null, '64321', 2);

insert into endereco values (null, 'Rua Pedro Vicente', 700, 'Bloco 3', 'Jd Veloso', 'Osasco', 'SP', '01109010', 1);

insert into dinheiroentrar values (null, 300.00, 'Pagamento referente as aulas no simulador', 1, 1, '2018-11-05');

insert into dinheiroentrar values (null, 700.00, 'Pagamento referente as aulas praticas', 2, 0, NULL);

insert into fluxodecaixamensalhistorico values (null, '2018-02-01', 10000, 8000);

insert into salarios values (null, 2500, 1, 1, '2018-11-01', '2018-11-01');

insert into salarios values (null, 2000, 2, 1, '2018-11-01', '2018-11-01');

insert into salarios values (null, 800, 3, 1, '2018-11-01', '2018-11-01');

INSERT INTO `AutoEscola`.`Salarios` (Valor, id_Funcionario, statusPagamento, pagamentoReferenteA, dataPagamento) VALUES (1000, 1 ,1 ,'2018-10-01', '2018-10-18');

insert into aula values (null, '2018-11-01 12:00:00', '2018-11-01 13:00:00', 1);

insert into aula values (null, '2018-11-11 13:00:00', '2018-11-01 14:00:00', 1);

insert into aula values (null, '2018-11-21 15:00:00', '2018-11-01 16:00:00', 1);

insert into aulapratica values (null, 1, 1, 1);

insert into aulapratica values (null, 1, 2, 2);

insert into aulateorica values (null, 1, 2);

insert into turno values (null, 1, 1, 1, 1, 1, 0, '08:00:00', '17:00:00', '2018-01-01', '2018-12-31');

insert into funcionario_has_turno values (1, null, 1);