# Created by Jeb Alawi 5/23/18
# Implemented by Jeb Alawi 5/23/18 - All Functionality and nearly all comments
# Edited by Houyi Fan 5/26/18 - Complete comments and delete unused variable
# Edited by Bin Chen 5/29/18 - Change the constructor and adding getter and setter methods
require 'set'

require_relative 'area'
require_relative '../constants'

# Player class contains the information about the player
class Player
    include Constants

    attr_reader :name, :number, :area
    #Constructor for Player class
    # name is the name of the player
    # WinningsHand contains the cards that have been identified as a part of set by the player successfully. And the number of cards in it will be the score of this player.
    def initialize (name, number)
        @name = name
        @number = number
        @area = Area.new PLAYER_AREA_X_START + number * (PLAYER_AREA_X_INDENT + PLAYER_AREA_SIZE_X), PLAYER_AREA_START_Y,
                         PLAYER_AREA_SIZE_X, PLAYER_AREA_SIZE_Y
        @winning_hands = Set[]
    end

    # returns player score
    # score = number of winning hands
    def score
        @winning_hands.length
    end

    # requires hand is a set of 3 Card objects
    # adds hand to winning hands
    def add_winning_hand(hand)
        @winning_hands.add(hand)
    end

end