CREATE PROCEDURE [dbo].[CreateOrder]
	@LeadId bigint,
	@Amount int,
	@Discount int,
	@StoreId int,
	@PaymentTypeId int,
	@DeliveryTypeId int,
	@StatusId int
As
Begin
	insert into [dbo].[Order](LeadId, Amount, OrderDate, Discount, StoreId, PaymentTypeId, DeliveryTypeId,StatusId)
	values (@LeadId, @Amount, SYSDATETIME(), @Discount, @StoreId, @PaymentTypeId, @DeliveryTypeId, @StatusId)
	declare @OrderId bigint
set @OrderId = SCOPE_IDENTITY()
exec [dbo].[Order_SelectById] @OrderId
END
