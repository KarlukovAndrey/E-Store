CREATE PROCEDURE [dbo].[UpdateProduct_Order]
	@Id bigint,
    @ProductId bigint,
    @OrderId int,
    @Quantity int
As
Update dbo.[Product_Order]
set
    ProductId = @ProductId,
    OrderId = @OrderId,
    Quantity = @Quantity
where(@Id = Id)
exec [dbo].[Order_SelectById] @OrderId
