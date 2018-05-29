# Created by Josh Wright
# Implemented by Josh Wright
# Edited by Houyi Fan 5/27/2018 - Complete comments

require_relative '../Model/card'
require 'test/unit'

class CardTest < Test::Unit::TestCase

  # test cases for constructor
  def test_constructor_1111
    testCard = Card.new(1,1,1,1)
    assert_equal(1, testCard.color)
    assert_equal(1, testCard.symbol)
    assert_equal(1, testCard.shading)
    assert_equal(1, testCard.number)
  end
  def test_constructor_1231
    testCard = Card.new(1,2,3,1)
    assert_equal(1, testCard.color)
    assert_equal(2, testCard.symbol)
    assert_equal(3, testCard.shading)
    assert_equal(1, testCard.number)
  end
  def test_constructor_2222
    testCard = Card.new(2,2,2,2)
    assert_equal(2, testCard.color)
    assert_equal(2, testCard.symbol)
    assert_equal(2, testCard.shading)
    assert_equal(2, testCard.number)
  end
  def test_constructor_3333
    testCard = Card.new(3,3,3,3)
    assert_equal(3, testCard.color)
    assert_equal(3, testCard.symbol)
    assert_equal(3, testCard.shading)
    assert_equal(3, testCard.number)
  end

  # test cases for toString
  def test_toString_1111
    testCard = Card.new(1,1,1,1)
    testStr = testCard.toString
    assert_equal("[red,diamond,open,1]", testStr)
  end
  def test_toString_2222
    testCard = Card.new(2,2,2,2)
    testStr = testCard.toString
    assert_equal("[green,squiggle,dashed,2]", testStr)
  end
  def test_toString_3333
    testCard = Card.new(3,3,3,3)
    testStr = testCard.toString
    assert_equal("[purple,oval,solid,3]", testStr)
  end


end