SELECT artists.'Name' AS ArtistName, albums.'Title' AS AlbumName, tracks.'Name' AS TrackName,
ROUND(tracks.'Bytes'/1000000.0, 2) ||' MB' AS MegaBytes 
FROM tracks
INNER JOIN albums ON albums.'AlbumId' = tracks.'AlbumId'
INNER JOIN artists ON artists.'ArtistId' = albums.'ArtistId'
WHERE albums.'Title' = 'American Idiot'
