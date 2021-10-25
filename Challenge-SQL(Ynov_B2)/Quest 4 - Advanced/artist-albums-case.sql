SELECT artists.'Name' AS Name, COUNT(albums.'AlbumId') AS NbAlbums, 
	CASE
		WHEN COUNT(albums.'AlbumId') = 1 THEN 'Unproductive'
		WHEN COUNT(albums.'AlbumId') > 1 AND COUNT(albums.'AlbumId') < 10 THEN 'Productive'
		WHEN COUNT(albums.'AlbumId') >= 10 THEN 'Very Productive'
	END AS IsProductive
FROM albums
INNER JOIN artists ON artists.'ArtistId' = albums.'ArtistId'
GROUP BY artists.'ArtistId'
LIMIT 100
