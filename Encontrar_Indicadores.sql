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
