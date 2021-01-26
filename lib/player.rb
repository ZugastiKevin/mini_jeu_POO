

# une class player
class Player
  attr_accessor :name
  attr_accessor :life_points
  attr_accessor :attacked_player


#Métode de creation d'un joueur avec 10 points de vie
  def initialize(name)
    @name = name
    @life_points = 10
  end


#Méthode pour affichez les stats d'un joueur
  def show_state
    print "  #{@name} a #{@life_points} points de vie"
  end


#Méthode qui inflige des dégats à un joueur
  def gets_damage(damage_points)
    @@attacked_player.life_points = (@@attacked_player.life_points - damage_points)
    if(@@attacked_player.life_points < 0) then (@@attacked_player.life_points = 0)
    end
    if(@@attacked_player.life_points == 0)
      then puts " ☠ Le joueur #{@@attacked_player.name} a été tué ! ☠"
    end
  end


#Méthode d'attaque
  def attacks(attacked_player)
    @@attacked_player = attacked_player
    dice_result = compute_damage
    puts "  Le joueur #{@name} attaque le joueur #{attacked_player.name}"
    gets_damage(dice_result)
    puts "  ⚔ il lui inflige #{dice_result} points de damage"
  end


#Randomizer dice
  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level
  attr_accessor :life_points


#Métode de creation d'un joueur humain avec 100 points de vie et une arme de lvl1
  def initialize(name)
    @life_points = 100
    @weapon_level = 1
    @name= name
  end


#Méthode pour affichez les stats d'un joueur humain
  def show_state
    puts " ♘ #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    puts (" ✙ " + "█" * (@life_points/10)).ljust(13, "░")
  end


#Damage avec boost du lvl de l'arme
  def compute_damage
    rand(1..6) * @weapon_level
  end


#Méthode de rechercher d'une nouvelle arme
  def search_weapon
    weapon_lvl_found = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_lvl_found}"
    if(weapon_lvl_found > @weapon_level)
      then @weapon_level = weapon_lvl_found
           puts "Youhou ! Elle est meilleure que ton arme actuelle ✦ : tu la prends."
      else puts "M@*#$... elle n'est pas mieux que ton arme actuelle... ☹ "
    end
  end


#Méthode de rechercher d'un pack de vie
  def search_health_pack
    health_kit_found = rand(1..6)
    
    if(health_kit_found == 1) then puts "Tu n'as rien trouvé... ☹"
    end

    if(health_kit_found >= 2 and health_kit_found <= 5)
      then puts "Bravo, tu as trouvé un pack de ✙ 50 points de vie ! "
        @life_points = @life_points + 50
        if(@life_points > 100) then @life_points = 100
        end
    end

    if(health_kit_found == 6)
      then puts "Waow, tu as trouvé un pack de ✙ 80 points de vie !"
        @life_points = @life_points + 80
        if(@life_points > 100) then @life_points = 100
        end
    end
  end

end