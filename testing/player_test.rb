#Author: Jeb Alawi 5/23/18
require_relative "../player.rb"
require_relative "../card.rb"
require 'test/unit'

class PlayerTest < Test::Unit::TestCase

  # no winning hands
  def score0
    one = Player.new("One")
    assert_equal(0, one.score)
  end

  # one winning hand
  def score1
    card1 = Card.new(1,1,1,1)
    one = Player.new("One")
    hand1 = Array.new(3)
    hand1 = [card1, card1, card1]
    one.addWinningHand(hand1)
    assert_equal(1, one.score)
  end

  #ten winning hands
  def test_score10
    card1 = Card.new(1,1,1,1)
    card2 = Card.new(1,1,1,1)
    card3 = Card.new(1,1,1,1)
    card4 = Card.new(1,1,1,1)
    card5 = Card.new(1,1,1,1)
    card6 = Card.new(1,1,1,1)
    card7 = Card.new(1,1,1,1)
    card8 = Card.new(1,1,1,1)
    card9 = Card.new(1,1,1,1)
    card10 = Card.new(1,1,1,1)
    one = Player.new("One")
    hand1 = [card1, card1, card1]
    hand2 = [card2, card2, card2]
    hand3 = [card3, card3, card3]
    hand4 = [card4, card4, card4]
    hand5 = [card5, card5, card5]
    hand6 = [card6, card6, card6]
    hand7 = [card7, card7, card7]
    hand8 = [card8, card8, card8]
    hand9 = [card9, card9, card9]
    hand10 = [card10, card10, card10]
    one.addWinningHand(hand1)
    one.addWinningHand(hand2)
    one.addWinningHand(hand3)
    one.addWinningHand(hand4)
    one.addWinningHand(hand5)
    one.addWinningHand(hand6)
    one.addWinningHand(hand7)
    one.addWinningHand(hand8)
    one.addWinningHand(hand9)
    one.addWinningHand(hand10)
    assert_equal(10, one.score)
  end

end