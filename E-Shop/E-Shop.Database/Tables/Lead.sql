CREATE TABLE [dbo].[Lead]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FirstName] nvarchar(50) NOT NULL,
	[LastName] nvarchar(50) NOT NULL,
	[RegistrationDate] datetime2 NOT NULL,
	[Birthday] date NOT NULL,
	[Address] nvarchar(40)NOT NULL,
	[Phone] nvarchar(20) NOT NULL,
	[Email] nvarchar(30) UNIQUE NOT NULL,
	[Password] nvarchar(60) NOT NULL,
	[CityId] int FOREIGN KEY ([CityId]) REFERENCES [City]([Id]) NOT NULL,
	[RoleId] int DEFAULT '1' FOREIGN KEY ([RoleId]) REFERENCES [Role]([Id]) NOT NULL,
	[IsDeleted] bit DEFAULT '0' NOT NULL 
)
