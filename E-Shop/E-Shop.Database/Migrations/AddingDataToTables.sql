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