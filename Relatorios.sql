
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





