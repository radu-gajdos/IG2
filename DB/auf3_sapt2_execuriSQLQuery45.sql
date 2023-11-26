--use Lab1;
use auf3;
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

SELECT * from aktuallVersion;
SELECT * from versions;

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


use auf3;
drop table T2
drop table T3
drop table T1
use auf3;
drop table versions
drop table aktuallVersion