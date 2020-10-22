CREATE PROCEDURE [dbo].[CreateProduct_Store]
	@ProductId int,
	@StorageId int,
	@Count int
As
	Insert into dbo.[Product_Store]
	Values (@ProductId, @StorageId, @Count)