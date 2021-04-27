require_relative 'player'

class Game
  attr_accessor :human_player, :ennemies

  def initialize(human)
    @human_player = HumanPlayer.new(human)
    @enemies = [Player.new("Orlando Bloom"), Player.new("Johnny Depp"), Player.new("Leonardo Dicaprio"), Player.new("Robert Pattinson")]
  end

  def kill_player
    @enemies.each do |player|
      if player.life_points <= 0
        @enemies.delete(player)
      end
    end
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && !@enemies.empty?
      return true
    else
      return false
    end
  end

  def show_players
    puts "Voici l'état de ton personnage :"
    @human_player.show_state
    puts "Il reste encore #{@enemies.count} ennemis en jeu !"
    puts gets.chomp
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts ""
    puts "Chercher une meilleure arme :"
    puts "👉 tape a"
    puts "Chercher à se soigner :"
    puts "👉 tape s"
    puts "Attaquer un joueur en vue :"

    i = 0
    @enemies.each do |enemy|
      enemy.show_state
      puts "👉 tape #{i}"
      i += 1
    end
  end

  def menu_choice
   print "👉 "
   answer = gets.chomp

   if answer == "a"
    @human_player.search_weapon
    puts gets.chomp
    puts ""
  elsif answer == "s"
    @human_player.search_health_pack
    puts gets.chomp
    puts ""
  elsif answer == "0" || answer == "1" || answer == "2" || answer == "3"
    number = answer.to_i

    if @enemies[number].life_points >= 0
      @human_player.attacks(@enemies[number])
      kill_player
    end
    
  else
    puts "Je n'ai pas compris ce que tu as dis, essaie encore !"
    print "👉 "
    answer = gets.chomp
  end
end

def enemies_attack
  puts "Les autres joueurs t'attaquent !"
  @enemies.each do | enemy |
    if enemy.life_points >= 0
      enemy.attacks(@human_player)
    end
  end
  puts gets.chomp
end

def end
  puts "La partie est finie"
  if @human_player.life_points <= 0
    puts "LOSER ! Tu as perdu..."
  else
    puts "BRAVO ! TU AS GAGNÉ !!"
  end
end
end
