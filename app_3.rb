# ligne qui donne acces aux require.
require 'bundler'
Bundler.require

# permet de lier player.rb et game.rb du dossier lib dans app.rb du dossier racine.
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/welcome'

#Creation de l'human-player

print "Entre ton pseudo : "
player_name = gets.chomp
system('clear')

#Initialisation
my_game = Game.new(player_name)

while true
  #Check si des ennemies sont en vie
  if(my_game.is_still_ongoing?) == false then break
  end

  #Voir l'état actuel des joueurs
  my_game.show_players

  #Menu
  my_game.menu

  #Menu des Choix
  my_game.menu_choice

  #Check si des ennemies sont en vie
  if(my_game.is_still_ongoing?) == false then break
  end

  #Les ennemis attaques
  my_game.enemies_attack
end

my_game.end

#binding.pry
#puts "C'est la fin !"