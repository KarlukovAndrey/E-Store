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
insert into [dbo].[Category] (Name, Description)
values ('Television', ''),
('Hoover', ''),
('RoboHoover', ''),
('Microwave', ''),
('Telephone', ''),
('Fridge', '')
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
declare @ProductPropertiesId int
declare @SpecificationsValueFloat float
declare @SpecificationsValueStringTw nvarchar(20)
declare @SpecificationsValueStringTen nvarchar(10)
declare @SpecificationsValueBit bit
declare @SpecificationsValueInt int


while  @count <= @ProductCount
	begin
		set @ScreenSize = (select P.ScreenSize from [dbo].[Product] as P where(P.[Id] = @count))
		if (@ScreenSize is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 1)
			
			set @SpecificationsValueFloat = (select P.[ScreenSize] from [dbo].[Product] as P where (P.[Id] = @count))
				
			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 1))
			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId,null,null,null, @SpecificationsValueFloat)
		end;

		set @Resolution = (select P.[Resolution] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@Resolution is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 2)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 2))
						
			set @SpecificationsValueStringTw = (select P.[Resolution] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId,@SpecificationsValueStringTw, null, null, null)
		end;

		set @DysplayType = (select P.[DysplayType] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@DysplayType is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 3)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 3))
			
			set @SpecificationsValueStringTen = (select P.[DysplayType] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId,@SpecificationsValueStringTen, null, null, null)			
		end;

		set @ThreedimensionalTechnology = (select P.[ThreedimensionalTechnology] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@ThreedimensionalTechnology is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 4)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 4))
			
			set @SpecificationsValueBit = (select P.[ThreedimensionalTechnology] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValueBit, null, null)			
		end;

		set @WetCleaning = (select P.[WetCleaning] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@WetCleaning is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 5)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 5))

			set @SpecificationsValueBit = (select P.[WetCleaning] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValueBit, null, null)	
		end;

		set @DustContainerVolume = (select P.[DustContainerVolume] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@DustContainerVolume is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 6)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 6))
		
			set @SpecificationsValueFloat = (select P.[DustContainerVolume] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, null, @SpecificationsValueFloat)	
		end;

		set @AttachmentsCount = (select P.[AttachmentsCount] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@AttachmentsCount is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 7)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 7))
			
			set @SpecificationsValueInt = (select P.[AttachmentsCount] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValueInt, null)	
		end;

		set @RemoteLaunch = (select P.[RemoteLaunch] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@RemoteLaunch is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 8)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 8))
			
			set @SpecificationsValueBit = (select P.[RemoteLaunch] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValueBit, null, null)	
		end;

		set @CleaningArea = (select P.[CleaningArea] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@CleaningArea is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 9)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 9))
			
			set @SpecificationsValueInt = (select P.[CleaningArea] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValueInt, null)	
		end;

		set @TurnTableDiameter = (select P.[TurnTableDiameter] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@TurnTableDiameter is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 10)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 10))
			
			set @SpecificationsValueFloat = (select P.[TurnTableDiameter] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, null, @SpecificationsValueFloat)	
		end;

		set @NumberOfProwerLevel = (select P.[NumberOfProwerLevel] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@NumberOfProwerLevel is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 11)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 11))
			
			set @SpecificationsValueInt = (select P.[NumberOfProwerLevel] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValueInt, null)	
		end;

		set @Grill = (select P.[Grill] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@Grill is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 12)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 12))
			
			set @SpecificationsValueBit = (select P.[Grill] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValueBit, null, null)	
		end;

		set @MicrowavesPower = (select P.[MicrowavesPower] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@MicrowavesPower is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 13)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 13))
			
			set @SpecificationsValueInt = (select P.[MicrowavesPower] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValueInt, null)		
		end;

		set @SimCardCount = (select P.[SimCardCount] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@SimCardCount is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 14)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 14))
			
			set @SpecificationsValueInt = (select P.[SimCardCount] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValueInt, null)		
		end;
		
		set @FrontCamera = (select P.[FrontCamera] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@FrontCamera is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 15)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 15))
			
			set @SpecificationsValueBit = (select P.[FrontCamera] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValueBit, null, null)	
		end;

		set @HeadphoneJack = (select P.[HeadphoneJack] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@HeadphoneJack is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 16)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 16))
			
			set @SpecificationsValueBit = (select P.[HeadphoneJack] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValueBit, null, null)	
		end;

		set @BatteryCapacity = (select P.[BatteryCapacity] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@BatteryCapacity is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 17)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 17))
			
			set @SpecificationsValueInt = (select P.[BatteryCapacity] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValueInt, null)		
		end;

		set @ConnectionStandard = (select P.[ConnectionStandard] from [dbo].[Product] as P where(P.[Id] = @count))
		if(@ConnectionStandard is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 18)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 18))
			

			set @SpecificationsValueStringTw = (select P.[ConnectionStandard] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId,@SpecificationsValueStringTw, null, null, null)
		end;

		set @MinTemperatureFreezer = (select P.[MinTemperatureFreezer] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@MinTemperatureFreezer is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 19)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 19))
			
			set @SpecificationsValueInt = (select P.[MinTemperatureFreezer] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValueInt, null)		
		end;

		set @ColdStorageTime = (select P.[ColdStorageTime] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@ColdStorageTime is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 20)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 20))
			
			set @SpecificationsValueInt = (select P.[ColdStorageTime] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, null, @SpecificationsValueInt, null)		
		end;


		set @Freezer = (select P.[Freezer] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@Freezer is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 21)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 21))
			
			set @SpecificationsValueBit = (select P.[Freezer] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValueBit, null, null)	
		end;

		set @Defrost = (select P.[Defrost] from [dbo].[Product] as P where(P.[Id] = @count))
		if (@Defrost is not null)
		begin
			insert into [dbo].[Product_Properties] (ProductId, PropertyTypeId)
			values(@count, 22)

			set @ProductPropertiesId = (select PP.[Id] from [dbo].[Product_Properties] as PP where(PP.ProductId = @count and PP.PropertyTypeId = 22))
			
			set @SpecificationsValueBit = (select P.[Defrost] from  [dbo].[Product] as P where (P.[Id] = @count))

			insert into [dbo].[Product_PropertiesValue] (Product_PropertiesId, StringValue, BitValue, IntValue , FloatValue)
			Values(@ProductPropertiesId, null, @SpecificationsValueBit, null, null)	
		end;
		set @count += 1				
	end;
