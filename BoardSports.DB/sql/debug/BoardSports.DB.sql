/*
<<<<<<< HEAD
Deployment script for BoardSportsDev
=======
Deployment script for BoardSports
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, NUMERIC_ROUNDABORT, QUOTED_IDENTIFIER OFF;


GO
<<<<<<< HEAD
:setvar DatabaseName "BoardSportsDev"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"
=======
:setvar DatabaseName "BoardSports"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.US688228\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.US688228\MSSQL\DATA\"
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f

GO
:on error exit
GO
USE [master]
GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL
    AND DATABASEPROPERTYEX(N'$(DatabaseName)','Status') <> N'ONLINE')
BEGIN
    RAISERROR(N'The state of the target database, %s, is not set to ONLINE. To deploy to this database, its state must be set to ONLINE.', 16, 127,N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO

IF NOT EXISTS (SELECT 1 FROM [master].[dbo].[sysdatabases] WHERE [name] = N'$(DatabaseName)')
BEGIN
<<<<<<< HEAD
    RAISERROR(N'You cannot deploy this update script to target DARLIN. The database for which this script was built, BoardSportsDev, does not exist on this server.', 16, 127) WITH NOWAIT
=======
    RAISERROR(N'You cannot deploy this update script to target WIN7-US688228\US688228. The database for which this script was built, BoardSports, does not exist on this server.', 16, 127) WITH NOWAIT
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
    RETURN
END

GO

<<<<<<< HEAD
IF (@@servername != 'DARLIN')
BEGIN
    RAISERROR(N'The server name in the build script %s does not match the name of the target server %s. Verify whether your database project settings are correct and whether your build script is up to date.', 16, 127,N'DARLIN',@@servername) WITH NOWAIT
=======
IF (@@servername != 'WIN7-US688228\US688228')
BEGIN
    RAISERROR(N'The server name in the build script %s does not match the name of the target server %s. Verify whether your database project settings are correct and whether your build script is up to date.', 16, 127,N'WIN7-US688228\US688228',@@servername) WITH NOWAIT
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
    RETURN
END

GO

IF CAST(DATABASEPROPERTY(N'$(DatabaseName)','IsReadOnly') as bit) = 1
BEGIN
    RAISERROR(N'You cannot deploy this update script because the database for which it was built, %s , is set to READ_ONLY.', 16, 127, N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
<<<<<<< HEAD
PRINT N'Creating [BoardSports]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [BoardSports], FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.US688228\MSSQL\DATA\BoardSports.mdf', SIZE = 32768 KB, FILEGROWTH = 10 %) TO FILEGROUP [PRIMARY];


GO
PRINT N'Creating [BoardSports_log]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [BoardSports_log], FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.US688228\MSSQL\DATA\BoardSports_log.ldf', SIZE = 8192 KB, MAXSIZE = 2097152 MB, FILEGROWTH = 10 %);


GO
=======
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
USE [$(DatabaseName)]
GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO
PRINT N'Dropping FK_Rigs_Boards...';


GO
ALTER TABLE [dbo].[Rigs] DROP CONSTRAINT [FK_Rigs_Boards];


GO
PRINT N'Dropping FK_Rigs_Booms...';


GO
ALTER TABLE [dbo].[Rigs] DROP CONSTRAINT [FK_Rigs_Booms];


GO
PRINT N'Dropping FK_Rigs_Fins...';


GO
ALTER TABLE [dbo].[Rigs] DROP CONSTRAINT [FK_Rigs_Fins];


GO
<<<<<<< HEAD
PRINT N'Dropping FK_Rigs_Kites...';


GO
ALTER TABLE [dbo].[Rigs] DROP CONSTRAINT [FK_Rigs_Kites];


GO
=======
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
PRINT N'Dropping FK_Rigs_Masts...';


GO
ALTER TABLE [dbo].[Rigs] DROP CONSTRAINT [FK_Rigs_Masts];


GO
<<<<<<< HEAD
PRINT N'Dropping FK_Rigs_Sails...';


GO
ALTER TABLE [dbo].[Rigs] DROP CONSTRAINT [FK_Rigs_Sails];


GO
PRINT N'Dropping FK_Rigs_Venues...';


GO
ALTER TABLE [dbo].[Rigs] DROP CONSTRAINT [FK_Rigs_Venues];


GO
PRINT N'Dropping FK_Sessions_Rigs...';


GO
ALTER TABLE [dbo].[Sessions] DROP CONSTRAINT [FK_Sessions_Rigs];


GO
=======
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
PRINT N'Starting rebuilding table [dbo].[Boards]...';


GO
<<<<<<< HEAD
/*
The column [dbo].[Boards].[PurchaseLocation] is being dropped, data loss could occur.

The type for column PictureLocation in table [dbo].[Boards] is currently  NVARCHAR (250) NULL but is being changed to  NVARCHAR (100) NULL. Data loss could occur.
*/
GO
=======
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

