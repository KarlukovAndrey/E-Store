CREATE PROCEDURE [dbo].[SelectLeadByLogin]
	@login nvarchar(30)
as
	select
	L.Id, L.FirstName, L.LastName, L.RegistrationDate,L.Password, L.Birthday, L.Address, L.Phone, L.Email,
	C.Id ,C.Name,
	R.Id, R.Name
	from [dbo].[Lead] as L
	inner join dbo.[City] as C on C.Id = L.CityId
    inner join dbo.[Role] as R on R.Id = L.RoleId 
	where @login = Email or @login = Phone