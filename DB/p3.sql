DROP TABLE IF EXISTS log_table

CREATE TABLE log_table (
    id INT IDENTITY(1,1) PRIMARY KEY,
    execTime DATETIME,
    cmdType CHAR(1),
    tableName NVARCHAR(255),
    affectedRows INT
);
GO

CREATE OR ALTER TRIGGER universalCmd
ON Companies
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @cmdType CHAR(1);

    IF EXISTS (SELECT * FROM INSERTED) AND EXISTS (SELECT * FROM DELETED)
    BEGIN
        SET @cmdType = 'U';
    END
    ELSE IF EXISTS (SELECT * FROM INSERTED)
    BEGIN
        SET @cmdType = 'I';
    END
    ELSE IF EXISTS (SELECT * FROM DELETED)
    BEGIN
        SET @cmdType = 'D';
    END

    IF @cmdType IS NOT NULL
    BEGIN
        DECLARE @affectedRowsCount INT;

        IF @cmdType = 'D'
        BEGIN
            SELECT @affectedRowsCount = COUNT(*) FROM DELETED;
        END
        ELSE
        BEGIN
            SELECT @affectedRowsCount = COUNT(*) FROM INSERTED;
        END

        BEGIN
            INSERT INTO log_table (execTime, cmdType, tableName, affectedRows)
            VALUES (GETDATE(), @cmdType, 'Companies', @affectedRowsCount);
        END
    END
END


SELECT * FROM Companies
SELECT * FROM log_table


INSERT INTO Companies VALUES ('Msg'), ('Micorsoft')

UPDATE Companies
SET companyName = LEFT(companyName, LEN(companyName) - 1)
WHERE companyName LIKE 'M%';

UPDATE Companies
SET companyName = LEFT(companyName, LEN(companyName) - 1)
WHERE id=12

DELETE FROM Companies WHERE id IN (13,15);
