CREATE PROCEDURE [dbo].[GetQuantityProductInStore]
	@ProductId int,
	@StoreId int
as
	select P.Quantity
	from [dbo].[Product_Store] as P
where @ProductId = ProductId and @StoreId = StoreId
