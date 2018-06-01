# Created by Josh Wright 5/23/18
# Implemented by Josh Wright 5/23/18 - Basic Functionality
# Implemented by Bin Chen 5/24/18 - the method replace_cards
# Edited by Houyi Fan 5/24/18 - Add "attr_accessor" for instance variables to help test the methods in this class, Fix a bug in setLeftInDealersHand
# Edited by Houyi Fan 5/26/18 - Complete comments
# Edited by Bin Chen 5/29/18 - Change the constructor of this class, added get_card and update_player method
# Edited by Jeb Alawi 5/30/18 - Added update_set! and submit_set to allow game gui to be playable
# Edited by Houyi Fan 5/30/18 - Change the constructor and Add restart, shuffle, get_sum_dealers_hand to achieve the game function of selecting difficulty
# Edited by Houyi Fan 5/31/18 - Change the constructor and restart. Rewrite set_winner!, winner. Add same_score?, same_attempt, result_message. Modify submit_set. Achieve the function of determining the winner.
# Edited by Bin Chen 5/31/18 - refactor the initialize function, and add a list of buttons
# Edited by Josh Wright 5/31/18 - Organized methods into getter and setter, added difficulty_level method, and added documentation to methods.

require_relative "deck"
require_relative "card"
require_relative "player"
require_relative "area"
require_relative "../constants"
require_relative "Buttons/hint_button"
require_relative "Buttons/restart_button"

