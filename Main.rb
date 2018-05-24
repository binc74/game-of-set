# Created by Josh Wright in 5/23
# Bin Chen implements the main and the display_card methods in 5/24

require_relative "game"
require_relative "card"


def display_cards(game)
  game.getDealersHand.length.times {|i| puts "Card ##{i}: " + game.getDealersHand[i].toString}
end


# gets the player list

name_list = []
print "Enter the number of players: "

gets.chomp!.to_i.times do |i|
  print "Enter the name of player #{i + 1}: "
  name_list.push gets.chomp!
end

# create and start the game

game = Game.new name_list
choice = []


until game.hasEnded?
  game.replenishHand!
  display_cards game

  puts "\nEnter the three cards you choose: "
  choice = gets.chomp!.split.map {|e| e.to_i}
  break unless choice.length == 3 and choice.reduce(true) { |a, b| a and b >= 0 and b <= 11}

  hand = choice.map {|index| game.getDealersHand[index]}

  for c in hand
    puts c.toString
  end

  #if isSet? hand
  #  puts "Congrats! It's a set"
  #elsif
  #  puts "Not a set!"
  #end
end

puts "Game ended!"