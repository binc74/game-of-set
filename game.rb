require_relative "deck"
require_relative "card"
require_relative "player"
#Created by Josh Wright 5/23/18
#Implemented by Josh Wright 5/23/18 - Basic Functionality

class Game
  #Constructor Method for Game Class
  # @author Josh Wright
  def initialize(listOfPlayers)
    @listOfPlayers = listOfPlayers
    @deck = Deck.new
    @dealersHand = []
    for i in 1..12 do
      @dealersHand.push(@deck.remove!)
    end
  end


  #Determines if 3 cards make a set
  #@requires hand is a list of 3 cards
  #@author Josh Wright
  def isSet?(hand)
    (setColor?(hand[0],hand[1],hand[2]) && setSymbol?(hand[0],hand[1],hand[2]) && setShading?(hand[0],hand[1],hand[2]) && setNumber?(hand[0],hand[1],hand[2]))
  end

  def setColor?(card1,card2,card3)
    (card1.color == card2.color && card2.color == card3.color) || (card1.color != card2.color && card2.color != card3.color)
  end
  def setSymbol?(card1,card2,card3)
    card1.symbol == card2.symbol && card2.symbol == card3.symbol || (card1.symbol != card2.symbol && card2.symbol != card3.symbol)
  end
  def setShading?(card1,card2,card3)
    card1.shading == card2.shading && card2.shading == card3.shading || (card1.shading != card2.shading && card2.shading != card3.shading)
  end
  def setNumber?(card1,card2,card3)
    card1.number == card2.number && card2.number == card3.number || (card1.number != card2.number && card2.number != card3.number)
  end


end

