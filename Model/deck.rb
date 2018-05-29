# Created by Josh Wright 5/23/18
# Implemented by Bin Chen 5/23/18 - the constructor, the size and remove methods
# Edited by Houyi Fan 5/26/18 - Complete comments
# Edited by Bin Chen 5/29/18 - Change the content of @CardDeck list from storing card to storing arrays

require_relative "card"

# Deck class contains all the cards that possibly be chosen
class Deck

  #Constructor for Deck class
  # CardDeck is an array containing all cards in the deck
  # Constructor will push all possible cards to the deck. Initially the deck has 81 cards.
  def initialize
    @CardDeck = []
    (1..3).each { |i| (1..3).each { |j| (1..3).each { |k| (1..3).each { |l| @CardDeck << [i, j, k, l]}}}}
  end

  # a getter method that returns the current size of the deck. In other words,the number of cards remained in the deck.
  def size; @CardDeck.length; end;

  # Public: Randomly removed a card from the deck list and returns the card
  #
  #  Returns the card removed from the deck
  def remove!
    @CardDeck.delete_at Random.rand(@CardDeck.length)
  end

  # adds a card to the deck and returns the deck
  def add! (card)
    @CardDeck.push card
  end
end