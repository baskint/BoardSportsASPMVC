USE [BoardSports]
GO

/****** Object:  Table [dbo].[Boards]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Boards](
	[BoardId] [int] NOT NULL,
	[BoardName] [nvarchar](100) NOT NULL,
	[Manufacturer] [nvarchar](100) NOT NULL,
	[Length] [decimal](8, 4) NULL,
	[Width] [decimal](8, 4) NULL,
	[Volume] [int] NULL,
	[BoardType] [nvarchar](100) NULL,
	[PurchaseDate] [datetime] NULL,
	[PurchasePrice] [money] NULL,
	[EstimatedValue] [money] NULL,
	[PictureLocation] [nvarchar](100) NULL,
	[YearManufactured] [int] NULL,
 CONSTRAINT [PK_Boards] PRIMARY KEY CLUSTERED 
(
	[BoardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [BoardSports]
GO

/****** Object:  Table [dbo].[Booms]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Booms](
	[BoomId] [int] NOT NULL,
	[BoomName] [nvarchar](100) NOT NULL,
	[Manufacturer] [nvarchar](100) NULL,
	[MinLength] [int] NULL,
	[MaxLength] [int] NULL,
	[PurchaseDate] [datetime] NULL,
	[PurchasePrice] [money] NULL,
	[EstimatedValue] [money] NULL,
	[PictureLocation] [nvarchar](100) NULL,
 CONSTRAINT [PK_Booms] PRIMARY KEY CLUSTERED 
(
	[BoomId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [BoardSports]
GO

/****** Object:  Table [dbo].[Fins]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fins](
	[FinId] [int] NOT NULL,
	[FinStyle] [nvarchar](100) NULL,
	[FinType] [nvarchar](100) NOT NULL,
	[Length] [int] NULL,
 CONSTRAINT [PK_Fins] PRIMARY KEY CLUSTERED 
(
	[FinId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [BoardSports]
GO

/****** Object:  Table [dbo].[KiteBoards]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KiteBoards](
	[KiteboardId] [int] NOT NULL,
	[KiteboardName] [nvarchar](50) NULL,
	[Manufacturer] [nvarchar](100) NULL,
	[PurchasePrice] [money] NULL,
	[PurchaseDate] [datetime] NULL,
	[YearManufactured] [int] NULL,
	[Length] [tinyint] NULL,
	[Width] [tinyint] NULL,
	[PictureLocation] [nvarchar](100) NULL,
 CONSTRAINT [PK_KiteBoards] PRIMARY KEY CLUSTERED 
(
	[KiteboardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [BoardSports]
GO

/****** Object:  Table [dbo].[Kites]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kites](
	[KiteId] [int] NOT NULL,
	[KiteName] [nvarchar](100) NOT NULL,
	[Manufacturer] [nvarchar](100) NULL,
	[Size] [tinyint] NULL,
	[NumberOfLines] [tinyint] NULL,
	[PictureLocation] [nvarchar](100) NULL,
	[EstimatedValue] [money] NULL,
	[PurchasePrice] [money] NULL,
	[PurchaseDate] [datetime] NULL,
	[YearManufactured] [int] NULL,
 CONSTRAINT [PK_Kites] PRIMARY KEY CLUSTERED 
(
	[KiteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [BoardSports]
GO

/****** Object:  Table [dbo].[Masts]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Masts](
	[MastId] [int] NOT NULL,
	[MastName] [nvarchar](50) NOT NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[CarbonContent] [int] NULL,
	[PurchaseDate] [date] NULL,
	[PurchasePrice] [money] NULL,
	[PurchaseStore] [nvarchar](100) NULL,
	[YearManurfactured] [nchar](10) NULL,
 CONSTRAINT [PK_Masts] PRIMARY KEY CLUSTERED 
(
	[MastId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [BoardSports]
GO

/****** Object:  Table [dbo].[Rigs]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rigs](
	[RigId] [int] NOT NULL,
	[RigDate] [nchar](10) NULL,
	[RigType] [nchar](10) NULL,
	[VenueId] [int] NOT NULL,
	[BoardId] [int] NOT NULL,
	[SailId] [int] NOT NULL,
	[BoomId] [int] NOT NULL,
	[FinId] [int] NOT NULL,
	[MastId] [int] NULL,
	[KiteId] [int] NULL,
	[KiteBoardId] [int] NULL,
 CONSTRAINT [PK_Rigs] PRIMARY KEY CLUSTERED 
(
	[RigId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [BoardSports]
GO

/****** Object:  Table [dbo].[Sails]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sails](
	[SailId] [int] NOT NULL,
	[SailName] [nvarchar](100) NOT NULL,
	[Manufacturer] [nvarchar](100) NULL,
	[PurchaseDate] [datetime] NULL,
	[PurchasePrice] [money] NULL,
	[Condition] [nvarchar](50) NULL,
	[Size] [decimal](8, 4) NOT NULL,
	[BoomLength] [tinyint] NULL,
	[BaseLength] [int] NULL,
	[PictureLocation] [nvarchar](100) NULL,
	[YearManufactured] [int] NULL,
 CONSTRAINT [PK_Sails] PRIMARY KEY CLUSTERED 
(
	[SailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [BoardSports]
GO

/****** Object:  Table [dbo].[Sessions]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sessions](
	[SessionId] [int] NOT NULL,
	[SessionType] [nvarchar](50) NOT NULL,
	[SessionDate] [datetime] NOT NULL,
	[SessionDescription] [nvarchar](250) NULL,
	[Duration] [decimal](10, 4) NULL,
	[Funfactor] [tinyint] NULL,
	[RigId] [int] NOT NULL,
	[BeersConsumed] [int] NULL,
	[PeopleInCompany] [int] NULL,
	[Notes] [nvarchar](250) NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [BoardSports]
GO

/****** Object:  Table [dbo].[Snowboards]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Snowboards](
	[SnowboardId] [int] NOT NULL,
	[SnowboardName] [nvarchar](100) NOT NULL,
	[Manufacturer] [nvarchar](100) NULL,
	[PurchaseDate] [datetime] NULL,
	[PurchasePrice] [money] NULL,
	[EstimatedPrice] [money] NULL,
	[Length] [tinyint] NULL,
	[Width] [tinyint] NULL,
	[Bindings] [nvarchar](50) NULL,
 CONSTRAINT [PK_Snowboards] PRIMARY KEY CLUSTERED 
(
	[SnowboardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [BoardSports]
GO

/****** Object:  Table [dbo].[Venues]    Script Date: 04/25/2011 09:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Venues](
	[VenueId] [int] NOT NULL,
	[VenueName] [nvarchar](100) NOT NULL,
	[PictureLocation] [nvarchar](250) NULL,
 CONSTRAINT [PK_Venues] PRIMARY KEY CLUSTERED 
(
	[VenueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Rigs]  WITH CHECK ADD  CONSTRAINT [FK_Rigs_Boards] FOREIGN KEY([BoardId])
REFERENCES [dbo].[Boards] ([BoardId])
GO

ALTER TABLE [dbo].[Rigs] CHECK CONSTRAINT [FK_Rigs_Boards]
GO

ALTER TABLE [dbo].[Rigs]  WITH CHECK ADD  CONSTRAINT [FK_Rigs_Booms] FOREIGN KEY([BoomId])
REFERENCES [dbo].[Booms] ([BoomId])
GO

ALTER TABLE [dbo].[Rigs] CHECK CONSTRAINT [FK_Rigs_Booms]
GO

ALTER TABLE [dbo].[Rigs]  WITH CHECK ADD  CONSTRAINT [FK_Rigs_Fins] FOREIGN KEY([FinId])
REFERENCES [dbo].[Fins] ([FinId])
GO

ALTER TABLE [dbo].[Rigs] CHECK CONSTRAINT [FK_Rigs_Fins]
GO

ALTER TABLE [dbo].[Rigs]  WITH CHECK ADD  CONSTRAINT [FK_Rigs_Masts] FOREIGN KEY([MastId])
REFERENCES [dbo].[Masts] ([MastId])
GO

ALTER TABLE [dbo].[Rigs] CHECK CONSTRAINT [FK_Rigs_Masts]
GO

ALTER TABLE [dbo].[Rigs]  WITH CHECK ADD  CONSTRAINT [FK_Rigs_Sails] FOREIGN KEY([SailId])
REFERENCES [dbo].[Sails] ([SailId])
GO

ALTER TABLE [dbo].[Rigs] CHECK CONSTRAINT [FK_Rigs_Sails]
GO

ALTER TABLE [dbo].[Rigs]  WITH CHECK ADD  CONSTRAINT [FK_Rigs_Venues] FOREIGN KEY([VenueId])
REFERENCES [dbo].[Venues] ([VenueId])
GO

ALTER TABLE [dbo].[Rigs] CHECK CONSTRAINT [FK_Rigs_Venues]
GO

ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Rigs] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([RigId])
GO

ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Rigs]
GO


