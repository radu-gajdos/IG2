use auf4;

DROP VIEW UserFaraCnp;
DROP FUNCTION GetDateFilteredData;

GO
CREATE VIEW UserFaraCnp AS
SELECT id, username AS 'Nume de utilizator', geburtsDatum AS 'Data nasterii'
FROM Users;
GO

CREATE FUNCTION GetDateFilteredData (@filterDate DATE)
RETURNS TABLE
AS
RETURN
(
    SELECT id, username AS 'Nume de utilizator', geburtsDatum AS 'Data nasterii', cnp
	FROM Users
    WHERE geburtsDatum >= @filterDate
);
Go

SELECT * FROM Users

SELECT V.*, F.*
FROM UserFaraCnp V
LEFT OUTER JOIN GetDateFilteredData('2002-01-01') F ON V.id = F.id;