#Author: Bin Chen 5/23/2018
# Modified by: Jeb Alawi 5/24/2018
require 'test/unit'
require_relative '../deck'

class DeckTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def test_constructor
    assert_equal(81, Deck.new.size)
  end

  def test_remove
    deck = Deck.new
    deck.remove!
    assert_equal(80, deck.size)
  end

  # Written By: Jeb Alawi 5/24/18
  # Remove all cards from deck
  def test_remove81
    deck = Deck.new
    81.times {deck.remove!}
    assert_equal(0,deck.size)
  end

  #Written by: Jeb Alawi 5/24/2018
  # Check class when removing card from deck
  def test_cardClass
    deck = Deck.new
    card = deck.remove!
    card1 = Card.new(1,1,1,1)
    assert_equal(card1.class, card.class)
  end

  def teardown
    # Do nothing
  end
end