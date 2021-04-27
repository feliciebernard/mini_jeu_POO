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
puts "Bienvenue, #{user_name}"
puts ""

my_game = Game.new(user_name)

while my_game.is_still_ongoing?
  my_game.menu
  my_game.menu_choice
  my_game.show_players
  my_game.enemies_attack
  my_game.show_players
end
my_game.end