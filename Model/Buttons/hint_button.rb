# Created by Bin Chen in 5/31/18
# Implemented by Bin Chen in 5/31/18 - implemented the constructor and execute method of button

require_relative 'button'
require_relative '../game'

#HintButton class that inherits from the Button class
class HintButton < Button
  def initialize(area, game)
    super 'Hint', area, game
  end

  #Gets a set from the dealer's hand and highlights cards dependant on the difficulty level
  # Difficulty level 1: 2 cards highlighted that is part of an available set
  # Difficulty level 2: 1 card highlighted that is part of an available set
  # Difficulty level 3: No hint option available
  # @Authors Bin Chen, Josh Wright
  # @updates game's cards_chosen
  def execute
    hint = @game.get_ans
    if @game.difficulty_level <= 2
      @game.update_set!(@game.index_of_card(hint[0]))
      if @game.difficulty_level == 1
        @game.update_set!(@game.index_of_card(hint[1]))
      end
    end
  end
end