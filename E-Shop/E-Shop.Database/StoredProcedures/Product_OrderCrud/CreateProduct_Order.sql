CREATE PROCEDURE [dbo].[CreateProduct_Order]
  @OrderId bigint,
  @ProductId int,
  @Quantity int
As
  Insert into dbo.[Product_Order] (OrderId, ProductId, Quantity)
  Values ( @OrderId, @ProductId, @Quantity)