BEGIN TRANSACTION;

CREATE TABLE [dbo].[tmp_ms_xx_Boards] (
    [BoardId]          INT            NOT NULL,
    [BoardName]        NVARCHAR (100) NOT NULL,
    [Manufacturer]     NVARCHAR (100) NOT NULL,
    [Length]           DECIMAL (8, 4) NULL,
    [Width]            DECIMAL (8, 4) NULL,
    [Volume]           INT            NULL,
    [BoardType]        NVARCHAR (100) NULL,
    [PurchaseDate]     DATETIME       NULL,
    [PurchasePrice]    MONEY          NULL,
    [EstimatedValue]   MONEY          NULL,
    [PictureLocation]  NVARCHAR (100) NULL,
    [YearManufactured] INT            NULL
);

ALTER TABLE [dbo].[tmp_ms_xx_Boards]
    ADD CONSTRAINT [tmp_ms_xx_clusteredindex_PK_Boards] PRIMARY KEY CLUSTERED ([BoardId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[Boards])
    BEGIN
<<<<<<< HEAD
        INSERT INTO [dbo].[tmp_ms_xx_Boards] ([BoardId], [BoardName], [Manufacturer], [Length], [Width], [Volume], [BoardType], [PurchaseDate], [PurchasePrice], [EstimatedValue], [YearManufactured], [PictureLocation])
=======
        INSERT INTO [dbo].[tmp_ms_xx_Boards] ([BoardId], [BoardName], [Manufacturer], [Length], [Width], [Volume], [BoardType], [PurchaseDate], [PurchasePrice], [EstimatedValue], [PictureLocation], [YearManufactured])
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
        SELECT   [BoardId],
                 [BoardName],
                 [Manufacturer],
                 [Length],
                 [Width],
                 [Volume],
                 [BoardType],
                 [PurchaseDate],
                 [PurchasePrice],
                 [EstimatedValue],
<<<<<<< HEAD
                 [YearManufactured],
                 [PictureLocation]
=======
                 [PictureLocation],
                 [YearManufactured]
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
        FROM     [dbo].[Boards]
        ORDER BY [BoardId] ASC;
    END

DROP TABLE [dbo].[Boards];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Boards]', N'Boards';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_clusteredindex_PK_Boards]', N'PK_Boards', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Booms]...';


GO
<<<<<<< HEAD
/*
The type for column PictureLocation in table [dbo].[Booms] is currently  NVARCHAR (250) NULL but is being changed to  NVARCHAR (100) NULL. Data loss could occur.
*/
GO
=======
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

BEGIN TRANSACTION;

CREATE TABLE [dbo].[tmp_ms_xx_Booms] (
    [BoomId]          INT            NOT NULL,
    [BoomName]        NVARCHAR (100) NOT NULL,
    [Manufacturer]    NVARCHAR (100) NULL,
    [MinLength]       INT            NULL,
    [MaxLength]       INT            NULL,
    [PurchaseDate]    DATETIME       NULL,
    [PurchasePrice]   MONEY          NULL,
    [EstimatedValue]  MONEY          NULL,
    [PictureLocation] NVARCHAR (100) NULL
);

