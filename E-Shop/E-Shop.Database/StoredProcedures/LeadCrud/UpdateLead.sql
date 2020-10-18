CREATE PROCEDURE [dbo].[UpdateLead]
  @Id BIGINT,
  @FirstName NVARCHAR(50),
  @LastName NVARCHAR(50),
  @Birthday DATETIME2,
  @Address NVARCHAR(40),
  @CityId INT,
  @Phone NVARCHAR(20),
  @Email NVARCHAR(30),
  @RoleId INT
as
  Begin
	Update [dbo].[Lead] set
	FirstName = @FirstName,
	LastName = @LastName,
	Birthday = @Birthday,
	Address = @Address,
	CityId = @CityId,
	Phone = @Phone,
	Email = @Email,
	RoleId = @RoleId

	where (Id = @Id)
  END

