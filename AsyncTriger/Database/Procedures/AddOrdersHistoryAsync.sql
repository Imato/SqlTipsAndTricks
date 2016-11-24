CREATE PROCEDURE dbo.AddOrdersHistoryAsync
	
AS
BEGIN

	SET NOCOUNT ON;
	/*
	DECLARE 
		@OrderId INT
		, @OrderData NVARCHAR(2000)
		, @Dialog UNIQUEIDENTIFIER;

	WHILE (1 = 1)
	BEGIN

		WAITFOR 
			( 
				RECEIVE TOP(1) 
					@OrderData = CAST(message_body AS XML),     
					@Dialog = conversation_handle
				FROM dbo.TestQueue 
			), TIMEOUT 2000;
			
		IF(@@ROWCOUNT = 0) 
			BREAK;


	END;

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


	DECLARE @message_type varchar(100) 
            DECLARE @dialog uniqueidentifier, @message_body XML; 
            WHILE (1 = 1) 
            BEGIN -- Receive the next available message from the queue 
            WAITFOR ( 
                        RECEIVE TOP(1) @message_type = message_type_name,     
                        @message_body = CAST(message_body AS XML),     
                        @dialog = conversation_handle
            FROM dbo.TestQueue ), TIMEOUT 500    if (@@ROWCOUNT = 0 OR @message_body IS NULL) 
            BEGIN 
                        BREAK 
            END 
            ELSE 
                        BEGIN 
                                    --process xml message here...
                                    INSERT INTO auditlog values(@message_body)
                        END
            END CONVERSATION @dialog 
            END

	add errors to EventLog
	*/

END;
