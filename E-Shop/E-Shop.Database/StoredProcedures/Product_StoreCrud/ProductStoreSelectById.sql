CREATE PROCEDURE [dbo].[ProductStoreSelectById]
  @Id bigint
as
  select
  P.Id, P.ProductId, P.StoreId, P.Quantity, IsDeleted
  from [dbo].[Product_Store] as P
where(@Id = P.Id and IsDeleted = 0)