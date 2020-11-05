CREATE PROCEDURE [dbo].[GetProductStore]
	@ProductId int,
	@StoreId int
as
	select 
	P.Id, P.ProductId, P.StoreId, P.Quantity, P.IsDeleted
	from [dbo].[Product_Store] as P
	where @ProductId = P.ProductId and @StoreId = P.StoreId

