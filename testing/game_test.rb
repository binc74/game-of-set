require_relative "../game"
require 'test/unit'
#created by Josh Wright 5/23/18
#Implemented by Josh Wright 5/23/18 - Test Plan for isSet
class Game_test < Test::Unit::TestCase


  def test_isSet_true
    testGame = Game.new([])
    card1 = Card.new(1,1,1,1)
    card2 = Card.new(2,2,2,2)
    card3 = Card.new(3,3,3,3)
    assert_equal(true,testGame.isSet?([card1,card2,card3]))
  end

  def test_isSet_false
    testGame = Game.new([])
    card1 = Card.new(1,2,1,1)
    card2 = Card.new(1,2,2,2)
    card3 = Card.new(3,3,3,3)
    assert_equal(false,testGame.isSet?([card1,card2,card3]))
  end

  def test_isSet_true2
    testGame = Game.new([])
    card1 = Card.new(1,1,2,3)
    card2 = Card.new(1,2,2,2)
    card3 = Card.new(1,3,2,1)
    assert_equal(true,testGame.isSet?([card1,card2,card3]))
  end
end