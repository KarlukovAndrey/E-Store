CREATE PROCEDURE [dbo].[UpdateProduct_Order]
	@Id bigint,
    @ProductId bigint,
    @Quantity int,
    @IsDeleted bit
As
Update dbo.[Product_Order]
set
    ProductId = @ProductId,
    Quantity = @Quantity,
    IsDeleted = @IsDeleted
   
where(@Id = Id)
exec [dbo].[ProductOrderSelectById] @Id

