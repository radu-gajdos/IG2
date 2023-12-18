use auf4;
GO
CREATE OR ALTER PROCEDURE UpdateSalariesForCompany
    @companyID INT
AS
BEGIN
    DECLARE @averagesalary DECIMAL(18, 2);

    SELECT @averagesalary = AVG(salary)
    FROM Users
    WHERE companyId = @companyId;

    UPDATE Users
    SET salary = @averagesalary
    WHERE companyId = @companyId
      AND salary < @averagesalary;
END;

GO
CREATE OR ALTER PROCEDURE AdjustSalariesBelowAverage
AS
BEGIN
    DECLARE @currentCompanyId INT;

    DECLARE companyCursor CURSOR FOR
    SELECT id FROM Companies;

    OPEN companyCursor;

    FETCH NEXT FROM companyCursor INTO @currentCompanyId;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC UpdateSalariesForCompany @companyID = @currentCompanyId;

        FETCH NEXT FROM companyCursor INTO @currentCompanyId;
    END

    CLOSE companyCursor;
    DEALLOCATE companyCursor;
END;

SELECT * FROM Users

EXEC InsertData 'Odo', 'rodo@gmail.com', '2003-06-11', '1234567890123', 1, 2500;
EXEC InsertData 'ALex', 'alexx@gmail.com', '2003-06-11', '1234567890123', 1, 1500;
EXEC InsertData 'Xulescu', 'xyxy@gmail.com', '2003-06-11', '1234567890123', 1, 1000;
EXEC InsertData 'Iunescu', 'asy@gmail.com', '2003-06-11', '1234567890123', 2, 1000;


EXEC AdjustSalariesBelowAverage