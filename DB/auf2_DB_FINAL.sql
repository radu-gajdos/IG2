use Lab1
SELECT U.userId, U.username, COUNT(USR.songId) AS TotalSongsRated
FROM [User] U
JOIN UserSongRating USR ON U.userId = USR.userId
GROUP BY U.userId, U.username
HAVING COUNT(USR.songId) > 1;

--SELECT U.userId, U.username, COUNT(USR.songId) AS TotalSongsRated
--FROM [User] U
--LEFT JOIN UserSongRating USR ON U.userId = USR.userId
--GROUP BY U.userId, U.username;

SELECT A.albumId, A.title, COUNT(S.songId) AS TotalSongs
FROM Album A
LEFT JOIN Song S ON A.albumId = S.albumId
GROUP BY A.albumId, A.title;



SELECT S.title
FROM Song S
JOIN SongGenre SG ON S.songId = SG.songId
JOIN Genre G ON SG.genreID = G.genreID
WHERE G.name = 'Pop'

UNION

SELECT S.title
FROM Song S
JOIN SongGenre SG ON S.songId = SG.songId
JOIN Genre G ON SG.genreID = G.genreID
WHERE G.name = 'Indie';

SELECT S.songId, S.releaseDate
FROM Song S
WHERE S.releaseDate >= '2017-01-01' AND S.releaseDate <= '2017-12-31'
   OR S.songId IN (
   SELECT S2.songId
   FROM Song AS S2 
   WHERE S.releaseDate >= '2019-01-01' AND S.releaseDate <= '2019-12-31');

SELECT S.songId
FROM Song S
JOIN SongArtist SA ON S.songId = SA.songId
JOIN Artist a ON SA.artistId = A.artistId
WHERE A.artistId = 1

INTERSECT

SELECT S.songId
FROM Song S
JOIN SongArtist SA ON S.songId = SA.songId
JOIN Artist a ON SA.artistId = A.artistId
WHERE A.artistId = 2

SELECT S.songId, S.title
FROM Song S
JOIN SongPlaylist SP ON S.songId = SP.songId
WHERE SP.playlistId = 1
AND S.songId IN (
    SELECT S.songId
	FROM Song S
	JOIN SongPlaylist SP ON S.songId = SP.songId
	WHERE SP.playlistId = 2
);


SELECT S.title
FROM Song S
JOIN SongArtist SA ON S.songId = SA.songId
JOIN Artist A ON SA.artistId = A.artistId
WHERE A.name = 'Ed Sheeran'

EXCEPT

SELECT S.title
FROM Song S
JOIN SongArtist SA ON S.songId = SA.songId
JOIN Artist A ON SA.artistId = A.artistId
WHERE A.name = 'Mark Ronson'

SELECT S.title
FROM Song S
JOIN UserSongRating SR ON S.songId = SR.songId
WHERE SR.rating = 1
AND S.songId NOT IN (
    SELECT S.songId
	FROM Song S
	JOIN UserSongRating SR ON S.songId = SR.songId
	WHERE SR.rating = 5
);

SELECT TOP 3 S.title, AVG(R.rating) AS AvgRating
FROM Song S
JOIN UserSongRating R ON S.songId = R.songId
GROUP BY S.songId
HAVING AVG(R.rating) >= 4
ORDER BY AvgRating DESC;

SELECT DISTINCT U.username
FROM [User] U
WHERE U.userId = ANY (
    SELECT USR.userId
    FROM UserSongRating USR
    WHERE USR.rating = 5
);

SELECT title, duration
FROM Song S
WHERE duration > ALL (
    SELECT duration
    FROM Song
	JOIN Album A ON A.albumId = S.albumId
    WHERE A.title = '-:-'
);