ALTER TABLE [dbo].[tmp_ms_xx_Booms]
    ADD CONSTRAINT [tmp_ms_xx_clusteredindex_PK_Booms] PRIMARY KEY CLUSTERED ([BoomId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[Booms])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Booms] ([BoomId], [BoomName], [Manufacturer], [MinLength], [MaxLength], [PurchaseDate], [PurchasePrice], [EstimatedValue], [PictureLocation])
        SELECT   [BoomId],
                 [BoomName],
                 [Manufacturer],
                 [MinLength],
                 [MaxLength],
                 [PurchaseDate],
                 [PurchasePrice],
                 [EstimatedValue],
                 [PictureLocation]
        FROM     [dbo].[Booms]
        ORDER BY [BoomId] ASC;
    END

DROP TABLE [dbo].[Booms];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Booms]', N'Booms';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_clusteredindex_PK_Booms]', N'PK_Booms', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Fins]...';


GO
<<<<<<< HEAD
/*
The column [dbo].[Fins].[Manufacturer] is being dropped, data loss could occur.

The column [dbo].[Fins].[PictureLocation] is being dropped, data loss could occur.

The column [dbo].[Fins].[PurchasePrice] is being dropped, data loss could occur.
*/
GO
=======
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

BEGIN TRANSACTION;

CREATE TABLE [dbo].[tmp_ms_xx_Fins] (
    [FinId]    INT            NOT NULL,
    [FinStyle] NVARCHAR (100) NULL,
    [FinType]  NVARCHAR (100) NOT NULL,
    [Length]   INT            NULL
);

ALTER TABLE [dbo].[tmp_ms_xx_Fins]
    ADD CONSTRAINT [tmp_ms_xx_clusteredindex_PK_Fins] PRIMARY KEY CLUSTERED ([FinId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[Fins])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Fins] ([FinId], [FinStyle], [FinType], [Length])
        SELECT   [FinId],
                 [FinStyle],
                 [FinType],
                 [Length]
        FROM     [dbo].[Fins]
        ORDER BY [FinId] ASC;
    END

DROP TABLE [dbo].[Fins];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Fins]', N'Fins';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_clusteredindex_PK_Fins]', N'PK_Fins', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
<<<<<<< HEAD
PRINT N'Starting rebuilding table [dbo].[Kites]...';


GO
/*
The column [dbo].[Kites].[BarBrand] is being dropped, data loss could occur.

The column [dbo].[Kites].[KiteBrand] is being dropped, data loss could occur.

The column [dbo].[Kites].[NumberLines] is being dropped, data loss could occur.

The type for column PictureLocation in table [dbo].[Kites] is currently  NVARCHAR (250) NULL but is being changed to  NVARCHAR (100) NULL. Data loss could occur.

The type for column Size in table [dbo].[Kites] is currently  INT NULL but is being changed to  TINYINT NULL. Data loss could occur.
*/
=======
PRINT N'Starting rebuilding table [dbo].[KiteBoards]...';


GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

BEGIN TRANSACTION;

CREATE TABLE [dbo].[tmp_ms_xx_KiteBoards] (
    [KiteboardId]      INT            NOT NULL,
    [KiteboardName]    NVARCHAR (50)  NULL,
    [Manufacturer]     NVARCHAR (100) NULL,
    [PurchasePrice]    MONEY          NULL,
    [PurchaseDate]     DATETIME       NULL,
    [YearManufactured] INT            NULL,
    [Length]           TINYINT        NULL,
    [Width]            TINYINT        NULL,
    [PictureLocation]  NVARCHAR (100) NULL
);

ALTER TABLE [dbo].[tmp_ms_xx_KiteBoards]
    ADD CONSTRAINT [tmp_ms_xx_clusteredindex_PK_KiteBoards] PRIMARY KEY CLUSTERED ([KiteboardId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[KiteBoards])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_KiteBoards] ([KiteboardId], [KiteboardName], [Manufacturer], [PurchasePrice], [PurchaseDate], [YearManufactured], [Length], [Width], [PictureLocation])
        SELECT   [KiteboardId],
                 [KiteboardName],
                 [Manufacturer],
                 [PurchasePrice],
                 [PurchaseDate],
                 [YearManufactured],
                 [Length],
                 [Width],
                 [PictureLocation]
        FROM     [dbo].[KiteBoards]
        ORDER BY [KiteboardId] ASC;
    END

