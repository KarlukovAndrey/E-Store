CREATE PROCEDURE [dbo].[CreateProduct_Order]
  @ProductId bigint,
  @OrderId int,
  @Quantity int
As
  Insert into dbo.[Product_Order]
  Values (@ProductId, @OrderId, @Quantity)
