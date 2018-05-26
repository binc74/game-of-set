# Created by Josh Wright in 5/23
# Bin Chen implements the main and the display_card methods in 5/24

require_relative "game"
require_relative "card"


# gets the player list

name_list = []
print "Enter the number of players: "

gets.chomp!.to_i.times do |i|
  print "Enter the name of player #{i + 1}: "
  name_list.push Player.new gets.chomp!
end

# create and start the game

game = Game.new name_list

until game.hasEnded?
  game.replenishHand!
  game.resetHand if !game.setLeftInDealersHand?
  puts "\n--- Dealers Hand ---"
  game.display_cards

  puts "\nEnter the player # who wants to enter a set or 0 for a hint:"
  playerNum = gets.chomp!.to_i
  while playerNum < 0 || playerNum > name_list.length
    puts "\nEnter a valid player #: "
    playerNum = gets.chomp!.to_i
  end
  if playerNum == 0
    puts "#{playerNum}"
    game.getHint
    puts "\nEnter the player # who wants to enter the set:"
    playerNum = gets.chomp!.to_i
    while playerNum < 0 || playerNum > name_list.length
      puts "\nEnter a valid player #: "
      playerNum = gets.chomp!.to_i
    end
  end
  puts "\nEnter three card numbers that make a set(separated by spaces): "
  choice = gets.chomp!.split.map {|e| e.to_i}
  break unless choice.length == 3 and choice.reduce(true) { |a, b| a and b >= 0 and b <= 11}
  hand = choice.map {|index| game.getDealersHand[index]}
  puts
  hand.each {|c| puts "You chose: " + c.toString}
  puts
  if game.isSet? hand
    puts "Congrats! It's a set\n"
    game.replace_cards choice
    game.listOfPlayers[playerNum-1].addWinningHand hand
    puts
  elsif
    puts "Not a set!\n"
    game.replace_cards choice
    puts
  end
end

puts "The winner is #{game.winner.name} "
puts "--- Scores ---"
name_list.each {|player| puts "#{player.name}'s score is #{player.score}"}
puts "Game ended!"