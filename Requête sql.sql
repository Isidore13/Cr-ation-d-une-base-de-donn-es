--- affichher le nombre de manga dans catalogue.

select count(*) from streaming.catalogue inner join streaming.manga on IDoeuvre=IDmanga;

/*
 count 
-------
    15
(1 ligne)
*/

--- afficher le nom des animés dans le catalogue.
select nom from streaming.catalogue inner join streaming.anime on IDoeuvre=IDanime;

/*
               nom                
----------------------------------
 Neon Genesis Evangelion
 My Hero Academia
 Sailor Moon
 One Punch Man
 No Game No Life
 Bleach
 Hunter x Hunter
 Dragon Ball Z
 One Piece
 Attack on Titan
 Fairy Tail
 JoJo’s Bizarre Adventure
 Tokyo Ghoul
 Fullmetal Alchemist: Brotherhood
 Vinland Saga
(15 lignes)
*/

---afficher le nomdes manga et animé dans la liste personnel de ghold
select manga.nom from streaming.listePerso natural join streaming.catalogue inner join streaming.manga on IDoeuvre=IDmanga where pseudo='Ghold' union select anime.nom from streaming.listePerso natural join streaming.catalogue inner join streaming.anime on IDoeuvre=IDanime where pseudo='Ghold';

/*
        nom         
--------------------
 Attack on Titan
 Naruto
 Shingeki no Kyojin
(3 lignes)
*/

---afficher les pseudo des utilisateurs qui on ajouter des animé et manga du genre shonen
select distinct pseudo from streaming.listePerso natural join streaming.catalogue where genre='Shonen';

/*
     pseudo     
----------------
 Anolty
 BuveurDeRicard
 Chat Gris
 Dick Tecktiv
 Drakonike
 Eternity
 Ghold
 Gustavo Lonté
 Horigon
 JeffRizet
 Pant3a
 Phoenix
 Redson
(13 lignes)
*/

---afficher tous les manga et animé sauf ce du genre shonen
select manga.nom from streaming.catalogue inner join streaming.manga on IDoeuvre=IDmanga where not genre='Shonen' union select anime.nom from streaming.catalogue inner join streaming.anime on IDoeuvre=IDanime where not genre='Shonen';

/*
           nom           
-------------------------
 One Punch Man
 Attack on Titan
 Shingeki no Kyojin
 Sailor Moon
 Tokyo Ghoul
 Neon Genesis Evangelion
 Berserk
 Urusei Yatsura
 Emma
 Vinland Saga
(10 lignes)
*/


