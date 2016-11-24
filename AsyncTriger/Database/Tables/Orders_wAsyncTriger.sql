CREATE TABLE dbo.Orders_wAsyncTriger
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
		CONSTRAINT DF_Orders_wAsyncTriger_IsDeleted DEFAULT 0

	, CONSTRAINT PK_Orders_wAsyncTriger PRIMARY KEY (OrderId)
) ON Data1;
GO

CREATE TRIGGER TG_Orders_wAsyncTriger ON dbo.Orders_wAsyncTriger
AFTER INSERT, UPDATE
AS
BEGIN 

	SET NOCOUNT ON;

	DECLARE @OrderData VARCHAR(MAX);

	SET @OrderData =
		(
			SELECT 
				OrderId
				, OrderDate
				, CustomerId
				, ProductId
				, Amount
				, Quantity
				, DeliveryId
				, ShipmentInfo
				, IsDeleted
			FROM inserted
			FOR JSON PATH, ROOT('OrderData')
		);

	IF @OrderData IS NOT NULL
	BEGIN 

		DECLARE @Handle UNIQUEIDENTIFIER;  
		 
        BEGIN DIALOG CONVERSATION @Handle   
        FROM SERVICE OrderHistoryServiceInitiator   
        TO SERVICE 'OrderHistoryServiceTarget'   
        ON CONTRACT OrderHistotyContract   
        WITH ENCRYPTION = OFF;   

        SEND ON CONVERSATION @Handle   
        MESSAGE TYPE OrderHistoryMessageType(@OrderData);

	END;
	
END;
GO