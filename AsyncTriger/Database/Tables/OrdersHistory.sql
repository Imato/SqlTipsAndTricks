CREATE TABLE dbo.OrdersHistory
(
	HistoryDate		DATETIME2		NOT NULL 
	, OrderId		INT				NOT NULL
	, OrderData		NVARCHAR(MAX)	NOT NULL
) ON History;
GO

 CREATE CLUSTERED INDEX CIX_OrdersHistory 
	ON dbo.OrdersHistory (HistoryDate)
	ON History;
GO
