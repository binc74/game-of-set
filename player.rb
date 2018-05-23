require 'set'
class Player

  # Author: Jeb Alawi
  # Constructor for Player class

  @Name = String
  @WinningHands = Set[]
  @CurrentHand = Array.new(3)
  def initialize (name)
    @Name = name
  end

  def score
    return @WinningHands.length
  end


end