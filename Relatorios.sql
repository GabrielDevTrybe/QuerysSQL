
-- OBS LEMBRAR DE TROCAR O LIKE QUE NO CASO È DO CUIABA

-- Primeiro executo essa query para pegar os nomes, tbm posso olhar no template anterior para relembrar
SELECT * FROM events e
WHERE OwnerId = 20 and Code like '%VP_01_CUIABA_%';


-- Nesse daqui eu comento todos os debaixo e vou executando um por um, e a cada um que eu executo e termino
-- eu coloco um left join e descomento a linha AND et1.`identity` IS NULL por diante. Tenho que lembrar que o que eu vou executar eu coloco inner join
SELECT COUNT(ifi.`Identity`)
FROM identity_FanId ifi
	LEFT JOIN event_tickets et1 ON ifi.`Identity` = et1.`identity` AND et1.eventCode = 'VP_01_CUIABA_01'
	LEFT JOIN event_tickets et2 ON ifi.`Identity` = et2.`identity` AND et2.eventCode = 'VP_01_CUIABA_02'
	LEFT JOIN event_tickets et3 ON ifi.`Identity` = et3.`identity` AND et3.eventCode = 'VP_01_CUIABA_03'
	LEFT JOIN event_tickets et4 ON ifi.`Identity` = et4.`identity` AND et4.eventCode = 'VP_01_CUIABA_04'
	LEFT JOIN event_tickets et5 ON ifi.`Identity` = et5.`identity` AND et5.eventCode = 'VP_01_CUIABA_05'
	LEFT JOIN event_tickets et6 ON ifi.`Identity` = et6.`identity` AND et6.eventCode = 'VP_01_CUIABA_06'
WHERE ifi.OriginSystemId = 81
--  	AND ifi.CreationDate > '2023-05-01'
 	AND et1.`identity` IS NULL
 	AND et2.`identity` IS NULL
 	AND et3.`identity` IS NULL
 	AND et4.`identity` IS NULL
 	AND et5.`identity` IS NULL;


--  Nesse aqui eu consigo pegar os campos de faixa etaria, lembrar de conferir por dia
 SELECT
	e.Name,
	CASE
  		WHEN et.ticketType = '0' THEN 'Geral'
		ELSE 'VIP'
	END as Tipo,
	COUNT(evt_tk_id) as Criados,
-- 	COUNT(accessDate) as Acessados,
		CASE
		WHEN i.BirthYear is null THEN 'Idade não informada'
		WHEN i.birthYear > 2006 THEN '0 a 17 anos'
		WHEN i.birthYear > 1999 THEN '18 a 24 anos'
		WHEN i.birthYear > 1985 THEN '25 a 34 anos'
		WHEN i.birthYear > 1975 THEN '35 a 44 anos'
		WHEN i.birthYear > 1959 THEN '45 a 59 anos'
		WHEN i.birthYear > 1939 THEN '60 a 79 anos'
		ELSE '80 anos ou mais'
	END as 'Faixa Etária'
FROM event_tickets et
	INNER JOIN events e on e.Code = et.eventCode
	INNER JOIN identities i on i.`Identity` = et.`identity`
WHERE et.eventCode like '%VP_01_CUIABA_%'
GROUP BY et.eventCode, et.ticketType,
		CASE
		WHEN i.BirthYear is null THEN 'Idade não informada'
		WHEN i.birthYear > 2006 THEN '0 a 17 anos'
		WHEN i.birthYear > 1999 THEN '18 a 24 anos'
		WHEN i.birthYear > 1985 THEN '25 a 34 anos'
		WHEN i.birthYear > 1975 THEN '35 a 44 anos'
		WHEN i.birthYear > 1959 THEN '45 a 59 anos'
		WHEN i.birthYear > 1939 THEN '60 a 79 anos'
		ELSE '80 anos ou mais'
	END;



Utilizei essa da ultima vez pro evento de Campo Grande

SELECT * FROM events e
WHERE OwnerId = 20 and Code like '%VP_CG_%';


-- Nesse daqui eu comento todos os debaixo e vou executando um por um, e a cada um que eu executo e termino
-- eu coloco um left join e descomento a linha AND et1.`identity` IS NULL por diante. Tenho que lembrar que o que eu vou executar eu coloco inner join
SELECT COUNT(ifi.`Identity`)
FROM identity_FanId ifi
	INNER JOIN event_tickets et1 ON ifi.`Identity` = et1.`identity` AND et1.eventCode = 'VP_CG_1'
