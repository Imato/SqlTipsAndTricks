CREATE FUNCTION mh.GetIntRange 
(
	@FROM INT
	, @TO INT
)
RETURNS TABLE
AS 
RETURN
(
	WITH F
		AS
		(
			SELECT @FROM AS IntRange
		)
		, T
		AS
		(
			SELECT IntRange
			FROM F
			UNION ALL
			SELECT IntRange + 1 
			FROM T
			WHERE IntRange < @TO
		)

	SELECT IntRange
	FROM T
	
)
GO
