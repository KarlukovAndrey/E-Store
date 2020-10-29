CREATE PROCEDURE [dbo].[Lead_SelectById]
	@LeadId bigint
AS
	SELECT
	L.Id, L.FirstName,L.LastName, L.RegistrationDate, L.Birthday, L.Address, L.Email,L.Phone,
	R.Id, R.Name,
	C.Id, C.Name
	from [dbo].[Lead] as L
	join dbo.city as C on C.Id = L.CityId
	join dbo.role as R on R.Id = L.RoleId
where(@LeadId = L.Id and IsDeleted = 0)