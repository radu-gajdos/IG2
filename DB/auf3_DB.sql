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
	UPDATE aktuallVersion SET versionNumber = versionNumber + 1;
    EXEC (@sql);
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
END;
GO

CREATE PROCEDURE RollbackCreateNewTable
    @tableName NVARCHAR(255)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'DROP TABLE ' + @tableName;
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
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'ALTER TABLE ' + @tableName + N' ADD CONSTRAINT ' + @constraintName + N' FOREIGN KEY (' + @columnName + N') REFERENCES ' + @referencedTable + N'(' + @referencedColumn + N')';
    EXEC (@sql);
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
END;
GO

GO

EXEC CreateNewTable 'Tabel1', '
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
'
GO

EXEC RollbackCreateNewTable 'Tabel1'
GO

EXEC CreateNewTable 'Tabel2', '
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
'
GO

EXEC RollbackCreateNewTable 'Tabel2'
GO

EXEC ModifyColumnType 'Tabel1', 'title', 'VARCHAR(50)';
EXEC RollbackModifyColumnType 'Tabel1', 'title', 'VARCHAR(255)';


EXEC CreateDefaultConstraint 'Tabel1', 'title', 'scevatitlu';
GO
EXEC RollbackCreateDefaultConstraint 'Tabel1', 'title';

EXEC AddNewColumn 'Tabel1', 'colnou', 'VARCHAR(255)';
EXEC RollbackAddNewColumn 'Tabel1', 'colnou';

EXEC AddNewColumn 'Tabel2', 'colnou', 'VARCHAR(255)';
EXEC RollbackAddNewColumn 'Tabel2', 'colnou';

EXEC AddNewColumn 'Tabel2', 'colnumeric', 'int';
EXEC RollbackAddNewColumn 'Tabel2', 'colnumeric';

EXEC CreateDefaultConstraint 'Tabel2', 'colnumeric', 1;
EXEC RollbackCreateDefaultConstraint 'Tabel2', 'colnumeric';

EXEC RollbackCreateForeignKeyConstraint 'Tabel2', 'FK_Tabel1_Tabel2_colnou'
EXEC CreateForeignKeyConstraint 'FK_Tabel1_Tabel2_colnou', 'Tabel2', 'colnumeric', 'Tabel1', 'id'

use Lab1;
CREATE TABLE aktuallVersion (
    versionNumber INT DEFAULT 0 PRIMARY KEY
);
INSERT INTO aktuallVersion DEFAULT VALUES;


