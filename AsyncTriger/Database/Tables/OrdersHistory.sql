CREATE TABLE dbo.OrdersHistory
(
	HistoryDate		DATETIME2		NOT NULL 
	, OrderId		INT				NOT NULL
	, OrderData		NVARCHAR(2000)	NOT NULL
) ON History;
GO

 CREATE CLUSTERED INDEX CIX_OrdersHistory 
	ON dbo.OrdersHistory (HistoryDate)
	ON History;
GO
