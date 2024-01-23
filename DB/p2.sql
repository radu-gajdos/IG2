CREATE TABLE Resort(
    resortid INT PRIMARY KEY NOT NULL,
    nume VARCHAR(50),
    stele INT,
    rating INT,
);

CREATE TABLE Canaba(
    cabanaid INT PRIMARY KEY NOT NULL,
    resortid INT,
    FOREIGN KEY (resortid) REFERENCES Resort(resortid),
    nume VARCHAR(50),
    locuri INT,
    pret INT,
);

CREATE TABLE Client(
    clientid INT PRIMARY KEY NOT NULL,
    nume VARCHAR(50),
    datanasterii DATE,
    tara VARCHAR(50),
);

CREATE TABLE Categorie(
    categorieid INT PRIMARY KEY NOT NULL,
    nume VARCHAR(50),
);

CREATE TABLE Activitate(
    activitateid INT PRIMARY KEY NOT NULL,
    nume VARCHAR(50),
    descriere VARCHAR(50),
    pret INT,
    categorieid INT,
    FOREIGN KEY (categorieid) REFERENCES Categorie(categorieid)
);

CREATE TABLE Cazare(
    cabanaid INT,
    clientid INT,
    PRIMARY KEY (cabanaid, clientid),
    FOREIGN KEY (cabanaid) REFERENCES Canaba(cabanaid),
    FOREIGN KEY (clientid) REFERENCES Client(clientid),
    datacazare DATE,
    nopti INT,
);

CREATE TABLE ClientActivitate(
    activitateid INT,
    clientid INT,
    PRIMARY KEY (activitateid, clientid),
    FOREIGN KEY (activitateid) REFERENCES Activitate(activitateid),
    FOREIGN KEY (clientid) REFERENCES Client(clientid),
    timp DATETIME
);


-- Insert data into Resort
INSERT INTO Resort (resortid, nume, stele, rating) VALUES
(1, 'Luxury Resort', 5, 9),
(2, 'Mountain Retreat', 4, 8),
(3, 'Seaside Paradise', 5, 9);

-- Insert data into Canaba
INSERT INTO Canaba (cabanaid, resortid, nume, locuri, pret) VALUES
(1, 1, 'Villa 1', 4, 200),
(2, 1, 'Villa 2', 6, 300),
(3, 2, 'Cabin 1', 2, 150),
(4, 3, 'Beach House 1', 8, 400);

-- Insert data into Client
INSERT INTO Client (clientid, nume, datanasterii, tara) VALUES
(1, 'John Smith', '1990-05-15', 'USA'),
(2, 'Alice Johnson', '1985-08-22', 'Canada'),
(3, 'Bob Miller', '1995-03-10', 'UK');

-- Insert data into Categorie
INSERT INTO Categorie (categorieid, nume) VALUES
(1, 'Adventure'),
(2, 'Relaxation'),
(3, 'Cultural');

-- Insert data into Activitate
INSERT INTO Activitate (activitateid, nume, descriere, pret, categorieid) VALUES
(1, 'Hiking Tour', 'Explore local trails', 50, 1),
(2, 'Spa Day', 'Relax and unwind', 100, 2),
(3, 'City Tour', 'Discover local culture', 75, 3);

-- Insert data into Cazare
INSERT INTO Cazare (cabanaid, clientid, datacazare, nopti) VALUES
(1, 1, '2024-01-15', 3),
(2, 2, '2024-02-20', 5),
(3, 3, '2024-03-25', 2),
(4, 1, '2024-04-10', 7);

-- Insert data into ClientActivitate
INSERT INTO ClientActivitate (activitateid, clientid, timp) VALUES
(1, 1, '2024-01-15 10:00:00'),
(2, 2, '2024-02-20 15:30:00'),
(3, 3, '2024-03-25 13:45:00'),

SELECT AVG(C.pret)
FROM Canaba C
WHERE C.locuri>=3;

CREATE VIEW CinciStele AS
SELECT R.resortid, R.nume, COUNT(CZ.clientid) AS nrcl
FROM Resort R
JOIN Canaba C ON R.resortid = C.resortid
JOIN Cazare CZ ON C.cabanaid = CZ.cabanaid
WHERE R.stele=5
GROUP BY R.resortid, R.nume

SELECT * FROM CinciStele ORDER BY nrcl DESC

-- Insert data into Activitate and Categorie
INSERT INTO Categorie (categorieid, nume) VALUES
(4, 'Adventure'),
(5, 'Relaxation');

INSERT INTO Activitate (activitateid, nume, descriere, pret, categorieid) VALUES
(4, 'Hiking Tour', 'Explore local trails', 50, 4),
(5, 'Spa Day', 'Relax and unwind', 100, 5);

-- Insert data into Client and ClientActivitate
INSERT INTO Client (clientid, nume, datanasterii, tara) VALUES
(4, 'John Smith', '1990-05-15', 'USA'),
(5, 'Alice Johnson', '1985-08-22', 'Canada');


INSERT INTO ClientActivitate (activitateid, clientid, timp) VALUES
(4, 4, '2024-01-15 10:00:00'),
(5, 5, '2024-02-20 15:30:00');


INSERT INTO Client VALUES (6,'pula', '1990-05-15', 'USA')
INSERT INTO ClientActivitate VALUES (4, 6, '2024-02-20 15:30:00');
INSERT INTO ClientActivitate VALUES (5, 6, '2024-02-20 15:30:00');

SELECT C.*
FROM Client C
JOIN ClientActivitate CA ON C.clientid = CA.clientid
JOIN Activitate A ON CA.activitateid = A.activitateid
JOIN Categorie CT ON A.categorieid = CT.categorieid
WHERE CT.nume = 'Adventure'

EXCEPT

SELECT C.*
FROM Client C
JOIN ClientActivitate CA ON C.clientid = CA.clientid
JOIN Activitate A ON CA.activitateid = A.activitateid
JOIN Categorie CT ON A.categorieid = CT.categorieid
WHERE CT.nume = 'Relaxation'


SELECT C.*
FROM Client C
JOIN ClientActivitate CA ON C.clientid = CA.clientid
JOIN Activitate A ON CA.activitateid = A.activitateid
JOIN Categorie CT ON A.categorieid = CT.categorieid
WHERE CT.nume = 'Adventure' AND C.clientid NOT IN (SELECT C.clientid
FROM Client C
JOIN ClientActivitate CA ON C.clientid = CA.clientid
JOIN Activitate A ON CA.activitateid = A.activitateid
JOIN Categorie CT ON A.categorieid = CT.categorieid
WHERE CT.nume = 'Relaxation'
)

