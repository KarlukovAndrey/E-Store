CREATE PROCEDURE [dbo].[SearchLead](
	@Id bigint = null,
	@FirstName nvarchar(50) = null,
	@FirstNameSearchMode int = 1,
	 -- 0,1,2 или 3 т.е. 0 - "начинается с", 1 - "содержит", 2 - "заканчивается", 3 - "строгое совпадение"
	@LastName nvarchar(50) = null,
	@LastNameSearchMode int = 1,
	@BirthdayFrom date = null,
	@BirthdayTo date = null,
	@Phone nvarchar(20) = null,
	@PhoneSearchMode INT = 1,
	@Email NVARCHAR(30) = NULL,
    @EmailSearchMode INT = 1,
	@CityId INT = NULL,
    @RoleId INT = NULL,
	@IsDeleted BIT = NULL,
	@RegistrationDateFrom DATE = NULL,
    @RegistrationDateTo DATE = NULL
)
AS
begin
declare @resultSQL nvarchar(max) ='
	select  L.[Id],
			L.[FirstName],
			L.[LastName],
			L.[RegistrationDate],
			L.[Birthday],
			L.[Address],
			L.[Email],
			L.[Phone],
			L.[IsDeleted],
			C.Id,C.[Name],
			R.Id, R.[Name]
	FROM    [dbo].[Lead] as L
	inner JOIN dbo.[City] as C on L.[CityId] = C.Id
	INNER JOIN dbo.[Role] as R on L.[RoleId] = R.Id
	where (1=1)
	'
	if( @Id IS NOT NULL)
	 begin 
		  set @resultSQL += ' and L.[Id] = ' + CONVERT(nvarchar, @Id)
	 end
    if( @Email IS NOT NULL)
	 begin
          if @EmailSearchMode = 0 set @resultSQL += ' and L.Email LIKE ''' + CONVERT(nvarchar(50), @Email) + '%'''
          if @EmailSearchMode is null or @EmailSearchMode = 1 set @resultSQL += ' and L.Email LIKE ' + '''%' + CONVERT(nvarchar(50), @Email) + '%'''
          if @EmailSearchMode = 2 set @resultSQL += ' and L.Email LIKE ' + '''%' + CONVERT(nvarchar(50), @Email) + ''''
          if @EmailSearchMode = 3 set @resultSQL += ' and L.Email = ' + '''' + CONVERT(nvarchar(50), @Email)+''''
      end
	 if( @FirstName IS NOT NULL)
      begin  
          if @FirstNameSearchMode = 0 set @resultSQL += ' and L.[FirstName] LIKE ''' + CONVERT(nvarchar(50), @FirstName) + '%'''
		  if @FirstNameSearchMode is null or @FirstNameSearchMode = 1 set @resultSQL += ' and L.[FirstName] LIKE ' + '''%' + CONVERT(nvarchar(50), @FirstName) + '%'''
          if @FirstNameSearchMode = 2 set @resultSQL += ' and L.[FirstName] LIKE ' + '''%' + CONVERT(nvarchar(50), @FirstName) + ''''
          if @FirstNameSearchMode = 3 set @resultSQL += ' and L.[FirstName] = ' + '''' + CONVERT(nvarchar(50), @FirstName)+''''
      end
	 if( @LastName IS NOT NULL)
	  begin    
		 if @LastNameSearchMode = 0 set @resultSQL += ' and L.LastName LIKE ''' + CONVERT(nvarchar(50), @LastName) + '%'''
		 if @LastNameSearchMode is null or @LastNameSearchMode = 1 set @resultSQL += ' and L.LastName LIKE ' + '''%' + CONVERT(nvarchar(50), @LastName) + '%'''
		 if @LastNameSearchMode = 2 set @resultSQL += ' and L.LastName LIKE ' + '''%' + CONVERT(nvarchar(50), @LastName) + ''''
		 if @LastNameSearchMode = 3 set @resultSQL += ' and L.LastName = ' + '''' + CONVERT(nvarchar(50), @LastName)+''''
      end
	if( @BirthdayFrom IS NOT NULL)
	 begin
		 set @resultSQL += ' and (L.Birthday BETWEEN '+ '''' 
		 + CONVERT(nvarchar, @BirthdayFrom) + ''' AND ' + '''' 
		 + CONVERT(nvarchar, @BirthdayTo) + ''')'
	 end
	if( @Phone IS NOT NULL)
     begin
        if @PhoneSearchMode = 0 set @resultSQL += ' and L.Phone LIKE ''' + CONVERT(nvarchar(50), @Phone) + '%'''
        if @PhoneSearchMode is null or @PhoneSearchMode = 1 set @resultSQL += ' and L.Phone LIKE ' + '''%' + CONVERT(nvarchar(50), @Phone) + '%'''
        if @PhoneSearchMode = 2 set @resultSQL += ' and L.Phone LIKE ' + '''%' + CONVERT(nvarchar(50), @Phone) + ''''
        if @PhoneSearchMode = 3 set @resultSQL += ' and L.Phone = ' + '''' + CONVERT(nvarchar(50), @Phone)+''''
    end
	if( @CityId IS NOT NULL)
	 begin
		set @resultSQL += ' and L.CityId = ' + CONVERT(nvarchar(50), @CityId)
  	 end
	if( @RoleId IS NOT NULL)
	begin
	    set @resultSQL += ' and L.RoleId = ' + CONVERT(nvarchar, @RoleId)
	end
	if( @IsDeleted IS NOT NULL)
	 begin
		set @resultSQL += ' and L.IsDeleted = ' + CONVERT(nvarchar, @IsDeleted)
	 end
	if( @RegistrationDateFrom IS NOT NULL)
	 begin
		set @resultSQL += ' and (L.RegistrationDate BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @RegistrationDateFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @RegistrationDateTo) + ''')'
  	 end
	 set @resultSQL += ' OPTION (RECOMPILE)'
	 Print @resultSQL
	 exec sp_executesql @resultSQL	
end