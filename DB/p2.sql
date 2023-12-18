

CREATE TABLE Companies (
    id INT IDENTITY(1,1) PRIMARY KEY,
    companyName NVARCHAR(255),
);
GO

INSERT INTO Companies VALUES ('Facebook')
INSERT INTO Companies VALUES ('Google')

SELECT * FROM Companies

DROP FUNCTION filterByDate

GO

CREATE FUNCTION filterByDate(@dateEmployed DATE)
RETURNS TABLE
AS
RETURN (
    SELECT Users.id
    FROM Users
    WHERE dateEmployed >= @dateEmployed
);

GO
CREATE VIEW usernameCompanyName AS
SELECT
    Users.id,
    Users.username,
    Users.dateEmployed,
	companies.companyName
FROM Users
JOIN companies on users.companyId = companies.id
GO

GO
SELECT usernameCompanyName.username, usernameCompanyName.dateEmployed, usernameCompanyName.companyName
FROM usernameCompanyName
JOIN filterByDate('2001-01-01') ON usernameCompanyName.id = filterByDate.id;