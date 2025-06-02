--ACTIVIDAD 1

SELECT e.FirstName, e.LastName 
FROM employees e
ORDER BY e.FirstName, e.LastName DESC

--ACTIVIDAD 2

SELECT t.name, t.Milliseconds, a.title
FROM albums a
INNER JOIN tracks t
ON a.AlbumId = t.AlbumId
WHERE a.Title = "Big Ones"

--ACTIVIDAD 3

SELECT g.name, COUNT(t.TrackId) AS CantidadCanciones
FROM genres g
INNER JOIN tracks t
ON g.GenreId = t.GenreId
GROUP BY g.name

--ACTIVIDAD 4

SELECT a.Title, COUNT(t.TrackId) AS CantidadCanciones
FROM albums a
INNER JOIN tracks t 
ON a.AlbumId = t.AlbumId
GROUP BY a.Title
HAVING COUNT(t.TrackId) >= 5;

--ACTIVIDAD 5

SELECT a.Title, SUM(t.UnitPrice) AS PrecioAlbum
FROM albums a
INNER JOIN tracks t
ON a.AlbumId = t.AlbumId
GROUP BY a.Title
ORDER BY PrecioAlbum ASC
LIMIT 10

--ACTIVIDAD 6

SELECT t.Name AS TrackName, g.Name AS GenreName, a.Title AS AlbumTitle, t.UnitPrice AS Price
FROM tracks t
INNER JOIN genres g 
ON t.GenreId = g.GenreId
INNER JOIN albums a 
ON t.AlbumId = a.AlbumId
WHERE t.UnitPrice = 0.99
ORDER BY t.Name;

--ACTIVIDAD 7

SELECT t.name AS TrackName, t.Milliseconds AS TrackDuration, a.Title AS AlbumTitle, ar.name AS ArtistName
FROM artists ar
INNER JOIN albums a
ON ar.ArtistId = a.ArtistId
INNER JOIN tracks t
ON a.AlbumId = t.AlbumId
ORDER BY t.Milliseconds ASC
LIMIT 20

--ACTIVIDAD 8


--ACTIVIDAD 9

--ACTIVIDAD 10

--ACTIVIDAD 11

--ACTIVIDAD 12

--ACTIVIDAD 13