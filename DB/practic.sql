CREATE TABLE Kunde(
	kundeid INT PRIMARY KEY,
	name VARCHAR(50),
	telefon VARCHAR(50),
	adresse VARCHAR(50)
);

CREATE TABLE Kostum(
	kostumid INT PRIMARY KEY,
	beschreibung VARCHAR(50),
	grosse INT,
	preis INT
);

CREATE TABLE Stoff(
	stoffid INT PRIMARY KEY,
	name VARCHAR(50),
	farbe VARCHAR(50),
	preis INT
);

CREATE TABLE KostumStoff(
	kostumid INT,
	stoffid INT,
	PRIMARY KEY (kostumid,stoffid),
	FOREIGN KEY (kostumid) REFERENCES Kostum(kostumid),
	FOREIGN KEY (stoffid) REFERENCES Stoff(stoffid),
);

CREATE TABLE Verleihformular(
	formularid INT PRIMARY KEY,
	kundeid INT,
	FOREIGN KEY (kundeid) REFERENCES Kunde(kundeid),
	datum DATE,
);

CREATE TABLE VerleihformularKostum(
	formularid INT,
	kostumid INT,
	PRIMARY KEY (kostumid,formularid),
	FOREIGN KEY (kostumid) REFERENCES Kostum(kostumid),
	FOREIGN KEY (formularid) REFERENCES Verleihformular(formularid),
	tage INT
);

INSERT INTO Kostum VALUES (1, 'K1', 12, 120)
INSERT INTO Kostum VALUES (2, 'K2', 10, 100)
INSERT INTO Kostum VALUES (3, 'K3', 9, 90)
INSERT INTO Kostum VALUES (4, 'K4', 9, 200)

INSERT INTO Stoff VALUES (1, 'S1', 'grun', 11)
INSERT INTO Stoff VALUES (2, 'S2', 'blau', 12)
INSERT INTO Stoff VALUES (3, 'S3', 'rot', 13)

INSERT INTO KostumStoff VALUES (1,1)
INSERT INTO KostumStoff VALUES (1,2)
INSERT INTO KostumStoff VALUES (2,2)
INSERT INTO KostumStoff VALUES (2,3)
INSERT INTO KostumStoff VALUES (4,3)
INSERT INTO KostumStoff VALUES (3,3)


--SELECT S.name, S.farbe, K.beschreibung
--FROM Kostum K
--JOIN KostumStoff KS ON K.kostumid = KS.kostumid
--JOIN Stoff S ON KS.stoffid = S.stoffid
--GROUP BY S.name, S.farbe, K.beschreibung

INSERT INTO Stoff VALUES (10, 'S10', 'grau', 1)

SELECT S.stoffid, S.name, S.farbe
FROM Stoff S

EXCEPT

SELECT S.stoffid, S.name, S.farbe
FROM Kostum K
JOIN KostumStoff KS ON K.kostumid = KS.kostumid
JOIN Stoff S ON KS.stoffid = S.stoffid
GROUP BY S.stoffid, S.name, S.farbe

GO

DROP VIEW KostumeUberZweiHundretAnzahlStoff

GO

CREATE VIEW KostumeUberZweiHundretAnzahlStoff AS
SELECT K.kostumid, COUNT(KS.kostumid) AS anzahl
FROM Kostum K
JOIN KostumStoff KS ON K.kostumid = KS.kostumid
WHERE K.preis = 200
GROUP BY K.kostumid,KS.kostumid

SELECT * FROM KostumeUberZweiHundretAnzahlStoff

GO
DROP VIEW AlleKostumeUndAnzahlStoff
GO
CREATE VIEW AlleKostumeUndAnzahlStoff AS
SELECT K.kostumid, K.beschreibung, K.preis, COUNT(KS.kostumid) AS anzahl
FROM Kostum K
JOIN KostumStoff KS ON K.kostumid = KS.kostumid
GROUP BY K.kostumid,KS.kostumid, K.beschreibung, K.preis

SELECT * FROM AlleKostumeUndAnzahlStoff

SELECT * FROM AlleKostumeUndAnzahlStoff AS AK
WHERE AK.anzahl > (SELECT MAX(KZ.anzahl) FROM KostumeUberZweiHundretAnzahlStoff KZ)

SELECT K.kostumid, K.beschreibung, K.preis, COUNT(KS.kostumid) AS anzahl
FROM Kostum K
JOIN KostumStoff KS ON K.kostumid = KS.kostumid
GROUP BY K.kostumid,KS.kostumid, K.beschreibung, K.preis
HAVING COUNT(KS.kostumid) > (
SELECT MAX(T.num) FROM(
	SELECT COUNT(KS2.kostumid) AS num
	FROM Kostum K2
	JOIN KostumStoff KS2 ON K2.kostumid = KS2.kostumid
	WHERE K2.preis = 200
	GROUP BY K2.kostumid,KS2.kostumid)T
	)