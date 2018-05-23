require_relative "card"

class Deck
  def initialize
    @CardDeck = []
    (1..3).each { |i| (1..3).each { |j| (1..3).each { |k| (1..3).each { |l| @CardDeck.push(Card.new i, j, k, l)}}}}
  end

  def length
    @CardDeck.count
  end

  def remove
    to_remove = Random.rand(@CardDeck.count)
    temp = @CardDeck[to_remove]
    @CardDeck.delete_at to_remove
    temp
  end
end