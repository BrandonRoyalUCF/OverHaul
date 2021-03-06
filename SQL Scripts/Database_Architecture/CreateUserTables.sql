USE [OverHaul_Main]
GO
/****** Object:  Table [dbo].[DriverInfo]    Script Date: 3/22/2018 12:46:00 PM ******/
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
/****** Object:  Table [dbo].[UserInfo]    Script Date: 3/22/2018 12:46:01 PM ******/
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
