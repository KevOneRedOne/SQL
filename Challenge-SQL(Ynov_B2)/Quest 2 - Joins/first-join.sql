SELECT Title AS AlbumName, Name AS ArtistName FROM albums 
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
LIMIT 100
