CREATE PROCEDURE [dbo].[DeleteProduct_Order]
	@Id bigint
As
	Delete From dbo.[Product_Order]
	Where(@Id = Id)
