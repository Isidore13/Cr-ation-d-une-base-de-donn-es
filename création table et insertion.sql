DROP SCHEMA IF EXISTS streaming CASCADE;
CREATE SCHEMA streaming;
------------------------------------------------------------
-- Table: utilisateur
------------------------------------------------------------
CREATE TABLE streaming.utilisateur(
	pseudo      VARCHAR (50) NOT NULL ,
	nom         VARCHAR (50) NOT NULL ,
	prenom      VARCHAR (50) NOT NULL ,
	numtel      INT  NOT NULL ,
	e_mail      VARCHAR (50) NOT NULL ,
	carteBleu   VARCHAR  NOT NULL  ,
	CONSTRAINT utilisateur_PK PRIMARY KEY (pseudo)
);


------------------------------------------------------------
-- Table: catalogue
------------------------------------------------------------
CREATE TABLE streaming.catalogue(
	IDoeuvre   INT  NOT NULL ,
	genre      VARCHAR (50) NOT NULL ,
	note       INT  NOT NULL  ,
	CONSTRAINT catalogue_PK PRIMARY KEY (IDoeuvre)
);


------------------------------------------------------------
-- Table: mangaka
------------------------------------------------------------
CREATE TABLE streaming.mangaka(
	IDmangaka       INT  NOT NULL ,
	nom             VARCHAR (50) NOT NULL ,
	prenom          VARCHAR (50) NOT NULL ,
	dateNaissance   VARCHAR (50) NOT NULL  ,
	CONSTRAINT mangaka_PK PRIMARY KEY (IDmangaka)
);


------------------------------------------------------------
-- Table: manga
------------------------------------------------------------
CREATE TABLE streaming.manga(
	IDmanga   INT  NOT NULL ,
	nom        VARCHAR (50) NOT NULL ,
	anneeCreation   INT  NOT NULL ,
	IDmangaka  INT  NOT NULL  ,
	CONSTRAINT manga_PK PRIMARY KEY (IDmanga),
	CONSTRAINT manga_catalogue_FK FOREIGN KEY (IDmanga) REFERENCES streaming.catalogue(IDoeuvre),
	CONSTRAINT manga_mangaka_FK FOREIGN KEY (IDmangaka) REFERENCES streaming.mangaka(IDmangaka)
);


------------------------------------------------------------
-- Table: studioAnimation
------------------------------------------------------------
CREATE TABLE streaming.studioAnimation(
	nom         VARCHAR (50) NOT NULL ,
	ville       VARCHAR (50) NOT NULL  ,
	CONSTRAINT studioAnimation_PK PRIMARY KEY (nom)
);

------------------------------------------------------------
-- Table: anime
------------------------------------------------------------
CREATE TABLE streaming.anime(
	IDanime          INT  NOT NULL ,
	nom               VARCHAR (50) NOT NULL ,
	anneeRealisation  DATE  NOT NULL ,
	studioAnimation   VARCHAR (50) NOT NULL ,
	saison            INT  NOT NULL ,
	episode           INT  NOT NULL ,
	CONSTRAINT anime_PK PRIMARY KEY (IDanime),
	CONSTRAINT anime_catalogue_FK FOREIGN KEY (IDanime) REFERENCES streaming.catalogue(IDoeuvre),
	CONSTRAINT anime_studioAnimation_FK FOREIGN KEY (studioAnimation) REFERENCES streaming.studioAnimation(nom)
);


------------------------------------------------------------
-- Table: listePerso
------------------------------------------------------------
CREATE TABLE streaming.listePerso(
	IDoeuvre    INT  NOT NULL ,
	pseudo      VARCHAR (50) NOT NULL ,
	DateAjout   DATE  NOT NULL  ,
	CONSTRAINT listePerso_PK PRIMARY KEY (IDoeuvre,pseudo),
	CONSTRAINT listePerso_catalogue_FK FOREIGN KEY (IDoeuvre) REFERENCES streaming.catalogue(IDoeuvre),
	CONSTRAINT listePerso_utilisateur_FK FOREIGN KEY (pseudo) REFERENCES streaming.utilisateur(pseudo)
);


------------------------------------------------------------
-- INSERTION
------------------------------------------------------------

