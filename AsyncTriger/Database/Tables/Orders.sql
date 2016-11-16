CREATE TABLE dbo.Orders
(
	OrderId			INT				NOT NULL	IDENTITY(1, 1)
	, OrderDate		DATETIME2(2)	NOT NULL	
	, CustomerId	INT				NOT NULL
	, ProductId		INT				NOT NULL
	, Amount		NUMERIC(16,4)	NOT NULL
	, Quantity		SMALLINT		NOT NULL
	, DeliveryId	INT				NOT NULL
	, ShipmentInfo	VARCHAR(1000)	NOT NULL
	, IsDeleted		BIT				NOT NULL 
		CONSTRAINT DF_Orders_IsDeleted DEFAULT 0

	, CONSTRAINT PK_Orders PRIMARY KEY (OrderId)
) ON Data1;
