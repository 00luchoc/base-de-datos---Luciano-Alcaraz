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

SELECT 
  e.LastName AS Empleado,
  e.Title AS Puesto,
  j.LastName AS Jefe,
  COUNT(c.CustomerId) AS ClientesAtendidos
FROM employees e
LEFT JOIN employees j ON e.ReportsTo = j.EmployeeId
LEFT JOIN customers c ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId
ORDER BY ClientesAtendidos DESC;

--ACTIVIDAD 9

INSERT INTO tracks (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES
('Get you', 1, 1, 1, 'Daniel Caesar', 354000, 5000000, 1.29),
('Freudian', 2, 1, 2, 'Daniel Caesar', 183000, 3200000, 0.99),
('Blessed', 3, 1, 3, 'Daniel Caesar', 482000, 6000000, 1.49),
('CYANIDE', 4, 1, 4, 'Daniel Caesar', 356000, 5400000, 1.19);

--ACTIVIDAD 10

SELECT *
FROM tracks
WHERE Name IN (
  'Get you',
  'Freudian',
  'Blessed',
  'CYANIDE'
);

--ACTIVIDAD 11

UPDATE tracks
SET Name = 'Loose', Composer = 'Daniel Caesar'
WHERE Name = 'Get you';

UPDATE tracks
SET Name = 'We find love', Composer = 'Daniel Caesar'
WHERE Name = 'CYANIDE';

--ACTIVIDAD 12

SELECT *
FROM tracks
WHERE Name IN ('Loose', 'We find love');

--ACTIVIDAD 13

DELETE FROM tracks
WHERE Name IN ('We find love', 'Blessed');