DROP TABLE [dbo].[KiteBoards];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_KiteBoards]', N'KiteBoards';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_clusteredindex_PK_KiteBoards]', N'PK_KiteBoards', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Kites]...';


>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

BEGIN TRANSACTION;

CREATE TABLE [dbo].[tmp_ms_xx_Kites] (
    [KiteId]           INT            NOT NULL,
    [KiteName]         NVARCHAR (100) NOT NULL,
    [Manufacturer]     NVARCHAR (100) NULL,
    [Size]             TINYINT        NULL,
    [NumberOfLines]    TINYINT        NULL,
    [PictureLocation]  NVARCHAR (100) NULL,
    [EstimatedValue]   MONEY          NULL,
    [PurchasePrice]    MONEY          NULL,
    [PurchaseDate]     DATETIME       NULL,
    [YearManufactured] INT            NULL
);

ALTER TABLE [dbo].[tmp_ms_xx_Kites]
    ADD CONSTRAINT [tmp_ms_xx_clusteredindex_PK_Kites] PRIMARY KEY CLUSTERED ([KiteId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[Kites])
    BEGIN
<<<<<<< HEAD
        INSERT INTO [dbo].[tmp_ms_xx_Kites] ([KiteId], [KiteName], [Manufacturer], [Size], [YearManufactured], [PictureLocation])
=======
        INSERT INTO [dbo].[tmp_ms_xx_Kites] ([KiteId], [KiteName], [Manufacturer], [Size], [NumberOfLines], [PictureLocation], [EstimatedValue], [PurchasePrice], [PurchaseDate], [YearManufactured])
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
        SELECT   [KiteId],
                 [KiteName],
                 [Manufacturer],
                 [Size],
<<<<<<< HEAD
                 [YearManufactured],
                 [PictureLocation]
=======
                 [NumberOfLines],
                 [PictureLocation],
                 [EstimatedValue],
                 [PurchasePrice],
                 [PurchaseDate],
                 [YearManufactured]
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
        FROM     [dbo].[Kites]
        ORDER BY [KiteId] ASC;
    END

DROP TABLE [dbo].[Kites];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Kites]', N'Kites';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_clusteredindex_PK_Kites]', N'PK_Kites', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Masts]...';


GO
<<<<<<< HEAD
/*
The column [dbo].[Masts].[PictureLocation] is being dropped, data loss could occur.

The column [dbo].[Masts].[PurchaseLocation] is being dropped, data loss could occur.

The type for column Manufacturer in table [dbo].[Masts] is currently  NVARCHAR (100) NULL but is being changed to  NVARCHAR (50) NULL. Data loss could occur.

The type for column MastName in table [dbo].[Masts] is currently  NVARCHAR (100) NULL but is being changed to  NVARCHAR (50) NOT NULL. Data loss could occur.
*/
GO
=======
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

BEGIN TRANSACTION;

CREATE TABLE [dbo].[tmp_ms_xx_Masts] (
    [MastId]            INT            NOT NULL,
    [MastName]          NVARCHAR (50)  NOT NULL,
    [Manufacturer]      NVARCHAR (50)  NULL,
    [CarbonContent]     INT            NULL,
    [PurchaseDate]      DATE           NULL,
    [PurchasePrice]     MONEY          NULL,
    [PurchaseStore]     NVARCHAR (100) NULL,
    [YearManurfactured] NCHAR (10)     NULL
);

