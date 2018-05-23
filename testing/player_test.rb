require_relative "../player.rb"
require_relative "../card.rb"
require 'test/unit'

class PlayerTest < Test::Unit::TestCase

  # no winning hands
  def score0
    one = Player.new("One")
    assert_equal(0, one.score)
  end

  def score1
    card1 = Card.new(1,1,1,1)
    one = Player.new("One")
    hand1 = Array.new(3)
    hand1 = [card1, card1, card1]
    one.addWinningHand(hand1)
    assert_equal(1, one.score)
  end

end