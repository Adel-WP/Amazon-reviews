DELETE FROM Reviews_MOD
WHERE  Id IN (SELECT Id
              FROM   Reviews_MOD
              EXCEPT
              SELECT MIN(Id)
              FROM   Reviews_MOD
              GROUP  BY Text);