CREATE PROCEDURE dbo.AddOrdersHistory
(
	@OrderId INT
	, @OrderData NVARCHAR(2000)
)
	
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
		, @OrderId
		, @OrderData;

END;
