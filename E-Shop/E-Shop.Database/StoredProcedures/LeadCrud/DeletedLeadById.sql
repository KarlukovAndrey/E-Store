CREATE PROCEDURE [dbo].[DeletedLeadById]
	@Id BIGINT
	as
	BEGIN
	  update dbo.[Lead]
	  Set IsDeleted = 1
	  where(@Id = Id)
	  Select
	  L.Id, L.FirstName, L.LastName ,L.RegistrationDate,L.Birthday, L.Address, L.Email, L.Phone,
	  R.Id, R.Name,
	  C.Id, C.Name
	  From [dbo].[Lead] as L
	  Join dbo.[Role] as R on R.Id = L.RoleId
	  Join dbo.[City] as C on C.Id = L.CityId
	  where(@Id = L.Id)
	END