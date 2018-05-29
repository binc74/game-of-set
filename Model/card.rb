# Created by Josh Wright 5/23/18
# Implemented by Josh Wright 5/23/18 - All Functionality and comments for constructor
# Edited by Houyi Fan 5/26/18 - Complete comments and modify coding style
# Edited by Bin Chen 5/29/18 - change all static variables into class instance variables,adding the 4 getter
#                                methods that get the word version of the attributes of card

# Card class describes a single card which has 4 attributes (color, symbol, shading, number)
class Card
  # the getters and setters of this class
  attr_reader :color, :symbol, :shading, :number, :area

  # class variables that describes the possible attributes a single card can have
  @@Colors = %w(red green purple)
  @@Symbols = %w(diamond squiggle oval)
  @@Shadings = %w(open dashed solid)
  @@Numbers = %w(1 2 3)

  #Constructor method for Card class
  # color must be {(1)red,(2)green, or (3)purple} - pick one
  # symbol must be {(1)diamond, (2)squiggle, or (3)oval} - pick one
  # shading must be {(1)open,(2)dashed, or (3)solid} - pick one
  # number must be {1,2,or 3} - pick one
  def initialize (color, symbol, shading, number, area)
    @color = color
    @symbol = symbol
    @shading = shading
    @number = number
    @area = area
  end

  # getters that returns the word version of the attributes of card
  def colorStr; @@Colors[@color-1]; end
  def symbolStr; @@Symbols[@symbol-1]; end
  def shadingStr; @@Shadings[@shading-1] ; end
  def numberStr; @@Numbers[@number -1]; end

  # returns the string representation of the card
  def toString
    return  "[" + @@Colors[@color-1] + "," + @@Symbols[@symbol-1] + "," + @@Shadings[@shading-1] + "," + @@Numbers[@number -1] + "]"
  end

end