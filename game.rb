require_relative "deck"
require_relative "card"
require_relative "player"

class Game

  def initialize(listOfPlayers)
    @listOfPlayers = listOfPlayers
    @deck = Deck.new
    @dealersHand = []
    unless @dealersHand.length == 12
      if(@deck.length> 0)
        dealersHand.push(@deck.remove)
      end
    end
  end
  #@requires hand is a list of 3 cards
  #
  def isSet(hand)

  end
end

