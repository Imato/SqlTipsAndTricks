CREATE QUEUE dbo.OrderHistotyQueue
	WITH STATUS=ON
	, ACTIVATION 
		(
			STATUS = ON
			, MAX_QUEUE_READERS = 50
			, PROCEDURE_NAME = dbo.AddOrdersHistoryAsync
			, EXECUTE AS OWNER
		);