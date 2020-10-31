CREATE PROCEDURE [dbo].[ProductOrderSelectById]
  @Id bigint
as
  select
  P.Id, P.[Name], P.Price, P.Brand,
  PrO.Id, PrO.OrderId, PrO.Quantity
  from [dbo].[Product_Order] as PrO
  join dbo.Product as P on P.Id = PrO.ProductId
where(@Id = PrO.Id and IsDeleted = 0)