Go

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

declare @ProductCount int
set @ProductCount = (Select count(*) from [dbo].[Product]) 
declare @count int = 1

while  @count <= @ProductCount
	begin
		set @ScreenSize = (select P.ScreenSize from [dbo].[Product] as P where(P.[Id] = @count))
		set @Resolution = (select P.Resolution from [dbo].[Product] as P where(P.[Id] = @count))
		set @DysplayType = (select P.DysplayType from [dbo].[Product] as P where(P.[Id] = @count))
		set @ThreedimensionalTechnology = (select P.ThreedimensionalTechnology from [dbo].[Product] as P where(P.[Id] = @count))
		set @WetCleaning = (select P.WetCleaning from [dbo].[Product] as P where(P.[Id] = @count))
		set @DustContainerVolume = (select P.DustContainerVolume from [dbo].[Product] as P where(P.[Id] = @count))
		set @AttachmentsCount = (select P.AttachmentsCount from [dbo].[Product] as P where(P.[Id] = @count))
		set @RemoteLaunch = (select P.RemoteLaunch from [dbo].[Product] as P where(P.[Id] = @count))
		set @CleaningArea = (select P.CleaningArea from [dbo].[Product] as P where(P.[Id] = @count))
		set @TurnTableDiameter = (select P.TurnTableDiameter from [dbo].[Product] as P where(P.[Id] = @count))
		set @NumberOfProwerLevel = (select P.NumberOfProwerLevel from [dbo].[Product] as P where(P.[Id] = @count))
		set @Grill = (select P.Grill from [dbo].[Product] as P where(P.[Id] = @count))
		set @MicrowavesPower = (select P.MicrowavesPower from [dbo].[Product] as P where(P.[Id] = @count))
		set @SimCardCount = (select P.SimCardCount from [dbo].[Product] as P where(P.[Id] = @count))
		set @FrontCamera = (select P.FrontCamera from [dbo].[Product] as P where(P.[Id] = @count))
		set @HeadphoneJack = (select P.HeadphoneJack from [dbo].[Product] as P where(P.[Id] = @count))
		set @BatteryCapacity = (select P.BatteryCapacity from [dbo].[Product] as P where(P.[Id] = @count))
		set @ConnectionStandard = (select P.ConnectionStandard from [dbo].[Product] as P where(P.[Id] = @count))
		set @MinTemperatureFreezer = (select P.MinTemperatureFreezer from [dbo].[Product] as P where(P.[Id] = @count))
		set @ColdStorageTime = (select P.ColdStorageTime from [dbo].[Product] as P where(P.[Id] = @count))
		set @Freezer = (select P.Freezer from [dbo].[Product] as P where(P.[Id] = @count))
		set @Defrost = (select P.Defrost from [dbo].[Product] as P where(P.[Id] = @count))
		
		if (@ScreenSize is not null and
			@Resolution is not null and
			@DysplayType is not null and
			@ThreedimensionalTechnology is not null)
			begin
				insert into [dbo].[Product_Category] (ProductId, CategoryId)
				values(@count, 1)
			end;

		if(@WetCleaning is not null and
		   @DustContainerVolume is not null and
		   @AttachmentsCount is not null and
		   @RemoteLaunch = 0)
		   begin
				insert into [dbo].[Product_Category] (ProductId, CategoryId)
				values(@count, 2)
		   end;

		if(@WetCleaning is not null and
		   @DustContainerVolume is not null and
		   @AttachmentsCount is not null and
		   @RemoteLaunch is not null)
		   begin
				insert into [dbo].[Product_Category] (ProductId, CategoryId)
				values(@count, 3)
		   end;

		if(@TurnTableDiameter is not null and
		   @NumberOfProwerLevel is not null and
		   @Grill is not null and
		   @MicrowavesPower is not null)
		   begin
				insert into [dbo].[Product_Category] (ProductId, CategoryId)
				values(@count, 4)
		   end;

		if(@SimCardCount is not null and
		   @FrontCamera is not null and
		   @HeadphoneJack is not null and
		   @BatteryCapacity is not null)
		   begin
				insert into [dbo].[Product_Category] (ProductId, CategoryId)
				values(@count, 5)
		   end;

		if(@MinTemperatureFreezer is not null and
		   @ColdStorageTime is not null and
		   @Freezer is not null and
		   @Defrost is not null)
		   begin
				insert into [dbo].[Product_Category] (ProductId, CategoryId)
				values(@count, 6)
		   end;
		 set @count += 1	
	end;
go
Alter Table dbo.Product
drop column ScreenSize,Resolution,DysplayType,ThreedimensionalTechnology,WetCleaning,DustContainerVolume,
AttachmentsCount,RemoteLaunch,CleaningArea,TurnTableDiameter,NumberOfProwerLevel,Grill,
MicrowavesPower,SimCardCount, FrontCamera, HeadphoneJack, BatteryCapacity, ConnectionStandard,
MinTemperatureFreezer,ColdStorageTime,Freezer,Defrost

