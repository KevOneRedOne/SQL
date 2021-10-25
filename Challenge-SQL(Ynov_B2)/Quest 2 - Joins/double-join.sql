SELECT DISTINCT tracks.'Name' AS 'TrackName', playlists.'Name' AS 'PlaylistName' FROM playlists
INNER JOIN playlist_track ON playlists.'PlaylistId' = playlist_track.'PlaylistId'
INNER JOIN tracks ON tracks.'TrackId' = playlist_track.'TrackId'
WHERE playlists.Name = 'TV Shows'
LIMIT 100