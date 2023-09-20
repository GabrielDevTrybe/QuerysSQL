-- precisamos enviar à FPF a lista de inscritos no curso até o momento, 
-- incluindo nome, cargo e empresa. Quem pode verificar isso por favor?
-- Ale Nakai — Today at 11:19 AM
-- @GabrielCoelho95 precisamos dessa lista acima.
-- O evento é o de eventCode = SUPERVISORES-2023 do owner 24
-- O survey com as respostas de cargo e empresa é o do surveyID 406


-- Aqui foi pedido um SELECT onde eu trouxe
-- o nome que eu tive que pegar pelo identity_FanId, lincando primeiro com user_survey
-- depois pegando a tabela identities e dai sim conseguindo lincar com i.`Identity` = ifi.`Identity`
-- As respostas de cargo e empresa peguei na tabela user_survey_answer onde o id delas são 210 para Empresa
-- e 281 para Cargo. No fim disse que tudo isso é baseado no surveyID 406

SELECT DISTINCT 
	CONCAT(i.Name1, ' ', IFNULL(i.Name2, '')) AS Nome,
	usa1.answer AS Empresa,
	usa2.answer AS Cargo
FROM user_survey us
INNER JOIN identity_FanId ifi ON ifi.`Identity` = us.ID
INNER JOIN identities i ON i.`Identity` = ifi.`Identity` 
LEFT JOIN user_survey_answer usa1 ON us.surveyUserID = usa1.surveyUserID AND usa1.questionId = 210
LEFT JOIN user_survey_answer usa2 ON us.surveyUserID = usa2.surveyUserID AND usa2.questionId = 281
WHERE us.surveyID = 406;




-- Essa query eu fiz pra mostrar todas as perguntas do Owner 406. Onde eu tive que garantir
-- que as pessoas pelo menos chegaram até a ultima pergunta. Quando elas chegam na ultima
-- tem end, mas não quer dizer que concluiram. Elas só concluiram quando geram o ticket,
-- então tive que conferir se elas tbm tem ticket. Fiz um if onde ele diz que no lugar de vir ticke NULL
-- ele vem como não tem ticket, e os que tem vem como tem ticket


  SELECT DISTINCT
    CONCAT(i.Name1, ' ', IFNULL(i.Name2, '')) AS Nome,
    usa1.answer AS Empresa,
    usa2.answer AS Cargo,
    usa3.answer AS Escolaridade,
    us.userCode AS CPF,
    usa4.answer AS Upload,
    if (et.evt_tk_id > 0, "Tem Ticket", "Não tem Ticket") AS Tickets
FROM
    user_survey us
LEFT JOIN
    identity_FanId ifi ON ifi.`Identity` = us.ID
INNER JOIN
    identities i ON i.`Identity` = ifi.`Identity`
LEFT JOIN
    user_survey_answer usa1 ON us.surveyUserID = usa1.surveyUserID AND usa1.questionId = 210
LEFT JOIN
    user_survey_answer usa2 ON us.surveyUserID = usa2.surveyUserID AND usa2.questionId = 281
LEFT JOIN
    user_survey_answer usa3 ON us.surveyUserID = usa3.surveyUserID AND usa3.questionId = 202
LEFT JOIN
    user_survey_answer usa4 ON us.surveyUserID = usa4.surveyUserID AND usa4.questionId = 10007
LEFT JOIN event_tickets et ON et.`identity` = ifi.`Identity` 
WHERE
    us.surveyID = 406 AND us.`end` IS NOT NULL AND currentReq = 3;







-- Essa query foi solicitada pelo SEBA para que fosse feita uma consulta
-- para retornar a lista dos que foram ao evento 'FUT_FEM'.
-- Pegamos esses caras por Event_invites pois ali ficavam todos os convidados
-- e nssa tabela ja tinha email e nome.
-- e garantimos que eles compareceram pelo accessDate

SELECT 
    ei.Name, 
    ei.Email, 
    ei.Identity, 
    et.identity, 
    et.accessDate  
FROM 
    Event_invites ei
JOIN 
    event_tickets et ON et.externalCode = ei.VoucherTK
WHERE 
    ei.EventCode = 'FUT_FEM'
    AND et.accessDate IS NOT NULL;
