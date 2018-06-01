# Created by Bin Chen in 5/29/18
# Edited by Bin Chen in 5/29/18 - implement initialize and is_in_area method, partially
#                                  implements the mouse_detection and update method
# Edited by Houyi Fan in 5/30/18 - add the code that restarts the game when pressing restart button
#                                  change the "Answer?" button to "Hint" button
# Edited by Bin Chen in 5/31/18 - created a button class and refactor all the codes about buttons
# Edited by Jeb Alawi on 5/30/18 - added mouse detection for card selection with update_set!

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
    @is_pressed = false # to prevent from detecting the key for too many times
  end


  # Check if the coordinate (x, y) is in the area
  #
  # x - the x value of the user's cursor on the window
  # y - the y value of the user's cursor on the window
  # area - the area class that contains the x position, y position, width and height of a rectangle
  #
  # Created by Bin Chen in 5/29/18
  # Implemented by Bin Chen in 5/29/18 - complete the functionality of this function
  def is_in_area?(x, y, area)
    x >= area.x and x <= area.x + area.width and y >= area.y and y <= area.y + area.height
  end


  # Detect the position of the mouse and process input
  #
  # x - the x value of the position of the cursor on the window
  # y - the y value of the position of the cursor on the window
  #
  # Created by Bin Chen in 5/29/18
  # Implemented by Bin Chen in 5/29/18 - deteccting the left mouse clicking
  # Edited by Jeb Alawi on 5/30/18 - update_set implemented
  # Edited by Houyi Fan in 5/30/18 - add the hint and restart button(now moved to button class)
  def mouse_detection(x, y)
    @game.dealers_hand.each_index {|i|
      @game.update_set! i if is_in_area? x, y, @game.dealers_hand[i].area
    }
    @game.player_list.each {|player|
      @game.update_player! player if is_in_area? x, y, player.area
    }

    @game.buttons.each { |button|
      button.execute if is_in_area? x, y, button.area
    }
  end


  # update the model of game according to user's input
  #
  # mouse_pos - a list that contains two float values, mouse_x and mouse_y, where (mouse_x, mouse_y) is the position of cursor on the window
  #             position of cursor on the window
  #
  # Created by Bin Chen in 5/29/18
  # Implemented by Bin Chen in 5/29/18 - detecting the left mouse clicking
  def update(mouse_pos)
    if Gosu.button_down? Gosu::MS_LEFT and not @is_pressed
      mouse_detection mouse_pos[0], mouse_pos[1]
      @is_pressed = true
    elsif not Gosu.button_down? Gosu::MS_LEFT
      @is_pressed = false
    end
  end
end