use autoescola;

insert into veiculo values (null, 'A', 'Normal', 'ABC-1234', 'Hyundai', 'HB20', 2018);

insert into funcionario values(null, 'José Mourinho', 2500.00);

insert into funcionario values(null, 'Maria Aparecida', 2000.00);

insert into aluno values (null, 'Gabriel Barbosa', '508.807.626-67', '23.543.863-01', 'gabigol@gmail.com', '1990-12-01', '2018-11-18 12:01:30');

insert into instrutor values (null, '12345678', 'A', 1);

insert into matricula values (null, 'A', 1, 1, 1, 0, '2018-11-18', 1, 1500.00);

insert into telefone values (null, '4002-8922', 1);

insert into professor values (null, '64321', 2);

insert into endereco values (null, 'Rua Pedro Vicente', 700, 'Bloco 3', 'Jd Veloso', 'Osasco', 'SP', '01109-010', 1);

insert into dinheiroentrar values (null, 300.00, 'Pagamento referente as aulas no simulador', 1, 1, '2018-11-05');

insert into fluxodecaixamensalhistorico values (null, '2018-02-01', 10000, 8000);

insert into salarios values (null, 2500, 1, 1, '2018-11-01', '2018-11-01');

insert into aula values (null, '2018-11-01 12:00:00', '2018-11-01 13:00:00', 1);

insert into aula values (null, '2018-11-11 13:00:00', '2018-11-11 14:00:00', 1);

insert into aula values (null, '2018-11-21 15:00:00', '2018-11-21 16:00:00', 1);

insert into aulapratica values (null, 1, 1, 1);

insert into aulateorica values (null, 1, 2);

insert into turno values (null, 1, 1, 1, 1, 1, 0, '08:00:00', '17:00:00', '2018-01-01', '2018-12-31');

insert into funcionario_has_turno values (1, null, 1);