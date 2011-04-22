CREATE TABLE [dbo].[Kites] (
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

