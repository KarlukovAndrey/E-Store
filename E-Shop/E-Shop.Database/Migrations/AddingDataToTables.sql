insert into dbo.Role 
values ('Customer'),
('Vip'),
('Admin')

go

insert into dbo.City
values ('Moskov'),
('Saint-Petersburg'),
('Kiev'),
('Minsk')

go

insert into dbo.DeliveryType
values ('customer pick-up'),
('delivery')

go

insert into dbo.PaymentType
values ('cash'),
('bank card')

go 

insert into dbo.Store (Name, Address)
values('Moskov', 'Moskov st. 3-Stroiteley 12'),
('Saint-Petersburg', 'Saint-Petersburg st. 3-Stroiteley 12'),
('Kiev', 'Kiev st. Victory 16'),
('Minsk', 'Minsk st. Lenina 4')

go

insert into dbo.Status
values('processing'),
('picking'),
('readyForDelivery'),
('cancelled'),
('completed')

go

insert into dbo.Product (Name, Price, Brand, Description,ManufactureCountry, ManufactureDate, Weight, Wattage, NoiseLevel, PresetPrograms, Width,
			             Height, Depth, ScreenSize, Resolution, DysplayType, ThreedimensionalTechnology, WetCleaning, DustContainerVolume,
			             AttachmentsCount, RemoteLaunch, CleaningArea, TurnTableDiameter, NumberOfProwerLevel, Grill, MicrowavesPower, SimCardCount,
			             FrontCamera, HeadphoneJack, BatteryCapacity, ConnectionStandard, MinTemperatureFreezer, ColdStorageTime, Freezer, Defrost)
values ('EN3889', 110990, 'Electrolux', 'Midea 3.1 Cu. Ft. Compact Refrigerator, WHD-113FB1 - Black','USA', '10.10.2020', 50, 220, 45, 7, 60, 200, 65,
        null, null, null, null, null,null, null, null, null,null,null, null, null, null,
			             null, null, null, null, -15, 120, 1, 1),
	   ('EN1419', 110000, 'Electrolux', 'RCA RFR835-Black 3.2 Cubc Foot 2 Door Fridge and Freezer, Black','USA', '10.10.2020', 50, 220, 45, 7, 60, 200, 65,
        null, null, null, null, null,null, null, null, null,null,null, null, null, null,
			             null, null, null, null, -20, 100, 1, 1),
	   ('BCRK32V', 110900, 'BLACK+DECKER', 'COMPACT & STYLISH - This space saving small refrigerator (17.5"" x 19.3"" x 32.7"") stores food, soda, beer, and other beverages with minimal energy and without taking up too much space.
	   The sleek, modern design - available in black, stainless steel, and white - is perfect for college dorm rooms, offices, garages, home bars, small apartments, and RV campers','USA', '10.10.2020', 50, 252, 45, 7, 60, 200, 65,
        null, null, null, null, null,null, null, null, null,null,null, null, null, null,
			             null, null, null, null, -20, 100, 1, 1),
	   ('EFR341', 110000, 'Frigidaire', 'Top Freezer Refrigerator is more spacious than a mini-fridge. 0. 96 cu ft freezer features ample storage space can be used to store ice cream. 
	   The door storage offer a convenient place to store jugs of milk, cartons of juice, or bottles of soda. 
	   Humidity-controlled crisper drawers help keep fruits and vegetables fresh longer.','USA', '10.10.2020', 50, 220, 45, 7, 60, 200, 65,
        null, null, null, null, null,null, null, null, null,null,null, null, null, null,
			             null, null, null, null, -20, 100, 1, 1),
	   ('QN50Q60TAFXZA', 1000, 'SAMSUNG', 'Enter a world saturated with color and sharpened to refreshing clarity, all of it made possible through the power of Quantum Dot technology.
	   An intuitive Smart TV interface learns what you like and suggests exciting new content. And if you’re into gaming, Game Enhancer automatically neutralizes annoyances like tearing and stuttering.
	   DISCLAIMERS: *QLED televisions can produce 100% Color Volume in the DCI-P3 color space, the format for most cinema screens and HDR movies for television.','Russia','10.10.2020', 15, 152, 0, 10, 214,
	   32, 12, 50, '4K', 'QLED', 1, null, null, null, null, null, null, null,null, null, null, null, null, null, null, null, null, null, null),
	     ('QN65Q90TAFXZA', 2000, 'SAMSUNG', '4K QLED doesn’t get any better than this. Experience razor-sharp clarity and striking contrast thanks to an intuitive array of LED backlighting. 
		 All that spectacle is automatically upscaled to 4K quality by a powerful Quantum Processor. 
		 Plus, with Ultra Viewing Angle, every scene looks crisp and clear no matter where you’re sitting. DISCLAIMERS: *Direct Full Array Numerical Index based on backlighting, antireflection
		 and contrast enhancement technologies.','Russia','10.10.2020', 15, 152, 0, 10, 214,
	   32, 12, 60, '4K', 'QLED', 1, null, null, null, null, null, null, null,null, null, null, null, null, null, null, null, null, null, null),
	   ('UH74220PC', 2151, 'Hoover', 'POWERFUL CLEANING ON ALL FLOORS: Simply steer around furniture and into tight spaces on carpet and hard floors using the on/off brush roll to leave no mess behind',
	   'Russia', '01.01.2001', 10, 123, 70, 5, 125,  125, 100, null, null, null, null, null, 100, 7, 0, 15, null, null, null, null, null,  null, null, null, null, null, null, null, null),
	   ('UH72625', 2451, 'Hoover', 'POWERFUL CLEANING ON ALL FLOORS: Simply steer around furniture and into tight spaces on carpet and hard floors using the on/off brush roll to leave no mess behind',
	   'Russia', '01.01.2001', 10, 123, 70, 5, 125,  125, 100, null, null, null, null, null, 100, 7, 0, 15, null, null, null, null, null,  null, null, null, null, null, null, null, null),
       ('E20 ', 5051, 'Kyvol', 'Powerful Suction & Ultra-thin: 2000Pa strong suction power, are suitable for hard floors to medium-pile carpets. Special design for daily cleaning, 
	   Cybovac E20 can easily clean various dust, hairs, and cat litter from your room, carpet, and under furniture.',
	   'Russia', '01.01.2020', 10, 123, 70, 5, 125,  125, 100, null, null, null, null, null, 100, 3, 1, 15, null, null, null, null, null,  null, null, null, null, null, null, null, null),
	   ('EM925A5A-SS', 1200, 'Toshiba', 'Stylish Stainless Steel with timeless design, external Dimension (wdh): 19. 215. 911. 5 inches, internal Dimension (wdh): 12. 3613. 668. 7 inches','Russia', '09.09.2019', 6, 231, 0, 5, 120,
			             50, 60, null, null, null, null, null, null, null, null, null, 15, 9, 1, 200, null, null, null, null, null, null, null, null, null)








