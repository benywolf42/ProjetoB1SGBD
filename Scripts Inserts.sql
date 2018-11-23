use autoescola;

/* =============================================== VEICULOS */

insert into veiculo values (null, 'A', 'AQHGAKSDAOI21452S1', 'ABC-1234', 'Hyundai', 'HB20', 2018);

insert into veiculo values (null, 'A', 'ASDASF2378ASDJKAGF', 'DEF-5678', 'Volkswagen', 'FOX', 2017);

insert into veiculo values (null, 'B', 'HGOAPQP6912FDF1243', 'GHI-9012', 'Honda', 'PCX', 2017);

insert into veiculo values (null, 'A', '1FDS124SSDF2356RFD', 'JKL-3456', 'Volkswagen', 'GOL', 2018);

insert into veiculo values (null, 'B', '4327189DFJKSAASDAD', 'MNO-7890', 'Yamaha', 'YBR', 2017);

insert into veiculo values (null, 'A', '213974DFJKAFDASDAS', 'PQR-1234', 'Fiat', 'UNO', 2017);

/* =============================================== FUNCIONARIOS */

insert into funcionario values(null, 'José Mourinho', 2500.00);

insert into funcionario values(null, 'Maria Aparecida', 2000.00);

insert into funcionario values(null, 'João Carreiro', 800.00);

insert into funcionario values(null, 'Pardinho', 5000.00);

insert into funcionario values(null, 'Julia Caldan', 3200.00);

insert into funcionario values(null, 'Bruna Heidi', 650.00);

insert into funcionario values(null, 'Henrique Schwortz', 1600.00);

insert into funcionario values(null, 'Douglas Vieira', 3500.00);

/* =============================================== INSTRUTORES */

insert into instrutor values (null, '12345678', 'A', 1);

insert into instrutor values (null, '88888888', 'A', 2);

insert into instrutor values (null, '87654321', 'AB', 3);

insert into instrutor values (null, '64975413', 'AB', 4);

insert into instrutor values (null, '67894385', 'AB', 6);

/* =============================================== PROFESSORES */

insert into professor values (null, '64321', 2);

insert into professor values (null, '12345', 4);

insert into professor values (null, '55555', 5);

insert into professor values (null, '91347', 7);

insert into professor values (null, '76841', 8);

/* =============================================== SALARIOS */

insert into salarios values (null, 2500, 1, 1, '2018-11-01', '2018-11-01');

insert into salarios values (null, 2000, 2, 1, '2018-11-01', '2018-11-01');

insert into salarios values (null, 800, 3, 0, '2018-10-01', '2018-10-01');

insert into salarios values (null, 5000, 4, 1, '2018-11-01', '2018-11-01');

insert into salarios values (null, 3200, 5, 1, '2018-09-01', '2018-09-01');

insert into salarios values (null, 650, 6, 1, '2018-11-01', '2018-11-01');

insert into salarios values (null, 1600, 7, 0, '2018-11-01', '2018-11-01');

insert into salarios values (null, 3500, 8, 1, '2018-09-01', '2018-09-01');

-- INSERT INTO `AutoEscola`.`Salarios` (Valor, id_Funcionario, statusPagamento, pagamentoReferenteA, dataPagamento) VALUES (1000, 1 ,1 ,'2018-10-01', '2018-10-18');

/* =============================================== TURNOS */

insert into turno values (null, 1, 1, 1, 1, 1, 0, '08:00:00', '17:00:00', '2018-01-01', '2018-12-31');

insert into funcionario_has_turno values (1, null, 1);

insert into turno values (null, 1, 0, 1, 0, 1, 0, '08:00:00', '13:00:00', '2018-01-01', '2018-12-31');

insert into funcionario_has_turno values (2, null, 2);

insert into turno values (null, 1, 1, 1, 1, 0, 0, '13:00:00', '22:00:00', '2018-01-01', '2018-12-31');

insert into funcionario_has_turno values (3, null, 3);

insert into turno values (null, 1, 1, 1, 1, 1, 1, '08:00:00', '18:00:00', '2018-01-01', '2018-12-31');

insert into funcionario_has_turno values (4, null, 4);

insert into turno values (null, 0, 1, 1, 1, 0, 0, '18:00:00', '22:00:00', '2018-01-01', '2018-12-31');

insert into funcionario_has_turno values (5, null, 5);

insert into turno values (null, 1, 1, 1, 1, 1, 0, '08:00:00', '18:00:00', '2018-01-01', '2018-12-31');

insert into funcionario_has_turno values (6, null, 6);

insert into turno values (null, 1, 0, 1, 0, 1, 1, '08:00:00', '18:00:00', '2018-01-01', '2018-12-31');

insert into funcionario_has_turno values (7, null, 7);

insert into turno values (null, 1, 1, 1, 1, 1, 1, '08:00:00', '22:00:00', '2018-01-01', '2018-12-31');

