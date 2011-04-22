CREATE TABLE [dbo].[Rigs] (
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



