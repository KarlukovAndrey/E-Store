CREATE PROCEDURE [dbo].[ProductOrderSelectById]
  @Id bigint
as
  select
  P.Id, P.OrderId, P.Quantity, P.IsDeleted
  from [dbo].[Product_Order] as P
where(@Id = P.Id and IsDeleted = 0)