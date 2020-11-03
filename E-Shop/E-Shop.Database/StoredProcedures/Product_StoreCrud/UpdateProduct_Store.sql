CREATE PROCEDURE [dbo].[UpdateProduct_Store]
	@Id bigint,
    @StoreId int,
    @Quantity int,
    @IsDeleted bit
As
Update dbo.[Product_Store]
set
    StoreId = @StoreId,
    Quantity = @Quantity,
    IsDeleted = @IsDeleted
where(@Id = Id)
exec [dbo].[ProductStoreSelectById] @Id
