CREATE PROCEDURE [dbo].[CreateLead]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Birthday datetime2,
	@Address nvarchar(40),
	@CityId int,
	@Phone nvarchar(20),
	@Email nvarchar(30),
	@Password nvarchar(60)
	As
	Begin
		insert into [dbo].[Lead](FirstName, LastName, RegistrationDate, Birthday, Address, CityId, Phone, Email, Password)
		values (@FirstName, @LastName,sysdatetime(), @Birthday, @Address, @CityId, @Phone, @Email,@Password)
		select SCOPE_IDENTITY()
	END