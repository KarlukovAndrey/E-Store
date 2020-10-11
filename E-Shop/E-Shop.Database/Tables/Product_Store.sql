CREATE TABLE [dbo].[Product_Store]
(
	[Id] bigint PRIMARY KEY Identity(1,1) NOT NULL,
	[ProductId] int NOT NULL, -- FOREIGN KEY ([ProductId]) REFERENCES [Product]([Id]),
	[StoreId] int FOREIGN KEY ([StoreId]) REFERENCES [Store]([Id]) NOT NULL,
	[Count] int NOT NULL,
)
