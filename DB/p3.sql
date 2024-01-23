CREATE TABLE Schallplatte (
    schallplatteid INT PRIMARY KEY,
    name VARCHAR(50),
    genre VARCHAR(50)
);


CREATE TABLE Lied (
    liedid INT PRIMARY KEY,
    titel VARCHAR(50),
    artistname VARCHAR(50),
    duration INT  
);

CREATE TABLE SchallplatteLied (
    schallplatteid INT,
    liedid INT,
    PRIMARY KEY (schallplatteid,liedid),
    FOREIGN KEY (schallplatteid) REFERENCES Schallplatte(schallplatteid),
    FOREIGN KEY (liedid) REFERENCES Lied(liedid),
);

CREATE TABLE Kunde (
    kundeid INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE Bestellung (
    bestellungid INT PRIMARY KEY,
    kundeid INT,
    FOREIGN KEY (kundeid) REFERENCES Kunde(kundeid),
    lieferungsadresse VARCHAR(50)
);

CREATE TABLE SchallplatteBestellung (
    schallplatteid INT,
    bestellungid INT,
    PRIMARY KEY (schallplatteid,bestellungid),
    FOREIGN KEY (schallplatteid) REFERENCES Schallplatte(schallplatteid),
    FOREIGN KEY (bestellungid) REFERENCES Bestellung(bestellungid),
    anzahl INT
);

-- Insert data into Schallplatte table
INSERT INTO Schallplatte (schallplatteid, name, genre) VALUES
(1, 'Album A', 'Rock'),
(2, 'Album B', 'Pop'),
(3, 'Album C', 'Metal');

-- Insert data into Lied table
INSERT INTO Lied (liedid, titel, artistname, duration) VALUES
(1, 'Song 1', 'Artist A', 200),
(2, 'Song 2', 'Artist B', 180),
(3, 'Rammstein', 'Rammstein', 220),
(4, 'Gummi', 'Artist C', 150);

-- Insert data into SchallplatteLied table
INSERT INTO SchallplatteLied (schallplatteid, liedid) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);

-- Insert data into Kunde table
INSERT INTO Kunde (kundeid, name, email) VALUES
(1, 'Customer A', 'customerA@example.com'),
(2, 'Customer B', 'customerB@example.com');

-- Insert data into Bestellung table
INSERT INTO Bestellung (bestellungid, kundeid, lieferungsadresse) VALUES
(1, 1, 'Address A'),
(2, 2, 'Address B');

-- Insert data into SchallplatteBestellung table
INSERT INTO SchallplatteBestellung (schallplatteid, bestellungid, anzahl) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 2, 3);


SELECT S.schallplatteid, S.name, S.genre
FROM Schallplatte S
JOIN SchallplatteLied SL ON S.schallplatteid = SL.schallplatteid
JOIN Lied L ON SL.liedid = L.liedid
WHERE L.titel = 'Rammstein'

EXCEPT

SELECT S.schallplatteid, S.name, S.genre
FROM Schallplatte S
JOIN SchallplatteLied SL ON S.schallplatteid = SL.schallplatteid
JOIN Lied L ON SL.liedid = L.liedid
WHERE L.titel = 'Gummi'

GO

DROP VIEW MaxAnzahl

GO

CREATE VIEW MaxAnzahl AS
SELECT SL.schallplatteid, COUNT(SL.liedid) AS anzahl, MAX(SL.liedid) AS MAX
FROM SchallplatteLied SL
GROUP BY SL.schallplatteid;

GO

SELECT * FROM MaxAnzahl

GO

DROP VIEW MaxAnzahl

GO


CREATE VIEW MaxAnzahl AS
SELECT SL.schallplatteid, COUNT(SL.liedid) AS anzahl
FROM SchallplatteLied SL
GROUP BY SL.schallplatteid;

GO

SELECT S.name, S.genre, A.anzahl
FROM Schallplatte S
JOIN MaxAnzahl A ON S.schallplatteid = A.schallplatteid
WHERE A.anzahl = (SELECT MAX(anzahl) FROM MaxAnzahl);
