CREATE PROCEDURE [dbo].[UpdateOrder]
	@Id bigint,
	@LeadId bigint,
	@StoreId int,
	@Amount decimal,
	@PaymentTypeId int,
	@DeliveryTypeId int,
	@StatusId int,
	@Discount int
as
	begin
		Update [dbo].[Order] set
		LeadId = @LeadId,
		StoreId = @StoreId,
		Amount = @Amount,
		PaymentTypeId = @PaymentTypeId,
		DeliveryTypeId = @DeliveryTypeId,
		StatusId = @StatusId,
		Discount = @Discount
		
		where(Id = @Id)
	end