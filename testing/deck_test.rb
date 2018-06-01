# Created by Bin Chen 5/23/18
# Implemented by Bin Chen 5/23/18 - add test for constructor and remove
# Edited by Houyi Fan 5/27/18 - Complete comments
# Edited by Jeb Alawi 5/28/18 - added test_remove3, test_remove81, test_class, test_add, test_remove_add, test_removeAll_add,
#                               test_removeAll_add81
# Edited by Bin Chen 5/31/18 - modified all of the test cases because of the change of the deck class

require 'test/unit'
require_relative '../Model/deck'

class DeckTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Nothing
  end

  def test_constructor
    assert_equal(81, Deck.new.size)
  end

  # ensures that a cards can be correctly removed from the deck
  def test_remove
    deck = Deck.new
    deck.remove!
    assert_equal(80, deck.size)
  end

  # ensures that a number of cards can be correctly removed from the deck
  def test_remove3
    deck = Deck.new
    3.times{deck.remove!}
    assert_equal(78, deck.size)
  end

  # ensures all cards can be removed from the deck
  def test_remove81
    deck = Deck.new
    81.times{deck.remove!}
    assert_equal(0,deck.size)
  end

  # ensures deck.remove returns an array of 4 integers with each values
  def test_class
    card_property = Deck.new.remove!
    assert_equal 4, card_property.length
    card_property.each { |property|
      assert_equal true, property >= 1 and property <= 3
    }
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def teardown
    # Do nothing
  end
end