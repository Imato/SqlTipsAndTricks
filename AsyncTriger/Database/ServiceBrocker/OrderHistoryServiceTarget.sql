CREATE SERVICE OrderHistoryServiceTarget
	ON QUEUE dbo.OrderHistotyQueue
	(
		OrderHistotyContract
	);
