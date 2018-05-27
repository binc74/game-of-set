# Created by Jeb Alawi 5/23/18
# Implemented by Jeb Alawi 5/23/18 - All Functionality and nearly all comments
# Edited by Houyi Fan 5/26/18 - Complete comments and delete unused variable
require 'set'

# Player class contains the information about the player
class Player

  # Author: Jeb Alawi

  #Constructor for Player class
  # name is the name of the player
  # WinningsHand contains the cards that have been identified as a part of set by the player successfully. And the number of cards in it will be the score of this player.
  def initialize (name)
    @Name = name
    @WinningHands = Set[]
  end

  # returns player score
  # score = number of winning hands
  def score
    @WinningHands.length
  end

  # returns player name
  def name
    @Name
  end

  # requires hand is a set of 3 Card objects
  # adds hand to winning hands
  def addWinningHand(hand)
    @WinningHands.add(hand)
  end

end