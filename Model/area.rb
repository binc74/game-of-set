# Created and implemented by Bin Chen 5/29/18

# a data class that hold the x, y, width and height of a rectangle
# the coordinate (x, y) represents the top-left of the rectangle area
class Area
    attr_accessor :x, :y, :width, :height

    def initialize(x, y, width, height)
        @x = x
        @y = y
        @width = width
        @height = height
    end
end