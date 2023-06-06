-- Essa query eu fiz pra trazer a data de nascimento,
-- nome e sobrenome fazendo um ifnull caso o segundo nome venha null
-- trazendo o et.evt_tk_id. 
-- Trazendo o tipo de eventos colocando um if pra trazer '0', 'Geral', 'VIP' e dando o nome de Tipo
-- trazendo o accessDate atribuindo Ausente ou Presente dando nome de Presença
-- trazendo cpf que vem de Number da tabela identity_numbers onde o NumberType = 1
-- trazendo o email que vem de Number da tabela identity_numbers onde o NumberType = 4
-- trazendo o telefone que vem de Number da tabela identity_numbers onde o NumberType = 3
-- trazendo o nome do evento que vem da tabela events



-- GABRIEL
SELECT 
    CONCAT(i.Birthday, '/', i.BirthMonth, '/', i.BirthYear) AS Data_Nascimento,
    CONCAT(i.Name1, ' ', IFNULL(i.Name2, '')) AS Nome,
    et.evt_tk_id,
    IF(et.ticketType = '0', 'Geral', 'VIP') AS Tipo,
    IF(et.accessDate IS NULL, 'Ausente', 'Presente') AS Presença,
    in2.Number AS CPF,
    in3.Number AS EMAIL,
    in4.Number AS TELEFONE,
    e.Name AS Evento
FROM 
    event_tickets et 
    INNER JOIN events e ON e.Code = et.eventCode AND e.OwnerId = 20 AND e.Code LIKE 'VP%'
    INNER JOIN identities i ON i.Identity = et.identity
    INNER JOIN identity_FanId ifi ON ifi.Identity = i.Identity AND ifi.OwnerId = 20
    INNER JOIN identity_numbers in2 ON in2.Identity = ifi.Identity AND in2.NumberType = 1
    INNER JOIN identity_numbers in3 ON in3.Identity = ifi.Identity AND in3.NumberType = 4
    INNER JOIN identity_numbers in4 ON in4.Identity = ifi.Identity AND in4.NumberType = 3
GROUP BY 
    et.evt_tk_id, i.Birthday
ORDER BY 
    e.Name, e.DateStart;