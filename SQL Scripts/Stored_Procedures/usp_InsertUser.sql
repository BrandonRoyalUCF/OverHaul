USE [OverHaul_Main]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUser]    Script Date: 3/22/2018 1:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[usp_InsertUser]
	@UserName varchar(50),
	@PassWord varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50)
AS
	
	IF EXISTS (SELECT 1 FROM UserInfo WHERE UserName = @UserName)
	BEGIN
		RAISERROR (100,-1,-1, 'Error: The user name already exists in the system.');
	END

	INSERT INTO UserInfo(UserName, PassWord, FirstName, LastName, isActive)
	VALUES (@UserName, @PassWord, @FirstName, @LastName, 1)


