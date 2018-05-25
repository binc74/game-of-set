require_relative "deck"
require_relative "card"
require_relative "player"
#Created by Josh Wright 5/23/18
#Implemented by Josh Wright 5/23/18 - Basic Functionality
# Bin Chen implemented the method replace_cards
# Edited by Houyi Fan 5/24/18 - add "attr_accessor" for instance variables to help test the methods in this class, Fix a bug in setLeftInDealersHand

class Game
  attr_accessor :listOfPlayers, :deck, :dealersHand, :hasEnded, :winner # add getter and setter methods to help test the methods in this class

  #    ----    Constructor method for Game class.    ----    #

  # @author Josh Wright
  # @requires
  #   |listOfPlayers| > 0
  #
  def initialize(listOfPlayers)

    @listOfPlayers = listOfPlayers
    @deck = Deck.new
    @dealersHand = []
    @hasEnded = false
    @winner = nil
    12.times {@dealersHand.push(@deck.remove!)}
  end

  #    ----    Kernel Methods    ----    #

  #finds the winner with the highest score
  #requires @hasEnded = true
  def getWinner
    maxScorePlayer = @listOfPlayers[0]
    for player in 1...(@listOfPlayers.length())
      maxScorePlayer = @listOfPlayers[player] if maxScorePlayer.score < listOfPlayers[player]
    end
  end

  def getDealersHand
    @dealersHand
  end

  def display_cards()
    @dealersHand.length.times {|i| puts "Card ##{i}: " + @dealerHand[i].toString}
  end

  def setLeftInDealersHand?
    setLeft = false
    for card1 in @dealersHand
      for card2 in @dealersHand
        for card3 in @dealersHand
              setLeft = setLeft || isSet?([card1,card2,card3]) if card1 != card2 && card2 != card3 && card1 != card3
        end
      end
    end
    return setLeft
  end

  def hasEnded?
    if @deck.size == 0 && (@dealersHand.length == 0 || !setLeftInDealersHand?(@dealersHand))
      @hasEnded = true
      @winner = getWinner
    end
  end

  def replace_cards(cards_index)
    cards_index.each {|index| @dealersHand[index] = @deck.remove!}
  end

  #replenishes the dealers hand each time a player finds a set
  # @updates dealersHand
  def replenishHand!
    while @dealersHand.length < 12
      @dealersHand.push(@deck.remove!)
    end
  end

  #Determines if 3 cards make a set
  #@requires hand is a list of 3 cards and none of the cards in hand are the same card
  #@author Josh Wright
  #@returns true if the hand makes a set and false otherwise
  def isSet?(hand)
    (setColor?(hand[0],hand[1],hand[2]) && setSymbol?(hand[0],hand[1],hand[2]) && setShading?(hand[0],hand[1],hand[2]) && setNumber?(hand[0],hand[1],hand[2]))
  end

  #Determines if 3 cards have the same color or 3 different colors
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same color or 3 different colors and false otherwise
  def setColor?(card1,card2,card3)
    (card1.color == card2.color && card2.color == card3.color) || (card1.color != card2.color && card2.color != card3.color)
  end

  #Determines if 3 cards have the same symbol or 3 different symbols
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same symbol or 3 different symbols and false otherwise
  def setSymbol?(card1,card2,card3)
    card1.symbol == card2.symbol && card2.symbol == card3.symbol || (card1.symbol != card2.symbol && card2.symbol != card3.symbol)
  end

  #Determines if 3 cards have the same shading or 3 different shadings
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same shading or 3 different shadings and false otherwise
  def setShading?(card1,card2,card3)
    card1.shading == card2.shading && card2.shading == card3.shading || (card1.shading != card2.shading && card2.shading != card3.shading)
  end
  #Determines if 3 cards have the same number or 3 different numbers
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same number or 3 different numbers and false otherwise
  def setNumber?(card1,card2,card3)
    card1.number == card2.number && card2.number == card3.number || (card1.number != card2.number && card2.number != card3.number)
  end

end

