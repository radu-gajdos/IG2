USE auf4;
DROP TABLE IF EXISTS Users;
DROP PROCEDURE IF EXISTS InsertData;
DROP FUNCTION IF EXISTS ValidateCnpLength;
DROP FUNCTION IF EXISTS ValidateEmailFormat;

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS log_table;
DROP TABLE IF EXISTS Companies;





CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(255),
	email NVARCHAR(255),
    dateEmployed DATE,
    cnp NVARCHAR(255),
    companyId INT,
    salary DECIMAL(18,2)
);




GO
CREATE FUNCTION ValidateEmailFormat (@email NVARCHAR(255))
RETURNS INT
AS
BEGIN
    DECLARE @isValid INT = 0;

    IF @email LIKE '%_@_%._%'
    BEGIN
        SET @isValid = 1;
    END

    RETURN @isValid;
END;
GO


CREATE FUNCTION ValidateCnpLength (@inputString NVARCHAR(255))
RETURNS INT
AS
BEGIN
    DECLARE @length INT;
    SET @length = LEN(@inputString);

    IF @length = 13
    BEGIN
        RETURN 1;
    END
    RETURN 0;
END;
GO

CREATE PROCEDURE InsertData
    @Param1 NVARCHAR(255),
    @Param2 NVARCHAR(255),
    @Param3 DATE,
    @Param4 NVARCHAR(255),
    @Param5 INT,
    @Param6 DECIMAL(18,2)
AS
BEGIN
    IF dbo.ValidateCnpLength(@Param4) = 1 AND dbo.ValidateEmailFormat(@Param2) = 1
    BEGIN
        INSERT INTO Users (username, email, dateEmployed, cnp, companyId, salary)
        VALUES (@Param1, @Param2, @Param3, @Param4, @Param5, @Param6);

        PRINT 'Data inserted!';
    END
    ELSE
    BEGIN
        PRINT 'Validation failed. Data not inserted.';
    END
END;
GO

SELECT * FROM Users;
GO
EXEC InsertData 'Radu', 'radu@gmail.com', '2003-06-11', '1234567890123', 1, 2500;
EXEC InsertData 'Andrei', 'andrei@hotmail.com', '2001-01-10', '1234567891234', 2, 2000;
EXEC InsertData 'Istvan', 'iiiii@hotmail.com', '2000-01-10', '1234567891234', 2, 2000;
EXEC InsertData 'Alex', 'asdasd', '1900-01-10', '1234567891234', 1, 2000;
EXEC InsertData 'Andreas', 'andreas@gmail.com', '2000-01-10', '123', 1, 2000;