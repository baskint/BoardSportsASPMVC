/*
Deployment script for BoardSports
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, NUMERIC_ROUNDABORT, QUOTED_IDENTIFIER OFF;


GO
:setvar DatabaseName "BoardSports"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.US688228\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.US688228\MSSQL\DATA\"

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
    RAISERROR(N'You cannot deploy this update script to target WIN7-US688228\US688228. The database for which this script was built, BoardSports, does not exist on this server.', 16, 127) WITH NOWAIT
    RETURN
END

GO

IF (@@servername != 'WIN7-US688228\US688228')
BEGIN
    RAISERROR(N'The server name in the build script %s does not match the name of the target server %s. Verify whether your database project settings are correct and whether your build script is up to date.', 16, 127,N'WIN7-US688228\US688228',@@servername) WITH NOWAIT
    RETURN
END

GO

IF CAST(DATABASEPROPERTY(N'$(DatabaseName)','IsReadOnly') as bit) = 1
BEGIN
    RAISERROR(N'You cannot deploy this update script because the database for which it was built, %s , is set to READ_ONLY.', 16, 127, N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
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
PRINT N'Dropping FK_Rigs_Masts...';


GO
ALTER TABLE [dbo].[Rigs] DROP CONSTRAINT [FK_Rigs_Masts];


GO
PRINT N'Starting rebuilding table [dbo].[Boards]...';


GO
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
        INSERT INTO [dbo].[tmp_ms_xx_Boards] ([BoardId], [BoardName], [Manufacturer], [Length], [Width], [Volume], [BoardType], [PurchaseDate], [PurchasePrice], [EstimatedValue], [PictureLocation], [YearManufactured])
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
                 [PictureLocation],
                 [YearManufactured]
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
        INSERT INTO [dbo].[tmp_ms_xx_Kites] ([KiteId], [KiteName], [Manufacturer], [Size], [NumberOfLines], [PictureLocation], [EstimatedValue], [PurchasePrice], [PurchaseDate], [YearManufactured])
        SELECT   [KiteId],
                 [KiteName],
                 [Manufacturer],
                 [Size],
                 [NumberOfLines],
                 [PictureLocation],
                 [EstimatedValue],
                 [PurchasePrice],
                 [PurchaseDate],
                 [YearManufactured]
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
        INSERT INTO [dbo].[tmp_ms_xx_Masts] ([MastId], [MastName], [Manufacturer], [CarbonContent], [PurchaseDate], [PurchasePrice], [PurchaseStore], [YearManurfactured])
        SELECT   [MastId],
                 [MastName],
                 [Manufacturer],
                 [CarbonContent],
                 [PurchaseDate],
                 [PurchasePrice],
                 [PurchaseStore],
                 [YearManurfactured]
        FROM     [dbo].[Masts]
        ORDER BY [MastId] ASC;
    END

DROP TABLE [dbo].[Masts];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Masts]', N'Masts';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_clusteredindex_PK_Masts]', N'PK_Masts', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Snowboards]...';


GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

BEGIN TRANSACTION;

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

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
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


GO
