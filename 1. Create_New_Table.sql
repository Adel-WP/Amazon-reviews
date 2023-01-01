CREATE TABLE Reviews_MOD
AS
SELECT
	Id,
	ProductId,
	UserId,
	HelpfulnessNumerator,
	HelpfulnessDenominator,
	Score,
	Date(Time, 'unixepoch'),
	Summary,
	Text
FROM
	Reviews