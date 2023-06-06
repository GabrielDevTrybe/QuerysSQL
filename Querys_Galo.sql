-- Essa query traz o nome, cpf e a coluna end das pessoas que 
-- responderam o Censo da Massa até o dia 25/05 as meia noite!


        SELECT
           COALESCE (CONCAT(
               (SELECT
                answer FROM user_survey_answer usa2
                JOIN user_survey us2 ON usa2.surveyUserID = us2.surveyUserID 
                WHERE us2.userCode = us.userCode AND usa2.questionId = 101 AND us2.surveyID = 288
               ), " ", 
               (SELECT
                answer FROM user_survey_answer usa2
                JOIN user_survey us2 ON usa2.surveyUserID = us2.surveyUserID 
                WHERE us2.userCode = us.userCode AND usa2.questionId = 102 AND us2.surveyID = 288
               )
               ), CONCAT(COALESCE(i.Name1,''), " ", COALESCE(i.Name2,'')) ) AS Nome,
           us.userCode AS CPF,
           us.end
           FROM user_survey us
           LEFT JOIN identities i ON i.Identity = us.ID
           WHERE surveyID = 289
           AND us.end <= '2023-05-25 23:59:59'
           AND us.end IS NOT NULL;