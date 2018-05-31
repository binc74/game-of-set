# Created by Bin Chen in 5/31/18
# Implemented by Bin Chen in 5/31/18 - implemented the constructor and execute method of button

require_relative 'button'

# the restart button that inherit from the button class
class RestartButton < Button
  def initialize(area, game)
    super 'Restart', area, game
  end

  # restart the game
  def execute
    @game.restart
    @game.player_list.each {|player| player.restart}
  end
end