require 'set'
class Player

  # Author: Jeb Alawi

  @Name = String
  @WinningHands = Set[]
  @CurrentHand = Array.new(3)

  # Constructor for Player class
  def initialize (name)
    @Name = name
  end

  # returns player score
  # score = number of winning hands
  def score
    return @WinningHands.length
  end


end