# Created by Bin Chen 5/29/18
# Edited by Bin Chen in 5/29/18 - implement the initialize, draw_players, draw_cards and draw methods
# Edited by Houyi Fan in 5/29/18 - add the code that transfers each card to the corresponding image
# Edited by Houyi Fan in 5/30/18 - add draw_menu, draw_winner, draw_result_message and organize the timer code to draw_timer
# Edited by Jeb Alawi on 5/30/18 - added draw_last_set, draw_timer, made cards transparent when not selected and solid when selected
# Edited by Bin Chen in 5/31/18 - reorganize the graphics and add the draw_set_remain function
# Edited by Bin Chen in 5/31/18 - created a button class and refactor all the codes about buttons

require 'gosu'

require_relative "Model/game"
require_relative "Model/deck"
require_relative "Model/card"
require_relative "Model/player"
require_relative "Model/area"
require_relative "constants"

# the view class is used to draw the graphics on the screen
class View
  include Constants

  def initialize(game)
    @game = game
    @font_for_menu = Gosu::Font.new FONT_SIZE_MENU # the font size for menu
    @font_for_player = Gosu::Font.new FONT_SIZE_PLAYER # the font size for player and hint
    @font_for_others = Gosu::Font.new FONT_SIZE_OTHERS # font size for hint and other messages
  end


  # draw all the players
  def draw_players
    @game.player_list.each {|player|
      text_color = player.number == @game.current_player ? Gosu::Color::RED : Gosu::Color::YELLOW

      # Draw the outer rectangle
      # Gosu.draw_rect player.area.x, player.area.y, player.area.width, player.area.height, Gosu::Color::GREEN

      # Write the Player Number
      @font_for_player.draw "#{player.name} (##{player.number + 1})", player.area.x + PLAYER_TEXT_INDENT_X,
                            player.area.y + PLAYER_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color

      # Write the Player Score
      @font_for_player.draw "SCORE: #{player.score}", player.area.x + PLAYER_TEXT_INDENT_X,
                            player.area.y + 2 * PLAYER_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color

      # Write the Player Attempt
      @font_for_player.draw "Attempt: #{player.attempt}", player.area.x + PLAYER_TEXT_INDENT_X,
                            player.area.y + 3 * PLAYER_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color

      # Write a mark to indicate who is operating
      @font_for_player.draw "(Current)", player.area.x + PLAYER_TEXT_INDENT_X,
                            player.area.y + 4 * PLAYER_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color if player.number == @game.current_player
    }
  end


  # Get dealersHand from the game and draw it to the screen
  def draw_cards
    @game.dealers_hand.each_index {|i|
      #text_color = @game.cardChosen === i ? Gosu::Color::RED : Gosu::Color::BLACK
      card = @game.dealers_hand[i]

      # Draw a white rectangular to represent the card area
      # Gosu.draw_rect card.area.x, card.area.y, card.area.width, card.area.height, Gosu::Color::WHITE

      # Add corresponding image to each card
      image = Gosu::Image.new("Images/" + card.color_str + "_" + card.symbol_str + "_" + card.shading_str + "_" + card.number_str + ".PNG")
      color = @game.card_chosen.include?(i) ? Gosu::Color.argb(0xff_ffffff) : Gosu::Color.argb(0xaa_faffff) # make the color of vertices in image become white. In other words, making the image not in shadow
      image.draw_as_quad card.area.x, card.area.y, color, card.area.x + card.area.width, card.area.y, color, card.area.x, card.area.y + card.area.height, color, card.area.x + card.area.width, card.area.y + card.area.height, color, 0
      @font_for_player.draw i.to_s, card.area.x + CARD_INDEX_INDENT_X, card.area.y + CARD_INDEX_INDENT_Y, 0, 1.0, 1.0, Gosu::Color::YELLOW
    }
  end


  def draw_last_set
    @font_for_others.draw "Last Set Found: ", LAST_SET_TEXT_X, LAST_SET_TEXT_Y, 0, 1.0, 1.0, Gosu::Color::RED
    if @game.last_set.length == 0
      @font_for_others.draw "None", LAST_SET_TEXT_X, LAST_SET_Y, 0, 1.0, 1.0, Gosu::Color::RED
      return
    end
    @game.last_set.each_index {|i|
      card = @game.last_set[i]
      image = Gosu::Image.new("Images/" + card.color_str + "_" + card.symbol_str + "_" + card.shading_str + "_" + card.number_str + ".PNG")
      color = Gosu::Color.argb(0xff_ffffff) # make the color of vertices in image become white. In other words, making the image not in shadow
      image.draw_as_quad card.area.x, card.area.y, color, card.area.x + card.area.width, card.area.y, color, card.area.x, card.area.y + card.area.height, color, card.area.x + card.area.width, card.area.y + card.area.height, color, 0
    }
  end

  # draw the timer
  def draw_timer
    @font_for_others.draw "Time: #{(Time.now - @game.time).to_i}", TIME_X, TIME_Y, 0, 1.0, 1.0, Gosu::Color::RED
  end

  # draw the current winner
  def draw_winner
    @font_for_others.draw "Winner: #{if @game.has_end?@game.winner.name}", WINNER_X, WINNER_Y, 0, 1.0, 1.0, Gosu::Color::RED
  end

  # draw a game menu on the lower right corner of windows
  def draw_menu
    text_color = Gosu::Color::AQUA

    @game.buttons.each { |button|
      @font_for_menu.draw button.text, button.area.x, button.area.y, 0, 1.0, 1.0, text_color
    }
  end

  # draw the result message after a player attempts
  def draw_result_message
    text_color = Gosu::Color::YELLOW
    @font_for_player.draw @game.result_message(@game.result), MESSAGE_START_X, MESSAGE_START_Y, 0, 1.0, 1.0, text_color
  end

  # draw the sets remained in dealers hand
  def draw_set_remain
    @font_for_others.draw "Sets Remain: #{@game.get_set_num_dealers_hand}", SET_REMAIN_X, SET_REMAIN_Y, 0, 1.0, 1.0, Gosu::Color::RED
  end

  # draw on the screen
  def draw
    draw_players
    draw_cards
    draw_timer
    draw_menu
    draw_last_set
    draw_result_message
    draw_winner
    draw_set_remain
  end
end