# Created by Josh Wright 5/23/18
# Implemented by Josh Wright 5/23/18 - All Functionality and comments for constructor
# Edited by Houyi Fan 5/26/18 - Complete comments and modify coding style
# Edited by Bin Chen 5/29/18 - change all static variables into class instance variables,adding the 4 getter
#                                methods that get the word version of the attributes of card

# Card class describes a single card which has 4 attributes (color, symbol, shading, number)
class Card
  # the getters and setters of this class
  attr_reader :color, :symbol, :shading, :number
  attr_accessor :area, :index

  # class variables that describes the possible attributes a single card can have
  @@colors = %w(red green purple)
  @@symbols = %w(diamond squiggle oval)
  @@shadings = %w(open dashed solid)
  @@numbers = %w(1 2 3)

  #Constructor method for Card class
  # color must be {(1)red,(2)green, or (3)purple} - pick one
  # symbol must be {(1)diamond, (2)squiggle, or (3)oval} - pick one
  # shading must be {(1)open,(2)dashed, or (3)solid} - pick one
  # number must be {1,2,or 3} - pick one
  # area is the area of the card
  def initialize (color, symbol, shading, number, index, area)
    @color = color
    @symbol = symbol
    @shading = shading
    @number = number
    @index = index
    @area = area
  end

  # getters that returns the word version of the attributes of card
  def color_str; @@colors[@color-1]; end
  def symbol_str; @@symbols[@symbol-1]; end
  def shading_str; @@shadings[@shading-1] ; end
  def number_str; @@numbers[@number -1]; end

  # returns the string representation of the card
  def to_string
    "[" + @@colors[@color-1] + "," + @@symbols[@symbol-1] + "," + @@shadings[@shading-1] + "," + @@numbers[@number -1] + "]"
  end

end