insert into funcionario_has_turno values (8, null, 8);

/* =============================================== ALUNOS */

insert into aluno values (null, 'Gabriel Barbosa', '50880762667', '2354386301', 'gabigol@gmail.com', '1990-12-01', '2018-11-18 12:01:30');

insert into aluno values (null, 'Angélica Faria de Lima', '77777777777', '4037962718', 'angelica@mail.com', '1985-03-07', '2018-10-20 14:07:30');

insert into aluno values (null, 'Marcos Alberto Tadeu', '46792418723', '3646724579', 'marcos.al@gmail.com', '1991-12-14', '2018-09-07 19:27:30');

insert into aluno values (null, 'José do Milho Verde', '39240779722', '4839616708', 'jose.milho@hotmail.com', '1993-02-01', '2018-11-20 10:26:30');

insert into aluno values (null, 'Mayra Carvalho Ferreira de França', '23487968451', '4679823467', 'mayra@mail.com', '1994-07-26', '2018-01-15 21:15:30');

--INSERT INTO `AutoEscola`.`Aluno` (nome,  cpf, rg, email, dataNascimento, dataRegistro) VALUES ("Aluno Teste", "12345612342", "521425235", "teste@email.com", "1990-01-01", now());

/* =============================================== TELEFONE */

insert into telefone values (null, '11997463241', 1);

insert into telefone values (null, '11987654321', 2);

insert into telefone values (null, '1146200802', 3);

insert into telefone values (null, '11941976354', 4);

insert into telefone values (null, '11997634723', 5);

/* =============================================== ENDEREÇOS */

insert into endereco values (null, 'Rua Pedro Vicente', 700, 'Bloco 3', 'Jd Veloso', 'Osasco', 'SP', '01109-010', 1);

insert into endereco values (null, 'Rua Barão de Rio Branco', 964, 'Casa', 'Centro', 'São Paulo', 'SP', '01213-020', 2);

insert into endereco values (null, 'Rua Anemona', 25, 'Casa 02', 'Jd das Flores', 'Osasco', 'SP', '06254-003', 3);

insert into endereco values (null, 'Rua Heitor Penteado', 2413, 'AP 13', 'Sumarezinho', 'São Paulo', 'SP', '05543-020', 4);

insert into endereco values (null, 'Rua Alberto Andaló', 24, 'AP 26', 'Centro', 'Guarulhos', 'SP', '07243-020', 5);

/* =============================================== MATRICULAS */

insert into matricula values (null, 'A', 1, 1, 1, 0, '2018-11-18', 1, 1500.00);

insert into matricula values (null, 'A', 0, 0, 0, 0, '2018-11-03', 2, 1300.00);

insert into matricula values (null, 'AB', 1, 1, 1, 1, '2018-09-26', 3, 2000.00);

insert into matricula values (null, 'B', 1, 0, 1, 1, '2018-10-15', 4, 900.00);

insert into matricula values (null, 'AB', 1, 1, 1, 1, '2018-10-24', 5, 1800.00);

/* =============================================== DINHEIROENTRAR */

insert into dinheiroentrar values (null, 300.00, 'Pagamento referente as aulas no simulador', 1, 1, '2018-11-05');

insert into dinheiroentrar values (null, 700.00, 'Pagamento referente as aulas praticas', 2, 0, '2018-11-15');

insert into dinheiroentrar values (null, 650.00, 'Pagamento referente as aulas no simulador', 3, 1, '2018-09-20');

insert into dinheiroentrar values (null, 700.00, 'Pagamento referente as aulas teoricas', 4, 1, '2018-10-17');

insert into dinheiroentrar values (null, 650.00, 'Pagamento referente as aulas teoricas', 5, 1, '2018-10-17');

/* =============================================== AULAS */

insert into aula values (null, '2018-10-01 08:00:00', '2018-10-01 09:00:00', 1);

insert into aula values (null, '2018-10-11 13:00:00', '2018-10-01 14:00:00', 1);

insert into aula values (null, '2018-10-21 15:00:00', '2018-10-01 16:00:00', 1);

insert into aula values (null, '2018-11-01 12:00:00', '2018-11-01 13:00:00', 2);

insert into aula values (null, '2018-11-11 13:00:00', '2018-11-01 14:00:00', 2);

insert into aula values (null, '2018-11-21 15:00:00', '2018-11-01 16:00:00', 2);

/* =============================================== AULAS TEÓRICAS */

insert into aulateorica values (null, 1, 1);

insert into aulateorica values (null, 2, 2);

/* =============================================== AULAS PRÁTICAS */

insert into aulapratica values (null, 1, 3, 1);

insert into aulapratica values (null, 1, 4, 2);

insert into aulapratica values (null, 2, 5, 2);

insert into aulapratica values (null, 2, 6, 2);

/* =============================================== FLUXO DE CAIXA */

insert into fluxodecaixamensalhistorico values (null, '2018-02-01', 10000, 8000);