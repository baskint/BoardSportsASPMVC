CREATE TABLE [dbo].[Booms] (
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

