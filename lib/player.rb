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
