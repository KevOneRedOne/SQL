1)
CREATE TABLE Film (
	idFilm INTEGER PRIMARY KEY,
 	titre TYPE VARCHAR(80) NOT NULL,
);

2)
INSERT INTO Film
VALUES (1, "Les Evadés");

INSERT INTO Film
VALUES (2, "Le Parrain");

INSERT INTO Film
VALUES (3, "La vie de Pie");

UPDATE "Film" SET "titre" = 'La vie de Pi' WHERE "idFilm" = '3';

3) 
SELECT * FROM Film;

4) 
INSERT INTO Film ('titre')
VALUES ('Chocolat'), ('Scarface'), ('Rango') ;

5) 
SELECT * FROM Film;

6)
SELECT titre FROM Film;

7)
CREATE TABLE Acteur (	
	idActeur INTEGER PRIMARY KEY,
 	Nom TYPE VARCHAR(80) NOT NULL,
	Prénom TYPE VARCHAR(80) NOT NULL
);

.tables

8)
INSERT INTO Acteur ('Nom','Prénom')
VALUES ('Deep', 'Johnny');

INSERT INTO Acteur ('Nom','Prénom')
VALUES ('Pacino', 'Al');

INSERT INTO Acteur ('Nom','Prénom')
VALUES ('Sharma', 'Suraj');

9) 
SELECT Nom FROM Acteur;

10)
CREATE TABLE Filmographie ( 
     idActeur INTEGER, 
     idFilm INTEGER,
     FOREIGN KEY(idActeur) REFERENCES Acteur(idActeur),
     FOREIGN KEY(idFilm) REFERENCES Film(idFilm)
); 

11)
INSERT INTO Filmographie
VALUES (1,4), (1,6), (2,2), (2,5), (3,3);

12) 
SELECT * FROM Filmographie ; 

13)  
SELECT idFilm FROM Filmographie
WHERE idActeur = 1 ;

14)
SELECT Film.titre, Acteur.Nom FROM Film
INNER JOIN Filmographie ON Film.idFilm = Filmographie.idFilm
INNER JOIN Acteur ON Filmographie.idActeur = Acteur.idActeur

15)
SELECT (Acteur.Nom || ' a joué dans ' || Film.titre) FROM Film
INNER JOIN Filmographie ON Film.idFilm = Filmographie.idFilm
INNER JOIN Acteur ON Filmographie.idActeur = Acteur.idActeur;