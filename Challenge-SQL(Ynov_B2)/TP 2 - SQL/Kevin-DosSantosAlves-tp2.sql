----------------------------------------------------
-- Exercice 1 : Création et structuration des tables
----------------------------------------------------

-- 1)
CREATE TABLE Formation (
	idFormation INTEGER PRIMARY KEY NOT NULL,
	nom TYPE VARCHAR(50) NOT NULL
);

-- 2)
ALTER TABLE Formation
ADD niveau VARCHAR(2) NULL

-- 3)
INSERT INTO Formation
VALUES 
	(1,'INFORMATIQUE','B1'),
	(2,'INFORMATIQUE','B2'),
	(3,'INFORMATIQUE','B3'),
	(4,'MARKETING ET COMMUNICATION','B1'),
	(5,'MARKETING ET COMMUNICATION','B2'),
	(6,'MARKETING ET COMMUNICATION','B3'),
	(7,'AUDIOVISUEL','B1'),
	(8,'AUDIOVISUEL','B2'),
	(9,'AUDIOVISUEL','B3'),
	(10,'ANIMATION','B1'),
	(11,'ANIMATION','B2'),
	(12,'ANIMATION','B3'),
	(13,'CREATION ET DESIGN','B1'),
	(14,'CREATION ET DESIGN','B2'),
	(15,'CREATION ET DESIGN','B3');

-- 4)
CREATE TABLE Etudiant (
	idEtudiant INTEGER PRIMARY KEY,
	nom TYPE VARCHAR(50) NOT NULL,
	prenom TYPE VARCHAR(50) NOT NULL,
	dateDeNaissance TYPE DATE NOT NULL,
	idFormation INTEGER,
	FOREIGN KEY(idFormation) REFERENCES Formation(idFormation)
);

-- 5)
INSERT INTO Etudiant (nom,prenom,dateDeNaissance,idFormation)
VALUES 
	('Charlotte', 'Louis', '1999-10-27', 2),
	('Frédéric-Nicolas', 'Olivier', '2000-05-01', 14),
	('Thibault', 'Hoarau', '1998-07-02', 6),
	('Catherine-Élise', 'Toussaint', '1996-08-03', 1),
	('Thérèse', 'Pires', '2001-07-02', 8),
	('Isaac', 'Le Rousseau', '2002-03-13', 13),
	('Nathalie', 'de Lenoir', '1995-02-28', 3),
	('Matthieu', 'Blot', '1996-03-25', 2),
	('Christine', 'Bourdon', '2000-05-14', 1),
	('Vincent-Sébastien', 'Prevost', '1998-05-08', 11),
	('Théophile', 'Berthelot du Da Silva', '2000-11-22', 10),
	('Agathe', 'Brun', '1999-02-03', 15),
	('Bernard', 'Charles', '2001-07-05', 3),
	('Pierre', 'Le Thibault', '1998-06-30', 5),
	('Aimé-David', 'Guichard', '1999-05-03', 4),
	('Noël', 'Lemonnier', '2000-12-01', 7),
	('Caroline', 'Le Boucher', '2002-01-04', 1),
	('Josette-Jeanne', 'Gallet', '1997-08-05', 15),
	('Raymond', 'Marchal', '2001-10-31', 8),
	('Alex-Aurore', 'Lejeune', '1999-05-03', 3);

-- 6)
INSERT INTO Etudiant (Prenom,Nom,dateDeNaissance,idFormation)
VALUES ('Caroline', 'Laurent', '2000-07-16', 2);

-- 7)
CREATE TABLE Enseignant (
	idEnseignant INTEGER PRIMARY KEY,
	Prenom TYPE VARCHAR(50) NOT NULL,
	Nom TYPE VARCHAR(50) NOT NULL,
	dateDeNaissance TYPE DATE NOT NULL
	);

-- 8)
INSERT INTO Enseignant(Prenom,Nom,dateDeNaissance)
VALUES 
	('Honoré', 'Delahaye', '1990-10-02'),
	('Tristan', 'Peltier', '1985-06-02'),
	('Danielle', 'Texier-Boulay', '1982-12-01'),
	('Jérôme', 'Rousseau', '1992-11-30'),
	('Thierry', 'Morvan', '1971-11-02'),
	('Jérôme', 'Perez-Aubry', '1972-11-16'),
	('Sébastien', 'Merle', '1964-12-03'),
	('Michelle', 'Bazin', '1989-01-12'),
	('Michèle-Suzanne', 'Millet', '1979-08-20'),
	('Camille', 'Le Blin', '1990-03-09');

-- 9)
CREATE TABLE Enseignement(
	idFormation INTEGER,
	idEnseignant INTEGER,
	FOREIGN KEY(idFormation) REFERENCES Formation(idFormation),
	FOREIGN KEY(idEnseignant) REFERENCES Enseignant(idEnseignant)
);

-- 10)
INSERT INTO Enseignement
VALUES 
	(3,4),(3,5),(3,6),
	(4,7),(4,8),(4,9),
	(5,10),(5,11),(5,12),
	(6,13),(6,14),(6,15),
	(7,1),(7,2),(7,3),
	(1,1),(1,2),
	(2,3),
	(8,5),(8,6),
	(9,10),(9,12),
	(10,7),(10,8);

--------------------------------------------------
-- Exercice 2 : Opérations sur les données
--------------------------------------------------

-- 1)
SELECT * FROM Enseignant;

-- 2)
UPDATE Etudiant
SET dateDeNaissance = '1997-03-25'
WHERE idEtudiant = 8; 

-- 3)
DELETE FROM Enseignement
WHERE idFormation = 1 AND idEnseignant = 7;

-- 4)
DELETE FROM Formation
WHERE idFormation IN (10,11,12);

DELETE FROM Enseignement
WHERE idFormation IN (10,11,12);

UPDATE Etudiant
SET idFormation = 0
WHERE idFormation IN (10,11,12);

-- 5)
SELECT * FROM Etudiant
WHERE Nom LIKE '%b%';

-- 6)
SELECT * FROM Etudiant
ORDER BY dateDeNaissance DESC
LIMIT 3;

-- 7)
SELECT * FROM Etudiant
WHERE idFormation IN (1,2,4,5,7,8,13,14);

-- 8)
SELECT ('Mr ' || Enseignant.'Nom' || ' enseigne la formation ' || Formation.'nom' || " ou se trouve l'étudiant : " || Etudiant.'Nom') AS Phrase
FROM Enseignant
INNER JOIN Enseignement ON Enseignement.'idEnseignant' = Enseignant.'idEnseignant'
INNER JOIN Formation ON Enseignement.'idFormation' = Formation.'idFormation'
INNER JOIN Etudiant ON Formation.'idFormation' = Etudiant.'idFormation';

-- 9)
SELECT COUNT(idFormation) AS nbFormationsB3 FROM Etudiant
WHERE idFormation in (3,6,9,15);

-- 10)
SELECT Nom, Prenom, DATE('now') - DATE("dateDeNaissance") AS Age FROM Etudiant;

-- 11)
SELECT Nom, Prenom, 
CASE
	WHEN idFormation IN (3,6,9,15) THEN 'Oui'
	ELSE 'Non'
END AS Stage 
FROM Etudiant

-- 12)
DELETE FROM Etudiant
WHERE Etudiant.'idFormation' IN (
	SELECT Formation.'idFormation' FROM Formation
	WHERE Formation.'idFormation' in (7,8,9));