INSERT INTO streaming.utilisateur(pseudo,nom,prenom,numtel,e_mail,carteBleu) values
('Eternity', 'Doe', 'John', '0601020304', 'johndoe@gmail.com', '1234 5678 9101 1121'),
('Horigon', 'Smith', 'Alice', '0612345678', 'alicesmith@gmail.com', '2234 5678 9101 1132'),
('Anolty', 'Rouge', 'Paul', '0623456789', 'paulrouge@gmail.com', '3234 5678 9101 1143'),
('Drakonike', 'Durand', 'Marie', '0654321098', 'mariedurand@gmail.com', '4234 5678 9101 1154'),
('Chat Gris', 'Blanche', 'Luc', '0645234567', 'lucblanche@gmail.com', '5234 5678 9101 1165'),
('Pant3a', 'Leclerc', 'Julie', '0678901234', 'julieleclerc@gmail.com', '6234 5678 9101 1176'),
('JeffRizet', 'Benjamin', 'Thomas', '0689012345', 'thomasbenjamin@gmail.com', '7234 5678 9101 1187'),
('Phoenix', 'Martin', 'Sophie', '0690123456', 'sophiemartin@gmail.com', '8234 5678 9101 1198'),
('Redson', 'Petit', 'Laurent', '0601122334', 'laurentpetit@gmail.com', '9234 5678 9101 1209'),
('Ghold', 'Gérard', 'Claire', '0612233445', 'clairegerard@gmail.com', '0234 5678 9101 1210'),
('BuveurDeRicard', 'Ricard', 'Nicolas', '0623344556', 'nicolasricard@gmail.com', '1234 5678 9101 1221'),
('Gustavo Lonté', 'Bertrand', 'Isabelle', '0634455667', 'isabellebertrand@gmail.com', '2234 5678 9101 1232'),
('Paul Defès', 'Muller', 'Julien', '0645566778', 'julienmuller@gmail.com', '3234 5678 9101 1243'),
('Dick Tecktiv', 'Fournier', 'Véronique', '0656677889', 'veroniquefournier@gmail.com', '4234 5678 9101 1254'),
('Ivan Triloc', 'Chavez', 'Gabriel', '0667788990', 'gabrielchavez@gmail.com', '5234 5678 9101 1265');

INSERT INTO streaming.catalogue(IDoeuvre, genre, note) values
(9, 'Shonen', 8),
(14, 'Shojo', 8),
(4, 'Shonen', 10),
(6, 'Shonen', 9),
(12, 'Shonen', 8),
(3, 'Shonen', 9),
(1, 'Shonen', 9),
(15, 'Seinen', 9),
(5, 'Shonen', 8),
(13, 'Seinen', 9),
(2, 'Shonen', 8),
(7, 'Shojo', 8),
(8, 'Shojo', 7),
(10, 'Shonen', 9),
(11, 'Seinen', 10),
(50, 'Seinen', 10),
(70, 'Shonen', 8),
(38, 'Shojo', 8),
(42, 'Seinen', 9),
(52, 'Shonen', 8),
(32, 'Shonen', 8),
(43, 'Shonen', 9),
(25, 'Shonen', 10),
(21, 'Shonen', 9),
(46, 'Seinen', 9),
(75, 'Shonen', 8),
(66, 'Shonen', 9),
(69, 'Seinen', 8),
(59, 'Shonen', 9),
(23, 'Seinen', 9);


INSERT INTO streaming.studioAnimation(nom,ville) values
('Toei Animation', 'Tokyo'),
('Madhouse', 'Tokyo'),
('Studio Ghibli', 'Koganei'),
('Bones', 'Osaka'),
('MAPPA', 'Tokyo'),
('Sunrise', 'Tokyo'),
('Kyoto Animation', 'Uji'),
('Production I.G', 'Tokyo'),
('Trigger', 'Tokyo'),
('Studio Pierrot', 'Mitaka'),
('Wit Studio', 'Tokyo'),
('A-1 Pictures', 'Tokyo'),
('David Production', 'Tama'),
('Silver Link', 'Tokyo'),
('Gainax', 'Fukushima'),
('JC Staff', 'Tokyo');

