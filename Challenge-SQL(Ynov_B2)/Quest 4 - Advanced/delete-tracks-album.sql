DELETE FROM tracks
WHERE tracks.'AlbumId' = (
	SELECT albums.'AlbumId' FROM albums
	WHERE albums.'AlbumId' = 7
	)