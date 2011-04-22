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

