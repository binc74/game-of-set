# Created by Josh Wright
# Implemented by Josh Wright - Test cases for constructor and toString
# Edited by Houyi Fan 5/27/2018 - Complete comments
# Edited by Houyi Fan 5/29/2018 - Add more test cases and Modify the test cases after card class changes

require_relative '../Model/card'
require 'test/unit'

class CardTest < Test::Unit::TestCase

  # test constructor with color 1, symbol 1, shading 1, number 1, area 1
  def test_constructor_11111
    testCard = Card.new(1, 1, 1, 1, 1)
    assert_equal(1, testCard.color)
    assert_equal(1, testCard.symbol)
    assert_equal(1, testCard.shading)
    assert_equal(1, testCard.number)
  end

  # test constructor with color 1, symbol 2, shading 3, number 1, area 3
  def test_constructor_12313
    testCard = Card.new(1, 2, 3, 1, 3)
    assert_equal(1, testCard.color)
    assert_equal(2, testCard.symbol)
    assert_equal(3, testCard.shading)
    assert_equal(1, testCard.number)
  end

  # test constructor with color 2, symbol 2, shading 2, number 2, area 2
  def test_constructor_22222
    testCard = Card.new(2, 2, 2, 2, 2)
    assert_equal(2, testCard.color)
    assert_equal(2, testCard.symbol)
    assert_equal(2, testCard.shading)
    assert_equal(2, testCard.number)
  end

  # test constructor with color 3, symbol 3, shading 3, number 3, area 3
  def test_constructor_33333
    testCard = Card.new(3, 3, 3, 3, 3)
    assert_equal(3, testCard.color)
    assert_equal(3, testCard.symbol)
    assert_equal(3, testCard.shading)
    assert_equal(3, testCard.number)
  end

  # test colorStr with card that has color 1(red)
  def test_colorStr_red
    testCard = Card.new(1, 1, 1, 1, 1)
    testStr = testCard.colorStr
    assert_equal("red", testStr)
  end

  # test colorStr with card that has color 2(green)
  def test_colorStr_green
    testCard = Card.new(2, 1, 1, 1, 1)
    testStr = testCard.colorStr
    assert_equal("green", testStr)
  end

  # test colorStr with card that has color 3(purple)
  def test_colorStr_purple
    testCard = Card.new(3, 1, 1, 1, 1)
    testStr = testCard.colorStr
    assert_equal("purple", testStr)
  end

  # test symbolStr with card that has symbol 1(diamond)
  def test_symbolStr_diamond
    testCard = Card.new(1, 1, 1, 1, 1)
    testStr = testCard.symbolStr
    assert_equal("diamond", testStr)
  end

  # test symbolStr with card that has symbol 2(squiggle)
  def test_symbolStr_squiggle
    testCard = Card.new(1, 2, 1, 1, 1)
    testStr = testCard.symbolStr
    assert_equal("squiggle", testStr)
  end

  # test symbolStr with card that has symbol 3(oval)
  def test_symbolStr_oval
    testCard = Card.new(1, 3, 1, 1, 1)
    testStr = testCard.symbolStr
    assert_equal("oval", testStr)
  end

  # test shadingStr with card that has shading 1(open)
  def test_shadingStr_open
    testCard = Card.new(1, 1, 1, 1, 1)
    testStr = testCard.shadingStr
    assert_equal("open", testStr)
  end

  # test shadingStr with card that has shading 2(dashed)
  def test_shadingStr_dashed
    testCard = Card.new(1, 1, 2, 1, 1)
    testStr = testCard.shadingStr
    assert_equal("dashed", testStr)
  end

  # test shadingStr with card that has shading 3(solid)
  def test_shadingStr_solid
    testCard = Card.new(1, 1, 3, 1, 1)
    testStr = testCard.shadingStr
    assert_equal("solid", testStr)
  end

  # test numberStr with card that has number 1
  def test_numberStr_1
    testCard = Card.new(1, 1, 1, 1, 1)
    testStr = testCard.numberStr
    assert_equal("1", testStr)
  end

  # test numberStr with card that has number 2
  def test_numberStr_2
    testCard = Card.new(1, 1, 1, 2, 1)
    testStr = testCard.numberStr
    assert_equal("2", testStr)
  end

  # test numberStr with card that has number 3
  def test_numberStr_3
    testCard = Card.new(1, 1, 1, 3, 1)
    testStr = testCard.numberStr
    assert_equal("3", testStr)
  end

  # test toString with card that has color 1(red), symbol 1(diamond), shading 1(open), number 1(1)
  def test_toString_1111
    testCard = Card.new(1, 1, 1, 1, 1)
    testStr = testCard.toString
    assert_equal("[red,diamond,open,1]", testStr)
  end

  # test toString with card that has color 2(green), symbol 2(squiggle), shading 2(dashed), number 2(2)
  def test_toString_2222
    testCard = Card.new(2, 2, 2, 2, 1)
    testStr = testCard.toString
    assert_equal("[green,squiggle,dashed,2]", testStr)
  end

  # test toString with card that has color 3(purple), symbol 3(oval), shading 3(solid), number 3(3)
  def test_toString_3333
    testCard = Card.new(3, 3, 3, 3, 1)
    testStr = testCard.toString
    assert_equal("[purple,oval,solid,3]", testStr)
  end

end