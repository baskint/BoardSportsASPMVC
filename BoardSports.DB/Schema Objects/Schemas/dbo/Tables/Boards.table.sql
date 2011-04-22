CREATE TABLE [dbo].[Boards] (
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