# Game class contains all operations and rules for the game
class Game
  include Constants

  attr_accessor :last_set, :player_list, :deck, :dealers_hand, :has_ended, :winner, :current_player, :card_chosen, :time,:result, :buttons # add getter and setter methods to help test the methods in this class

  @difficulty # a class instance variable to store the difficulty when restarting the game

  #    ----    Constructor method for Game class.    ----    #


  # @authors Josh Wright
  # @requires
  #   |player_names| > 0
  # @param
  #   player_names - a list that contains all players in the game
  # @param
  #   difficulty - the integer in the range 1..3 that indicates the difficulty level
  #
  # deck is the Deck used in the game. It has all cards that are not in dealersHand and winningsHand
  # dealersHand is the dealers hand list. It contains cards that are providing to players to judge currently. Initially it will have 12 cards
  # hasEned indicates if the game has ended
  # winner indicates who is the winner of the game
  # Constructor will push 12 cards from deck to dealers hand initially to start the game
  def initialize(player_names, difficulty)
    @player_list = player_names.map.with_index {|name, index| Player.new name, index}
    @difficulty = DIFFICULTY[difficulty.to_i - 1]
    @difficulty_level = difficulty.to_i
    @buttons = []
    add_buttons!
    restart
  end

  #    ----    Getter Methods    ----    #


  #Checks to make sure that there isn't a draw between two players when the game has ended
  # @Author Houyi Fan
  # @requires has_ended = true
  # @returns true if more than one max score player and false otherwise
  def same_score? (max_score_player)
    @draw_players = []
    count = 0
    @player_list.each do |player|
      if player.score == max_score_player.score
        count += 1
        @draw_players.push player
      end
    end
    count > 1
  end

  #Builds the dealers hand according to the difficulty level set by the player.
  # @Author Houyi Fan
  # @updates dealers_hand
  # @updates deck
  def get_dealers_hand_by_difficulty!
    shuffle
    num_set = get_set_num_dealers_hand
    until @difficulty.include? num_set
      shuffle
      num_set = get_set_num_dealers_hand
    end
  end

  def dealers_hand
    @dealers_hand
  end

  def player_list
    @player_list
  end
  #Checks to see if more than one player has the same number of attempts.
  # @author Houyi Fan
  # @param max_score_player
  #   the first instance of a player with the maximum score if there are multiple
  # @returns true if there are more than one player with the same number of attempts
  # as the max score player and false otherwise.
  def same_attempt?(max_score_player)
    @draw_players.each do |player|
      if player.attempt != max_score_player.attempt
        return false
      end
    end
    true
  end

  #Returns the winner of the game.
  # @author Josh Wright
  # @editedBy Houyi Fan
  # @requires has_ended = true
  # @returns the winner
  def winner
    return set_winner! if @player_list.length > 1
    return @player_list[0] if @player_list.length == 1
  end

  # Displays all cards in the dealers hand list on the console
  # Method not used for MVC
  # def display_cards
  #     @dealers_hand.length.times {|i| puts "Card ##{i}: " + @dealers_hand[i].to_string}
  # end

  # # Puts a hint on the console
  # method not used in MVC
  # def display_hint
  #     puts "Two cards of a set in the hand: #{get_hint}"
  # end

  # Checks if there is still a set in the dealer's hand
  # @author Josh Wright
  # @editedBy
  # @returns true if there is a set left in the dealer's hand and false otherwise
  def set_left_in_dealers_hand?
    set_left = false
    @dealers_hand.each {|card1|
      @dealers_hand.each {|card2|
        @dealers_hand.each {|card3|
          set_left = set_left || is_set?([card1, card2, card3]) if card1 != card2 && card2 != card3 && card1 != card3
        }
      }
    }
    set_left
  end

  #Returns the difficulty level.
  #@Author Josh Wright
  # @returns the integer value the user entered for a difficulty level
  def difficulty_level
    @difficulty_level
  end

  #Returns the index of a card in the dealer's hand.
  # @Author
  # @param
  #   card - the card we want to find in the dealer's hand
  # @returns the integer index of the card in the dealer's hand or nil if the card is not in the dealer's hand
  def index_of_card (card)
    @dealers_hand.length.times { |i|
      return i if card == dealers_hand[i]
    }
  end

  #Checks to see if the game has ended by the deck running out of cards and the dealer has less than three cards or
  # there is not a set left in the dealer's hand.
  # @Author Josh Wright
  # @returns true if |deck| == 0 and (|dealer_hand| < 3 or there is not a set left in the dealers hand)
  # and false otherwise
  def has_ended?
    if @deck.size == 0 && (@dealers_hand.length < 3  || !set_left_in_dealers_hand?)
      @has_ended = true
      @winner = set_winner!
    end
  end

  # Returns a list of three cards that make a set.
  # @Author Josh Wright
  # @returns a list 3 cards that make a set and nil otherwise
  def get_ans
    for card1 in @dealers_hand
      for card2 in @dealers_hand
        for card3 in @dealers_hand
          if card1 != card2 && card2 != card3 && card1 != card3 && is_set?([card1, card2, card3])
            return [card1, card2, card3]
            #return puts "\nCard ##{self.index_of_card card1}: " + card1.to_string + "\nCard ##{self.index_of_card card2}: " + card2.to_string + "\nCard ##{self.index_of_card card3}: " + card3.to_string
          end
        end
      end
    end
    #puts "No Set Available"
  end

  #Determines if 3 cards make a set.
  #@Author Josh Wright
  #@requires hand is a list of 3 cards and none of the cards in hand are the same card
  #@returns true if the hand makes a set and false otherwise
  def is_set?(hand)
    (set_color?(hand[0], hand[1], hand[2]) && set_symbol?(hand[0], hand[1], hand[2]) && set_shading?(hand[0], hand[1], hand[2]) && set_number?(hand[0], hand[1], hand[2]))
  end

  #Determines if 3 cards have the same color or 3 different colors.
  # @Author Josh Wright
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same color or 3 different colors and false otherwise
  def set_color?(card1, card2, card3)
    (card1.color == card2.color && card2.color == card3.color && card1.color == card3.color) || (card1.color != card2.color && card2.color != card3.color && card1.color != card3.color)
  end

  #Determines if 3 cards have the same symbol or 3 different symbols.
  # @Author Josh Wright
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same symbol or 3 different symbols and false otherwise
  def set_symbol?(card1, card2, card3)
    card1.symbol == card2.symbol && card2.symbol == card3.symbol && card1.symbol == card3.symbol || (card1.symbol != card2.symbol && card2.symbol != card3.symbol && card1.symbol != card3.symbol)
  end

  #Determines if 3 cards have the same shading or 3 different shadings
  # @Author Josh Wright
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same shading or 3 different shadings and false otherwise
  def set_shading?(card1, card2, card3)
    card1.shading == card2.shading && card2.shading == card3.shading && card1.shading == card3.shading || (card1.shading != card2.shading && card2.shading != card3.shading && card1.shading != card3.shading)
  end

  #Determines if 3 cards have the same number or 3 different numbers
  # @Author Josh Wright
  # @requires card1 != card2 != card3
  # @returns true if all 3 cards have same number or 3 different numbers and false otherwise
  def set_number?(card1, card2, card3)
    card1.number == card2.number && card2.number == card3.number && card1.number == card3.number || (card1.number != card2.number && card2.number != card3.number && card1.number != card3.number)
  end

  #??? What is this method used for???
  def check_set?(b1, b2, b3)
    b1 == b2 && b2 == b3 || (b1 != b2 && b2 != b3)
  end

  # Gets the card object ???
  # @Author
  # @returns
  def get_card(content, position)
    Card.new *content, position,
             Area.new(CARD_START_X + (position % CARD_EACH_ROW) * (CARD_SIZE_X + CARD_INDENT_X),
                      CARD_START_Y + (position / CARD_EACH_ROW) * (CARD_SIZE_Y + CARD_INDENT_Y), CARD_SIZE_X, CARD_SIZE_Y)
  end


    # returns a message after a players attempted move
    def result_message (result)
      # using if-else block to avoid nested ternary operators
      if @has_chosen
        result ? "This is a Set": "This is not a Set"
      else
        ""
      end
      # @has_chosen ? (result ? "This is a Set": "This is not a Set") : ""
    end
  

  def ended?
    @has_ended
  end

  #    ----    Setter Methods    ----    #

  # add buttons the @buttons
  def add_buttons!
    @buttons << HintButton.new(Area.new(HINT_BUTTON_START_X, HINT_BUTTON_START_Y, HINT_BUTTON_SIZE_X, HINT_BUTTON_SIZE_Y), self)
    @buttons << RestartButton.new(Area.new(RESTART_BUTTON_START_X, RESTART_BUTTON_START_Y, RESTART_BUTTON_SIZE_X, RESTART_BUTTON_SIZE_Y), self)
  end

  # @Authors Houyi Fan, Josh Wright
  # restart the game
  def restart
    @deck = Deck.new
    @dealers_hand = []
    @has_ended = false
    @winner = nil
    get_dealers_hand_by_difficulty!
    @current_player = 0
    @card_chosen = Set[]
    @time = Time.now
    @last_set = []
    @result = false
    @has_chosen = false
    @draw_players = []
  end

  # Determine the winner of the game
  # Finds the winner with the highest score, if there are more than one player having the same score, we compare the
  # number of attempts each player has made. If no player has ever made an attempt or  more than one player has the
  # same score and same attempt number, then there is no winner
  # @Author Houyi Fan
  # @requires player_list.length > 0
  def set_winner!
    # if any player has ever attempted, then we begin to find the current winner
    if @has_chosen
      # find the player with the highest score
      max_score_player = @player_list[0]
      @player_list.each do |player|
        max_score_player = player if max_score_player.score < player.score
      end
      # if the highest score player has score 0, then there is no winner
      if max_score_player.score == 0
        @winner = Player.new"No winner", 0
      else
        # if the highest score player has score more than 0, we try to find if there are other players having the same score
        if same_score? max_score_player
          # we delete those max score players who have larger number of attempts
          @player_list.each do |player|
            if max_score_player.score == player.score && max_score_player.attempt > player.attempt
              @draw_players.delete max_score_player
              max_score_player = player
            end
          end
          # After delete, if there is only one player left, then this player is the winner
          if @draw_players.length == 1
            @winner = @draw_players[0]
          elsif same_attempt? max_score_player      # if there are more than one player left, we see if they have same number of attempts
            @winner = Player.new"No winner", 0    # if they have same number of attempts, then there is no winner
          else  #if they don't same number of attempts, we find the winner who has the least number of attempts
            max_score_min_attempt_player = max_score_player
            @draw_players.each{|player| max_score_min_attempt_player = player if max_score_min_attempt_player.attempt > player.attempt}
            @winner = max_score_min_attempt_player
          end
        else #if there's only one player who has the max score, then this player is the winner
          @winner = max_score_player
        end
      end
    else #if no player has ever attempted, then there is no player
      @winner = Player.new"No winner", 0
    end
    @winner   #return the winner
  end

  # Resets the dealers hand
  # @Author Josh Wright
  # @updates dealers_hand
  # @updates deck
  def reset_hand
    while @dealers_hand.length > 0
      @deck.add! @dealers_hand.pop
    end
    replenish_hand!
  end

  # Replaces the card at cards_index in the dealer's hand.
  # @Author Bin Chen
  # @editedBy Josh Wright
  # @param
  #   cards_index - the index of cards to be removed
  def replace_cards(cards_index)
    #cards_index.each {|index|  @dealersHand[index] = @deck.remove!}
    for i in cards_index
      if @deck.size > 0
        @dealers_hand[i] = Card.new *@deck.remove!, @dealers_hand[i].index, @dealers_hand[i].area
      else
        @dealers_hand.delete_at i
      end
    end
  end

  #Replenishes the dealers hand each time a player finds a set.
  # @Author Josh Wright
  # @editedBy
  # @updates dealersHand
  def replenish_hand!
    while @dealers_hand.length < 12 && @deck.size > 0
      @dealers_hand << @deck.remove!
    end
  end

  # Updates the @currentPlayer using the game controls.
  # @Author
  # @updates current_player
  def update_player!(player)
    if @current_player != player.number
      print "Player switched from " + @player_list[@current_player].name
      @current_player = player.number
      puts " to " + player.name
    end
  end


  #Updates the cards that are being selected to form a set.
  # @Author Jeb Alawi
  # @updates card_chosen
  # updates @card_chosen, adds cards to array when clicked, removes them when unclicked, submits cards when three are selected
  def update_set!(i)
    if @card_chosen.include?(i)
      @card_chosen.delete(i)
    elsif @card_chosen.size < 3
      @card_chosen.add(i)
    end
    if @card_chosen.length == 3
      submit_set @card_chosen
    end
  end


  #Submits three cards to try to make a set
  # @Author Jeb Alawi
  #
  # adds attempt to player, checks if cards make a set, replaces set in dealers hand, logs winning hand to player as well as time hand was submitted,
  # displays last set of cards selected
  def submit_set card_set_index
    @has_chosen = true
    card_set_arr = card_set_index.to_a
    card_set_arr = [@dealers_hand[card_set_arr[0]],@dealers_hand[card_set_arr[1]],@dealers_hand[card_set_arr[2]]]
    player_list[current_player].attempt += 1
    if is_set? card_set_arr
      @result = true
      #print "This is a Set\n"
      replace_cards(card_set_index.to_a)
      player_list[current_player].add_winning_hand card_set_arr
      player_list[current_player].log.push((Time.now-time).to_i)

      #puts player_list[current_player].score
      #puts player_list[current_player].log[0]
      @last_set = card_set_arr
      last_set_0_area = Area.new LAST_SET_0_X,LAST_SET_Y, CARD_SIZE_X, CARD_SIZE_Y
      last_set_1_area = Area.new LAST_SET_1_X,LAST_SET_Y, CARD_SIZE_X, CARD_SIZE_Y
      last_set_2_area = Area.new LAST_SET_2_X,LAST_SET_Y, CARD_SIZE_X, CARD_SIZE_Y
      card_set_arr[0].area = last_set_0_area
      card_set_arr[1].area = last_set_1_area
      card_set_arr[2].area = last_set_2_area
      3.times{|i| @last_set[i] = card_set_arr[i]}
      @card_chosen = Set[]
    else
      @result = false
      #print "This is not a Set\n"
      @card_chosen = Set[]
    end
  end

  #Shuffles the cards and rebuilds the dealer's hand
  # @Authors Houyi Fan
  # @replaces deck
  # @replaces dealers_hand
  def shuffle
    @deck = Deck.new
    @dealers_hand = []
    12.times {|pos| @dealers_hand << get_card(@deck.remove!, pos)}
  end


  # returns the possible number of set in the dealers hand
  # @Authors Houyi Fan
  def get_set_num_dealers_hand
    set_num = 0
    for card1 in @dealers_hand
      for card2 in @dealers_hand
        for card3 in @dealers_hand
          if card1 != card2 && card2 != card3 && card1 != card3 && is_set?([card1, card2, card3])
            set_num += 1
          end
        end
      end
    end
    set_num
  end
end


