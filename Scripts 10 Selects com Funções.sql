use autoescola;

drop database autoescola;

-- Ver aulas práticas de um mês em especifico (ex: mês = 2018-11)
select *  from aula aa
join aulapratica ap on ap.id_Aula = aa.idAula
where SUBSTR(inicioAula,1,7) = '2018-11'
or SUBSTR(fimAula,1,7) = '2018-11';

-- Ver aulas teoricas de um mês em especifico (ex: mês = "2018-11")
select *  from aula aa
join aulateorica at on at.id_Aula = aa.idAula
where SUBSTR(inicioAula,1,7) = '2018-11'
or SUBSTR(fimAula,1,7) = '2018-11';

-- Checar todos os agendamentos de um instrutor em especifico em uma data especifica (ex: Instrutor = "José Mourinho" data = "2018-11-01")
select aa.inicioAula, aa.fimAula ,at.id_Professor, ap.id_Instrutor, fc.nome from aula aa
left join aulateorica at on at.id_Aula = aa.idAula
left join aulapratica ap on ap.id_Aula = aa.idAula
left join funcionario fc on fc.idFuncionario = at.id_Professor or fc.idFuncionario = ap.id_Instrutor
where fc.nome = 'José Mourinho'
and (SUBSTR(aa.inicioAula,1,10) = '2018-11-01'
	or SUBSTR(aa.fimAula,1,10) = '2018-11-01')
order by aa.inicioAula desc;

-- Checar total de horas que um funcionario x trabalhou em um mês dando aulas praticas e teoricas (ex: funcionario = "José Mourinho" data = "2018-11")
select 
time_format( SEC_TO_TIME( SUM( TIME_TO_SEC( TIMEDIFF(aa.fimAula, aa.inicioAula) ) ) ),'%H:%i:%s') 
from aula aa
left join aulateorica at on at.id_Aula = aa.idAula
left join aulapratica ap on ap.id_Aula = aa.idAula
left join funcionario fc on fc.idFuncionario = at.id_Professor or fc.idFuncionario = ap.id_Instrutor
where fc.nome = 'José Mourinho'
and (SUBSTR(aa.inicioAula,1,7) = '2018-11'
	or SUBSTR(aa.fimAula,1,7) = '2018-11');
 
  -- Ver carros utilizados em um mês em especifico (ex: mês = 2018-11)
select bv.chassi, bv.placa, bv.marca, bv.modelo, bv.ano from aula bb
join aulapratica bp on bp.id_Aula = bb.idAula
join veiculo bv on bv.idVeiculo = bp.Veiculo_idVeiculo
where SUBSTR(inicioAula,1,7) = '2018-11'
or SUBSTR(fimAula,1,7) = '2018-11';
 
  -- Ver o salário de cada um dos funcionários instrutores com salário maior que um valor específico
select func.nome, sal.Valor, sal.dataPagamento, inst.registroInstrutor from salarios sal
join funcionario func on sal.id_Funcionario = idFuncionario
join instrutor inst on inst.id_Funcionario = idFuncionario
where sal.Valor >= 1000.00;

  -- Consultar o status do aluno irregular matriculado 
select alu.nome, din.statusPagamento, mat.statusMatricula, mat.statusExameMedico, mat.statusExameCfc from matricula mat
join aluno alu on alu.idAluno = mat.id_Aluno
join dinheiroentrar din on din.id_Matricula = mat.idMatricula
where mat.statusMatricula != 1 or
mat.statusExameMedico != 1 or
din.statusPagamento != 1;

-- Listar todas as entradas de dinheiro de um aluno especifico
select al.nome, al.cpf, ma.tipoCnh ,de.Valor from dinheiroentrar de
join matricula ma on ma.idMatricula = de.id_Matricula
join aluno al on al.idAluno = ma.id_Aluno
where al.nome = 'Gabriel Barbosa';

-- Lista todos os funcionários que são professores e instrutores

select func.idFuncionario, func.nome, prof.idProfessor, prof.registroCfc, inst.idInstrutor, inst.registroInstrutor, inst.tipoCnh from funcionario func
join professor prof on prof.id_Funcionario = func.idFuncionario
join instrutor inst on inst.id_Funcionario = func.idFuncionario
where inst.tipoCnh = 'A' or
inst.tipoCnh = 'AB';

-- Ver aulas teoricas de forma mais visual de um mês em especifico (ex: mês = "2018-11")
select al.nome, al.cpf, fu.nome, pf.registroCfc, aa.idAula, aa.inicioAula, aa.fimAula from aula aa
join aulateorica at on at.id_Aula = aa.idAula
join professor pf on pf.idProfessor = at.id_Professor
join matricula mt on mt.idMatricula = aa.id_Matricula
join aluno al on al.idAluno = mt.id_Aluno
join funcionario fu on fu.idFuncionario = pf.id_Funcionario
where SUBSTR(inicioAula,1,7) = '2018-11'
or SUBSTR(fimAula,1,7) = '2018-11';


    
    

    
    
