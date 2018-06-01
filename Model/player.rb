# Created by Jeb Alawi 5/23/18
# Implemented by Jeb Alawi 5/23/18 - All Functionality and nearly all comments
# Edited by Houyi Fan 5/26/18 - Complete comments and delete unused variable
# Edited by Bin Chen 5/29/18 - Change the constructor and adding getter and setter methods
# Edited by Houyi Fan 5/30/18 - Add the restart method
# Edited by Houyi Fan 5/30/18 - Change the constructor and restart method
# Edited by Jeb Alawi 5/30/18 - Added log to keep track of time winning_hands are selected
# Edited by Bin Chen 5/31/18 - Modified all the test cases because the change of deck.rb, added test cases for the restart method
require 'set'

require_relative 'area'
require_relative '../constants'

# Player class contains the information about the player
class Player
    include Constants

    attr_reader :name, :number, :area, :winning_hands
    attr_accessor :log, :attempt
    #@Author Jeb Alawi
    #@editedBy Houyi Fan
    #Constructor for Player class
    # name is the name of the player
    # WinningsHand contains the cards that have been identified as a part of set by the player successfully. And the number of cards in it will be the score of this player.
    def initialize (name, number)
        @name = name
        @number = number
        @area = Area.new PLAYER_AREA_X_START + number * (PLAYER_AREA_X_INDENT + PLAYER_AREA_SIZE_X), PLAYER_AREA_START_Y,
                         PLAYER_AREA_SIZE_X, PLAYER_AREA_SIZE_Y
        @winning_hands = []
        @log = []
        @attempt = 0
    end

    #@Author Jeb Alawi
    # returns player score
    # score = number of winning hands
    def score
        @winning_hands.length
    end

    #@Author Jeb Alawi
    # requires hand is a set of 3 Card objects
    # adds hand to winning hands
    def add_winning_hand(hand)
        @winning_hands.push(hand)
    end

    #@Author
    # Houyi Fan
    def restart
        @winning_hands = []
        @attempt = 0
    end

end