-- Aqui eu fiz querys pra atualizar os indicadores que encontrei 
-- no Encontrar_Indicadores e usei o update_indicators pra passar
-- o indicador e o projId que utiliza esse indicador. No caso o 18 é o da ponte preta

CALL `fanbase_db_test`.`ind_ultimo_evento_sys2`(18, -1042, 15, 75);
                                                projID, indicador, OwnerId, systemID

-- Geralmente eu utilizei só esse de baixo, nao usei o de cima
call update_indicator(18, NULL, -1042);
call update_indicator(66, 10, null);
call update_indicator(66, 12, null);
SELECT * FROM indicator_values WHERE IndID = -1143;
SELECT * FROM events WHERE OwnerId = 15;
SELECT * FROM projects WHERE ProjectID = 18;
SELECT * FROM projects;
SELECT * FROM indicators WHERE IndID = -1042;
SELECT * FROM indicators WHERE Config LIKE "%ind_ultimo_evento%";
SELECT * FROM indicators WHERE IndID = -1142;
SELECT * FROM events WHERE OwnerId = 15 ORDER BY DateStart ASC;