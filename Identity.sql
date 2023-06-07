-- Nessa contulta recebi nomes de umas pessoas
-- e retornei as informações de contato delas, como 
-- endereço, email telefone esse tipo de informaçãp.

-- Aqui eu tive um problema onde algumas pessoas não tinham essas informações
-- dai eu tive que verificar se elas responderam o survey de cadastro  288 do galo
-- Eu tive que pegar o identity delas, ir na tabela user_survey onde o 
-- idenetity é ID, depois que eu passei o ID o retorno da consulta me retornou um
-- surveyUserID onde especificava qual survey essa pessoa respondeu como o survey 288 e 289.
-- O que eu precisei pegar foi o 288 que era o survey de cadastro. Dai entao com esse surveyUserID
-- eu fui na tabela user_survey_answer passando esse surveyUserID pra pegar as respostas desse survey


-- Thiago Delabela = 3853490
-- Leandro Barbosa Pontes = 3622403
-- Samyra Lorrayne = 3870451
-- Rone Pereira = 3870381
-- Nelson Henrique Nery = 3872586
-- Claudia Marcia Cunha Ribeiro = 3728137
-- Moisés Andriola = 3857573
-- Rafael Oliveira Gonçalves = 3673923
-- Procurar se preencheram o survey 288

SELECT * FROM user_survey
WHERE ID IN (3853490, 3622403, 3870451, 3870381, 3872586, 3728137, 3857573, 3673923)
AND surveyID = 288;

SELECT * FROM user_survey WHERE ID = 3857573;
SELECT * FROM user_survey_answer WHERE surveyUserID = 334092;


SELECT * FROM identity_addresses WHERE `Identity` = 3673923;
SELECT 
	i.`Identity`,
    CONCAT(i.Name1, ' ', IFNULL(i.Name2, '')) AS Nome,
    in2.Number AS Telefone,
    in3.Number AS Email,
    ia.Add1 AS Rua,
    ia.Zip AS Cep,
    ia.City AS Cidade,
    ia.State AS Estado
FROM 
    identities AS i
INNER JOIN 
    identity_numbers AS in2 ON in2.Identity = i.Identity AND in2.NumberType = 3
INNER JOIN
    identity_numbers AS in3 ON in3.Identity = i.Identity AND in3.NumberType = 4
LEFT JOIN identity_addresses AS ia ON ia.Identity = i.Identity
WHERE 
    i.Identity IN (3853490, 3622403, 3870451, 3870381, 3872586, 3728137, 3857573, 3673923);


