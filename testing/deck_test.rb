# Created by Bin Chen 5/23/18
# Implemented by Bin Chen 5/23/18 - add test for constructor and remove
# Edited by Houyi Fan 5/27/18 - Complete comments

require 'test/unit'
require_relative '../Model/deck'

class MyTest < Test::Unit::TestCase

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

  def teardown
    # Do nothing
  end
end