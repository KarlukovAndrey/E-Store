CREATE Procedure [dbo].[SearchOrder](
	@Id bigint = null,
	@LeadId bigint = null,
	@StoreId int = null,
	@AmountFrom decimal = null,
	@AmountTo decimal = null,
	@OrderDateFrom datetime2 = null,
	@OrderDateTo datetime2 = null,
	@PaymentTypeId int = null,
	@DeliveryTypeId int = null,
	@StatusId int = null
)
as
begin
declare @resultSQL nvarchar(max) = '
	select	O.[Id],
			O.[LeadId],
			O.[Amount],
			O.[OrderDate],
			O.[Discount],
			S.[Id],
			S.[Name],
			S.[Address],
			P.[Id],
			P.[Name],
			D.[Id],
			D.[Name],
			St.[Id],
			St.[Name]
	from [dbo].[Order] as O
	inner JOIN [dbo].[Store] as S on O.[StoreId] = S.Id
	inner JOIN [dbo].[PaymentType] as P on O.[PaymentTypeId] = P.Id
	inner JOIN [dbo].[DeliveryType] as D on O.[DeliveryTypeId] = D.Id
	inner JOIN [dbo].[Status] as St on O.[StatusId] = St.Id
	where (1=1)
	'
	if( @Id IS NOT NULL)
	 begin 
		  set @resultSQL += ' and O.[Id] = ' + CONVERT(nvarchar, @Id)
	 end
	if(@LeadId IS NOT NULL)
	 begin
		  set @resultSQL += ' and O.[LeadId] =' + CONVERT(nvarchar,@LeadId)
	 end
	if(@AmountFrom IS NOT NULL)
	 begin 
		set @resultSQL += ' and (O.Amount BETWEEN '+ ''''
		+ CONVERT(nvarchar, @AmountFrom) + ''' AND' + ''''
		+ CONVERT(nvarchar, @AmountTo) + ''')'
	 end
	 if( @OrderDateFrom IS NOT NULL)
	 begin
		set @resultSQL += ' and (O.OrderDate BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @OrderDateFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @OrderDateTo) + ''')'
  	 end
	  if( @StoreId IS NOT NULL)
	 begin
		set @resultSQL += ' and O.StoreId = ' + CONVERT(nvarchar, @StoreId)
  	 end
	 if( @PaymentTypeId IS NOT NULL)
	 begin
		set @resultSQL += ' and O.PaymentTypeId = ' + CONVERT(nvarchar, @PaymentTypeId)
  	 end
	 if( @DeliveryTypeId IS NOT NULL)
	 begin
		set @resultSQL += ' and O.DeliveryTypeId = ' + CONVERT(nvarchar, @DeliveryTypeId)
  	 end
	 if( @StatusId IS NOT NULL)
	 begin
		set @resultSQL += ' and O.StatusId = ' + CONVERT(nvarchar, @StatusId)
  	 end
	 set @resultSQL += ' OPTION (RECOMPILE)'
	 Print @resultSQL
	 exec sp_executesql @resultSQL	
end
