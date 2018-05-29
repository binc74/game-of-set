# Created by Bin Chen 5/29/18
# Edited by Bin Chen in 5/29/18 - implement the initialize, draw_players, draw_cards and draw methods

require 'gosu'

require_relative "Model/game"
require_relative "Model/deck"
require_relative "Model/card"
require_relative "Model/player"
require_relative "Model/area"
require_relative "consts"

# the view class is used to draw the graphics on the screen
class View
    def initialize(game)
        @game = game
        @font = Gosu::Font.new(20)  # the font size
    end


    # draw all the players
    def draw_players
        @game.listOfPlayers.each { |player|
            text_color = player.number == @game.currentPlayer ? Gosu::Color::RED : Gosu::Color::YELLOW

            # Draw the outer rectangle
            #Gosu.draw_rect player.area.x, player.area.y, player.area.width, player.area.height, Gosu::Color::GREEN

            # Write the Player Number
            @font.draw "#{player.name} (##{player.number + 1})", player.area.x + PLAYER_TEXT_INDENT_X,
                       player.area.y + PLAYER_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color

            # Write the Player Score
            @font.draw "SCORE: #{player.score}", player.area.x+ PLAYER_TEXT_INDENT_X,
                       player.area.y + 2 * PLAYER_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color
        }
    end


    # Get dealersHand from the game and draw it to the screen
    def draw_cards
        @game.dealersHand.each_index { |i|
            text_color = @game.cardChosen === i ? Gosu::Color::RED : Gosu::Color::BLACK
            card = @game.dealersHand[i]

            Gosu.draw_rect card.area.x, card.area.y, card.area.width, card.area.height, Gosu::Color::WHITE
            # Write the Color of the card
            @font.draw "#{card.colorStr}", card.area.x + CARD_TEXT_INDENT_X, card.area.y + 1 * CARD_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color

            # Write the Symbol of the card
            @font.draw "#{card.symbolStr}", card.area.x + CARD_TEXT_INDENT_X,
                       card.area.y + 2 * CARD_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color

            # Write the Shading of the card
            @font.draw "#{card.shadingStr}", card.area.x + CARD_TEXT_INDENT_X,
                       card.area.y + 3 * CARD_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color

            # Write the Number of the card
            @font.draw "#{card.numberStr}", card.area.x + CARD_TEXT_INDENT_X,
                       card.area.y + 4 * CARD_TEXT_INDENT_Y, 0, 1.0, 1.0, text_color
        }
    end


    # draw on the screen
    def draw
        draw_players
        draw_cards
        #@font.draw "Time: #{@game.time}", 600, 100, 0, 1.0, 1.0, Gosu::Color::RED
    end
end