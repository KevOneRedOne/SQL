SELECT DISTINCT genres.'Name', AVG(tracks.'Milliseconds') AS AverageDuration FROM tracks
INNER JOIN genres ON tracks.'GenreId' = genres.'GenreId'
GROUP BY genres.'Name'
ORDER BY AVG(tracks.'Milliseconds') DESC