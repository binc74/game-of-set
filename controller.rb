# Created by Bin Chen in 5/29/18
# Edited by Bin Chen in 5/29/18 - implement initialize and is_in_area method, partially
#                                  implements the mouse_detection and update method

require 'gosu'

require_relative 'Model/game'
require_relative 'Model/area'
require_relative 'Model/player'

# This class get the user input and process request
class Controller
    def initialize(game)
        @game = game
        @pressed = false        # to prevent from detecting the key for too many times
    end

    def is_in_area?(x,y,area)
        x >= area.x and x <= area.x + area.width and y >= area.y and y <= area.y + area.height
    end

    def mouse_detection(x, y)
        @game.dealersHand.each { |card|

        }
        @game.listOfPlayers.each { |player|
            if is_in_area? x, y, player.area
                @game.update_player player
            end
        }
    end

    def update mouse_pos
        if Gosu.button_down? Gosu::MS_LEFT and not @pressed
            mouse_detection mouse_pos[0], mouse_pos[1]
            @pressed = true
        elsif not Gosu.button_down? Gosu::MS_LEFT
            @pressed = false
        end
    end
end