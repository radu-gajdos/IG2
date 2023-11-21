use Lab1;
GO

EXEC CreateNewTable 'Tabel1', '
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
'

EXEC RollbackCreateNewTable 'Tabel1'

EXEC CreateNewTable 'Tabel2', '
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
'
EXEC RollbackCreateNewTable 'Podcast'

EXEC ModifyColumnType 'Tabel1', 'title', 'VARCHAR(50)';
EXEC RollbackModifyColumnType 'Tabel1', 'title', 'VARCHAR(255)';


EXEC CreateDefaultConstraint 'Tabel1', 'title', 'ashdashdjkad';
EXEC RollbackCreateDefaultConstraint 'Tabel1', 'title';

EXEC AddNewColumn 'Tabel1', 'colnou', 'VARCHAR(255)';
EXEC RollbackAddNewColumn 'Tabel1', 'colnou';

EXEC AddNewColumn 'Tabel2', 'colnou', 'VARCHAR(255)';
EXEC RollbackAddNewColumn 'Tabel2', 'colnou';

EXEC AddNewColumn 'Tabel2', 'colnumeric', 'int';
EXEC RollbackAddNewColumn 'Tabel2', 'colnumeric';

EXEC CreateDefaultConstraint 'Tabel2', 'colnumeric', 1;
EXEC RollbackCreateDefaultConstraint 'Tabel2', 'colnumeric';

EXEC RollbackCreateForeignKeyConstraint 'FK_Tabel1_Tabel2_colnou', 'Tabel2'
EXEC CreateForeignKeyConstraint 'FK_Tabel1_Tabel2_colnou', 'Tabel2', 'colnumeric', 'Tabel1', 'id'