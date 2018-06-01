# Created by Jeb Alawi 5/25/18
# Implemented by Jeb Alawi 5/25/18
# Edited by Houyi Fan 5/26/18 - Complete comments and delete unused statement

require_relative "../Model/player.rb"
require_relative "../Model/card.rb"
require 'test/unit'

class PlayerTest < Test::Unit::TestCase
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Since we don't need index and area in these tests, just set them a value
    @index = 0
    @area = Area.new 0, 0, 0, 0
  end

  # test for score when the player doesn't have any card in winning hands
  def test_score0
    one = Player.new("One", 0)
    assert_equal(0, one.score)
  end

  # test for score when the player has only one card in winning hands
  def test_score1
    card1 = Card.new(1,1,1,1, @index, @area)
    one = Player.new("One", 0)
    hand1 = [card1, card1, card1]
    one.add_winning_hand(hand1)
    assert_equal(1, one.score)
  end

  # test for score when the player has 10 cards in winning hands
  def test_score10
    card1 = Card.new(1,1,1,1, @index, @area)
    card2 = Card.new(1,1,1,1, @index, @area)
    card3 = Card.new(1,1,1,1, @index, @area)
    card4 = Card.new(1,1,1, 1, @index, @area)
    card5 = Card.new(1,1,1,1, @index, @area)
    card6 = Card.new(1,1,1,1, @index, @area)
    card7 = Card.new(1,1,1,1, @index, @area)
    card8 = Card.new(1,1,1,1, @index, @area)
    card9 = Card.new(1,1,1,1, @index, @area)
    card10 = Card.new(1,1,1,1, @index, @area)
    one = Player.new("One", 0)
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
    one.add_winning_hand(hand1)
    one.add_winning_hand(hand2)
    one.add_winning_hand(hand3)
    one.add_winning_hand(hand4)
    one.add_winning_hand(hand5)
    one.add_winning_hand(hand6)
    one.add_winning_hand(hand7)
    one.add_winning_hand(hand8)
    one.add_winning_hand(hand9)
    one.add_winning_hand(hand10)
    assert_equal(10, one.score)
  end

  # test if the restart methods works on the default settings of player
  def test_restart_default
    name = "One"
    number = 0
    one = Player.new name, number
    one.restart
    assert_equal one.score, 0
    assert_equal one.name, name
    assert_equal one.number, number
  end

  # test if the restart methods works on player if winning hand is added to the player
  def test_restart_modified
    name = "One"
    number = 0
    one = Player.new name, number
    card1 = Card.new(1,1,1,1, @index, @area)
    one.add_winning_hand [card1, card1, card1]
    one.add_winning_hand [card1, card1, card1]
    one.restart
    assert_equal one.score, 0
    assert_equal one.name, name
    assert_equal one.number, number
  end
end