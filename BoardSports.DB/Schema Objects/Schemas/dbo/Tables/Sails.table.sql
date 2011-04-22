CREATE TABLE [dbo].[Sails] (
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



