class Card
  #Constructor method for Card class
  # color must be {(1)red,(2)green, or (3)purple} - pick one
  # symbol must be {(1)diamond, (2)squiggle, or (3)oval} - pick one
  # shading must be {(1)open,(2)dashed, or (3)solid} - pick one
  # number must be {1,2,or 3} - pick one
  # Created by Josh Wright
  @@Colors = ["red", "green","purple"]
  @@Symbols = ["diamond", "squiggle","oval"]
  @@Shadings = ["open", "dashed","solid"]
  @@Numbers = ["1", "2" ,"3"]
  def initialize (color, symbol, shading, number)
    @color = color
    @symbol = symbol
    @shading = shading
    @number = number
  end

  def color()
    return @color
  end
  def symbol()
    return @symbol
  end
  def shading()
    return @shading
  end
  def number()
    return @number
  end
  def toString ()
    return  "[" + @@Colors[@color-1] + "," + @@Symbols[@symbol-1] + "," + @@Shadings[@shading-1] + "," + @@Numbers[@number -1] + "]"
  end
end