ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [BoardSports_log], FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.US688228\MSSQL\DATA\BoardSports_log.ldf', SIZE = 8192 KB, MAXSIZE = 2097152 MB, FILEGROWTH = 10 %);



