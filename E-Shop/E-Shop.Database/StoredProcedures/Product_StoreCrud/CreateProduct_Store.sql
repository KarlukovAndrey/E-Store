CREATE PROCEDURE [dbo].[CreateProduct_Store]
	@ProductId int,
	@StoreId int,
	@Quantity int
As
begin
	Insert into dbo.[Product_Store] (ProductId, StoreId, Quantity)
	Values (@ProductId, @StoreId, @Quantity)
	declare @Id bigint
	set @Id = SCOPE_IDENTITY()
exec [dbo].[ProductStoreSelectById] @Id
end