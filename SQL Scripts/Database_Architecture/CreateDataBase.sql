USE [OverHaul_Main]
GO
/****** Object:  Table [dbo].[DriverInfo]    Script Date: 3/26/2018 8:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverInfo](
	[id] [int] NOT NULL,
	[id_User] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DriverLiscenseNumber] [varchar](50) NULL,
	[CarMake] [varchar](50) NULL,
	[CarModel] [varchar](50) NULL,
	[LiscensePlateNumber] [varchar](50) NULL,
	[Picture] [varbinary](max) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_DriverInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 3/26/2018 8:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Transaction] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Weight] [float] NOT NULL,
	[Height] [float] NOT NULL,
	[Length] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[Picture] [varbinary](max) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 3/26/2018 8:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Transaction] [int] NOT NULL,
	[StartLocation] [varchar](50) NOT NULL,
	[EndLocation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 3/26/2018 8:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_User] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[DatePosted] [datetime2](7) NOT NULL,
	[DateClosed] [datetime2](7) NOT NULL,
	[isCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 3/26/2018 8:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[FirstName] [nchar](10) NOT NULL,
	[LastName] [nchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DriverInfo]  WITH CHECK ADD  CONSTRAINT [FK_DriverInfo_UserInfo] FOREIGN KEY([id_User])
REFERENCES [dbo].[UserInfo] ([id])
GO
ALTER TABLE [dbo].[DriverInfo] CHECK CONSTRAINT [FK_DriverInfo_UserInfo]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Transaction] FOREIGN KEY([id_Transaction])
REFERENCES [dbo].[Transaction] ([id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Transaction]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Transaction] FOREIGN KEY([id_Transaction])
REFERENCES [dbo].[Transaction] ([id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Transaction]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_UserInfo] FOREIGN KEY([id_User])
REFERENCES [dbo].[UserInfo] ([id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_UserInfo]
GO
