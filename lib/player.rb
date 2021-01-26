require "pry"


class Player

  attr_accessor :name, :life_points
  @@all_player = []



  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
    @@all_player << [name_to_save, life_points]
  end



  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end



  def gets_damage(damage_points)
    @@player.life_points = (@@player.life_points - damage_points)
    if (@@player.life_points < 0) then (@@player.life_points = 0)
    end

    if (@@player.life_points <= 0) then puts "le joueur #{@@player.name} a été tué !"
    end
  end



  def attacks(player)
    @@player = player
    dice_result = compute_damage
    puts "#{@name} attaque #{@@player.name}"
    gets_damage(dice_result)
    puts "il lui inflige #{dice_result} points de dommages"
  end



  def compute_damage
    return rand(1..6)
  end

end