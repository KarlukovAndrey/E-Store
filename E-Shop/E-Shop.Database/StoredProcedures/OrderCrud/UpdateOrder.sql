CREATE PROCEDURE [dbo].[UpdateOrder]
	@Id bigint,
	@LeadId bigint, 
	@Amount decimal,
	@Discount int,
	@StoreId int,
	@DeliveryTypeId int,
	@PaymentTypeId int,
	@StatusId int
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
		exec [dbo].[Order_SelectById] @Id
	end