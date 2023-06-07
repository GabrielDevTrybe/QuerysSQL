-- Fiz essas querys para encontrar os indicadores
-- Por exemplo, eu queria adicionar a data do lado dos eventos,
-- dai eu tive que pegar o nome desse indicador pra eu pegar o ID dele
-- e conseguir encontrar os times que usam esse mesmo indicador e trocar as datas


 SELECT * FROM indicators WHERE ProjId = 18 AND `Type` = 10;
 SELECT * FROM indicators WHERE Description = "ULTIMO JOGO OU EVENTO" AND ProjId = 18;
 SELECT * FROM indicators WHERE Description = "PAULISTÃO A2 TOTAL HISTÓRICO" AND ProjId = 18;
 SELECT * FROM indicators WHERE Description = "PAULISTÃO A2 TEMP. ATUAL" AND ProjId = 18;
 SELECT * FROM indicators WHERE Description = "PAULISTÃO A2  Temp. Anterior" AND ProjId = 18;
 SELECT * FROM indicators WHERE Description = "PAULISTÃO A2  Temp. Anterior" AND ProjId = 18;
 SELECT * FROM indicators WHERE Description = "BRASILEIRÃO B TEMP. ANTERIOR" AND ProjId = 87;


BRASILEIRÃO B TOTAL HISTÓRICO
 SELECT * FROM indicators WHERE Description = "BRASILEIRÃO B TEMP. ANTERIOR" AND ProjId = 87;






-- Recebi a tarefa de pegar um nome do indicador na dash do fanbox;
-- Primeiro eu tive que ver qual era o ProjId que estou querendo esse indicador, no caso 
-- era o galo, entao na tabela projects eu encontrei o ProjId do galo que era 137, dai
-- procurar qual era o Id desse indicador "IndID", depois eu trouxe todos os indicadores 
-- baseado nesse indicador que tem o ID 431 e o time que usa esse indicador.
-- Os campos era a quantidade que estava la, o percentual e o texto igual estava na tela

-- IndID 431   indicador
-- projId 137  projects

SELECT * FROM projects WHERE ProjectID = 137;
SELECT * FROM indicators WHERE ProjId = 137 AND Description = "PLANO DE SAÚDE";



SELECT REPLACE(`text`, 'otherText=', '') AS Texto, value AS Quantidade, perc AS Percentual
FROM indicator_values
WHERE IndID = 431 AND ProjId = 137
ORDER BY value DESC;