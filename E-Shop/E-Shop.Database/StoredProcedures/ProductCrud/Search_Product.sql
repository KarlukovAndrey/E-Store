CREATE PROCEDURE [dbo].[Search_Product](
	@Id int = null,
	@Name nvarchar(100) = null,
	@NameSearchMode int = 1,
	@PriceFrom decimal = null,
	@PriceTo decimal = null,
	@Brand nvarchar(50) = null,
	@BrandSearchMode int = 1,
	@ManufactureCountry nvarchar(50) = null,
	@ManufactureCountrySearchMode int = 1,
	@ManufactureDateFrom date = null,
	@ManufactureDateTo date = null,
	@ScreenSizeFrom float = null, 
	@ScreenSizeTo float = null, 
	@Resolution nvarchar(20) = null,
	@ResolutionSearchMode int = 1,
	@DysplayType nvarchar(10) = null,
	@DysplayTypeSearchMode int = 1,
	@ThreedimensionalTechnology bit = null,
	@WetCleaning bit = null,
	@DustContainerVolumeFrom float = null,
	@DustContainerVolumeTo float = null,
	@AttachmentsCountFrom int = null,
	@AttachmentsCountTo int = null,
	@RemoteLaunch bit = null,
	@CleaningAreaFrom int = null,
	@CleaningAreaTo int = null,
	@TurnTableDiameterFrom float = null,
	@TurnTableDiameterTo float = null,
	@Grill bit = null,
	@MicrowavesPowerFrom int = null,
	@MicrowavesPowerTo int = null,
	@SimCardCountFrom int = null,
	@SimCardCountTo int = null,
	@FrontCamera bit = null,
	@HeadphoneJack bit = null,
	@BatteryCapacityFrom int = null,
	@BatteryCapacityTo int = null,
	@ConnectionStandard nvarchar(20) = null,
	@ConnectionStandardSearchMode int = 1,
	@MinTemperatureFreezerFrom int = null,
	@MinTemperatureFreezerTo int = null,
	@ColdStorageTimeFrom int = null,
	@ColdStorageTimeTo int = null,
	@Freezer bit = null,
	@Defrost bit = null
)
as
begin
declare @resultSQL nvarchar(max) ='
	SELECT 
	P.[Id],
	P.[Name],
	P.[Price],
	P.[Brand],
	P.[Description],
	P.[ManufactureCountry],
	P.[ManufactureDate],
	P.[Weight],
	P.[Wattage],
	P.[NoiseLevel],
	P.[PresetPrograms], 
	P.[Width], 
    P.[Height], 
	P.[Depth], 
	P.[ScreenSize], 
	P.[Resolution], 
	P.[DysplayType], 
	P.[ThreedimensionalTechnology], 
	P.[WetCleaning], 
	P.[DustContainerVolume], 
	P.[AttachmentsCount], 
	P.[RemoteLaunch], 
	P.[CleaningArea], 
	P.[TurnTableDiameter], 
	P.[NumberOfProwerLevel], 
	P.[Grill], 
	P.[MicrowavesPower], 
	P.[SimCardCount], 
	P.[FrontCamera],
	P.[HeadphoneJack], 
	P.[BatteryCapacity], 
	P.[ConnectionStandard], 
	P.[MinTemperatureFreezer], 
	P.[ColdStorageTime], 
	P.[Freezer], 
	P.[Defrost] 
	from [dbo].[Product] as P
	where (1=1)	
	'
	if( @Id IS NOT NULL)
	 begin 
		  set @resultSQL += ' and P.[Id] = ' + CONVERT(nvarchar, @Id)
	 end
	if(@Name IS NOT NULL)
	 begin 
		  if @NameSearchMode = 0 set @resultSQL += ' and P.Name LIKE ''' + CONVERT(nvarchar(100), @Name) + '%'''
          if @NameSearchMode is null or @NameSearchMode = 1 set @resultSQL += ' and P.Name LIKE ' + '''%' + CONVERT(nvarchar(100), @Name) + '%'''
          if @NameSearchMode = 2 set @resultSQL += ' and P.Name LIKE ' + '''%' + CONVERT(nvarchar(100), @Name) + ''''
          if @NameSearchMode = 3 set @resultSQL += ' and P.Name = ' + '''' + CONVERT(nvarchar(100), @Name)+''''
      end
	if( @PriceFrom IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.Price BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @PriceFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @PriceTo) + ''')'
  	 end
	if(@Brand IS NOT NULL)
	 begin 
		  if @BrandSearchMode = 0 set @resultSQL += ' and P.Brand LIKE ''' + CONVERT(nvarchar(50), @Brand) + '%'''
          if @BrandSearchMode is null or @BrandSearchMode = 1 set @resultSQL += ' and P.Brand LIKE ' + '''%' + CONVERT(nvarchar(50), @Brand) + '%'''
          if @BrandSearchMode = 2 set @resultSQL += ' and P.Brand LIKE ' + '''%' + CONVERT(nvarchar(50), @Brand) + ''''
          if @BrandSearchMode = 3 set @resultSQL += ' and P.Brand = ' + '''' + CONVERT(nvarchar(50), @Brand)+''''
      end
	if(@ManufactureCountry IS NOT NULL)
	 begin 
		  if @ManufactureCountrySearchMode = 0 set @resultSQL += ' and P.ManufactureCountry LIKE ''' + CONVERT(nvarchar(50), @ManufactureCountry) + '%'''
          if @ManufactureCountrySearchMode is null or @ManufactureCountrySearchMode = 1 set @resultSQL += ' and P.ManufactureCountry LIKE ' + '''%' + CONVERT(nvarchar(50), @ManufactureCountry) + '%'''
          if @ManufactureCountrySearchMode = 2 set @resultSQL += ' and P.ManufactureCountry LIKE ' + '''%' + CONVERT(nvarchar(50), @ManufactureCountry) + ''''
          if @ManufactureCountrySearchMode = 3 set @resultSQL += ' and P.ManufactureCountry = ' + '''' + CONVERT(nvarchar(50), @ManufactureCountry)+''''
      end
	if(@ManufactureDateFrom IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.ManufactureDate BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @ManufactureDateFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @ManufactureDateTo) + ''')'
  	 end	
	if(@ScreenSizeFrom IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.ScreenSize BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @ScreenSizeFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @ScreenSizeTo) + ''')'
  	 end
	
    if(@Resolution IS NOT NULL)
	 begin 
		  if @ResolutionSearchMode = 0 set @resultSQL += ' and P.Resolution LIKE ''' + CONVERT(nvarchar(20), @Resolution) + '%'''
          if @ResolutionSearchMode is null or @ResolutionSearchMode = 1 set @resultSQL += ' and P.Resolution LIKE ' + '''%' + CONVERT(nvarchar(20), @Resolution) + '%'''
          if @ResolutionSearchMode = 2 set @resultSQL += ' and P.Resolution LIKE ' + '''%' + CONVERT(nvarchar(20), @Resolution) + ''''
          if @ResolutionSearchMode = 3 set @resultSQL += ' and P.Resolution = ' + '''' + CONVERT(nvarchar(20), @Resolution)+''''
     end

	if(@DysplayType IS NOT NULL)
	 begin 
		  if @DysplayTypeSearchMode = 0 set @resultSQL += ' and P.DysplayType LIKE ''' + CONVERT(nvarchar(10), @DysplayType) + '%'''
          if @DysplayTypeSearchMode is null or @DysplayTypeSearchMode = 1 set @resultSQL += ' and P.DysplayType LIKE ' + '''%' + CONVERT(nvarchar(10), @DysplayType) + '%'''
          if @DysplayTypeSearchMode = 2 set @resultSQL += ' and P.DysplayType LIKE ' + '''%' + CONVERT(nvarchar(10), @DysplayType) + ''''
          if @DysplayTypeSearchMode = 3 set @resultSQL += ' and P.DysplayType = ' + '''' + CONVERT(nvarchar(10), @DysplayType)+''''
     end

	if(@ThreedimensionalTechnology IS NOT NULL)
	 begin 
		  set @resultSQL += ' and P.[ThreedimensionalTechnology] = ' + CONVERT(nvarchar, @ThreedimensionalTechnology)
	 end
	
	if(@WetCleaning IS NOT NULL)
	 begin 
		  set @resultSQL += ' and P.[WetCleaning] = ' + CONVERT(nvarchar, @WetCleaning)
	 end

	if(@DustContainerVolumeFrom  IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.DustContainerVolume BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @DustContainerVolumeFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @DustContainerVolumeTo) + ''')'
  	 end

	if(@AttachmentsCountFrom  IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.AttachmentsCount BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @AttachmentsCountFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @AttachmentsCountTo) + ''')'
  	 end

	if(@RemoteLaunch IS NOT NULL)
	 begin 
		  set @resultSQL += ' and P.[RemoteLaunch] = ' + CONVERT(nvarchar, @RemoteLaunch)
	 end

	if(@CleaningAreaFrom  IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.CleaningArea BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @CleaningAreaFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @CleaningAreaTo) + ''')'
  	 end

	if(@TurnTableDiameterFrom  IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.TurnTableDiameter BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @TurnTableDiameterFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @TurnTableDiameterTo) + ''')'
  	 end

	if(@Grill IS NOT NULL)
	 begin 
		  set @resultSQL += ' and P.[Grill] = ' + CONVERT(nvarchar, @Grill)
	 end

	if(@MicrowavesPowerFrom  IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.MicrowavesPower BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @MicrowavesPowerFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @MicrowavesPowerTo) + ''')'
  	 end

	if(@SimCardCountFrom  IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.SimCardCount BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @SimCardCountFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @SimCardCountTo) + ''')'
  	 end

	if(@FrontCamera IS NOT NULL)
	 begin 
		  set @resultSQL += ' and P.[FrontCamera] = ' + CONVERT(nvarchar, @FrontCamera)
	 end
	 
	 if(@HeadphoneJack IS NOT NULL)
	  begin 
		  set @resultSQL += ' and P.[HeadphoneJack] = ' + CONVERT(nvarchar, @HeadphoneJack)
	 end

	if(@BatteryCapacityFrom  IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.BatteryCapacity BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @BatteryCapacityFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @BatteryCapacityTo) + ''')'
  	 end

	if(@ConnectionStandard IS NOT NULL)
	 begin 
		  if @ConnectionStandardSearchMode = 0 set @resultSQL += ' and P.ConnectionStandard LIKE ''' + CONVERT(nvarchar(20), @ConnectionStandard) + '%'''
          if @ConnectionStandardSearchMode is null or @ConnectionStandardSearchMode = 1 set @resultSQL += ' and P.ConnectionStandard LIKE ' + '''%' + CONVERT(nvarchar(20), @ConnectionStandard) + '%'''
          if @ConnectionStandardSearchMode = 2 set @resultSQL += ' and P.ConnectionStandard LIKE ' + '''%' + CONVERT(nvarchar(20), @ConnectionStandard) + ''''
          if @ConnectionStandardSearchMode = 3 set @resultSQL += ' and P.ConnectionStandard = ' + '''' + CONVERT(nvarchar(20), @ConnectionStandard)+''''
     end

	if(@MinTemperatureFreezerFrom  IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.MinTemperatureFreezer BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @MinTemperatureFreezerFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @MinTemperatureFreezerTo) + ''')'
  	 end

	if(@ColdStorageTimeFrom  IS NOT NULL)
	 begin
		set @resultSQL += ' and (P.ColdStorageTime BETWEEN '+ '''' 
		+ CONVERT(nvarchar, @ColdStorageTimeFrom) + ''' AND ' + '''' 
		+ CONVERT(nvarchar, @ColdStorageTimeTo) + ''')'
  	 end

	if(@Freezer IS NOT NULL)
	  begin 
		  set @resultSQL += ' and P.[Freezer] = ' + CONVERT(nvarchar, @Freezer)
	 end

	if(@Defrost IS NOT NULL)
	  begin 
		  set @resultSQL += ' and P.[Defrost] = ' + CONVERT(nvarchar, @Defrost)
	 end

	set @resultSQL += ' OPTION (RECOMPILE)'
	Print @resultSQL
	exec sp_executesql @resultSQL	
end