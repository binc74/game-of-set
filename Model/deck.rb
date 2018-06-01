# Created by Josh Wright 5/23/18
# Implemented by Bin Chen 5/23/18 - the constructor, the size and remove methods
# Edited by Houyi Fan 5/26/18 - Complete comments
# Edited by Bin Chen 5/29/18 - Change the content of @CardDeck list from storing card to storing arrays

require_relative "card"

# Deck class contains all the cards that possibly be chosen
class Deck

  #Constructor for Deck class
  # CardDeck is an array containing all cards properties in the deck
  # where game properties is a list [card.color, card.symbol, card.shading, card.number]
  #
  # Constructor will push all possible cards to the deck. Initially the deck has 81 cards.
  #
  # created and implemented by Bin Chen 5/23/18
  def initialize
    @card_deck = []
    (1..3).each { |i| (1..3).each { |j| (1..3).each { |k| (1..3).each { |l| @card_deck << [i, j, k, l]}}}}
  end

  # a getter method that returns the current size of the deck. In other words,the number of cards remained in the deck.
  #
  # created and implemented by Bin Chen 5/23/18
  def size; @card_deck.length; end

  # Public: Randomly removed a card property from the deck list and returns the card property
  #
  #  Returns the card removed from the deck
  #
  # created and implemented by Bin Chen 5/23/18
  def remove!
    @card_deck.delete_at Random.rand(@card_deck.length)
  end
end