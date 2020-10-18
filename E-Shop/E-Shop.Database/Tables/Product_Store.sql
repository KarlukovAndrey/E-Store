CREATE TABLE [dbo].[Product_Store]
(
	[Id] BIGINT PRIMARY KEY Identity(1,1) NOT NULL,
	[ProductId] INT NOT NULL FOREIGN KEY ([ProductId]) REFERENCES [Product]([Id]),
	[StoreId] INT FOREIGN KEY ([StoreId]) REFERENCES [Store]([Id]) NOT NULL,
	[Count] INT NOT NULL,
)
