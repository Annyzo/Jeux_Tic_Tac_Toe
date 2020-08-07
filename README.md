

# Projet : Tic Tac Toe
Ce projet consiste à créer un programme identique à ceux du jeu Morpion(tic-tac-toe) avec le POO en ruby. Le progamme se lance dans le terminal avec la commande ruby tictactoe.rb.

# I-Fonctionnement du programme:

- Le programme commence par demander le prénom des joueurs 

- Le programme affiche le plateau chaque tour, puis demande au joueur auquel c'est le tour où ce dernier compte jouer

- Si un joueur gagne, le programme annonce qui a gagné 

- S'il y a un match nul, le programme annonce qu'il y a un match nul
 
- À la fin d'une partie, compter les nombres de partie et relancer le programme 

# II-Visualisation:

1 | 2 | 3
--|---|--
4 | 5 | 6
5 | 8 | 9

# III-Composition du programme:

## 1- class BoardCase
- def initialize(number_case) : Récupérer la position où l'on doit placer le symbol du joueur

end

## 2- class Board
- def initialize : Initialiser le plateau ou le terrain de jeu avec attribution (chiffre ou lettre) de chaque position de la case (9 cases)
- def play_turn : Executer le souhait utilisateur(position, quitter ou rejouer -> perdre) et attribuer le symbole adéquat sur chaque case (vérifier si il y a déjà un symbol ou pas!!!)
- def victory  : vérifier l'état du plateau, si un utilisateur à remporter le jeu, ou si il y a match null (nombre d'entree totale d'utilisateur == 9)

end 

## 3-class Player
- def initialize : Définir le nom joueur, symbole et statut : {exemple : victoire :0 , Défaite = 0} //

end

## 4-class Game
- def initialize : créer deux players puis un current_player(prédéfini) et initialiser le plateau. // Avant : appel au Show.new.menu
- def turn : Démarrer la partie : rediriger vers la classe et méthodes cible selon la demande du joueur! // Avant cela demande au utilisateur if they are ready et sa requête? avec Application.new.input_action
- def new_round : relancer une nouvelle partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
- def new_game : relancer également une nouvelle partie en initialisant un nouveau board et également de nouveaux joueurs.
- def game_end: Clôturer la partie avec affichage résultats puis compter le nombre de partie (incrémentation victoire et défaite) et demander action joueurs

end

## 5-Class show
- def show_board : Afficher le plateau du jeu + les descriptions des noms des joueurs avec leur symbole adéquat + staut {-defaite: 0, victoire:0}
- def menu: Définir la page d'accueil du gaming 'morpion'
- def show_resultat : Afficher le résultat : Selon notre choix mais faut que cela brille ;)
- def Error_input_commande : Afficher l'erreur selon le cas!! 

end

## 6-class Application
- def input_action : Demander et vérifier chaque action utilisateur avec gestion erreur (ex: Erreur Fatal, Commande non reconnue)
- def perform : ordonner chaque etape à exécuter avec une boucle ou condition //

end 

Application.new.perform // Pour exécuter le programme

# IV-Auteurs:

 - RAMAHATAFANDRY Fanomezana Nirina : https://github.com/FaSa1316 
 - RANDIMBIARILANTO  Mino : https://github.com/MinoRandy
 - RABEMIARINTSOA Anny Zo : https://github.com/Annyzo
 - Rabearimanana Tolotry ny Avo : https://github.com/Tolotra0977
 - RIANJHARINELINA Ny Toky Fitiavana : https://github.com/ny-toky-fitiavana02
 - ANDRIANASOLO Tolotra judicael :  https://github.com/Tolotra-Judicael
