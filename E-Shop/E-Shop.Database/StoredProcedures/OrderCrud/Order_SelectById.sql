Create Procedure [dbo].[Order_SelectById]
	@OrderId bigint
as 
	select
	O.Id, O.LeadId, O.Amount,O.OrderDate,O.Discount,
	S.Id, S.[Name], S.[Address],
	P.Id, P.[Name],
	D.Id, D.[Name],
	St.Id, St.[Name]
	from [dbo].[Order] as O
	join dbo.Store as S on S.Id = O.StoreId
	join dbo.PaymentType as P on P.Id = O.PaymentTypeId
	join dbo.DeliveryType as D on D.Id = O.DeliveryTypeId
	join dbo.Status as St on St.Id = O.StatusId
where(@OrderId = O.Id)
