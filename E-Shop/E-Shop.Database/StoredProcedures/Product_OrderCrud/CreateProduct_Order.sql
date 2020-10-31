CREATE PROCEDURE [dbo].[CreateProduct_Order]
  @OrderId bigint,
  @ProductId int,
  @Quantity int
As
  insert into dbo.[Product_Order] (OrderId, ProductId, Quantity)
  values ( @OrderId, @ProductId, @Quantity)
  declare @ProductOrderId bigint
set @ProductOrderId = SCOPE_IdENTITY()
exec [dbo].[ProductOrderSelectById] @ProductOrderId
