class BoardCase

    #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
    attr_accessor :value, :case_number

    def initialize(case_number)
        #TO DO : doit régler sa valeur, ainsi que son numéro de case
        @value = ""
        @case_number = case_number
    end

    def to_s
        # renvoie la valeur au format string
        self.value = @value 
      end
       
end

###########################################################################################################
###########################################################################################################

class Board
    include Enumerable

    #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
    #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
    attr_accessor :board

    def initialize
      #TO DO :
      #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
      #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
      @board =  [*0..8].map { |i|  BoardCase.new(i).case_number }
    end
  
    def play_turn
      #TO DO : une méthode qui :
      #1) demande au bon joueur ce qu'il souhaite faire
      #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
      case_number = gets.chomp().to_i
      @board = @board.each_index.map {
         |e| e == case_number && @board[e] != "X" && @board[e] != "_" ? @board[e] = symbol : @board[e] 
        }
    end
  
    def victory?
        #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
        if (
            @board[0] == @board[1] && @board[0] == @board[2]
            ) || (
                @board[3] == @board[4] && @board[3] == @board[5]
                ) || (
                    @board[6] == @board[7] && @board[6] == @board[8] 
                    ) || (
                        @board[0] == @board[3] && @board[0] == @board[6]
                        ) || (
                            @board[1] == @board[4] && @board[1] == @board[7]
                            ) || (
                                @board[2] == @board[5] && @board[2] == @board[8]
                                ) ||(
                                     @board[0] == @board[4] && @board[0] == @board[8]
                                     ) || (
                                         @board[2] == @board[4] && @board[2] == @board[6]
                                        )                           

            return true
        else
            return false
        end
    end
end
  
###########################################################################################################
###########################################################################################################

class Player
  #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
  # Player : ce sont les joueurs. Il doit y avoir 2 instances de cette classe lors d'une partie
  attr_accessor :name, :symbol
    
  def initialize

    #TO DO : doit régler son nom et sa valeur
    # nom du joueur, symbole avec lequel il joue
    @name = name
    @symbol = symbol
  end

end

###########################################################################################################
###########################################################################################################
  
class Game
    # TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player),
    # le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  
    # Game : c'est la partie. Elle initialise tout et lance le jeu

    attr_accessor :symbol
    def initialize
      #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    
      # crée le joueur 1
      name_1 = gets.chomp
      @player1 = Player.new(name_1, "X")

      # crée le joueur 2
      @player2 = Player.new(name_2, "_")
      @current_player = @player1

    end
  
    def turn
        #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board).
        # Elle affiche le plateau, demande au joueur ce qu'il joue,
        # vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
        # On boucle tant qu'il n'y a pas de victoire
        loop do
            system "clear"
            
    	    puts "Voici l'état du jeu:"
    	    # Affiche le plateau :
            @board.to_s

            puts ""
            puts "C'est le tour de #{@current_player.name} avec les #{@current_player.symbol}"
            puts "Choisis une case"
            print ">"

            # On appelle la méthode play de la classe board sur le joueur en cours (current). Elle demande au 
            # joueur quelle case il joue, puis affiche son symbole dans la case
            @board.play(@current_player.symbol)

            # On arrête la boucle en cas de victoire
            if @board.victory? == true
      	        system "clear"
		  	        puts "Voici l'état du jeu:"
                @board.to_s
                puts ""
                puts "#{@current_player.name} a gagné !!!"
                puts
                break
            end
            # Il n'y a pas de victoire : on passe au joueur suivant et on boucle (tour suivant)
            @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
        end

    end
  
    def new_round(valu)
      # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
      if valu == "ok"
        @board = Board.new
        self.go
      else
        puts"A BIENTOT MON AMI"
      end
    end

    def new_game(ko)
      if ko == "new"
        vao = Game.new
        vao.go
      end
    end
  
    def game_end
      # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    end 
    
    def go
      # lance la partie
      while @board.victory? == false
        self.turn
      end
      puts " taper ok pour nouveau round"
      puts " Et new pour nouveau game"
      @li = gets.chomp
      self.new_game(@li)
      self.new_round(@li)
    end
  
end
  
###########################################################################################################
###########################################################################################################
 
class Show

  def initialize

    puts "		     ************WELCOME TO THE MORPION GAME**********************"
    puts "                                            **  "
    puts "                                          ******  "
    puts "                                        **********  "
    puts "                                          ******  "
    puts "                                            **  "
    puts "	      	  WARNING!!!, IF YOU CHOOSE A BUSY CASE, YOU LOSE YOUR TOUR!!!"
    puts
    puts "                             Que voulez-vous faire?"
  end
  
    def show_board(board)
      #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    end
  
end
  
###########################################################################################################
###########################################################################################################

class Application

    def perform
      # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
      # 
  
    end
  
end

  
  
  Application.new.perform