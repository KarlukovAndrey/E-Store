CREATE PROCEDURE [dbo].[DeleatedLeadById]
	@Id BIGINT
	as
	BEGIN
	  update dbo.[Lead]
	  Set IsDeleted = 1
	  where(@Id = Id)
	  Select L.Id, L.FirstName, L.LastName, L.Email, L.Phone, L.RegistrationDate, L.Birthday, L.Address,C.Name, R.Id, R.Name
	  From [dbo].[Lead] as L
	  Join dbo.[City] as C on C.Id = L.CityId
	  Join dbo.[Role] as R on R.Id = L.RoleId
	  where(@Id = L.Id)
	END
