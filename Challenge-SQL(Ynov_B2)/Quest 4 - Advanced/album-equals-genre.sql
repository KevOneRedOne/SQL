SELECT * FROM albums
WHERE albums.'Title' in (
	SELECT genres.'Name' FROM genres
	)
