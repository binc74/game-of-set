require 'test/unit'
require_relative '../deck'

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def test_constructor
    assert_equal(81, Deck.new.length)
  end

  def test_remove
    deck = Deck.new
    deck.remove
    assert_equal(80, deck.length)
  end

  def teardown
    # Do nothing
  end
end