class Player
	attr_accessor :name, :life_points

	def initialize(name_to_save)
		@name = name_to_save
		@life_points = 10
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie."
	end

	def gets_damage(damage)
		@life_points -= damage
		if @life_points <= 0
			puts "le joueur #{@name} a été tué!"
		end
	end

	def attacks(player)
		puts "#{@name} attaque #{player.name}"
    damage_inflicted = compute_damage
    puts "il lui inflige #{damage_inflicted} points de dommages"
    player.gets_damage(damage_inflicted)
  end

  def compute_damage
    return rand(1..6)
  end

end


class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon}"
    if weapon > @weapon_level
      @weapon_level = weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else 
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack < 1
      puts  "Tu n'as rien trouvé... "
    elsif health_pack > 1 && health_pack < 6
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points <= 50
        @life_points = @life_points + 50
      else @life_points = @life_points + 50 - (@life_points - 50)
      end
    else health_pack = 6
      puts "Waow, tu as trouvé un pack de +80 points de vie "
      if @life_points <= 20
        @life_points = @life_points + 80
      else @life_points = @life_points + 80 - (@life_points - 80)
      end
    end
  end

end