ALTER TABLE [dbo].[tmp_ms_xx_Masts]
    ADD CONSTRAINT [tmp_ms_xx_clusteredindex_PK_Masts] PRIMARY KEY CLUSTERED ([MastId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[Masts])
    BEGIN
<<<<<<< HEAD
        INSERT INTO [dbo].[tmp_ms_xx_Masts] ([MastId], [MastName], [Manufacturer], [CarbonContent], [PurchaseDate], [PurchasePrice])
=======
        INSERT INTO [dbo].[tmp_ms_xx_Masts] ([MastId], [MastName], [Manufacturer], [CarbonContent], [PurchaseDate], [PurchasePrice], [PurchaseStore], [YearManurfactured])
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
        SELECT   [MastId],
                 [MastName],
                 [Manufacturer],
                 [CarbonContent],
                 [PurchaseDate],
<<<<<<< HEAD
                 [PurchasePrice]
=======
                 [PurchasePrice],
                 [PurchaseStore],
                 [YearManurfactured]
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
        FROM     [dbo].[Masts]
        ORDER BY [MastId] ASC;
    END

DROP TABLE [dbo].[Masts];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Masts]', N'Masts';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_clusteredindex_PK_Masts]', N'PK_Masts', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
<<<<<<< HEAD
PRINT N'Starting rebuilding table [dbo].[Rigs]...';


GO
/*
The type for column RigType in table [dbo].[Rigs] is currently  NVARCHAR (50) NOT NULL but is being changed to  NCHAR (10) NULL. Data loss could occur.
*/
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;
=======
PRINT N'Starting rebuilding table [dbo].[Snowboards]...';
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f


GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

BEGIN TRANSACTION;

<<<<<<< HEAD
CREATE TABLE [dbo].[tmp_ms_xx_Rigs] (
    [RigId]       INT        NOT NULL,
    [RigDate]     NCHAR (10) NULL,
    [RigType]     NCHAR (10) NULL,
    [VenueId]     INT        NOT NULL,
    [BoardId]     INT        NOT NULL,
    [SailId]      INT        NOT NULL,
    [BoomId]      INT        NOT NULL,
    [FinId]       INT        NOT NULL,
    [MastId]      INT        NULL,
    [KiteId]      INT        NULL,
    [KiteBoardId] INT        NULL
);

ALTER TABLE [dbo].[tmp_ms_xx_Rigs]
    ADD CONSTRAINT [tmp_ms_xx_clusteredindex_PK_Rigs] PRIMARY KEY CLUSTERED ([RigId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[Rigs])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Rigs] ([RigId], [RigDate], [RigType], [VenueId], [BoardId], [BoomId], [MastId], [SailId], [KiteId], [FinId])
        SELECT   [RigId],
                 [RigDate],
                 [RigType],
                 [VenueId],
                 [BoardId],
                 [BoomId],
                 [MastId],
                 [SailId],
                 [KiteId],
                 [FinId]
        FROM     [dbo].[Rigs]
        ORDER BY [RigId] ASC;
    END

DROP TABLE [dbo].[Rigs];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Rigs]', N'Rigs';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_clusteredindex_PK_Rigs]', N'PK_Rigs', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Starting rebuilding table [dbo].[Sails]...';


GO
/*
The type for column BoomLength in table [dbo].[Sails] is currently  INT NULL but is being changed to  TINYINT NULL. Data loss could occur.

The type for column PictureLocation in table [dbo].[Sails] is currently  NVARCHAR (250) NULL but is being changed to  NVARCHAR (100) NULL. Data loss could occur.
*/
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

BEGIN TRANSACTION;

CREATE TABLE [dbo].[tmp_ms_xx_Sails] (
    [SailId]           INT            NOT NULL,
    [SailName]         NVARCHAR (100) NOT NULL,
    [Manufacturer]     NVARCHAR (100) NULL,
    [PurchaseDate]     DATETIME       NULL,
    [PurchasePrice]    MONEY          NULL,
    [Condition]        NVARCHAR (50)  NULL,
    [Size]             DECIMAL (8, 4) NOT NULL,
    [BoomLength]       TINYINT        NULL,
    [BaseLength]       INT            NULL,
    [PictureLocation]  NVARCHAR (100) NULL,
    [YearManufactured] INT            NULL
);

