CREATE PROCEDURE [dbo].[DeleteProduct_Store]
	@Id bigint
As
	Delete From dbo.[Product_Store]
	Where(@Id = Id)
