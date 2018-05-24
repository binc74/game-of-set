# Josh Wright Created this file in 5/23
# Bin Chen implements the constructor, the size and remove methods in 5/23

require_relative "card"

# The Deck contains all the cards that possibly be chosen
class Deck
  def initialize
    @CardDeck = []
    (1..3).each { |i| (1..3).each { |j| (1..3).each { |k| (1..3).each { |l| @CardDeck.push(Card.new i, j, k, l)}}}}
    @CardDeck.shuffle!
  end

  def size
    @CardDeck.length
  end

  # Public: Randomly removed a card from the deck list and returns the card
  #
  #  Returns the card removed from the deck
  def remove!
    @CardDeck.delete_at Random.rand(@CardDeck.length)
  end
end