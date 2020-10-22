CREATE PROCEDURE [dbo].[CreateOrder]
	@LeadId bigint,
	@StoreId int,
	@Amount int,
	@PaymentTypeId int,
	@DeliveryTypeId int,
	@StatusId int,
	@Discount int
As
Begin
	insert into [dbo].[Order](LeadId, StoreId, Amount,PaymentTypeId, Date, DeliveryTypeId,StatusId, Discount)
	values (@LeadId, @StoreId, @Amount,@PaymentTypeId, SYSDATETIME(), @DeliveryTypeId, @StatusId, @Discount)
	select SCOPE_IDENTITY()
END
	
