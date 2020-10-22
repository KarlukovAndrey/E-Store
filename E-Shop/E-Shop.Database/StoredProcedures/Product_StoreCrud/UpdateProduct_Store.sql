CREATE PROCEDURE [dbo].[UpdateProduct_Store]
	@Id bigint,
    @ProductId int,
    @StoreId int,
    @Quantity int
As
Update dbo.[Product_Store]
set
    ProductId = @ProductId,
    StoreId = @StoreId,
    Quantity = @Quantity
where(@Id = Id)
