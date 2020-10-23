CREATE TABLE [dbo].[Order]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[LeadId] BIGINT  FOREIGN KEY ([LeadId]) REFERENCES [Lead]([Id]) NOT NULL,
	[StoreId] INT NOT NULL,
	[Amount] DECIMAL NOT NULL,
	[PaymentTypeId] INT FOREIGN KEY([PaymentTypeId]) References[PaymentType]([Id]) NOT NULL,
	[OrderDate] DATETIME2 NOT NULL,
	[DeliveryTypeId] INT FOREIGN KEY([DeliveryTypeId]) REFERENCES [DeliveryType]([Id]) NOT NULL,
	[StatusId] INT FOREIGN KEY ([StatusId]) REFERENCES [Status]([Id]) NOT NULL,
	[Discount] INT NOT NULL
	)
