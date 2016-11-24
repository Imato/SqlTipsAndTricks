CREATE TABLE dbo.EventLog
(
	EventLogDate	DATETIME2		NOT NULL 
	, EventLogType	CHAR(10)		NOT NULL
	, EventLogText	NVARCHAR(MAX)	NOT NULL
) ON History;
GO

 CREATE CLUSTERED INDEX CIX_EventLog
	ON dbo.EventLog (EventLogDate)
	ON History;
GO
