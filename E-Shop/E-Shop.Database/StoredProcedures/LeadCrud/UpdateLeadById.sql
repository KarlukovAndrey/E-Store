Create PROCEDURE [dbo].[UpdateLeadById]
  @Id BIGINT,
  @FirstName NVARCHAR(50),
  @LastName NVARCHAR(50),
  @Birthday DATE,
  @Address NVARCHAR(40),
  @CityId INT,
  @Phone NVARCHAR(20),
  @Email NVARCHAR(30),
  @Password NVARCHAR(60),
  @RoleId INT
as
  begin
	Update [dbo].[Lead] set
	FirstName = @FirstName,
	LastName = @LastName,
	Birthday = @Birthday,
	Address = @Address,
	CityId = @CityId,
	Phone = @Phone,
	Email = @Email,
	Password = @Password,
	RoleId = @RoleId
	where (Id = @Id)
	exec [dbo].[Lead_SelectById] @Id
  end