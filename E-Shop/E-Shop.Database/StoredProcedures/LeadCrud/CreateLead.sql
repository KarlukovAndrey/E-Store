CREATE PROCEDURE [dbo].[CreateLead]
	@CityId int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Birthday date,
	@Address nvarchar(40),
	@Phone nvarchar(20),
	@Email nvarchar(30),
	@Password nvarchar(60)
	As
	Begin
		insert into [dbo].[Lead]( CityId, FirstName, LastName, RegistrationDate, Birthday, Address, Phone, Email, Password)
		values ( @CityId,@FirstName, @LastName,sysdatetime(), @Birthday, @Address, @Phone, @Email, @Password)	
		declare @LeadId bigint
Set @LeadId = SCOPE_IdENTITY()
exec [dbo].[Lead_SelectById] @LeadId
	END