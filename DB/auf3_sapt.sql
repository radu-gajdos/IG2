use Lab1;

DROP PROCEDURE ModifyColumnType
DROP PROCEDURE RollbackModifyColumnType
GO

CREATE PROCEDURE ModifyColumnType
    @tableName NVARCHAR(255),
    @columnName NVARCHAR(255),
    @newDataType NVARCHAR(255)
AS
BEGIN
	
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'ALTER TABLE ' + @tableName + N' ALTER COLUMN ' + @columnName + N' ' + @newDataType;
    EXEC (@sql);
	UPDATE aktuallVersion SET versionNumber = versionNumber + 1;
	DECLARE @version INT;
	SELECT @version = versionNumber
	FROM aktuallVersion;
	IF NOT EXISTS (SELECT 1 FROM versions WHERE versionId = @version)
	BEGIN
	INSERT INTO versions (versionId, FunctionName, Param1, Param2, Param3)
    VALUES (@version, 'changeColumnType', @tableName, @columnName, @newDataType);
	END
END;
GO

CREATE PROCEDURE RollbackModifyColumnType
    @tableName NVARCHAR(255),
    @columnName NVARCHAR(255),
    @originalDataType NVARCHAR(50)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'ALTER TABLE ' + @tableName + N' ALTER COLUMN ' + @columnName + N' ' + @originalDataType;
    EXEC (@sql);
	UPDATE aktuallVersion SET versionNumber = versionNumber - 1;
END;
GO

GO

DROP PROCEDURE CreateDefaultConstraint
DROP PROCEDURE RollbackCreateDefaultConstraint
GO
CREATE PROCEDURE CreateDefaultConstraint
    @tableName NVARCHAR(255),
    @columnName NVARCHAR(255),
    @defaultValue NVARCHAR(MAX)
