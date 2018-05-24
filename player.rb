require 'set'
class Player

  # Author: Jeb Alawi 5/23/18
  #

  # Constructor for Player class
  def initialize (name)
    @Name = name
    @WinningHands = Set[]
    @CurrentHand = Array.new(3)
  end

  # returns player score
  # score = number of winning hands
  def score
    return @WinningHands.length
  end

  # requires hand is a set of 3 Card objects
  # adds hand to winning hands
  def addWinningHand(hand)
    @WinningHands.add(hand)
  end


end