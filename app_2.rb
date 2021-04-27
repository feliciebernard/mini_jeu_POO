require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️"
puts "☠️ Bienvenue sur 'ILS VEULENT TOUS MA POO !'  ☠️"
puts "☠️     Seras-tu le dernier survivant ?! 😱    ☠️"
puts "☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️  ☠️"

puts ""
puts "Pour commencer, entre ton nom de joueur :"
print "👉 "
user_name = gets.chomp
puts ""

user = HumanPlayer.new(user_name)
player1 = Player.new("José")
player2 = Player.new("Josiane")
enemies = []
enemies << player1 << player2

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  puts "Voici l'état de ton personnage :"
  user.show_state
  puts ""
  puts gets.chomp

  puts "Quelle action veux-tu effectuer ?"
  puts ""
  puts "Chercher une meilleure arme :"
  puts "👉 tape a"
  puts "Chercher à se soigner :"
  puts "👉 tape s"
  puts "Attaquer un joueur en vue :"
  player1.show_state 
  puts "👉 tape 0"
  player2.show_state
  puts "👉 tape 1"
  puts ""

  print "👉 "
  answer = gets.chomp

  if answer == "a"
    user.search_weapon
    puts gets.chomp
    puts ""

  elsif answer == "s"
    user.search_health_pack
    puts gets.chomp
    puts ""

  elsif answer == "0"
    user.attacks(player1)
    puts ""
  elsif answer == "1"
    user.attacks(player2)
    puts ""
  else
    puts "Je n'ai pas compris ce que tu as dis, essaie encore !"
    print "👉 "
    answer = gets.chomp
  end

  puts "Les autres joueurs t'attaquent !"
  puts ""
  
  enemies.each do |player|
    if player.life_points > 0
      player.attacks(user)
    end
  end
  puts gets.chomp
end

puts ""
puts "La partie et finie"

if user.life_points <= 0
  puts "LOSER ! Tu as perdu..."
elsif player1.life_points <= 0 && player2.life_points <= 0
  puts "BRAVO ! TU AS GAGNÉ !!"
end


