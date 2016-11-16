ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [Data1],
		FILENAME = '$(DefaultDataPath)$(DefaultFilePrefix)_Data1File.ndf',
		SIZE = 100MB,
        MAXSIZE = 500MB,
        FILEGROWTH = 10%
	)
		TO FILEGROUP Data1;
	
