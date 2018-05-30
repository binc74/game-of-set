# Created by Josh Wright in 5/23
# Bin Chen implements the main and the display_card methods in 5/24
# Edited by Bin Chen in 5/29/18 - Completely change the main class to do the graphics

require 'gosu'

require_relative "Model/game"
require_relative "Model/card"
require_relative "controller"
require_relative "Model/player"
require_relative "view"

class SetGame < Gosu::Window
    def initialize
        # gets the player list

        name_list = []
        print "Enter the number of players(1 - 4): "

        gets.chomp!.to_i.times do |i|
            print "Enter the name of player #{i + 1}(No more than 8 characters): "
            name_list.push gets.chomp!
        end

        @game = Game.new name_list # create the model
        @controller = Controller.new @game # create the controller to deal with user input
        @view = View.new @game # create the view to do the graphics

        # start the game
        super 800, 600 # set the window size
        self.caption = "Set Game" # set the title of the game shown on windows
        @background_image = Gosu::Image.new "Images/background.png"
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
        @background_image.draw 0, 0, 0
        @view.draw # draw the game to the screen
    end
end

SetGame.new.show
puts "Game Ended!!!"