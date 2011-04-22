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

