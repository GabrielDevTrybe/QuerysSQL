/*
Foi pedido pra fazer isso 
exporte uma lista (Dados cadastrais + Respostas do capítulo aquecimento) 
de todos os respondentes da Survey da WSL Saquarema Jun/23.
Os dados de CPF ao inves de pegar pelo identityNumbers eu peguei ele
pela resposta do Survey na user_survey_answer onde o id da pergunta de CPF
era a 119. Também tive que fazer uma adaptação para que acada resposta ficasse em colunas
diferentes, pegando cada Id de cada resposta e adicionando como campo no Select.
*/

SELECT DISTINCT
CONCAT(i.Name1, ' ', IFNULL(i.Name2, '')) AS Nome,
in2.`Number` AS Email,
in3.`Number` AS Telefone,
usa.answer AS CPF,
usa2.answer AS País,
usa3.answer  AS EstadoCivil,
usa4.answer  AS TemFilho,
usa5.answer  AS Renda
FROM user_survey us 
INNER JOIN user_survey_answer usa ON us.surveyUserID = usa.surveyUserID AND usa.questionId = 119
INNER JOIN user_survey_answer usa2 ON usa2.surveyUserID = us.surveyUserID AND usa2.questionId = 106
INNER JOIN user_survey_answer usa3 ON usa3.surveyUserID = us.surveyUserID AND usa3.questionId = 2124
INNER JOIN user_survey_answer usa4 ON usa4.surveyUserID = us.surveyUserID AND usa4.questionId = 201
INNER JOIN user_survey_answer usa5 ON usa5.surveyUserID = us.surveyUserID AND usa5.questionId = 203
INNER JOIN survey_chapters sc ON sc.SurveyId = us.surveyID AND sc.ChapterId = 1 
INNER JOIN identity_FanId ifi ON ifi.`Identity` = us.ID
INNER JOIN identities i ON i.`Identity` = ifi.`Identity` 
LEFT JOIN identity_numbers in2 ON in2.`Identity` = ifi.`Identity` AND in2.NumberType = 4
LEFT JOIN identity_numbers in3 ON in3.`Identity` = ifi.`Identity` AND in3.NumberType = 3
WHERE us.surveyID = 425 
GROUP BY Nome;




/*
Como alguns CPFs estavam Nulos no identity Numbers, fizemos uma consulta
para pegar os dados de CPF que vinham da pergunta 119 onde o Number
da tabela identity_numbers estivessem como Nulos.
Dai no Insert Into entre parenteses tem os campos e eles foram passados no 
Select. Por eexemplo, no Insert Into o primeiro parametro é Identity
e foi passado us.ID, ja no segundo parametro era NumberType e foi passasdo 1 que é o 
NumberType de CPF e assim por diante. Assim o CPF que vem da resposta de user_survey_answer
com o numero da pergunta 119, foi inserido com a condição de que o Number do tipo um de 
identity_numbers forem Null.
*/

INSERT INTO fanbase_db.identity_numbers
(Identity, NumberType, Number, Verified)
select us.ID, 1, convert_cpf(usa.answer), 0 from user_survey us 
join user_survey_answer usa on us.surveyUserID = usa.surveyUserID
LEFT join identity_numbers in2 on us.ID = in2.Identity and NumberType = 1
where us.surveyID  = 425
and usa.questionId = 119
and in2.Number is NULL