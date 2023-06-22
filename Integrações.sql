SELECT * FROM interfaces;

-- Aqui eu posso ver os logs relacionados ao cbv_fantasy, 
-- geralmente vou executar para ver se a api esta dando erro
SELECT * FROM interface_log il where il.if_code = "cbv_fantasy" ORDER BY if_date DESC;

select * from interfaces_params ip where ip.IfCode = "cbv_fantasy"

SELECT * FROM interfaces WHERE PrjId = 26;
DESCRIBE interfaces;