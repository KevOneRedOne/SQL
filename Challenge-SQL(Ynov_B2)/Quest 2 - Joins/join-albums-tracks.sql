SELECT Title AS AlbumName, Name AS TrackName, Milliseconds FROM tracks
INNER JOIN albums ON albums.AlbumId = tracks.AlbumId
ORDER BY "Milliseconds" ASC
LIMIT 50