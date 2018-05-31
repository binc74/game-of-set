# Created by Bin Chen in 5/31/18
# Implemented by Bin Chen in 5/31/18 - implemented the constructor and execute method of button

require_relative 'button'

# the hint button that inherit from the button class
class HintButton < Button
  def initialize(area, game)
    super 'Hint', area, game
  end

  # get the answer
  def execute
    @game.get_ans
  end
end