# Created by Bin Chen in 5/29
# Bin Chen added the const for player graphics and card graphics in 5/29
# Jeb Alawi added const for answer button, timer 5/30
# Houyi Fan added const for restart button, difficulty, hint button, result message, current winner 5/30

# this module stores all the constants that needed for this project
module Constants
    # Constants for window size
    WINDOW_HEIGHT = 650
    WINDOW_WIDTH = 840

    # Constants for player graphics
    PLAYER_AREA_X_START = 15
    PLAYER_AREA_X_INDENT = 15
    PLAYER_AREA_SIZE_X = 120
    PLAYER_AREA_SIZE_Y = 70
    PLAYER_AREA_START_Y = 490
    PLAYER_TEXT_INDENT_X = 10
    PLAYER_TEXT_INDENT_Y = 15

    # Constants for card graphics
    CARD_EACH_ROW = 4
    CARD_START_X = 15
    CARD_START_Y = 50
    CARD_INDENT_X = 35
    CARD_INDENT_Y = 30
    CARD_SIZE_X = 100
    CARD_SIZE_Y = 110
    CARD_TEXT_INDENT_X = 30
    CARD_TEXT_INDENT_Y = 20

    LAST_SET_Y = 225
    LAST_SET_0_X = 535
    LAST_SET_1_X = 535 + CARD_SIZE_X
    LAST_SET_2_X = 535 + 2*CARD_SIZE_X

    # Constants for result message
    MESSAGE_START_X = 15
    MESSAGE_START_Y = 630

    # Constants for Answer button
    ANS_BOX_X = 550
    ANS_BOX_Y = 150
    ANS_BOX_WIDTH = 150
    ANS_BOX_HEIGHT = 70
    ANS_FONT_X = 600
    ANS_FONT_Y = 175

    # Constants for Timer
    TIME_X = 600
    TIME_Y = 100

    # Constants for CurrentWinner
    WINNER_X = 600
    WINNER_Y = 150

    # Constants for Restart button
    RESTART_BUTTON_START_X = 650
    RESTART_BUTTON_START_Y = 440
    RESTART_BUTTON_SIZE_X = 180
    RESTART_BUTTON_SIZE_Y = 35
    # BUTTON_INDENT_X = 0
    # BUTTON_INDENT_Y = 50
    HINT_BUTTON_START_X = 650
    HINT_BUTTON_START_Y = 525
    HINT_BUTTON_SIZE_X = 80
    HINT_BUTTON_SIZE_Y = 35

    # Constant ranges for difficulty for game
    DIFFICULTY = [29..42, 15..28, 0..14]

end