# Created by Josh Wright
# Implemented by Josh Wright - Test cases for constructor and toString
# Edited by Houyi Fan 5/27/2018 - Complete comments
# Edited by Houyi Fan 5/29/2018 - Add more test cases and Modify the test cases after card class changes
# Edited by Bin Chen 5/31/18 - Changed all of the test cases because of the modification of constructor of card class

require_relative '../Model/card'
require_relative '../Model/area'
require 'test/unit'

class CardTest < Test::Unit::TestCase
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Since we don't need index and area in these tests, just set them a value
    @index = 0
    @area = Area.new 0, 0, 0, 0
  end

  # test constructor with color 1, symbol 1, shading 1, number 1, area 1
  def test_constructor_11111
    testCard = Card.new 1, 1, 1, 1, @index, @area
    assert_equal(1, testCard.color)
    assert_equal(1, testCard.symbol)
    assert_equal(1, testCard.shading)
    assert_equal(1, testCard.number)
  end

  # test constructor with color 1, symbol 2, shading 3, number 1, area 3
  def test_constructor_12313
    testCard = Card.new 1, 2, 3, 1,  @index, @area
    assert_equal(1, testCard.color)
    assert_equal(2, testCard.symbol)
    assert_equal(3, testCard.shading)
    assert_equal(1, testCard.number)
  end

  # test constructor with color 2, symbol 2, shading 2, number 2, area 2
  def test_constructor_22222
    testCard = Card.new 2, 2, 2, 2, @index, @area
    assert_equal(2, testCard.color)
    assert_equal(2, testCard.symbol)
    assert_equal(2, testCard.shading)
    assert_equal(2, testCard.number)
  end

  # test colorStr with card that has color 1(red)
  def test_colorStr_red
    testCard = Card.new 1, 1, 1, 1, @index, @area
    testStr = testCard.color_str
    assert_equal("red", testStr)
  end

  # test colorStr with card that has color 2(green)
  def test_colorStr_green
    testCard = Card.new 2, 1, 1, 1, @index, @area
    testStr = testCard.color_str
    assert_equal("green", testStr)
  end

  # test colorStr with card that has color 3(purple)
  def test_colorStr_purple
    testCard = Card.new 3, 1, 1, 1, @index, @area
    testStr = testCard.color_str
    assert_equal("purple", testStr)
  end

  # test symbolStr with card that has symbol 1(diamond)
  def test_symbolStr_diamond
    testCard = Card.new 1, 1, 1, 1, @index, @area
    testStr = testCard.symbol_str
    assert_equal("diamond", testStr)
  end

  # test symbolStr with card that has symbol 2(squiggle)
  def test_symbolStr_squiggle
    testCard = Card.new 1, 2, 1, 1, @index, @area
    testStr = testCard.symbol_str
    assert_equal("squiggle", testStr)
  end

  # test symbolStr with card that has symbol 3(oval)
  def test_symbolStr_oval
    testCard = Card.new 1, 3, 1, 1, @index, @area
    testStr = testCard.symbol_str
    assert_equal("oval", testStr)
  end

  # test shadingStr with card that has shading 1(open)
  def test_shadingStr_open
    testCard = Card.new 1, 1, 1, 1, @index, @area
    testStr = testCard.shading_str
    assert_equal("open", testStr)
  end

  # test shadingStr with card that has shading 2(dashed)
  def test_shadingStr_dashed
    testCard = Card.new 1, 1, 2, 1, @index, @area
    testStr = testCard.shading_str
    assert_equal("dashed", testStr)
  end

  # test shadingStr with card that has shading 3(solid)
  def test_shadingStr_solid
    testCard = Card.new 1, 1, 3, 1, @index, @area
    testStr = testCard.shading_str
    assert_equal("solid", testStr)
  end

  # test numberStr with card that has number 1
  def test_numberStr_1
    testCard = Card.new 1, 1, 1, 1, @index, @area
    testStr = testCard.number_str
    assert_equal("1", testStr)
  end

  # test numberStr with card that has number 2
  def test_numberStr_2
    testCard = Card.new 1, 1, 1, 2, @index, @area
    testStr = testCard.number_str
    assert_equal("2", testStr)
  end

  # test numberStr with card that has number 3
  def test_numberStr_3
    testCard = Card.new 1, 1, 1, 3, @index, @area
    testStr = testCard.number_str
    assert_equal("3", testStr)
  end

  # test toString with card that has color 1(red), symbol 1(diamond), shading 1(open), number 1(1)
  def test_toString_1111
    testCard = Card.new 1, 1, 1, 1, @index, @area
    testStr = testCard.to_string
    assert_equal("[red,diamond,open,1]", testStr)
  end

  # test toString with card that has color 2(green), symbol 2(squiggle), shading 2(dashed), number 2(2)
  def test_toString_2222
    testCard = Card.new 2, 2, 2, 2, @index, @area
    testStr = testCard.to_string
    assert_equal("[green,squiggle,dashed,2]", testStr)
  end

  # test toString with card that has color 3(purple), symbol 3(oval), shading 3(solid), number 3(3)
  def test_toString_3333
    testCard = Card.new 3, 3, 3, 3, @index, @area
    testStr = testCard.to_string
    assert_equal("[purple,oval,solid,3]", testStr)
  end

end