AS
BEGIN
    DECLARE @constraintName NVARCHAR(255);
    SET @constraintName = N'Def_' + @tableName + '_' + @columnName;
    DECLARE @sql NVARCHAR(MAX);
    IF EXISTS (
        SELECT COLUMN_NAME
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = @tableName AND COLUMN_NAME = @columnName AND DATA_TYPE = 'int'
    )
    BEGIN
        SET @sql = N'ALTER TABLE ' + @tableName + N' ADD CONSTRAINT ' + @constraintName + N' DEFAULT ' + @defaultValue + N' FOR ' + @columnName;
    END
    ELSE
    BEGIN
        SET @sql = N'ALTER TABLE ' + @tableName + N' ADD CONSTRAINT ' + @constraintName + N' DEFAULT ''' + @defaultValue + N''' FOR ' + @columnName;
    END
    EXEC sp_executesql @sql;
	UPDATE aktuallVersion SET versionNumber = versionNumber + 1;

	DECLARE @version INT;
	SELECT @version = versionNumber
	FROM aktuallVersion;
	IF NOT EXISTS (SELECT 1 FROM versions WHERE versionId = @version)
	BEGIN
	INSERT INTO versions (versionId, FunctionName, Param1, Param2, Param3)
    VALUES (@version, 'CreateDefaultConstraint', @tableName, @columnName, @defaultValue);
	END
END;
GO



GO

CREATE PROCEDURE RollbackCreateDefaultConstraint
    @tableName NVARCHAR(255),
    @columnName NVARCHAR(255)
AS
BEGIN
    DECLARE @constraintName NVARCHAR(255);
    SET @constraintName = N'Def_' + @tableName + '_' + @columnName;
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'ALTER TABLE ' + @tableName + N' DROP CONSTRAINT ' + @constraintName;
    EXEC (@sql);
	UPDATE aktuallVersion SET versionNumber = versionNumber - 1;
END;
GO




DROP PROCEDURE CreateNewTable
DROP PROCEDURE RollbackCreateNewTable
GO
CREATE PROCEDURE CreateNewTable
    @tableName NVARCHAR(255),
    @columnsDefinition NVARCHAR(MAX)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'CREATE TABLE ' + @tableName + N' (' + @columnsDefinition + N')';
    EXEC (@sql);
	UPDATE aktuallVersion SET versionNumber = versionNumber + 1;

	DECLARE @version INT;
	SELECT @version = versionNumber
	FROM aktuallVersion;
	IF NOT EXISTS (SELECT 1 FROM versions WHERE versionId = @version)
	BEGIN
	INSERT INTO versions (versionId, FunctionName, Param1, Param2)
    VALUES (@version, 'CreateNewTable', @tableName, @columnsDefinition);
	END
END;
GO

CREATE PROCEDURE RollbackCreateNewTable
    @tableName NVARCHAR(255)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'DROP TABLE ' + @tableName;
	UPDATE aktuallVersion SET versionNumber = versionNumber - 1;
    EXEC (@sql);
END;
GO



DROP PROCEDURE AddNewColumn
DROP PROCEDURE RollbackAddNewColumn
GO
CREATE PROCEDURE AddNewColumn
    @tableName NVARCHAR(255),
    @columnName NVARCHAR(255),
    @dataType NVARCHAR(50)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'ALTER TABLE ' + @tableName + N' ADD ' + @columnName + N' ' + @dataType;
    EXEC (@sql);
	UPDATE aktuallVersion SET versionNumber = versionNumber + 1;
	DECLARE @version INT;
	SELECT @version = versionNumber
	FROM aktuallVersion;
	IF NOT EXISTS (SELECT 1 FROM versions WHERE versionId = @version)
	BEGIN
	INSERT INTO versions (versionId, FunctionName, Param1, Param2, Param3)
    VALUES (@version, 'AddNewColumn', @tableName, @columnName, @dataType);
	END
END;
GO

CREATE PROCEDURE RollbackAddNewColumn
    @tableName NVARCHAR(255),
    @columnName NVARCHAR(255)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'ALTER TABLE ' + @tableName + N' DROP COLUMN ' + @columnName;
    EXEC (@sql);
	UPDATE aktuallVersion SET versionNumber = versionNumber - 1;

END;
GO


DROP PROCEDURE CreateForeignKeyConstraint
DROP PROCEDURE RollbackCreateForeignKeyConstraint
GO
CREATE PROCEDURE CreateForeignKeyConstraint
    @constraintName NVARCHAR(255),
    @tableName NVARCHAR(255),
    @columnName NVARCHAR(255),
    @referencedTable NVARCHAR(255),
    @referencedColumn NVARCHAR(255)
AS
BEGIN
	INSERT INTO versions (FunctionName, Param1, Param2, Param3, Param4, Param5)
    VALUES ('changeColumnType', @constraintName, @tableName, @columnName, @referencedTable, @referencedColumn);
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'ALTER TABLE ' + @tableName + N' ADD CONSTRAINT ' + @constraintName + N' FOREIGN KEY (' + @columnName + N') REFERENCES ' + @referencedTable + N'(' + @referencedColumn + N')';
	EXEC (@sql);
	UPDATE aktuallVersion SET versionNumber = versionNumber + 1;
	DECLARE @version INT;
	SELECT @version = versionNumber
	FROM aktuallVersion;
	IF NOT EXISTS (SELECT 1 FROM versions WHERE versionId = @version)
	BEGIN
	PRINT(@version)
	INSERT INTO versions (versionId, FunctionName, Param1, Param2, Param3, Param4, Param5)
    VALUES (@version, 'CreateForeignKeyConstraint', @tableName, @columnName, @referencedTable, @referencedColumn, @constraintName);
	END
END;
GO

CREATE PROCEDURE RollbackCreateForeignKeyConstraint
    @tableName NVARCHAR(255),
    @constraintName NVARCHAR(255)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'ALTER TABLE ' + @tableName + N' DROP CONSTRAINT ' + @constraintName;
    EXEC (@sql);
	UPDATE aktuallVersion SET versionNumber = versionNumber - 1;

END;
GO

use Lab1;
CREATE TABLE aktuallVersion (
    versionNumber INT DEFAULT 0 PRIMARY KEY
);
INSERT INTO aktuallVersion DEFAULT VALUES;

CREATE TABLE versions (
    versionId INT PRIMARY KEY,
    FunctionName VARCHAR(100),
    Param1 VARCHAR(MAX) DEFAULT NULL,
    Param2 VARCHAR(MAX) DEFAULT NULL,
    Param3 VARCHAR(MAX) DEFAULT NULL,
    Param4 VARCHAR(MAX) DEFAULT NULL,
    Param5 VARCHAR(MAX) DEFAULT NULL,
);

GO

DROP PROCEDURE RollbackToOldVersion

CREATE PROCEDURE RollbackToOldVersion
    @targetVersion INT
AS
BEGIN
    DECLARE @currentVersion INT;
    SELECT @currentVersion = versionNumber FROM aktuallVersion;

    WHILE @currentVersion > @targetVersion
    BEGIN
        DECLARE @functionName VARCHAR(100),
                @tableName NVARCHAR(255),
                @columnName NVARCHAR(255),
                @dataType NVARCHAR(50),
                @constraintName NVARCHAR(255),
                @referencedTable NVARCHAR(255),
                @referencedColumn NVARCHAR(255);

        SELECT TOP 1
            @functionName = FunctionName,
            @tableName = Param1,
            @columnName = Param2,
            @dataType = Param3,
            @constraintName = Param5,
            @referencedTable = Param3,
            @referencedColumn = Param4
        FROM versions
        WHERE versionId = @currentVersion;

		IF @currentVersion > @targetVersion

        IF @functionName = 'CreateDefaultConstraint'
        BEGIN
            EXEC RollbackCreateDefaultConstraint @tableName, @columnName;
        END
        ELSE IF @functionName = 'CreateNewTable'
        BEGIN
            EXEC RollbackCreateNewTable @tableName;
        END
        ELSE IF @functionName = 'AddNewColumn'
        BEGIN
            EXEC RollbackAddNewColumn @tableName, @columnName;
        END
        ELSE IF @functionName = 'changeColumnType'
        BEGIN
            DECLARE @originalDataType NVARCHAR(50);
            SELECT @originalDataType = Param3
            FROM versions
            WHERE versionId = @currentVersion - 1;

			PRINT 'Original Data Type: ' + @originalDataType;
			

            EXEC RollbackModifyColumnType @tableName, @columnName, @originalDataType;
        END
        ELSE IF @functionName = 'CreateForeignKeyConstraint'
        BEGIN
            EXEC RollbackCreateForeignKeyConstraint @tableName, @constraintName;
        END

        SET @currentVersion = @currentVersion - 1;
    END
END;

DROP PROCEDURE RollbackToNewVersion


CREATE PROCEDURE RollbackToNewVersion
    @targetVersion INT
AS
BEGIN
    DECLARE @currentVersion INT;
    SELECT @currentVersion = versionNumber FROM aktuallVersion;

    WHILE @currentVersion < @targetVersion
    BEGIN
        DECLARE @functionName VARCHAR(100),
                @tableName NVARCHAR(255),
                @columnName NVARCHAR(255),
                @dataType NVARCHAR(50),
                @constraintName NVARCHAR(255),
                @referencedTable NVARCHAR(255),
                @referencedColumn NVARCHAR(255);

        SELECT TOP 1
            @functionName = FunctionName,
            @tableName = Param1,
            @columnName = Param2,
            @dataType = Param3,
            @constraintName = Param5,
            @referencedTable = Param3,
            @referencedColumn = Param4
        FROM versions
        WHERE versionId = @currentVersion + 1;

        IF @functionName = 'CreateDefaultConstraint'
        BEGIN
            EXEC CreateDefaultConstraint @tableName, @columnName, @dataType;
        END
        ELSE IF @functionName = 'CreateNewTable'
        BEGIN
            EXEC CreateNewTable @tableName, @columnName;
        END
        ELSE IF @functionName = 'AddNewColumn'
        BEGIN
            EXEC AddNewColumn @tableName, @columnName, @dataType;
        END
        ELSE IF @functionName = 'changeColumnType'
        BEGIN
            DECLARE @newDataType NVARCHAR(50);
            SELECT @newDataType = Param3
            FROM versions
            WHERE versionId = @currentVersion + 1;
            PRINT 'New Data Type: ' + @newDataType;

            EXEC ModifyColumnType @tableName, @columnName, @newDataType;
        END
        ELSE IF @functionName = 'CreateForeignKeyConstraint'
        BEGIN
            EXEC CreateForeignKeyConstraint @constraintName, @tableName, @columnName, @referencedTable, @referencedColumn;
        END
		
        SET @currentVersion = @currentVersion + 1;
    END
END;

DROP PROCEDURE universalRollbackToVersion;

CREATE PROCEDURE universalRollbackToVersion
    @targetVersion INT
AS
BEGIN
    DECLARE @currentVersion INT;
    SELECT @currentVersion = versionNumber FROM aktuallVersion;

    IF @currentVersion = @targetVersion
    BEGIN
        -- Do nothing, already at the target version
        RETURN;
    END

    IF @currentVersion > @targetVersion
    BEGIN
        -- Rollback to an older version
        EXEC RollbackToOldVersion @targetVersion;
    END
    ELSE
    BEGIN
        -- Rollback to a newer version
        EXEC RollbackToNewVersion @targetVersion;
    END
END;

use Lab1;
CREATE TABLE aktuallVersion (
    versionNumber INT DEFAULT 0 PRIMARY KEY
);
INSERT INTO aktuallVersion DEFAULT VALUES;

CREATE TABLE versions (
    versionId INT PRIMARY KEY,
    FunctionName VARCHAR(100),
    Param1 VARCHAR(MAX) DEFAULT NULL,
    Param2 VARCHAR(MAX) DEFAULT NULL,
    Param3 VARCHAR(MAX) DEFAULT NULL,
    Param4 VARCHAR(MAX) DEFAULT NULL,
    Param5 VARCHAR(MAX) DEFAULT NULL,
);

EXEC CreateNewTable 'T1', 'id INT PRIMARY KEY, title VARCHAR(50)'
EXEC CreateNewTable 'T2', 'id INT PRIMARY KEY, title VARCHAR(50)'
EXEC universalRollbackToVersion 1;
EXEC universalRollbackToVersion 2;

EXEC AddNewColumn 'T1', 'rating', 'int'
EXEC universalRollbackToVersion 2;
EXEC universalRollbackToVersion 3;

EXEC ModifyColumnType 'T1', 'title', 'char(20)'
EXEC universalRollbackToVersion 3;
EXEC universalRollbackToVersion 4;

EXEC CreateDefaultConstraint 'T1', 'title', 'test'
EXEC universalRollbackToVersion 4;
EXEC universalRollbackToVersion 5;

EXEC CreateDefaultConstraint 'T1', 'rating', 1
EXEC universalRollbackToVersion 5;
EXEC universalRollbackToVersion 6;

EXEC CreateNewTable 'T3', 'id INT PRIMARY KEY, t1_id INT'
EXEC universalRollbackToVersion 6;
EXEC universalRollbackToVersion 7;

EXEC CreateForeignKeyConstraint 'FK_T3_T1', 'T3', 't1_id', 'T1', 'id'
EXEC universalRollbackToVersion 7;
EXEC universalRollbackToVersion 8;

EXEC universalRollbackToVersion 1;
EXEC universalRollbackToVersion 8;




use Lab1;
drop table T1
drop table T2
drop table T3
use Lab1;
drop table versions
drop table aktuallVersion

