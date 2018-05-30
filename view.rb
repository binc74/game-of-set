# Created by Bin Chen 5/29/18
# Edited by Bin Chen in 5/29/18 - implement the initialize, draw_players, draw_cards and draw methods
# Edited by Houyi Fan in 5/29/18 - add the code that transfers each card to the corresponding image

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
        @font = Gosu::Font.new(20)  # the font size
    end


    # draw all the players
    def draw_players
        @game.player_list.each { |player|
            text_color = player.number == @game.current_player ? Gosu::Color::RED : Gosu::Color::YELLOW

            # Draw the outer rectangle
            # Gosu.draw_rect player.area.x, player.area.y, player.area.width, player.area.height, Gosu::Color::GREEN

            # Write the Player Number
            @font.draw "#{player.name} (##{player.number + 1})", player.area.x + PLAYER_TEXT_INDENT_X,
                       player.area.y + PLAYER_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color

            # Write the Player Score
            @font.draw "SCORE: #{player.score}", player.area.x+ PLAYER_TEXT_INDENT_X,
                       player.area.y + 2 * PLAYER_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color

            @font.draw "(Current)", player.area.x+ PLAYER_TEXT_INDENT_X,
                       player.area.y + 3 * PLAYER_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color if player.number == @game.current_player
        }
    end


    # Get dealersHand from the game and draw it to the screen
    def draw_cards
        @game.dealers_hand.each_index { |i|
            #text_color = @game.cardChosen === i ? Gosu::Color::RED : Gosu::Color::BLACK
            card = @game.dealers_hand[i]

            # Draw a white rectangular to represent the card area
            # Gosu.draw_rect card.area.x, card.area.y, card.area.width, card.area.height, Gosu::Color::WHITE

            # Add corresponding image to each card
            image = Gosu::Image.new("Images/" + card.color_str + "_" + card.symbol_str + "_" + card.shading_str + "_" + card.number_str + ".PNG")
            color = @game.card_chosen.include?(i) ? Gosu::Color.argb(0xff_ffffff) : Gosu::Color.argb(0xaa_faffff) # make the color of vertices in image become white. In other words, making the image not in shadow
            image.draw_as_quad card.area.x, card.area.y, color, card.area.x + card.area.width, card.area.y, color, card.area.x, card.area.y + card.area.height, color, card.area.x + card.area.width, card.area.y + card.area.height, color, 0

        }
    end


    def draw_hint
        Gosu.draw_rect 550, 150, 150, 70, Gosu::Color::WHITE
        @font.draw "HINT?", 600,
                   175, 0, 1.0, 1.0, Gosu::Color::BLACK
    end

    # draw on the screen
    def draw
        draw_players
        draw_cards
        draw_hint
        #@font.draw "Time: #{@game.time}", 600, 100, 0, 1.0, 1.0, Gosu::Color::RED
    end
end