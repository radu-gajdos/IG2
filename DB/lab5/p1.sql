DROP TABLE Ta
CREATE TABLE Ta (
    idA INT PRIMARY KEY,
    a2 INT UNIQUE,
    a3 INT
);

CREATE TABLE Tb (
    idB INT PRIMARY KEY,
    b2 INT,
    b3 INT
);

CREATE TABLE Tc (
    idC INT PRIMARY KEY,
    idA INT,
    idB INT,
    FOREIGN KEY (idA) REFERENCES Ta(idA),
    FOREIGN KEY (idB) REFERENCES Tb(idB)
);


GO
CREATE OR ALTER PROCEDURE InsertDataIntoTa
AS
BEGIN
    DECLARE @counter INT = 1;

    WHILE @counter <= 10000
    BEGIN
        INSERT INTO Ta (idA, a2)
        VALUES (@counter, @counter * 10, @counter*100);

        SET @counter = @counter + 1;
    END
END;

GO
CREATE OR ALTER PROCEDURE InsertDataIntoTb
AS
BEGIN
    DECLARE @counter INT = 1;

    WHILE @counter <= 3000
    BEGIN
        INSERT INTO Tb (idB, b2, b3)
        VALUES (@counter, @counter * 5, @counter * 2);

        SET @counter = @counter + 1;
    END
END;

GO
CREATE OR ALTER PROCEDURE InsertDataIntoTc
AS
BEGIN
    DECLARE @counter INT = 1;

    DECLARE @id_A INT = 1;
	DECLARE @id_B INT = 1;


    WHILE @counter <= 30000
    BEGIN
        IF @id_A > 10000
		BEGIN
			SET @id_A = 1;
		END

		IF @id_B > 3000
		BEGIN
			SET @id_B = 1;
		END

		INSERT INTO Tc(idC, idA, idB)
		VALUES (@counter, @id_A, @id_B);
		SET @counter = @counter + 1;
		SET @id_A = @id_A + 1;
		SET @id_B = @id_B + 1;

    END
END;


EXEC InsertDataIntoTa;
SELECT COUNT(*) FROM Ta

EXEC InsertDataIntoTb;
SELECT COUNT(*) FROM Tb

EXEC InsertDataIntoTc;
SELECT COUNT(*) FROM Tc

DROP TABLE Tc

