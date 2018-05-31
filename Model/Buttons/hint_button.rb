# Created by Bin Chen in 5/31/18
# Implemented by Bin Chen in 5/31/18 - implemented the constructor and execute method of button

require_relative 'button'
require_relative '../game'

# the hint button that inherit from the button class
class HintButton < Button
  def initialize(area, game)
    super 'Hint', area, game
  end

  # get the answer
  def execute
    hint = @game.get_ans
    puts @game.difficulty_level
    if @game.difficulty_level <= 2
      @game.update_set!(@game.index_of_card(hint[0]))
      if @game.difficulty_level == 1
        @game.update_set!(@game.index_of_card(hint[1]))
      end
    end
  end
end