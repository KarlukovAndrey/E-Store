CREATE PROCEDURE [dbo].[UpdateProduct_Order]
	@Id bigint,
    @ProductId bigint,
    @Quantity int
    
As
Update dbo.[Product_Order]
set
    ProductId = @ProductId,
    Quantity = @Quantity
   
where(@Id = Id and IsDeleted = 0)
exec [dbo].[ProductOrderSelectById] @Id

