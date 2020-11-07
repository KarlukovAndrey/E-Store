CREATE PROCEDURE [dbo].[ProductStoreSearch](
	@Id bigint = null,
	@ProductId int = null,
	@StoreId nvarchar(max) = null,
	@IsDeleted bit = null
)
as
begin 
DECLARE @resultSQL nvarchar (max) = '
	select P.[Id],
		   P.[ProductId],
		   P.[StoreId],
		   P.[Quantity],
		   P.[IsDeleted]
	from [dbo].[Product_Store] as P
	where (1=1)
	'
	if (@Id is not null)
		begin
			set @resultSQL += ' AND T.Id = ' + CONVERT(nvarchar, @Id)
		end
	if(@ProductId is not null)
		begin
			set @resultSQL +='AND P.ProductId = ' + CONVERT(nvarchar, @ProductId)
		end
	if(@StoreId is not null)
		begin
			set @resultSQL +='AND P.StoreId IN (SELECT A.Value FROM STRING_SPLIT(@StoreId, '','') AS A)'
		end
	if(@IsDeleted is not null)
		begin
			set @resultSQL +=' AND P.IsDeleted = ' + CONVERT(nvarchar, @IsDeleted)
		end
		set @resultSQL += ' OPTION (RECOMPILE)'
		Print @resultSQL
		exec sp_executesql @resultSQL, N'@StoreId nvarchar(max)', @StoreId		
end