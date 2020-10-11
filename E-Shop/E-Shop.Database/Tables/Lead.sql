CREATE TABLE [dbo].[Lead]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FirstName] nvarchar(50) NOT NULL,
	[LastName] nvarchar(50) NOT NULL,
	[RegistrationDate] datetime2 NOT NULL,
	[LastUpdateDate] datetime2 NOT NULL,
	[Birthday] datetime2 NOT NULL,
	[Address] nvarchar(40) NOT NULL,
	[Phone] nvarchar(20) NOT NULL,
	[Email] nvarchar(30) NOT NULL,
	[Password] nvarchar(60) NOT NULL,
	[CityId] INT FOREIGN KEY ([CityId]) REFERENCES [City]([Id]) NOT NULL,
	[IsDeleted] bit NOT NULL DEFAULT '0'
)
