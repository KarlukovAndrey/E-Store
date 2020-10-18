CREATE TABLE [dbo].[Product_Order]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[OrderId] BIGINT FOREIGN KEY ([OrderId]) REFERENCES [Order]([Id]) NOT NULL,
	[ProductId] INT FOREIGN KEY ([ProductId]) REFERENCES [Product]([Id]) NOT NULL,
	[Quantity] INT NOT NULL
)
