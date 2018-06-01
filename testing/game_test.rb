# Created by Josh Wright 5/23/18
# Implemented by Josh Wright 5/23/18 - Test Plan for isSet
# Implemented by Houyi Fan 5/24/18 - Test Plan for other methods except isSet. Add documentation for each test case.
# Edited by Houyi Fan 5/27/18 - Fix a wrong test case
# Edited by Jeb Alawi 5/28/18 - Added test cases
# Edited by Bin Chen 6/1/18 - modified all test cases in game_test because of the change of constructor in other classes

require_relative "../Model/game"
require 'test/unit'

class GameTest < Test::Unit::TestCase
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Since we don't need index and area in these tests, just set them a value
    @index = 0
    @area = Area.new 0, 0, 0, 0
  end

  # Written by: Jeb Alawi
  # listOfPlayers
  def test_list_player
    bob = Player.new("Bob", 0)
    ross = Player.new("Ross", 0)
    game = Game.new([bob, ross], 1)
    playerList= game.player_list
    assert_equal(2,playerList.length)
  end

  # Written by: Jeb Alawi
  # resetHand
  def test_reset_hand
    bob = Player.new("Bob", 0)
    ross = Player.new("Ross", 0)
    game = Game.new([bob, ross], 1)

    #check that no card is the same in dealers hand
    (0..game.dealers_hand.length).each { |i|
      ((i + 1)..game.dealers_hand.length).each { |j|
        assert_equal false, game.dealers_hand[i] == game.dealers_hand[j]
      }
    }
  end
  

  # @author Jeb Alawi
  # replace cards
  def test_replace_cards
    testGame = Game.new(["Fan"], 1)
    testGame.dealers_hand[0] = Card.new(1,1,1,1, 0, @area)
    c1 = testGame.dealers_hand[0]
    testGame.dealers_hand[1] = Card.new(1,1,1,2, 1, @area)
    c2 = testGame.dealers_hand[1]
    testGame.dealers_hand[2] = Card.new(1,1,1,3, 2, @area)
    c3 = testGame.dealers_hand[2]
    testGame.replace_cards [0,1,2]
    assert_equal(false,c1 == testGame.dealers_hand[0])
    assert_equal(false,c2 == testGame.dealers_hand[1])
    assert_equal(false,c3 == testGame.dealers_hand[2])
    assert_equal(12, testGame.dealers_hand.length)

  end

  # replenish hand
  def test_replenish_hand
    testGame = Game.new(["Fan"], 1)
    testGame.replenish_hand!
    assert_equal(12, testGame.dealers_hand.length)
  end

  # @author Jeb Alawi
  # update player
  def test_update_player
    testGame = Game.new(%w("Fan", "Ran"), 1)
    assert_equal(0, testGame.current_player)
    testGame.update_player! testGame.player_list[1]
    assert_equal(1, testGame.current_player)
  end

  # @author Jeb Alawi
  # update player to same player
  def test_update_player_same_player
    testGame = Game.new(%w("Fan", "Ran"), 1)
    assert_equal(0, testGame.current_player)
    testGame.update_player! testGame.player_list[0]
    assert_equal(0, testGame.current_player)
  end

  # @author Jeb Alawi
  # update set with one card
  def test_update_set!
    testGame = Game.new(["Fan"], 1)
    testGame.update_set!(1)
    assert_equal(1,testGame.card_chosen.length)
  end

  # @author Jeb Alawi
  # update set with two cards
  def test_update_set2
    testGame = Game.new(["Fan"], 1)
    testGame.update_set!(1)
    testGame.update_set!(2)
    assert_equal(2,testGame.card_chosen.length)
  end

  # @author Jeb Alawi
  # update set with three cards
  def test_update_set3
    testGame = Game.new(["Fan"], 1)
    testGame.update_set!(1)
    testGame.update_set!(2)
    testGame.update_set!(3)
    assert_equal(0,testGame.card_chosen.length)
  end

  # @author Jeb Alawi
  # submit set when there is a set
  def test_submit_set
    testGame = Game.new(["Fan"], 1)
    testGame.dealers_hand[0] = Card.new(1,1,1,1, 0, @area)
    c1 = testGame.dealers_hand[0]
    testGame.dealers_hand[1] = Card.new(1,1,1,2, 1, @area)
    c2 = testGame.dealers_hand[1]
    testGame.dealers_hand[2] = Card.new(1,1,1,3, 2, @area)
    c3 = testGame.dealers_hand[2]
    card_set = Set[0,1,2]
    testGame.submit_set(card_set)
    assert_equal(1,testGame.player_list[0].attempt)
    assert_equal(1,testGame.player_list[0].winning_hands.length)
    assert_equal(1,testGame.player_list[0].log.length)
    assert_equal(3,testGame.last_set.length)
    assert_equal(0,testGame.card_chosen.length)
    assert_equal(false,c1 == testGame.dealers_hand[0])
    assert_equal(false,c2 == testGame.dealers_hand[1])
    assert_equal(false,c3 == testGame.dealers_hand[2])
  end

  # @author Jeb Alawi
  # submit set when there is not a set
  def test_submit_set_no_set
    testGame = Game.new(["Fan"], 1)
    testGame.dealers_hand[0] = Card.new(1,2,1,1, 0, @area)
    c1 = testGame.dealers_hand[0]
    testGame.dealers_hand[1] = Card.new(1,2,2,2, 1, @area)
    c2 = testGame.dealers_hand[1]
    testGame.dealers_hand[2] = Card.new(3,3,3,3, 2, @area)
    c3 = testGame.dealers_hand[2]
    card_set = Set[0,1,2]
    testGame.submit_set(card_set)
    assert_equal(1,testGame.player_list[0].attempt)
    assert_equal(0,testGame.player_list[0].winning_hands.length)
    assert_equal(0,testGame.player_list[0].log.length)
    assert_equal(0,testGame.last_set.length)
    assert_equal(0,testGame.card_chosen.length)
    assert_equal(true,c1 == testGame.dealers_hand[0])
    assert_equal(true,c2 == testGame.dealers_hand[1])
    assert_equal(true,c3 == testGame.dealers_hand[2])
  end

  # @author Jeb Alawi
  # shuffle
  def test_shuffle
    testGame = Game.new(["Fan"], 1)
    testGame.shuffle
    assert_equal(12, testGame.dealers_hand.length)
  end


  # test for constructor with one player
  def test_constructor_one_player
    testGame = Game.new(["Fan"], 1)
    assert_equal(1, testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal("Fan", testGame.winner.name)
  end


  # test for isSet when it is true
  def test_is_set_true
    testGame = Game.new([], 1)
    card1 = Card.new(1,1,1,1, @index, @area)
    card2 = Card.new(2,2,2,2, @index, @area)
    card3 = Card.new(3,3,3,3, @index, @area)
    assert_equal(true,testGame.is_set?([card1,card2,card3]))
  end

  # test for isSet when it is false
  def test_is_set_false
    testGame = Game.new([],1)
    card1 = Card.new(1,2,1,1, @index, @area)
    card2 = Card.new(1,2,2,2, @index, @area)
    card3 = Card.new(3,3,3,3, @index, @area)
    assert_equal(false,testGame.is_set?([card1,card2,card3]))
  end

  # Another test for isSet when it is true
  def test_is_set_true2
    testGame = Game.new([],1)
    card1 = Card.new(1,1,2,3, @index, @area)
    card2 = Card.new(1,2,2,2, @index, @area)
    card3 = Card.new(1,3,2,1, @index, @area)
    assert_equal(true,testGame.is_set?([card1,card2,card3]))
  end

  # test for setColor when it is true
  def test_set_color_true
    testGame = Game.new([],1)
    card1 = Card.new(1,1,2,3, @index, @area)
    card2 = Card.new(1,3,1,2, @index, @area)
    card3 = Card.new(1,3,2,1, @index, @area)
    assert_equal(true, testGame.set_color?(card1,card2,card3))
  end

  # test for setColor when it is false
  def test_set_color_false
    testGame = Game.new([],1)
    card1 = Card.new(2,1,2,3, @index, @area)
    card2 = Card.new(1,3,1,2, @index, @area)
    card3 = Card.new(1,3,2,1, @index, @area)
    assert_equal(false, testGame.set_color?(card1,card2,card3))
  end

  # test for setSymbol when it is true
  def test_set_symbol_true
    testGame = Game.new([],1)
    card1 = Card.new(2,3,2,3, @index, @area)
    card2 = Card.new(1,3,1,2, @index, @area)
    card3 = Card.new(1,3,2,1, @index, @area)
    assert_equal(true, testGame.set_symbol?(card1,card2,card3))
  end

  # test for setSymbol when it is false
  def test_set_symbol_false
    testGame = Game.new([],1)
    card1 = Card.new(2,1,2,3, @index, @area)
    card2 = Card.new(1,1,1,2, @index, @area)
    card3 = Card.new(1,3,2,1, @index, @area)
    assert_equal(false, testGame.set_symbol?(card1,card2,card3))
  end

  # test for setShading when it is true
  def test_set_shading_true
    testGame = Game.new([],1)
    card1 = Card.new(2,3,2,3, @index, @area)
    card2 = Card.new(1,3,2,2, @index, @area)
    card3 = Card.new(1,3,2,1, @index, @area)
    assert_equal(true, testGame.set_shading?(card1,card2,card3))
  end

  # test for setShading when it is false
  def test_set_shading_false
    testGame = Game.new([],1)
    card1 = Card.new(2,3,2,3, @index, @area)
    card2 = Card.new(1,3,2,2, @index, @area)
    card3 = Card.new(1,3,3,1, @index, @area)
    assert_equal(false, testGame.set_shading?(card1,card2,card3))
  end

  # test for setNumber when it is true
  def test_set_number_true
    testGame = Game.new([],1)
    card1 = Card.new(2,3,1,3, @index, @area)
    card2 = Card.new(1,3,2,3, @index, @area)
    card3 = Card.new(1,3,3,3, @index, @area)
    assert_equal(true, testGame.set_number?(card1,card2,card3))
  end

  # test setNumber when it is false
  def test_set_number_false
    testGame = Game.new([],1)
    card1 = Card.new(2,3,1,2, @index, @area)
    card2 = Card.new(1,3,2,2, @index, @area)
    card3 = Card.new(1,3,3,3, @index, @area)
    assert_equal(false, testGame.set_number?(card1,card2,card3))
  end

end