CREATE PROCEDURE [dbo].[UpdateLeadAddress]
	@Id bigint,
	@Address nvarchar(40)
as
	begin
	  Update [dbo].[Lead] set
	  Address = @Address
	  where (Id = @Id)
	  exec [dbo].[Lead_SelectById] @Id
	end