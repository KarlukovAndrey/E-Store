CREATE PROCEDURE [dbo].[CreateLead]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Birthday datetime2,
	@Address nvarchar(40),
	@CityId int,
	@Phone nvarchar(20),
	@Email nvarchar(30),
	@RoleId int
	As
	Begin
		insert into [dbo].[Lead]
		values (@FirstName, @LastName, @Birthday, @Address, @CityId, @Phone, @Email, @RoleId)
		select SCOPE_IDENTITY()
	END
