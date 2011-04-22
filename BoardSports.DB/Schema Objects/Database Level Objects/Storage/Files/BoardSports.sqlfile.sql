ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [BoardSports], FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.US688228\MSSQL\DATA\BoardSports.mdf', SIZE = 32768 KB, FILEGROWTH = 10 %) TO FILEGROUP [PRIMARY];



