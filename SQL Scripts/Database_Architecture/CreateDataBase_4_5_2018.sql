USE [OverHaul_Main]
GO
/****** Object:  Table [dbo].[CustomerInfo]    Script Date: 4/5/2018 5:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[DateRegistered] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPaymentInfo]    Script Date: 4/5/2018 5:43:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPaymentInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Customer] [int] NOT NULL,
	[CardNumber] [varchar](50) NOT NULL,
	[BillingAddress] [varchar](500) NOT NULL,
	[ExpirationMonth] [varchar](50) NOT NULL,
	[ExpirationYear] [varchar](50) NOT NULL,
	[CVV] [varchar](50) NOT NULL,
	[BillingName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserPaymentInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerRating]    Script Date: 4/5/2018 5:43:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerRating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Customer] [int] NOT NULL,
	[id_DriverWhoRated] [int] NOT NULL,
	[id_ServiceRequest] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_CustomerRating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverInfo]    Script Date: 4/5/2018 5:43:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverInfo](
	[id] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[DriverLicenseNumber] [varchar](50) NOT NULL,
	[Picture] [varbinary](max) NULL,
	[DateRegistered] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AverageRating] [float] NOT NULL,
	[NumberRatings] [int] NOT NULL,
 CONSTRAINT [PK_DriverInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverPaymentInfo]    Script Date: 4/5/2018 5:43:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverPaymentInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Driver] [int] NOT NULL,
	[BankAccountNumber] [varchar](50) NOT NULL,
	[RoutingNumber] [varchar](50) NOT NULL,
	[BillingName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DriverPaymentInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverRating]    Script Date: 4/5/2018 5:43:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverRating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Driver] [int] NOT NULL,
	[id_CustomerWhoRated] [int] NOT NULL,
	[id_ServiceRequest] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_DriverRating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/5/2018 5:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_ServiceRequest] [int] NOT NULL,
	[StartLocation] [varchar](50) NOT NULL,
	[EndLocation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRequest]    Script Date: 4/5/2018 5:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Customer] [int] NOT NULL,
	[id_DriverWhoCompleted] [varchar](50) NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[TotalWeight] [float] NOT NULL,
	[DatePosted] [datetime2](7) NOT NULL,
	[DateClosed] [datetime2](7) NULL,
	[Price] [float] NOT NULL,
	[LoadHelp] [bit] NOT NULL,
	[UnloadHelp] [bit] NOT NULL,
	[Picture] [varbinary](max) NULL,
	[isCompleted] [bit] NOT NULL,
	[inProgress] [bit] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 4/5/2018 5:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Driver] [int] NOT NULL,
	[CarMake] [varchar](50) NOT NULL,
	[CarModel] [varchar](50) NOT NULL,
	[CarYear] [int] NOT NULL,
	[LicensePlateNumber] [varchar](50) NOT NULL,
	[LoadCapacity] [float] NOT NULL,
	[Picture] [varbinary](max) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_isCompleted]  DEFAULT ((0)) FOR [isCompleted]
GO
ALTER TABLE [dbo].[ServiceRequest] ADD  CONSTRAINT [DF_ServiceRequest_inProgress]  DEFAULT ((0)) FOR [inProgress]
GO
ALTER TABLE [dbo].[CustomerPaymentInfo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPaymentInfo_CustomerInfo] FOREIGN KEY([id_Customer])
REFERENCES [dbo].[CustomerInfo] ([id])
GO
ALTER TABLE [dbo].[CustomerPaymentInfo] CHECK CONSTRAINT [FK_CustomerPaymentInfo_CustomerInfo]
GO
ALTER TABLE [dbo].[CustomerRating]  WITH CHECK ADD  CONSTRAINT [FK_CustomerRating_CustomerInfo] FOREIGN KEY([id_Customer])
REFERENCES [dbo].[CustomerInfo] ([id])
GO
ALTER TABLE [dbo].[CustomerRating] CHECK CONSTRAINT [FK_CustomerRating_CustomerInfo]
GO
ALTER TABLE [dbo].[DriverPaymentInfo]  WITH CHECK ADD  CONSTRAINT [FK_DriverPaymentInfo_DriverInfo] FOREIGN KEY([id_Driver])
REFERENCES [dbo].[DriverInfo] ([id])
GO
ALTER TABLE [dbo].[DriverPaymentInfo] CHECK CONSTRAINT [FK_DriverPaymentInfo_DriverInfo]
GO
ALTER TABLE [dbo].[DriverRating]  WITH CHECK ADD  CONSTRAINT [FK_DriverRating_CustomerInfo] FOREIGN KEY([id_CustomerWhoRated])
REFERENCES [dbo].[CustomerInfo] ([id])
GO
ALTER TABLE [dbo].[DriverRating] CHECK CONSTRAINT [FK_DriverRating_CustomerInfo]
GO
ALTER TABLE [dbo].[DriverRating]  WITH CHECK ADD  CONSTRAINT [FK_DriverRating_DriverInfo] FOREIGN KEY([id_Driver])
REFERENCES [dbo].[DriverInfo] ([id])
GO
ALTER TABLE [dbo].[DriverRating] CHECK CONSTRAINT [FK_DriverRating_DriverInfo]
GO
ALTER TABLE [dbo].[DriverRating]  WITH CHECK ADD  CONSTRAINT [FK_DriverRating_Transaction] FOREIGN KEY([id_ServiceRequest])
REFERENCES [dbo].[ServiceRequest] ([id])
GO
ALTER TABLE [dbo].[DriverRating] CHECK CONSTRAINT [FK_DriverRating_Transaction]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Transaction] FOREIGN KEY([id_ServiceRequest])
REFERENCES [dbo].[ServiceRequest] ([id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Transaction]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequest_CustomerInfo] FOREIGN KEY([id_Customer])
REFERENCES [dbo].[CustomerInfo] ([id])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_ServiceRequest_CustomerInfo]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_DriverInfo] FOREIGN KEY([id_Driver])
REFERENCES [dbo].[DriverInfo] ([id])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_DriverInfo]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertCustomer]    Script Date: 4/5/2018 5:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertCustomer]
	@UserName varchar(50),
	@PassWord varchar(50),
	@Name varchar(50),
	@PhoneNumber varchar(50),
	@DateRegistered datetime2(7),

	@CardNumber varchar(50),
	@BillingAddress varchar(500),
	@ExpirationMonth varchar(50),
	@ExpirationYear varchar(50),
	@CVV varchar(50),
	@BillingName varchar(50)
AS
	
	IF EXISTS (SELECT 1 FROM CustomerInfo WHERE UserName = @UserName)
	BEGIN
		RAISERROR (100,-1,-1, 'Error: The user name already exists in the system.');
	END

	INSERT INTO CustomerInfo(UserName, PassWord, Name, PhoneNumber, DateRegistered, IsActive)
	VALUES (@UserName, @PassWord, @Name, @PhoneNumber, @DateRegistered, 1)

	DECLARE @idCustomer int = (SELECT SCOPE_IDENTITY())

	INSERT INTO CustomerPaymentInfo(CardNumber, BillingAddress, ExpirationMonth, ExpirationYear, CVV, BillingName)
	VALUES (@CardNumber, @BillingAddress, @ExpirationMonth, @ExpirationYear, @CVV, @BillingName)


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertDriver]    Script Date: 4/5/2018 5:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertDriver]
	@UserName varchar(50),
	@PassWord varchar(50),
	@Name varchar(50),
	@PhoneNumber varchar(50),
	@DriverLicenseNumber varchar(50),
	@DateRegistered datetime2(7),

	@CarMake varchar(50),
	@CarModel varchar(50),
	@CarYear int,
	@LicensePlateNumber varchar(50),
	@LoadCapacity float,

	@BankAccountNumber varchar(50),
	@RoutingNumber varchar(50),
	@BillingName varchar(50)
AS
	
	IF EXISTS (SELECT 1 FROM DriverInfo WHERE UserName = @UserName)
	BEGIN
		RAISERROR (100,-1,-1, 'Error: The user name already exists in the system.');
	END

	INSERT INTO DriverInfo(UserName, [PassWord], [Name], PhoneNumber, DriverLicenseNumber, DateRegistered, IsActive)                      
	VALUES (@UserName, @PassWord, @Name, @PhoneNumber, @DriverLicenseNumber, @DateRegistered,1)

	DECLARE @idDriver int = (SELECT SCOPE_IDENTITY())

	INSERT INTO Vehicle(id_Driver, CarMake, CarModel, CarYear, LicensePlateNumber, LoadCapacity)
	VALUES (@idDriver, @CarMake, @CarModel, @CarYear, @LicensePlateNumber, @LoadCapacity)

	INSERT INTO DriverPaymentInfo(id_Driver, BankAccountNumber, RoutingNumber, BillingName)
	VALUES (@idDriver, @BankAccountNumber, @RoutingNumber, @BillingName)
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertDriverRating]    Script Date: 4/5/2018 5:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertDriverRating]
	@IdDriver int,
	@IdCustomerWhoRated int,
	@IdServiceRequest int,
	@Rating int,
	@Comment varchar(50),
	@NewDriverAverage float,
	@NewDriverCount int
AS

	INSERT INTO [DriverRating](id_Driver, id_CustomerWhoRated, id_ServiceRequest, Rating, Comment)
	VALUES (@idDriver, @IdCustomerWhoRated, @IdServiceRequest, @Rating, @Comment)

	UPDATE DriverInfo
	SET AverageRating = @NewDriverAverage, NumberRatings = @NewDriverCount
	WHERE id = @IdDriver

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertServiceRequest]    Script Date: 4/5/2018 5:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertServiceRequest]
	@idCustomer int,
	@Title varchar(50),
	@Description varchar(500),
	@TotalWeight float,
	@DatePosted datetime2(7),
	@Price float,
	@LoadHelp bit,
	@UnloadHelp bit,
	@Picture varbinary(MAX),

	@StartLocation varchar(50),
	@EndLocation varchar(50)
AS

	INSERT INTO ServiceRequest(id_Customer, Title, [Description], TotalWeight, DatePosted, Price, LoadHelp, UnloadHelp, Picture, isCompleted, inProgress)
	VALUES (@idCustomer, @Title, @Description, @TotalWeight, @DatePosted, @Price, @LoadHelp, @UnloadHelp, @Picture, 0, 0)

	DECLARE @idServiceRequest int = (SELECT SCOPE_IDENTITY())

	INSERT INTO [Location](id_ServiceRequest, StartLocation, EndLocation)
	VALUES (@idServiceRequest, @StartLocation, @EndLocation)

GO