ALTER TABLE [dbo].[tmp_ms_xx_Sails]
    ADD CONSTRAINT [tmp_ms_xx_clusteredindex_PK_Sails] PRIMARY KEY CLUSTERED ([SailId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[Sails])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Sails] ([SailId], [SailName], [Manufacturer], [PurchaseDate], [PurchasePrice], [Condition], [Size], [BoomLength], [BaseLength], [YearManufactured], [PictureLocation])
        SELECT   [SailId],
                 [SailName],
                 [Manufacturer],
                 [PurchaseDate],
                 [PurchasePrice],
                 [Condition],
                 [Size],
                 [BoomLength],
                 [BaseLength],
                 [YearManufactured],
                 [PictureLocation]
        FROM     [dbo].[Sails]
        ORDER BY [SailId] ASC;
    END

DROP TABLE [dbo].[Sails];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Sails]', N'Sails';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_clusteredindex_PK_Sails]', N'PK_Sails', N'OBJECT';
=======
CREATE TABLE [dbo].[tmp_ms_xx_Snowboards] (
    [SnowboardId]    INT            NOT NULL,
    [SnowboardName]  NVARCHAR (100) NOT NULL,
    [Manufacturer]   NVARCHAR (100) NULL,
    [PurchaseDate]   DATETIME       NULL,
    [PurchasePrice]  MONEY          NULL,
    [EstimatedPrice] MONEY          NULL,
    [Length]         TINYINT        NULL,
    [Width]          TINYINT        NULL,
    [Bindings]       NVARCHAR (50)  NULL
);

ALTER TABLE [dbo].[tmp_ms_xx_Snowboards]
    ADD CONSTRAINT [tmp_ms_xx_clusteredindex_PK_Snowboards] PRIMARY KEY CLUSTERED ([SnowboardId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

IF EXISTS (SELECT TOP 1 1
           FROM   [dbo].[Snowboards])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Snowboards] ([SnowboardId], [SnowboardName], [Manufacturer], [PurchaseDate], [PurchasePrice], [EstimatedPrice], [Length], [Width], [Bindings])
        SELECT   [SnowboardId],
                 [SnowboardName],
                 [Manufacturer],
                 [PurchaseDate],
                 [PurchasePrice],
                 [EstimatedPrice],
                 [Length],
                 [Width],
                 [Bindings]
        FROM     [dbo].[Snowboards]
        ORDER BY [SnowboardId] ASC;
    END

DROP TABLE [dbo].[Snowboards];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Snowboards]', N'Snowboards';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_clusteredindex_PK_Snowboards]', N'PK_Snowboards', N'OBJECT';
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
<<<<<<< HEAD
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Altering [dbo].[Sessions]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
ALTER TABLE [dbo].[Sessions] DROP COLUMN [VenueId];


GO
ALTER TABLE [dbo].[Sessions] ALTER COLUMN [Duration] DECIMAL (10, 4) NULL;

ALTER TABLE [dbo].[Sessions] ALTER COLUMN [Funfactor] TINYINT NULL;

ALTER TABLE [dbo].[Sessions] ALTER COLUMN [Notes] NVARCHAR (250) NULL;

ALTER TABLE [dbo].[Sessions] ALTER COLUMN [RigId] INT NOT NULL;

ALTER TABLE [dbo].[Sessions] ALTER COLUMN [SessionDate] DATETIME NOT NULL;

ALTER TABLE [dbo].[Sessions] ALTER COLUMN [SessionDescription] NVARCHAR (250) NULL;

ALTER TABLE [dbo].[Sessions] ALTER COLUMN [SessionType] NVARCHAR (50) NOT NULL;


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
PRINT N'Creating [dbo].[KiteBoards]...';


GO
CREATE TABLE [dbo].[KiteBoards] (
    [KiteboardId]      INT            NOT NULL,
    [KiteboardName]    NVARCHAR (50)  NULL,
    [Manufacturer]     NVARCHAR (100) NULL,
    [PurchasePrice]    MONEY          NULL,
    [PurchaseDate]     DATETIME       NULL,
    [YearManufactured] INT            NULL,
    [Length]           TINYINT        NULL,
    [Width]            TINYINT        NULL,
    [PictureLocation]  NVARCHAR (100) NULL
);


GO
PRINT N'Creating PK_KiteBoards...';