-- 	LEFT JOIN event_tickets et2 ON ifi.`Identity` = et2.`identity` AND et2.eventCode = 'VP_CG_2'
-- 	LEFT JOIN event_tickets et3 ON ifi.`Identity` = et3.`identity` AND et3.eventCode = 'VP_CG_3'
-- 	LEFT JOIN event_tickets et4 ON ifi.`Identity` = et4.`identity` AND et4.eventCode = 'VP_CG_4'
-- 	LEFT JOIN event_tickets et5 ON ifi.`Identity` = et5.`identity` AND et5.eventCode = 'VP_CG_5'
-- 	LEFT JOIN event_tickets et6 ON ifi.`Identity` = et6.`identity` AND et6.eventCode = 'VP_CG_6'
WHERE ifi.OriginSystemId = 81;
--  	AND et1.`identity` IS NULL
--  	AND et2.`identity` IS NULL
--  	AND et3.`identity` IS NULL
--  	AND et4.`identity` IS NULL
--  	AND et5.`identity` IS NULL


--  Nesse aqui eu consigo pegar os campos de faixa etaria, lembrar de conferir por dia
 SELECT
	e.Name,
	CASE
  		WHEN et.ticketType = '0' THEN 'Geral'
		ELSE 'VVIP'
	END as Tipo,
	COUNT(evt_tk_id) as Criados,
-- 	COUNT(accessDate) as Acessados,
		CASE
		WHEN i.BirthYear is null THEN 'Idade não informada'
		WHEN i.birthYear > 2006 THEN '0 a 17 anos'
		WHEN i.birthYear > 1999 THEN '18 a 24 anos'
		WHEN i.birthYear > 1985 THEN '25 a 34 anos'
		WHEN i.birthYear > 1975 THEN '35 a 44 anos'
		WHEN i.birthYear > 1959 THEN '45 a 59 anos'
		WHEN i.birthYear > 1939 THEN '60 a 79 anos'
		ELSE '80 anos ou mais'
	END as 'Faixa Etária'
FROM event_tickets et
	INNER JOIN events e on e.Code = et.eventCode
	INNER JOIN identities i on i.`Identity` = et.`identity`
WHERE et.eventCode = 'VP_CG_6'
GROUP BY et.eventCode, et.ticketType,
		CASE
		WHEN i.BirthYear is null THEN 'Idade não informada'
		WHEN i.birthYear > 2006 THEN '0 a 17 anos'
		WHEN i.birthYear > 1999 THEN '18 a 24 anos'
		WHEN i.birthYear > 1985 THEN '25 a 34 anos'
		WHEN i.birthYear > 1975 THEN '35 a 44 anos'
		WHEN i.birthYear > 1959 THEN '45 a 59 anos'
		WHEN i.birthYear > 1939 THEN '60 a 79 anos'
		ELSE '80 anos ou mais'
	END;

SELECT * FROM event_tickets et;
SELECT * FROM tickets_for_sale tfs WHERE tfs.EventCode = 'VP_CG_4' AND tfs.Price = 0;
SELECT * FROM event_ticket_types ett;

SELECT * FROM events e WHERE e.Code LIKE '%VP_CG_%';

-- VVIP
-- VP_CG_4
-- VP_CG_5
-- VP_CG_6

-- Geral
-- VP_CG_1
-- VP_CG_2
-- VP_CG_3

-- ingresso valor diferente de 0 é vvip













Query que eu usei pra add o VIP e VVIP


SELECT * FROM events e
WHERE OwnerId = 20 and Code like '%VP_CG_%';


-- Nesse daqui eu comento todos os debaixo e vou executando um por um, e a cada um que eu executo e termino
-- eu coloco um left join e descomento a linha AND et1.`identity` IS NULL por diante. Tenho que lembrar que o que eu vou executar eu coloco inner join
SELECT COUNT(ifi.`Identity`)
FROM identity_FanId ifi
	LEFT JOIN event_tickets et1 ON ifi.`Identity` = et1.`identity` AND et1.eventCode = 'VP_CG_1'
	LEFT JOIN event_tickets et2 ON ifi.`Identity` = et2.`identity` AND et2.eventCode = 'VP_CG_2'
	LEFT JOIN event_tickets et3 ON ifi.`Identity` = et3.`identity` AND et3.eventCode = 'VP_CG_3'
	LEFT JOIN event_tickets et4 ON ifi.`Identity` = et4.`identity` AND et4.eventCode = 'VP_CG_4'
	LEFT JOIN event_tickets et5 ON ifi.`Identity` = et5.`identity` AND et5.eventCode = 'VP_CG_5'
	INNER JOIN event_tickets et6 ON ifi.`Identity` = et6.`identity` AND et6.eventCode = 'VP_CG_6'
