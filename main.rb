# Created by Josh Wright in 5/23
# Bin Chen implements the main and the display_card methods in 5/24
# Edited by Bin Chen in 5/29/18 - Completely change the main class to do the graphics
# Edited by Houyi Fan in 5/30/18 - Add the code to ask the user for difficulty
# Edited by Jeb Alwi on 5/30/18 - Added print statistic functionality at end of game
# Edited by Bin Chen on 6/1/18 - Modify the printing result

require 'gosu'

require_relative "Model/game"
require_relative "Model/card"
require_relative "controller"
require_relative "Model/player"
require_relative "view"
require_relative "constants"

class SetGame < Gosu::Window
  include Constants

  attr_reader :game

  # first get user input about all player's names and the difficulty, then start the window
  #
  # Created by Bin Chen in 5/29/18
  # Edited by Bin Chen in 5/29/18 - reading players name list and initialize the game, view and controller
  # Edited by Houyi Fan in 5/30/18 - reading the difficulty the player wants
  def initialize
    # gets the player list
    name_list = []
    print "Enter the number of players(1 - 4): "
    num_players = gets.chomp!.to_i
    until num_players > 0 && num_players < 5
        puts "Incorrect player numberEnter the number of players(1 - 4): "
    end
    num_players.times do |i|
      print "Enter the name of player #{i + 1}(No more than 8 characters): "
      name_list << gets.chomp!
    end

    print "Enter the difficulty you want(1 - 3): "
    difficulty = gets.chomp!

    @game = Game.new name_list, difficulty # create the model
    @controller = Controller.new @game # create the controller to deal with user input
    @view = View.new @game # create the view to do the graphics

    # start the game
    super WINDOW_WIDTH, WINDOW_HEIGHT # set the window size
    self.caption = "Set Game" # set the title of the game shown on windows
    @background_image = Gosu::Image.new "Images/background.png"
    puts "\nGame Starts!"
  end


  # the method that overwrite the method in Gosu to set the visibility of cursor in the window to be visible
  #
  # Created by Bin Chen 5/29/18
  def needs_cursor?;
    true;
  end


  # update the game at Gosu's default rate(60 calls per second)
  #
  # Created and implemented by Bin Chen 5/29/18
  def update
    @controller.update [mouse_x, mouse_y] # getting user input and update the game
  end


  # draw the graphics on the screen in default 60 fps
  #
  # Created and implemented by Bin Chen 5/29/18
  # Modified by Bin Chen 5/30/18 - add background drawing (although the background is pure black)
  def draw
    @background_image.draw 0, 0, 0 # draw the background first
    @view.draw # draw the game to the screen
  end

  # print the status of each players in the game on the console
  #
  # i - the player number
  #
  # Created by Jeb Alawi 5/30/18
  def print_stat(i)
    puts "Player: " + @game.player_list[i].name
    puts "No Set Found!" if @game.player_list[i].score == 0

    @game.player_list[i].winning_hands.map.with_index {|k, j|
      puts "Set ##{j + 1}"
      puts "Time Found: " + @game.player_list[i].log[j].to_s
      puts "Content: "
      puts k[0].to_string
      puts k[1].to_string
      puts k[2].to_string + "\n\n"
    }
  end
end

game1 = SetGame.new
game1.show
puts "\nGame Ended!!!\n"

# print the status of every player after the window is closed in normal ways
puts "Winner: " + game1.game.winner.name
puts "\nIndividual Results: "
game1.game.player_list.each_index {|player| game1.print_stat(player)}