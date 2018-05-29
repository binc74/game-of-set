# Created by
# Implemented by
# Edited by Houyi Fan 5/26/18 - Complete comments and delete unused statement

require_relative "../Model/player.rb"
require_relative "../Model/card.rb"
require 'test/unit'

class PlayerTest < Test::Unit::TestCase

  # test for score when the player doesn't have any card in winning hands
  def score0
    one = Player.new("One")
    assert_equal(0, one.score)
  end

  # test for score when the player has only one card in winning hands
  def score1
    card1 = Card.new(1,1,1,1)
    one = Player.new("One")
    hand1 = [card1, card1, card1]
    one.addWinningHand(hand1)
    assert_equal(1, one.score)
  end

end