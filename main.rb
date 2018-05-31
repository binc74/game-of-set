# Created by Josh Wright in 5/23
# Bin Chen implements the main and the display_card methods in 5/24
# Edited by Bin Chen in 5/29/18 - Completely change the main class to do the graphics
# Edited by Houyi Fan in 5/30/18 - Add the code to ask the user for difficulty

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
    def initialize
        # gets the player list

        name_list = []
        print "Enter the number of players(1 - 4): "

        gets.chomp!.to_i.times do |i|
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
    def needs_cursor?;
        true;
    end


    # update the game at Gosu's default rate(60 calls per second)
    def update
        @controller.update [mouse_x, mouse_y] # getting user input and update the game
    end


    # draw the graphics on the screen
    def draw
        @background_image.draw 0, 0, 0  # draw the background first
        @view.draw # draw the game to the screen
    end

    def print_stat i
        puts "Player: " + @game.player_list[i].name
            @game.player_list[i].winning_hands.map.with_index {|k, j|
                puts "Time: " + @game.player_list[i].log[j].to_s
                puts k[0].to_string
                puts k[1].to_string
                puts k[2].to_string+"\n"
            }
    end
end

game1 = SetGame.new
game1.show
puts "Game Ended!!!\n"

game1.game.player_list.each_index {|player| game1.print_stat(player)}