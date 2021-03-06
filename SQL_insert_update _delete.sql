USE [SharecarDB]
GO
/****** Object:  StoredProcedure [dbo].[RegistrationMain]    Script Date: 14-Jan-20 10:06:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROC [dbo].[RegistrationMain]
	-- Add the parameters for the stored procedure here
	@regid bigint,
	@logid bigint,
	@bankid bigint,
	@firstname nvarchar(50),
 @lastname nvarchar(50),
 @email nvarchar(50),
 @password	nvarchar(50),
 @username	nvarchar(50),
 @address nvarchar(50),
 @city nvarchar(50),
 @state nvarchar(50),
 @country nvarchar(50),
 @pincode nvarchar(50),
 @StatementType nvarchar(20) = ''  

 
AS

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	IF NOT EXISTS(SELECT * FROM [OPR.RegistrationMain] WHERE Username=@username and Password=@password )   
 Begin
 
insert into [OPR.RegistrationMain] values(@regid,@logid,@bankid,@firstname,@lastname,@email,@password,@username,@address,@city,@state,@country,@pincode)
 
 return

END
IF @StatementType = 'Update'  
BEGIN  
UPDATE [OPR.RegistrationMain] SET  
FirstName = @firstname, LastName = @lastname, Email = @email,Password=@password,Username=@username,Address=@address,City=@city,State=@state,Country=@country,PinCode=@pincode  
 
WHERE RegID = @regid  
END  
IF @StatementType = 'Delete'  
BEGIN  
DELETE FROM [OPR.RegistrationMain] WHERE RegID = @regid  
END  
  
