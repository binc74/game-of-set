# Created by Bin Chen in 5/29/18
# Edited by Bin Chen in 5/29/18 - implement initialize and is_in_area method, partially
#                                  implements the mouse_detection and update method
# Edited by Houyi Fan in 5/30/18 - add the code that restarts the game when pressing restart button
#                                  change the "Answer?" button to "Hint" button
#
require 'gosu'

require_relative 'Model/game'
require_relative 'Model/area'
require_relative 'Model/player'
require_relative 'constants'

# This class get the user input and process request
class Controller
    include Constants

    def initialize(game)
        @game = game
        @is_pressed = false        # to prevent from detecting the key for too many times
    end

    # Check if the coordinate (x, y) is in the area
    def is_in_area?(x,y,area)
        x >= area.x and x <= area.x + area.width and y >= area.y and y <= area.y + area.height
    end

    # Detect the position of the mouse and process input
    def mouse_detection(x, y)
        @game.dealers_hand.each_index { |i|
            if is_in_area? x, y, @game.dealers_hand[i].area
                @game.update_set! i
            end
        }
        @game.player_list.each { |player|
            @game.update_player! player if is_in_area? x, y, player.area
        }
        # ans_area = Area.new ANS_BOX_X, ANS_BOX_Y,
        #                     ANS_BOX_WIDTH, ANS_BOX_HEIGHT
        # if is_in_area? x, y, ans_area
        #     @game.get_ans
        # end
        restart_button_area = Area.new RESTART_BUTTON_START_X, RESTART_BUTTON_START_Y, RESTART_BUTTON_SIZE_X, RESTART_BUTTON_SIZE_Y
        if is_in_area? x, y, restart_button_area
            @game.restart
            @game.player_list.each {|player| player.restart}
        end

        hint_button_area = Area.new HINT_BUTTON_START_X, HINT_BUTTON_START_Y, HINT_BUTTON_SIZE_X, HINT_BUTTON_SIZE_Y
        if is_in_area? x, y, hint_button_area
          @game.get_ans
        end
    end

    # update the model of game according to user's input
    def update mouse_pos
        if Gosu.button_down? Gosu::MS_LEFT and not @is_pressed
            mouse_detection mouse_pos[0], mouse_pos[1]
            @is_pressed = true
        elsif not Gosu.button_down? Gosu::MS_LEFT
            @is_pressed = false
        end
    end
end