Create table [dbo].Color (
	[Id] int NOT NULL PRIMARY KEY Identity (1,1), 
	[Name] nvarchar(30) NOT NULL
)
GO


Create table [dbo].PropertyType (
	[Id] int NOT NULL PRIMARY KEY Identity (1,1), 
	[Name] nvarchar(50) NOT NULL
)

Go
Create table [dbo].Product_Properties (
	[Id] int NOT NULL PRIMARY KEY Identity (1,1), 
	[ProductId] int FOREIGN KEY([ProductId]) References[Product]([Id]) NOT NULL,
	[PropertyTypeId] int FOREIGN KEY([PropertyTypeId]) References[PropertyType]([Id]) NOT NULL
)

GO
Create table [dbo].Product_PropertiesValue(
	[Id] int NOT NULL PRIMARY KEY Identity (1,1), 
	[Product_PropertiesId] int FOREIGN KEY([Product_PropertiesId]) References[Product_Properties]([Id]) NOT NULL,
	[StringValue] nvarchar(100) NULL,
	[BitValue] bit NULL,
	[IntValue] int NULL,
	[FloatValue] float NULL
)

Go

Create table [dbo].Category(
	[Id] int NOT NULL PRIMARY KEY Identity (1,1), 
	[Name] nvarchar(50) NOT NULL,
	[Description] nvarchar(1000) NULL
)

GO

Create table [dbo].Product_Category(
	[Id] int NOT NULL PRIMARY KEY Identity (1,1), 
	[ProductId] int FOREIGN KEY([ProductId]) References[Product]([Id]) NOT NULL,
	[CategoryId] int FOREIGN KEY([CategoryId]) References[Category]([Id]) NOT NULL
)
GO

Create table [dbo].Tmp(
	[Id] int PRIMARY KEY Identity(1,1) NOT NULL,
	[ScreenSize] float NULL,
	[Resolution] nvarchar(20) NULL,
	[DysplayType] nvarchar(10) NULL,
	[ThreedimensionalTechnology] bit NULL,
	[WetCleaning] bit NULL,
	[DustContainerVolume] float NULL,
	[AttachmentsCount] int NULL,
	[RemoteLaunch] bit NULL,
	[CleaningArea] int NULL,
	[TurnTableDiameter] float NULL,
	[NumberOfProwerLevel] int NULL,
	[Grill] bit NULL,
	[MicrowavesPower] int NULL,
	[SimCardCount] int NULL,
	[FrontCamera] bit NULL,
	[HeadphoneJack] bit NULL,
	[BatteryCapacity] int NULL,
	[ConnectionStandard] nvarchar(20) NULL,
	[MinTemperatureFreezer] int NULL,
	[ColdStorageTime] int NULL,
	[Freezer] bit NULL,
	[Defrost] bit NULL
)
GO
insert into [dbo].[PropertyType] 
values('ScreenSize'),
('Resolution'),
('DysplayType'),
('ThreedimensionalTechnology'),
('WetCleaning'),
('DustContainerVolume'),
('AttachmentsCount'),
('RemoteLaunch'),
('CleaningArea'),
('TurnTableDiameter'),
('NumberOfProwerLevel'),
('Grill'),
('MicrowavesPower'),
('SimCardCount'),
('FrontCamera'),
('HeadphoneJack'),
('BatteryCapacity'),
('ConnectionStandard'),
('MinTemperatureFreezer'),
('ColdStorageTime'),
('Freezer'),
('Defrost')
Go
insert into [dbo].[Category]
values ('Television'),
('Hoover'),
('RoboHoover'),
('Microwave'),
('Telephone'),
('Fridge')
GO
declare @ProductCount int
set @ProductCount = (Select count(*) from [dbo].[Product]) 

declare @ScreenSize float
declare @Resolution nvarchar(20)
declare @DysplayType nvarchar(10)
declare @ThreedimensionalTechnology bit
declare @WetCleaning bit
declare @DustContainerVolume float
declare @AttachmentsCount int
declare @RemoteLaunch bit
declare @CleaningArea int
declare @TurnTableDiameter float
declare @NumberOfProwerLevel int
declare @Grill bit
declare @MicrowavesPower int
declare @SimCardCount int
declare @FrontCamera bit
declare @HeadphoneJack bit
declare @BatteryCapacity int
declare @ConnectionStandard nvarchar(20)
declare @MinTemperatureFreezer int
declare @ColdStorageTime int
declare @Freezer bit
declare @Defrost bit

declare @count int = 1


