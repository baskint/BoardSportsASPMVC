CREATE TABLE [dbo].[Sessions] (
    [SessionId]          INT             NOT NULL,
    [SessionType]        NVARCHAR (50)   NOT NULL,
    [SessionDate]        DATETIME        NOT NULL,
    [SessionDescription] NVARCHAR (250)  NULL,
    [Duration]           DECIMAL (10, 4) NULL,
    [Funfactor]          TINYINT         NULL,
    [RigId]              INT             NOT NULL,
    [BeersConsumed]      INT             NULL,
    [PeopleInCompany]    INT             NULL,
    [Notes]              NVARCHAR (250)  NULL
);

