CREATE TABLE Membership (
    membershipId INT PRIMARY KEY,
    userId INT,
    startDate DATE,
    endDate DATE,
    membershipType VARCHAR(50),
    FOREIGN KEY (userId) REFERENCES [User](userId)
);

CREATE TABLE UserSongRating (
    userId INT,
    songId INT,
    rating INT,
    PRIMARY KEY (userId, songId),
    FOREIGN KEY (userId) REFERENCES [User](userId),
    FOREIGN KEY (songId) REFERENCES Song(songId)
);

INSERT INTO Membership (membershipId, userId, startDate, endDate, membershipType)
VALUES (1, 1, '2023-01-01', '2023-12-31', 'Gold');

INSERT INTO Membership (membershipId, userId, startDate, endDate, membershipType)
VALUES (2, 2, '2023-02-15', '2023-11-30', 'Silver');

INSERT INTO Membership (membershipId, userId, startDate, endDate, membershipType)
VALUES (3, 3, '2023-03-10', '2023-10-31', 'Bronze');

INSERT INTO Membership (membershipId, userId, startDate, endDate, membershipType)
VALUES (4, 4, '2023-04-20', '2023-09-15', 'Silver');

INSERT INTO Membership (membershipId, userId, startDate, endDate, membershipType)
VALUES (5, 5, '2023-05-05', '2023-12-31', 'Gold');



INSERT INTO UserSongRating (userId, songId, rating)
VALUES (1, 1, 5);

INSERT INTO UserSongRating (userId, songId, rating)
VALUES (2, 2, 4);

INSERT INTO UserSongRating (userId, songId, rating)
VALUES (3, 3, 3);

INSERT INTO UserSongRating (userId, songId, rating)
VALUES (4, 4, 2);

INSERT INTO UserSongRating (userId, songId, rating)
VALUES (5, 5, 4);

INSERT INTO UserSongRating (userId, songId, rating)
VALUES (1, 3, 5);

INSERT INTO UserSongRating (userId, songId, rating)
VALUES (2, 3, 2);

INSERT INTO UserSongRating (userId, songId)
VALUES (2, 5);

INSERT INTO Membership (membershipId, userId, startDate, endDate, membershipType)
VALUES (6, 6, '2023-06-01', '2023-12-31', 'Silver')



UPDATE Membership
SET endDate = '2023-12-31'
WHERE membershipId = 1 AND membershipType = 'Gold';

DELETE FROM UserSongRating
WHERE rating IS NULL;

UPDATE Membership
SET membershipType = 'Platinum'
WHERE userId IN (1, 2, 3);

UPDATE UserSongRating
SET rating = 4
WHERE userId = 2 AND rating BETWEEN 2 AND 5;

SELECT userId, username, email
FROM [User]
WHERE email LIKE 'a%';


SELECT SP.playlistID, P.title
FROM SongPlaylist SP
JOIN Playlist P ON SP.playlistID = P.playlistID
GROUP BY SP.PlaylistID, P.title
HAVING COUNT(SP.SongID) > 2;