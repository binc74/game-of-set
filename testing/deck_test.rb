# Created by Bin Chen 5/23/18
# Implemented by Bin Chen 5/23/18 - add test for constructor and remove
# Edited by Houyi Fan 5/27/18 - Complete comments
# Edited by Jeb Alawi 5/28/18 - added test_remove3, test_remove81, test_class, test_add, test_remove_add, test_removeAll_add,
#     test_removeAll_add81

require 'test/unit'
require_relative '../Model/deck'

class DeckTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  def test_constructor
    assert_equal(81, Deck.new.size)
  end

  def test_remove
    deck = Deck.new
    deck.remove!
    assert_equal(80, deck.size)
  end

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

  # ensures deck.remove returns an object of class Card
  def test_class
    deck = Deck.new
    card = deck.remove!
    testCard = Card.new(1,1,1,1)
    assert_equal(testCard.class,card.class )
  end

  def test_add
    deck = Deck.new
    card = Card.new(1,1,1,1)
    deck.add!(card)
    assert_equal(82, deck.size)
  end

  #removes a card then adds it back to the deck
  def test_remove_add
    deck = Deck.new
    card = deck.remove!
    deck.add!(card)
    assert_equal(81, deck.size)
  end

  def test_removeAll_add
    deck = Deck.new
    card = deck.remove!
    80.times{deck.remove!}
    deck.add!(card)
    assert_equal(1, deck.size)
  end

  def test_removeAll_add81
    deck = Deck.new
    card = deck.remove!
    80.times{deck.remove!}
    81.times{deck.add!(card)}
    assert_equal(81, deck.size)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def teardown
    # Do nothing
  end
end