# Created by Bin Chen 6/1/18
# Modified by Bin Chen in 6/1/18 - adding two test cases for the is_in_area? method

require 'test/unit'

require_relative '../Model/area'
require_relative '../controller'

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @controller = Controller.new nil
  end

  # test if the location (x, y) is out of area
  def test_is_in_area_false
    area = Area.new(20, 20, 10,10)
    assert_equal false, @controller.is_in_area?(35, 35, area)
  end

  # test if the location (x, y) is in area
  def test_is_in_area_true
    area = Area.new(20, 20, 10,10)
    assert_equal true, @controller.is_in_area?(25, 25, area)
  end
end