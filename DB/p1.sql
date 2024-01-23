/*
Se cere implementarea unei baze de date pentru o televiziune. Se vor avea in vedere urmatoarele caracteristici:
• In baza de date trebuie sa apara cel putin urmatoarele entitati (pot aparea si altele): TVShows, Actori, Spectatori,
AbonamenteTV, CategoriiShows
• Un TV show are nume si rating si o lista de actori care apar in show. De asemenea ne intereseaza pentru fiecare
show din ce categorie (ex. comedie, drama) face parte.
• Televiziunea Ofera diferite abonamente TV la diferite preturi.
• Fiecare spectator are nume si tip de abonament.
• Vrem sa stocam de asemenea vizionarile, adica ce spectator la ce show TV s-a uitat si cand anume (data si ora).
Cerinte:
1) Creati baza de date pentru problema descrisa anterior. (4 puncte)
2) Creati un view care contine numele spectatorilor care au vizionat atat 'Next Star' (numele show-ului), cat si
'Financial Education'. (1 punct)
3) Scrieti o interogare care afiseaza numarul de vizionari si numele show-urilor cu numar de vizionari mai mare
decat numarul de vizionari a show-ului 'Megastar' (numele show-ului) (2 puncte)
4) Scrieti o interogare care afiseaza tipul de abonament si suma totala incasata pe tipul respectiv pentru toate
tipurile de abonament din care s-au vandut cel Putin 3 (adica sunt cel putin 3 spectatori cu acel tip de
abonament). (2 puncte)
*/
CREATE TABLE Categories (
    categoryid INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    description VARCHAR(50)
);

CREATE TABLE TVShows (
    tvshowid INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    rating INT,
    categoryid INT,
    FOREIGN KEY (categoryid) REFERENCES Categories(categoryid)
);

CREATE TABLE Actors (
    actorId INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    rating INT
);

CREATE TABLE TVShowsActors (
    tvshowid INT,
    actorid INT,
    PRIMARY KEY (tvshowid, actorid),
    FOREIGN KEY (tvshowid) REFERENCES TVShows(tvshowid),
    FOREIGN KEY (actorid) REFERENCES Actors(actorid)
);

CREATE TABLE Subscriptions (
    subscriptionid INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    price INT
);

CREATE TABLE Spectators (
    spectatorid INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    subscriptionid INT,
    FOREIGN KEY (subscriptionid) REFERENCES Subscriptions(subscriptionid)
);



CREATE TABLE TVShowsSpectators (
    tvshowid INT,
    spectatorid INT,
    PRIMARY KEY (tvshowid, spectatorid),
    FOREIGN KEY (tvshowid) REFERENCES TVShows(tvshowid),
    FOREIGN KEY (spectatorid) REFERENCES Spectators(spectatorid),
    watchdate DATETIME DEFAULT GETDATE()
);

-- Insert data into Categories
INSERT INTO Categories (name, description) VALUES
('Entertainment', 'Shows for entertainment'),
('Education', 'Educational shows');

-- Insert data into TVShows
INSERT INTO TVShows (name, rating, categoryid) VALUES
('Next Star', 4, 1),
('Financial Education', 5, 2),
('Comedy Show', 3, 1);

-- Insert data into Actors
INSERT INTO Actors (name, rating) VALUES
('John Doe', 4),
('Jane Smith', 5),
('Bob Johnson', 3);

-- Insert data into TVShowsActors
INSERT INTO TVShowsActors (tvshowid, actorid) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);

-- Insert data into Subscriptions
INSERT INTO Subscriptions (name, price) VALUES
('Basic', 10),
('Premium', 20);

-- Insert data into Spectators
INSERT INTO Spectators (name, subscriptionid) VALUES
('Alice Adams', 1),
('Bob Brown', 2),
('Charlie Clark', 1);

-- Insert data into TVShowsSpectators
INSERT INTO TVShowsSpectators (tvshowid, spectatorid, watchdate) VALUES
(1, 1, GETDATE()),
(2, 1, GETDATE()),
(2, 2, GETDATE()),
(3, 3, GETDATE());



CREATE VIEW CommonSpectatorsView AS
SELECT S.spectatorid, S.name
FROM Spectators S
JOIN TVShowsSpectators TS ON S.spectatorid = TS.spectatorid
JOIN TVShows T ON TS.tvshowid = T.tvshowid
WHERE T.name = 'Next Star'

INTERSECT

SELECT S.spectatorid, S.name
FROM Spectators S
JOIN TVShowsSpectators TS ON S.spectatorid = TS.spectatorid
JOIN TVShows T ON TS.tvshowid = T.tvshowid
WHERE T.name = 'Financial Education';

SELECT * FROM CommonSpectatorsView

INSERT INTO TVShows VALUES ('Megastar', 5, 2)
SELECT * FROM TVShows
INSERT INTO TVShowsSpectators VALUES (4,1,GETDATE())
SELECT * FROM TVShowsSpectators


DROP VIEW TVShowCountsView
CREATE VIEW TVShowCountsView AS
SELECT T.name AS ShowName, COUNT(TS.tvshowid) AS ShowCount
FROM TVShows T
JOIN TVShowsSpectators TS ON T.tvshowid = TS.tvshowid
GROUP BY T.name;


SELECT ShowName, ShowCount
FROM TVShowCountsView
WHERE ShowCount > (
    SELECT ShowCount
    FROM TVShowCountsView
    WHERE ShowName = 'Megastar'
);

DROP VIEW SubscriptionCountView
CREATE VIEW SubscriptionCountView AS
SELECT S.subscriptionid AS subscriptionid, S.name AS name, COUNT(SP.spectatorid) AS subscriptioncount
FROM Subscriptions S
JOIN Spectators SP ON S.subscriptionid = SP.subscriptionid
GROUP BY S.subscriptionid, S.name;

SELECT * FROM SubscriptionCountView

INSERT INTO Spectators VALUES ('Gajdos Radu', 1);
INSERT INTO Spectators VALUES ('Alexandru Ioan Cuza', 1);

SELECT SCV.subscriptionid, SCV.name, SCV.subscriptioncount
FROM SubscriptionCountView AS SCV
WHERE SCV.subscriptioncount>3

