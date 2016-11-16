ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [History],
		FILENAME = '$(DefaultDataPath)$(DefaultFilePrefix)_History.ndf',
		SIZE = 100MB,
        MAXSIZE = 500MB,
        FILEGROWTH = 10%
	)
		TO FILEGROUP History;
	
