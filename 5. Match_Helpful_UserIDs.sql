ALTER TABLE Reviews_MOD
  ADD Helpful_User INTEGER;

UPDATE Reviews_MOD
SET Helpful_User = (SELECT CASE
                                WHEN Reviews_MOD.UserId IN(SELECT
                                     List_of_Helpful_Users.UserId
                                     FROM List_of_Helpful_Users) THEN 1
                                ELSE 0
                              END); 