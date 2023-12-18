-- a)
SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('Ta')
SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('Tb')
SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('Tc')

EXEC sp_helpindex 'Ta';
EXEC sp_helpindex 'Tb';
EXEC sp_helpindex 'Tc';

SELECT * FROM Ta WHERE idA % 5 = 0;

SELECT * FROM Ta WHERE idA = 1000;

SELECT a2 FROM Ta WHERE a2 % 5 = 0;

SELECT * FROM Ta;
SELECT a2 FROM Ta WHERE a2 = 10;

--b)
SELECT a3 FROM Ta WHERE a2 = 10;

--c)
SELECT b2 FROM Tb WHERE b2 = 1000;

CREATE NONCLUSTERED INDEX Index_b2 ON Tb(b2);
DROP INDEX Index_b2 ON Tb;
EXEC sp_helpindex 'Tb';

SELECT * FROM Tb WHERE b2 = 1000;

--d)

EXEC sp_helpindex 'Tc';

CREATE NONCLUSTERED INDEX Index_idA ON Tc(idA);
DROP INDEX Index_idA ON Tc;  

SELECT a2
FROM Ta
INNER JOIN Tc On Tc.idA = Ta.idA
WHERE Ta.a2 = 10;

--

CREATE NONCLUSTERED INDEX Index_idB ON Tc(idB);
DROP INDEX Index_idB ON Tc;  

SELECT b2
FROM Tb
INNER JOIN Tc On Tc.idB = Tb.idB
WHERE Tb.idB = 1;