INSERT INTO streaming.anime(IDanime, nom, anneeRealisation, studioAnimation, saison, episode) values
(50, 'Neon Genesis Evangelion', '1995-10-05', 'Gainax', 1, 26),
(70, 'My Hero Academia', '2016-04-03', 'Bones', 6, 113),
(38, 'Sailor Moon', '1992-03-07', 'Toei Animation', 5, 200),
(42, 'One Punch Man', '2015-10-05', 'Madhouse', 2, 24),
(52, 'No Game No Life', '2014-04-09', 'Silver Link', 1, 12),
(32, 'Bleach', '2004-10-05', 'Studio Pierrot', 16, 366),
(43, 'Hunter x Hunter', '2011-10-02', 'Madhouse', 6, 148),
(25, 'Dragon Ball Z', '1989-04-26', 'Toei Animation', 9, 291),
(21, 'One Piece', '1999-10-20', 'Toei Animation', 20, 1000),
(46, 'Attack on Titan', '2013-04-06', 'Wit Studio', 4, 75),
(75, 'Fairy Tail', '2009-10-12', 'A-1 Pictures', 9, 175),
(66, 'JoJo’s Bizarre Adventure', '2012-10-05', 'David Production', 5, 154),
(69, 'Tokyo Ghoul', '2014-07-03', 'Studio Pierrot', 4, 48),
(59, 'Fullmetal Alchemist: Brotherhood', '2009-04-05', 'Bones', 5, 64),
(23, 'Vinland Saga', '2019-07-07', 'Wit Studio', 2, 24);


INSERT INTO streaming.mangaka(IDmangaka,nom, prenom, dateNaissance) values
(1, 'Tezuka', 'Osamu', '1928-11-03'),
(2, 'Kishimoto', 'Masashi', '1974-11-08'),
(3, 'Oda', 'Eiichiro', '1975-01-01'),
(4, 'Toriyama', 'Akira', '1955-04-05'),
(5, 'Mashima', 'Hiro', '1977-12-03'),
(6, 'Togashi', 'Yoshihiro', '1966-04-27'),
(7, 'Takeuchi', 'Naoko', '1967-03-15'),
(8, 'Takahashi', 'Rumiko', '1950-10-10'),
(9, 'Kubo', 'Tite', '1977-06-26'),
(10, 'Inoue', 'Takehiko', '1967-01-12'),
(11, 'Miura', 'Kentaro', '1966-07-11'),
(12, 'Watsuki', 'Nobuhiro', '1970-05-26'),
(13, 'Isayama', 'Hajime', '1986-08-29'),
(14, 'Mori', 'Kaoru', '1978-01-19'),
(15, 'Yukimura', 'Makoto', '1976-05-08');


INSERT INTO streaming.manga(IDmanga, nom, anneeCreation, IDmangaka) values
(9, 'Bleach', 2001, 9),
(14, 'Emma', 2002, 14),
(4, 'Dragon Ball', 1984, 4),
(6, 'Hunter x Hunter', 1998, 6),
(12, 'Kenshin le Vagabond', 1994, 12),
(3, 'One Piece', 1997, 3),
(1, 'Astro Boy', 1952, 1),
(15, 'Vinland Saga', 2005, 15),
(5, 'Fairy Tail', 2006, 5),
(13, 'Shingeki no Kyojin', 2009, 13),
(2, 'Naruto', 1999, 2),
(7, 'Sailor Moon', 1991, 7),
(8, 'Urusei Yatsura', 1978, 8),
(10, 'Slam Dunk', 1990, 10),
(11, 'Berserk', 1989,11);


INSERT INTO streaming.listePerso(IDoeuvre, pseudo, DateAjout) values
(9, 'Eternity', '2025-01-01'),
(14, 'Horigon', '2025-01-02'),
(4, 'Anolty', '2025-01-03'),
(6, 'Drakonike', '2025-01-04'),
(12, 'Chat Gris', '2025-01-05'),
(3, 'Pant3a', '2025-01-06'),
(1, 'JeffRizet', '2025-01-07'),
(15, 'Phoenix', '2025-01-08'),
(5, 'Redson', '2025-01-09'),
(13, 'Ghold', '2025-01-10'),
(2, 'Ghold', '2025-01-11'),
(7, 'Gustavo Lonté', '2025-01-12'),
(8, 'Paul Defès', '2025-01-13'),
(10, 'Dick Tecktiv', '2025-01-14'),
(11, 'Ivan Triloc', '2025-01-15'),
(50, 'Eternity', '2025-01-01'),
(70, 'Horigon', '2025-01-02'),
(38, 'Anolty', '2025-01-03'),
(42, 'Drakonike', '2025-01-04'),
(52, 'Chat Gris', '2025-01-05'),
(32, 'Pant3a', '2025-01-06'),
(43, 'JeffRizet', '2025-01-07'),
(25, 'Phoenix', '2025-01-08'),
(21, 'Redson', '2025-01-09'),
(46, 'Ghold', '2025-01-10'),
(75, 'BuveurDeRicard', '2025-01-11'),
(66, 'Gustavo Lonté', '2025-01-12'),
(69, 'Paul Defès', '2025-01-13'),
(59, 'Dick Tecktiv', '2025-01-14'),
(23, 'Ivan Triloc', '2025-01-15');
