-- Create stored procedure ComputeAverageWeightedScoreForUsers
-- computes and stores the average weighted score for all students

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users
    JOIN (
        SELECT users.id, SUM(corrections.score * projects.weight) / SUM(projects.weight) AS weight_avg
        FROM users
        JOIN corrections ON users.id = corrections.user_id
        JOIN projects ON corrections.project_id = projects.id
        GROUP BY users.id
    ) AS weight ON users.id = weight.id
    SET users.average_score = weight.weight_avg;
END $$
DELIMITER ;
