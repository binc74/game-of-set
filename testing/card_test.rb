require_relative '../card'
require 'test/unit'
#Created by Josh Wright
class CardTest < Test::Unit::TestCase

  def test_contructor_1111
    testCard = Card.new(1,1,1,1)
    assert_equal(1, testCard.color)
    assert_equal(1, testCard.symbol)
    assert_equal(1, testCard.shading)
    assert_equal(1, testCard.number)
  end
  def test_contructor_1231
    testCard = Card.new(1,2,3,1)
    assert_equal(1, testCard.color)
    assert_equal(2, testCard.symbol)
    assert_equal(3, testCard.shading)
    assert_equal(1, testCard.number)
  end
  def test_contructor_2222
    testCard = Card.new(2,2,2,2)
    assert_equal(2, testCard.color)
    assert_equal(2, testCard.symbol)
    assert_equal(2, testCard.shading)
    assert_equal(2, testCard.number)
  end
  def test_contructor_3333
    testCard = Card.new(3,3,3,3)
    assert_equal(3, testCard.color)
    assert_equal(3, testCard.symbol)
    assert_equal(3, testCard.shading)
    assert_equal(3, testCard.number)
  end

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