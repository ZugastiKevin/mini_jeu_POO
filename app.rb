# ligne qui donne acces aux require.
require 'bundler'
Bundler.require

# permet de lier player.rb et game.rb du dossier lib dans app.rb du dossier racine.
require_relative 'lib/player'
require_relative 'lib/game'


# crée les deux joueur.
player1 = Player.new("Josianne")
player2 = Player.new("José")




# la boucle qui fait le combat.
while (player1.life_points != 0 or player2.life_points != 0)
  puts
  puts "Voici l'état de chaque joueur :"
  puts
  player1.show_state
  player2.show_state
  puts
  puts "Passons à la phase d'attaque :"
  puts
  player1.attacks(player2)
  break if(player2.life_points <= 0)
  puts
  player2.attacks(player1)
  
end

=begin
binding.pry
puts "la vie du fromage et de la baguette"
=end