WHERE ifi.OriginSystemId = 81
 	AND et1.`identity` IS NULL
 	AND et2.`identity` IS NULL
 	AND et3.`identity` IS NULL
 	AND et4.`identity` IS NULL
 	AND et5.`identity` IS NULL;


--  Nesse aqui eu consigo pegar os campos de faixa etaria, lembrar de conferir por dia
 SELECT
	e.Name,
	CASE
  		WHEN et.ticketType = '0' THEN 'Geral'
  		WHEN et.ticketType = '1' THEN 'VVIP'
  		WHEN et.ticketType = 'VIP' THEN 'VIP'
	END as Tipo,
-- 	COUNT(evt_tk_id) as Criados,
	COUNT(accessDate) as Acessados,
		CASE
		WHEN i.BirthYear is null THEN 'Idade não informada'
		WHEN i.birthYear > 2006 THEN '0 a 17 anos'
		WHEN i.birthYear > 1999 THEN '18 a 24 anos'
		WHEN i.birthYear > 1985 THEN '25 a 34 anos'
		WHEN i.birthYear > 1975 THEN '35 a 44 anos'
		WHEN i.birthYear > 1959 THEN '45 a 59 anos'
		WHEN i.birthYear > 1939 THEN '60 a 79 anos'
		ELSE '80 anos ou mais'
	END as 'Faixa Etária'
FROM event_tickets et
	INNER JOIN events e on e.Code = et.eventCode
	INNER JOIN identities i on i.`Identity` = et.`identity`
WHERE et.eventCode = 'VP_CG_6'
GROUP BY et.eventCode, et.ticketType,
		CASE
		WHEN i.BirthYear is null THEN 'Idade não informada'
		WHEN i.birthYear > 2006 THEN '0 a 17 anos'
		WHEN i.birthYear > 1999 THEN '18 a 24 anos'
		WHEN i.birthYear > 1985 THEN '25 a 34 anos'
		WHEN i.birthYear > 1975 THEN '35 a 44 anos'
		WHEN i.birthYear > 1959 THEN '45 a 59 anos'
		WHEN i.birthYear > 1939 THEN '60 a 79 anos'
		ELSE '80 anos ou mais'
	END;

SELECT * FROM event_tickets et WHERE et.eventCode = "VP_CG_6" AND (et.ticketType <> 0 OR et.ticketType = "VIP");
SELECT * FROM event_tickets et WHERE et.eventCode = "VP_CG_3" AND et.ticketType <> 0;
SELECT * FROM Event_invites ei WHERE ei.EventCode = "VP_CG_3";
SELECT * FROM tickets_for_sale tfs WHERE tfs.EventCode = 'VP_CG_4' AND tfs.Price = 0;
SELECT * FROM event_ticket_types ett;

SELECT * FROM events e WHERE e.Code LIKE '%VP_CG_%';


-- Quando esta na tabela de EventInvites ele foi convidado, então ele é VIP

SELECT * FROM event_tickets et
INNER JOIN Event_invites ei ON et.eventCode = ei.EventCode
WHERE et.eventCode = "VP_CG_3";


-- VVIP
-- VP_CG_4
-- VP_CG_5
-- VP_CG_6

-- Geral
-- VP_CG_1
-- VP_CG_2
-- VP_CG_3

-- ingresso valor diferente de 0 é vvip


SELECT
    ifi.`Identity`,
    CONCAT(if2.Name1,' ', IFNULL(if2.Name2, '')) Nome,
    if2.Gender,
    CONCAT(if2.Birthday, '/', if2.BirthMonth,'/', if2.BirthYear) as Nascimento,
    in2.`Number` as CPF,
    GROUP_CONCAT(if3.`Number`) as Email,
    GROUP_CONCAT(if4.`Number`) as Tel,
    if5.Zip as CEP
    FROM user_survey us
join identity_FanId ifi on ifi.`Identity` = us.ID and ifi.OwnerId = 168
join identity_fandata if2 on if2.FanId = ifi.FanId and if2.OwnerId = ifi.OwnerId
left join identity_numbers in2 on in2.`Identity` = us.ID and in2.NumberType = 1
left join identity_fannumbers if3 on if3.FanId = ifi.FanId and if3.OwnerId = ifi.OwnerId and if3.NumberType = 4
left join identity_fannumbers if4 on if4.FanId = ifi.FanId and if4.OwnerId = ifi.OwnerId and if4.NumberType = 3
left join identity_fanaddresses if5 on if5.FanId = ifi.FanId and if5.OwnerId = ifi.OwnerId
WHERE us.surveyID = 552
AND us.end IS NOT NULL
AND us.end <= '2024-02-26 23:59:59'
GROUP by ifi.`Identity`;
