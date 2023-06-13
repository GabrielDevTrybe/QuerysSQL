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