GO
ALTER TABLE [dbo].[KiteBoards]
    ADD CONSTRAINT [PK_KiteBoards] PRIMARY KEY CLUSTERED ([KiteboardId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating [dbo].[Snowboards]...';


GO
CREATE TABLE [dbo].[Snowboards] (
    [SnowboardId]    INT            NOT NULL,
    [SnowboardName]  NVARCHAR (100) NOT NULL,
    [Manufacturer]   NVARCHAR (100) NULL,
    [PurchaseDate]   DATETIME       NULL,
    [PurchasePrice]  MONEY          NULL,
    [EstimatedPrice] MONEY          NULL,
    [Length]         TINYINT        NULL,
    [Width]          TINYINT        NULL,
    [Bindings]       NVARCHAR (50)  NULL
);


GO
PRINT N'Creating PK_Snowboards...';


GO
ALTER TABLE [dbo].[Snowboards]
    ADD CONSTRAINT [PK_Snowboards] PRIMARY KEY CLUSTERED ([SnowboardId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
=======
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
PRINT N'Creating FK_Rigs_Boards...';


GO
ALTER TABLE [dbo].[Rigs] WITH NOCHECK
    ADD CONSTRAINT [FK_Rigs_Boards] FOREIGN KEY ([BoardId]) REFERENCES [dbo].[Boards] ([BoardId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Rigs_Booms...';


GO
ALTER TABLE [dbo].[Rigs] WITH NOCHECK
    ADD CONSTRAINT [FK_Rigs_Booms] FOREIGN KEY ([BoomId]) REFERENCES [dbo].[Booms] ([BoomId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Rigs_Fins...';


GO
ALTER TABLE [dbo].[Rigs] WITH NOCHECK
    ADD CONSTRAINT [FK_Rigs_Fins] FOREIGN KEY ([FinId]) REFERENCES [dbo].[Fins] ([FinId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Rigs_Masts...';


GO
ALTER TABLE [dbo].[Rigs] WITH NOCHECK
    ADD CONSTRAINT [FK_Rigs_Masts] FOREIGN KEY ([MastId]) REFERENCES [dbo].[Masts] ([MastId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
<<<<<<< HEAD
PRINT N'Creating FK_Rigs_Sails...';


GO
ALTER TABLE [dbo].[Rigs] WITH NOCHECK
    ADD CONSTRAINT [FK_Rigs_Sails] FOREIGN KEY ([SailId]) REFERENCES [dbo].[Sails] ([SailId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Rigs_Venues...';


GO
ALTER TABLE [dbo].[Rigs] WITH NOCHECK
    ADD CONSTRAINT [FK_Rigs_Venues] FOREIGN KEY ([VenueId]) REFERENCES [dbo].[Venues] ([VenueId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating FK_Sessions_Rigs...';


GO
ALTER TABLE [dbo].[Sessions] WITH NOCHECK
    ADD CONSTRAINT [FK_Sessions_Rigs] FOREIGN KEY ([RigId]) REFERENCES [dbo].[Rigs] ([RigId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
=======
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Rigs] WITH CHECK CHECK CONSTRAINT [FK_Rigs_Boards];

ALTER TABLE [dbo].[Rigs] WITH CHECK CHECK CONSTRAINT [FK_Rigs_Booms];

ALTER TABLE [dbo].[Rigs] WITH CHECK CHECK CONSTRAINT [FK_Rigs_Fins];

ALTER TABLE [dbo].[Rigs] WITH CHECK CHECK CONSTRAINT [FK_Rigs_Masts];

<<<<<<< HEAD
ALTER TABLE [dbo].[Rigs] WITH CHECK CHECK CONSTRAINT [FK_Rigs_Sails];

ALTER TABLE [dbo].[Rigs] WITH CHECK CHECK CONSTRAINT [FK_Rigs_Venues];

ALTER TABLE [dbo].[Sessions] WITH CHECK CHECK CONSTRAINT [FK_Sessions_Rigs];

=======
>>>>>>> f0797c61d5678ce8fd61b26b2ee1499e5557e00f

GO