while  @count <= @ProductCount
	begin
		set @ScreenSize = (select P.ScreenSize from [dbo].[Product] as P where(P.[Id] = @count))
		if (@ScreenSize is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 1)
			declare @SpecificationsValue float
			set @SpecificationsValue = (select P.[ScreenSize] from [dbo].[Product] as P where (P.[Id] = @count))
			
			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 1))
			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId,null,null,null, @SpecificationsValue)
		end;

		set @Resolution = (select P.[Resolution] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@Resolution is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 2)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 2))
			
			declare @SpecificationsValue nvarchar(20)
			set @SpecificationsValue = (select P.[Resolution] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId,@SpecificationsValue, null, null, null)
		end;

		set @DysplayType = (select P.[DysplayType] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@DysplayType is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 3)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 3))
			
			declare @SpecificationsValue nvarchar(10)
			set @SpecificationsValue = (select P.[DysplayType] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId,@SpecificationsValue, null, null, null)			
		end;

		set @ThreedimensionalTechnology = (select P.[ThreedimensionalTechnology] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@ThreedimensionalTechnology is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 4)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 4))
			
			declare @SpecificationsValue bit
			set @SpecificationsValue = (select P.[ThreedimensionalTechnology] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValue, null, null)			
		end;

		set @WetCleaning = (select P.[WetCleaning] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@WetCleaning is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 5)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 5))

			declare @SpecificationsValue bit
			set @SpecificationsValue = (select P.[WetCleaning] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValue, null, null)	
		end;

		set @DustContainerVolume = (select P.[DustContainerVolume] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@DustContainerVolume is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 6)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 6))
		
			declare @SpecificationsValue float
			set @SpecificationsValue = (select P.[DustContainerVolume] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, null, @SpecificationsValue)	
		end;

		set @AttachmentsCount = (select P.[AttachmentsCount] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@AttachmentsCount is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 7)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 7))
			
			declare @SpecificationsValue int
			set @SpecificationsValue = (select P.[AttachmentsCount] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValue, null)	
		end;

		set @RemoteLaunch = (select P.[RemoteLaunch] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@RemoteLaunch is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 8)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 8))
			
			declare @SpecificationsValue bit
			set @SpecificationsValue = (select P.[RemoteLaunch] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValue, null, null)	
		end;

		set @CleaningArea = (select P.[CleaningArea] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@CleaningArea is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 9)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 9))
			
			declare @SpecificationsValue int
			set @SpecificationsValue = (select P.[CleaningArea] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValue, null)	
		end;

		set @TurnTableDiameter = (select P.[TurnTableDiameter] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@TurnTableDiameter is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 10)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 10))
			
			declare @SpecificationsValue float
			set @SpecificationsValue = (select P.[TurnTableDiameter] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, null, @SpecificationsValue)	
		end;

		set @NumberOfProwerLevel = (select P.[NumberOfProwerLevel] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@NumberOfProwerLevel is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 11)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 11))
			
			declare @SpecificationsValue int
			set @SpecificationsValue = (select P.[NumberOfProwerLevel] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValue, null)	
		end;

		set @Grill = (select P.[Grill] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@Grill is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 12)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 12))
			
			declare @SpecificationsValue bit
			set @SpecificationsValue = (select P.[Grill] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValue, null, null)	
		end;

		set @MicrowavesPower = (select P.[MicrowavesPower] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@MicrowavesPower is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 13)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 13))
			
			declare @SpecificationsValue int
			set @SpecificationsValue = (select P.[MicrowavesPower] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValue, null)		
		end;

		set @SimCardCount = (select P.[SimCardCount] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@SimCardCount is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 14)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 14))
			
			declare @SpecificationsValue int
			set @SpecificationsValue = (select P.[SimCardCount] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValue, null)		
		end;
		
		set @FrontCamera = (select P.[FrontCamera] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@FrontCamera is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 15)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 15))
			
			declare @SpecificationsValue bit
			set @SpecificationsValue = (select P.[FrontCamera] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValue, null, null)	
		end;

		set @HeadphoneJack = (select P.[HeadphoneJack] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@HeadphoneJack is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 16)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 16))
			
			declare @SpecificationsValue bit
			set @SpecificationsValue = (select P.[HeadphoneJack] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValue, null, null)	
		end;

		set @BatteryCapacity = (select P.[BatteryCapacity] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@BatteryCapacity is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 17)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 17))
			
			declare @SpecificationsValue int
			set @SpecificationsValue = (select P.[BatteryCapacity] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValue, null)		
		end;

		set @ConnectionStandard = (select P.[ConnectionStandard] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@ConnectionStandard is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 18)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 18))
			
			declare @SpecificationsValue nvarchar(20)
			set @SpecificationsValue = (select P.[ConnectionStandard] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId,@SpecificationsValue, null, null, null)
		end;

		set @MinTemperatureFreezer = (select P.[MinTemperatureFreezer] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@MinTemperatureFreezer is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 19)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 19))
			
			declare @SpecificationsValue int
			set @SpecificationsValue = (select P.[MinTemperatureFreezer] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValue, null)		
		end;

		set @ColdStorageTime = (select P.[ColdStorageTime] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@ColdStorageTime is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 20)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 20))
			
			declare @SpecificationsValue int
			set @SpecificationsValue = (select P.[ColdStorageTime] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValue, null)		
		end;


		set @Freezer = (select P.[Freezer] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@Freezer is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 21)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 21))
			
			declare @SpecificationsValue bit
			set @SpecificationsValue = (select P.[Freezer] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValue, null, null)	
		end;

		set @Defrost = (select P.[Defrost] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@Defrost is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 22)

			declare @ProductPropertiesId int
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 22))
			
			declare @SpecificationsValue bit
			set @SpecificationsValue = (select P.[Defrost] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValue, null, null)	
		end;
		set @count += 1				
	end;
Go
