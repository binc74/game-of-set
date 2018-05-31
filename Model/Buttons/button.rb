# Created by Bin Chen in 5/31/18
# Implemented by Bin Chen in 5/31/18 - implemented the constructor and execute method of button

# the button class that contains the function, text, and area of the button
class Button

  attr_accessor :text, :area

  def initialize(text, area, game)
    @text = text
    @area = area
    @game = game
  end

  # this method contains the functionality of the button
  #
  # Created by Bin Chen in 5/31/18
  def execute
    # do nothing
  end
end