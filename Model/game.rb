# Created by Josh Wright 5/23/18
# Implemented by Josh Wright 5/23/18 - Basic Functionality
# Implemented by Bin Chen 5/24/18 - the method replace_cards
# Edited by Houyi Fan 5/24/18 - Add "attr_accessor" for instance variables to help test the methods in this class, Fix a bug in setLeftInDealersHand
# Edited by Houyi Fan 5/26/18 - Complete comments
# Edited by Bin Chen 5/29/18 - Change the constructor of this class, added get_card and update_player method

require_relative "deck"
require_relative "card"
require_relative "player"
require_relative "area"
require_relative "../consts"

# Game class contains all operations and rules for the game
class Game
  include Consts

  attr_accessor :listOfPlayers, :deck, :dealersHand, :hasEnded, :winner, :currentPlayer, :cardChosen # add getter and setter methods to help test the methods in this class

  #    ----    Constructor method for Game class.    ----    #

  # @author Josh Wright
  # @requires
  #   |listOfPlayers| > 0
  # @param
  #   listOfPlayers - a list that contains all players in the game
  #
  # deck is the Deck used in the game. It has all cards that are not in dealersHand and winningsHand
  # dealersHand is the dealers hand list. It contains cards that are providing to players to judge currently. Initially it will have 12 cards
  # hasEned indicates if the game has ended
  # winner indicates who is the winner of the game
  # Constructor will push 12 cards from deck to dealers hand initially to start the game
  def initialize(playerNames)
    @listOfPlayers = playerNames.map.with_index { |name, index| Player.new name, index }
    @deck = Deck.new
    @dealersHand = []
    @hasEnded = false
    @winner = nil
    12.times { |pos| @dealersHand << get_card(@deck.remove!, pos)}
    @currentPlayer = 0
    @cardChosen = Set[]
  end

  #    ----    Kernel Methods    ----    #

  # finds the winner with the highest score
  # requires @hasEnded = true
  def setWinner
    maxScorePlayer = @listOfPlayers[0]
    for player in @listOfPlayers
      maxScorePlayer = player if maxScorePlayer.score < player.score
    end
    return maxScorePlayer
  end

  # returns the game winner
  def winner
    @winner
  end

  # resets the dealers hand list by moving current cards in it back to deck and retrieving cards from deck again
  def resetHand
    while @dealersHand.length > 0
      @deck.add! @dealersHand.pop
    end
    self.replenishHand!
  end

  # returns the current list in dealers hand
  def getDealersHand
    @dealersHand
  end

  # puts all cards in the dealers hand list on the console
  def display_cards
    @dealersHand.length.times {|i| puts "Card ##{i}: " + @dealersHand[i].toString}
  end

  # puts a hint on the console
  def displayHint
    puts "Two cards of a set in the hand: #{self.getHint}"
  end

  # returns a boolean value by checking if there is still a set in the dealers hand list
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

  # Returns the index of a card by doing a linear search in dealers hand list, and returns nil if we cannot find this card
  #@param
  #   card - the card we want to find
  def indexOfCard (card)
    for i in 0...@dealersHand.length
      if card == dealersHand[i]
        return i
      end
    end
  end

  # setting the hasEnded as true and determining the winner if there is no card remaining in deck and no set in dealers hand
  def hasEnded?
    if @deck.size == 0 && (@dealersHand.length == 0 || !setLeftInDealersHand?)
      @hasEnded = true
      @winner = setWinner
    end
  end

  # puts a hint that contains two card in a set on the console, which lets the player only need find the third card.
  # And puts a message on the console when there is no set in the deck
  def getHint
    for card1 in @dealersHand
      for card2 in @dealersHand
        for card3 in @dealersHand
          if card1 != card2 && card2 != card3 && card1 != card3 && isSet?([card1,card2,card3])
            return  puts "\nCard ##{self.indexOfCard card1}: " + card1.toString + "\nCard ##{self.indexOfCard card2}: " + card2.toString #+ "\nCard ##{self.indexOfCard card3}: " + card3.toString
          end
      end
    end
    end
    puts "No Set Available"
  end

  # replaces the dealers hand list by removing cards from deck to it. When there is no card in deck, just delete cards in the dealers hand list
  # @param
  #   cards_index - the index of cards that the player chooses
  def replace_cards(cards_index)
    #cards_index.each {|index|  @dealersHand[index] = @deck.remove!}
    for i in cards_index
       if @deck.size > 0
          @dealersHand[i] = @deck.remove!
       else
          @dealersHand.delete_at i
       end
    end
  end

  #replenishes the dealers hand each time a player finds a set
  # @updates dealersHand
  def replenishHand!
    while @dealersHand.length < 12 && @deck.size > 0
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
    (card1.color == card2.color && card2.color == card3.color && card1.color == card3.color) || (card1.color != card2.color && card2.color != card3.color && card1.color != card3.color)
  end

  #Determines if 3 cards have the same symbol or 3 different symbols
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same symbol or 3 different symbols and false otherwise
  def setSymbol?(card1,card2,card3)
    card1.symbol == card2.symbol && card2.symbol == card3.symbol && card1.symbol == card3.symbol  || (card1.symbol != card2.symbol && card2.symbol != card3.symbol && card1.symbol != card3.symbol)
  end

  #Determines if 3 cards have the same shading or 3 different shadings
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same shading or 3 different shadings and false otherwise
  def setShading?(card1,card2,card3)
    card1.shading == card2.shading && card2.shading == card3.shading && card1.shading == card3.shading || (card1.shading != card2.shading && card2.shading != card3.shading && card1.shading != card3.shading)
  end
  #Determines if 3 cards have the same number or 3 different numbers
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same number or 3 different numbers and false otherwise
  def setNumber?(card1,card2,card3)
    card1.number == card2.number && card2.number == card3.number && card1.number == card3.number || (card1.number != card2.number && card2.number != card3.number && card1.number != card3.number)
  end

  def checkSet?(b1, b2, b3)
    b1 == b2 && b2 == b3 || (b1 != b2 && b2 != b3)
  end

  # get the card object
  def get_card(content, position)
    Card.new *content,
             Area.new(CARD_START_X + (position % CARD_EACH_ROW) * (CARD_SIZE_X + CARD_INDENT_X),
                      CARD_START_Y + (position / CARD_EACH_ROW) * (CARD_SIZE_Y + CARD_INDENT_Y), CARD_SIZE_X, CARD_SIZE_Y)
  end

  # update the @currentPlayer using the player
  def update_player!(player)
    if @currentPlayer != player.number
      print "Player switched from " + @listOfPlayers[@currentPlayer].name
      @currentPlayer = player.number
      puts " to " + player.name
    end
  end
end

