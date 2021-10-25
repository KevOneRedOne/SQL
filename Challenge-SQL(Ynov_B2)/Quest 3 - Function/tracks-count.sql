SELECT DISTINCT genres.'Name', COUNT(tracks.'GenreId') AS NumberOfTracks FROM genres
INNER JOIN tracks ON tracks.'GenreId' = genres.'GenreId'
GROUP BY genres.'Name' 