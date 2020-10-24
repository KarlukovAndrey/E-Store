CREATE PROCEDURE [dbo].[CreateLead]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Birthday datetime2,
	@Address nvarchar(40),
	@Phone nvarchar(20),
	@Email nvarchar(30),
	@Password nvarchar(60),
	@CityId int
	As
	Begin
		insert into [dbo].[Lead](FirstName, LastName, RegistrationDate, Birthday, Address, Phone, Email, Password, CityId)
		values (@FirstName, @LastName,sysdatetime(), @Birthday, @Address, @Phone, @Email, @Password, @CityId)
		select SCOPE_IDENTITY()
	END