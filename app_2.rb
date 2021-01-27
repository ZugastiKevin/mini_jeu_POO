# ligne qui donne acces aux require.
require 'bundler'
Bundler.require

# permet de lier player.rb et game.rb du dossier lib dans app.rb du dossier racine.
require_relative 'lib/player'
require_relative 'lib/game'


#Accueil du jeu
puts " "
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts " "



#Creation de l'human-player
puts "Entre ton pseudo :"
print ">"
player_name = gets.chomp
puts " "
player0 = HumanPlayer.new(player_name)



#Creation d'un array d'ennemies
enemies = []



#Creation des joueurs
enemies << player1 = Player.new("Josiane")
enemies << player2 = Player.new("José")



#Combats jusqu'a la mort, condition = mort de l'human-player ou des 2 bots
while((player1.life_points != 0 and player2.life_points != 0) or player0.life_points != 0)

  player0.show_state
  sleep(1)

  break if((player1.life_points == 0 and player2.life_points == 0) or player0.life_points == 0)

  puts "Quelle action veux-tu effectuer ?"
  puts " "
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts " "
  puts "attaquer un joueur en vue :"
  puts "0 - "
  print player1.show_state
  puts " "
  puts "1 - "
  print player2.show_state
  puts " "

  puts "Votre réponse :"
  print ">"
  user_answer = gets.chomp
  puts " "

  if(user_answer == "a")
    then player0.search_weapon
  end

  if(user_answer == "s")
    then player0.search_health_pack
  end

  if(user_answer == 0.to_s)
    then player0.attacks(player1)
  end

  if(user_answer == 1.to_s)
    then player0.attacks(player2)
  end

  puts " "
  puts "Les autres joueurs t'attaquent !"

  enemies.each do |current_player|
    if(current_player.life_points != 0)
      then current_player.attacks(player0)
    end
  end

end



#Message de fin du jeu
puts "La partie est finie"
if(player0.life_points != 0)
  then "BRAVO ! TU AS GAGNE !"
  else "Loser ! Tu as perdu !"
end