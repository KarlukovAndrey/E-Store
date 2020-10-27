CREATE PROCEDURE [dbo].[Lead_SelectById]
	@LeadId bigint
AS
	SELECT L.Id, L.FirstName,L.LastName, L.RegistrationDate, L.Birthday, L.Address, L.Email, L.CityId ,L.RoleId
	from [dbo].[Lead] as L
where(@LeadId = L.Id and IsDeleted = 0)
