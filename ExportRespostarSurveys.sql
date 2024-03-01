SELECT
    ifi.`Identity`,
    CONCAT(if2.Name1,' ', IFNULL(if2.Name2, '')) Nome,
    if2.Gender,
    CONCAT(if2.Birthday, '/', if2.BirthMonth,'/', if2.BirthYear) as Nascimento,
    in2.`Number` as CPF,
    GROUP_CONCAT(if3.`Number`) as Email,
    GROUP_CONCAT(if4.`Number`) as Tel,
    if5.Zip as CEP
FROM user_survey us
join identity_FanId ifi on ifi.`Identity` = us.ID and ifi.OwnerId = 168
join identity_fandata if2 on if2.FanId = ifi.FanId and if2.OwnerId = ifi.OwnerId
left join identity_numbers in2 on in2.`Identity` = us.ID and in2.NumberType = 1
left join identity_fannumbers if3 on if3.FanId = ifi.FanId and if3.OwnerId = ifi.OwnerId and if3.NumberType = 4
left join identity_fannumbers if4 on if4.FanId = ifi.FanId and if4.OwnerId = ifi.OwnerId and if4.NumberType = 3
left join identity_fanaddresses if5 on if5.FanId = ifi.FanId and if5.OwnerId = ifi.OwnerId
WHERE us.surveyID = 552
GROUP by ifi.`Identity`


-- Dai é só trocar o survey e o owner correspondente
