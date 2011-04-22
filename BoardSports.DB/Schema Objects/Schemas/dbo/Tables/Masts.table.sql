CREATE TABLE [dbo].[Masts] (
    [MastId]            INT            NOT NULL,
    [MastName]          NVARCHAR (50)  NOT NULL,
    [Manufacturer]      NVARCHAR (50)  NULL,
    [CarbonContent]     INT            NULL,
    [PurchaseDate]      DATE           NULL,
    [PurchasePrice]     MONEY          NULL,
    [PurchaseStore]     NVARCHAR (100) NULL,
    [YearManurfactured] NCHAR (10)     NULL
);

