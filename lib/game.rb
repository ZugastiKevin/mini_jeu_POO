# est une class game
class Game

  attr_accessor :human_player
  attr_accessor :enemies
  @@enemies = []


#Méthode d'initialisation nom user + creation 4 ennemies
  def initialize(human_player)
    @human_player = HumanPlayer.new(human_player)
    @@enemies << @player1 = Player.new("Rats")
    @@enemies << @player2 = Player.new("King Courgette")
    @@enemies << @player3 = Player.new("Skeleton")
    @@enemies << @player4 = Player.new("Mimic")
  end


#Méthode qui supprime un bots de l'array quand il est mort
  def kill_player
    @@enemies.each do |current_bots|
      if(current_bots.life_points == 0)
        then @@enemies.delete(current_bots)
      end
    end
  end


#Méthode, le jeu est t-il toujours en cours ?
  def is_still_ongoing?
    if((@human_player.life_points) == 0 or (@@enemies.count == 0))
      then return false
      else return true
    end
  end


  #Méthode affichant l'état des joueurs
  def show_players
    puts "┌──────────────────────────────────────────────────────┐"
        @human_player.show_state
    puts "└──────────────────────────────────────────────────────┘"
        puts "  Il reste #{@@enemies.count} ennemis."
      end


#Menu interactif - Affichage des choix
def menu
  puts " "
  puts "  ###########################################"
  puts "  ##   Quelle action veux-tu effectuer ?   ##"
  puts "  ###########################################"
  puts "  #                                         #"
  puts "  ## a - chercher une meilleure arme =|==> ##"
  puts "  #                                         #"
  puts "  ##      s - chercher à se soigner ✙      ##"
  puts "  #                                         #"
  puts "  ###########################################"
  puts "  ##      attaquer un joueur en vue :      ##"
  puts "  ###########################################"
  puts "  #                                         #"

  if(@player1.life_points == 0)
    else print "  # 0 - "
         @player1.show_state
         puts "           #"
  end

  puts "  #                                         #"

  if(@player2.life_points == 0)
    else print "  # 1 - "
         @player2.show_state
         puts " #"
  end

  puts "  #                                         #"

  if(@player3.life_points == 0)
    else print "  # 2 - "
         @player3.show_state
         puts "       #"
  end

  puts "  #                                         #"

  if(@player4.life_points == 0)
    else print "  # 3 - "
         @player4.show_state
         puts "          #"
  end

  puts "  #                                         #"
  puts "  ###########################################"
end


#Menu interactif - Choix de l'user
def menu_choice
  puts " "
  print "Votre réponse : "
  user_answer = gets.chomp

  if(user_answer == "a")
    then @human_player.search_weapon
  end
  if(user_answer == "s")
    then @human_player.search_health_pack
  end
  if(user_answer == 0.to_s)
    then @human_player.attacks(@player1)
  end
  if(user_answer == 1.to_s)
    then @human_player.attacks(@player2)
  end
  if(user_answer == 2.to_s)
    then @human_player.attacks(@player3)
  end
  if(user_answer == 3.to_s)
    then @human_player.attacks(@player4)
  end
  kill_player
end


#Méthode d'attaque des ennemis
  def enemies_attack
    @@enemies.each do |current_bots|
        current_bots.attacks(@human_player)
    end
    puts "└──────────────────────────────────────────────────────┘"
  end


#Méthode finale
  def end
    puts " "
    puts "                 La partie est finie"
    puts " "
    if(@human_player.life_points != 0)
      then abort("♫ ♪ ♫ ♬ ♫ ♪ ♬ ♫ BRAVO ! TU AS GAGNE ! ♫ ♪ ♫ ♬ ♫ ♪ ♬ ♫")
      else abort("          ☠ ☠ ☠ Loser ! Tu as perdu ! ☠ ☠ ☠")
    end
  end
end