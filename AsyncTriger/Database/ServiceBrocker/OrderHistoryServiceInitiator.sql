CREATE SERVICE OrderHistoryServiceInitiator
	ON QUEUE dbo.OrderHistotyQueue
	(
		OrderHistotyContract
	);
