CREATE VIEW List_of_Helpful_Users
AS
  SELECT UserId,
         COUNT(Id),
         AVG(HelpfulnessNumerator),
         AVG(HelpfulnessDenominator)
  FROM   Reviews_MOD
  GROUP  BY UserId
  HAVING COUNT(Id) >= 3
         AND AVG(HelpfulnessNumerator) >= 10
         AND AVG(HelpfulnessNumerator) >= AVG(HelpfulnessDenominator)
  ORDER  BY AVG(HelpfulnessNumerator) DESC,
            COUNT(Id) DESC; 