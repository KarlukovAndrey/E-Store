﻿CREATE PROCEDURE [dbo].[Product_SelectById]
	@ProductId int
AS
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
where(@ProductId = P.Id)
