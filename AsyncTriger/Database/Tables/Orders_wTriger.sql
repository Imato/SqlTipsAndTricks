CREATE TABLE dbo.Orders_wTriger
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
		CONSTRAINT DF_Orders_wTriger_IsDeleted DEFAULT 0

	, CONSTRAINT PK_Orders_wTriger PRIMARY KEY (OrderId)
) ON Data1;
GO

CREATE TRIGGER TG_Orders_wTriger ON dbo.Orders_wTriger
AFTER INSERT, UPDATE
AS
BEGIN 

	SET NOCOUNT ON;

	INSERT INTO dbo.OrdersHistory
	(
		HistoryDate
		, OrderId
		, OrderData
	)
	SELECT 
		GETUTCDATE()
		, OrderId
		, 
			(
				SELECT 
					OrderDate
					, CustomerId
					, ProductId
					, Amount
					, Quantity
					, DeliveryId
					, ShipmentInfo
					, IsDeleted
				FOR JSON PATH, ROOT('OrderData')
			)
	FROM inserted;
	
END;
GO

