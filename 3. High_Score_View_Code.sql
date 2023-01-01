CREATE VIEW High_Score_Products AS
SELECT ProductId, AVG(Score), COUNT(score), Text FROM Reviews_MOD
GROUP BY ProductId
HAVING COUNT(score) > 50 AND AVG(score) >= 4.5
ORDER BY AVG(score) DESC