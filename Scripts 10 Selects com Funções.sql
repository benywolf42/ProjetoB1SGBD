use autoescola;

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

-- Checar total de horas que um funcionario x trabalhou em um mês dando aulas pratricas e teoricas (ex: funcionario = "José Mourinho" data = "2018-11")
select 
time_format( SEC_TO_TIME( SUM( TIME_TO_SEC( TIMEDIFF(aa.fimAula, aa.inicioAula) ) ) ),'%H:%i:%s') 
from aula aa
left join aulateorica at on at.id_Aula = aa.idAula
left join aulapratica ap on ap.id_Aula = aa.idAula
left join funcionario fc on fc.idFuncionario = at.id_Professor or fc.idFuncionario = ap.id_Instrutor
where fc.nome = 'José Mourinho'
and (SUBSTR(aa.inicioAula,1,7) = '2018-11'
	or SUBSTR(aa.fimAula,1,7) = '2018-11')
