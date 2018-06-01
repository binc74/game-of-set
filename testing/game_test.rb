# Created by Josh Wright 5/23/18
# Implemented by Josh Wright 5/23/18 - Test Plan for isSet
# Implemented by Houyi Fan 5/24/18 - Test Plan for other methods except isSet. Add documentation for each test case.
# Edited by Houyi Fan 5/27/18 - Fix a wrong test case
# Edited by Jeb Alawi 5/28/18 - Added test cases

require_relative "../Model/game"
require_relative "../Model/deck"
require_relative "../Model/card"
require_relative "../Model/player"
require 'test/unit'

class GameTest < Test::Unit::TestCase
  # test for constructor with one player and level 1 difficulty
  def test_constructor_one_players_diff1
    testGame = Game.new(["Josh"], 1)
    assert_equal(1,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(1,testGame.difficulty_level)
  end

  def test_constructor_one_players_diff2
    testGame = Game.new(["Josh"], 2)
    assert_equal(1,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(2,testGame.difficulty_level)
  end

  def test_constructor_one_players_diff3
    testGame = Game.new(["Josh"], 3)
    assert_equal(1,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(3,testGame.difficulty_level)
  end

  # test for constructor with two players and level 1 difficulty
  def test_constructor_two_players_diff1
    testGame = Game.new(["Josh", "Fan"], 1)
    assert_equal(2,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(1,testGame.difficulty_level)
  end

  # test for constructor with two players and level 2 difficulty
  def test_constructor_two_players_diff2
    testGame = Game.new(["Josh", "Fan"], 2)
    assert_equal(2,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(2,testGame.difficulty_level)
  end

  # test for constructor with two players and level 3 difficulty
  def test_constructor_two_players_diff3
    testGame = Game.new(["Josh", "Fan"], 3)
    assert_equal(2,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(3,testGame.difficulty_level)
  end

  # test for constructor with three players and level 1 difficulty
  def test_constructor_three_players_diff1
    testGame = Game.new(["Josh", "Fan", "Bin"], 1)
    assert_equal(3,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(1,testGame.difficulty_level)
  end

  # test for constructor with three players and level 2 difficulty
  def test_constructor_three_players_diff2
    testGame = Game.new(["Josh", "Fan", "Bin"], 2)
    assert_equal(3,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(2,testGame.difficulty_level)
  end

  # test for constructor with three players and level 3 difficulty
  def test_constructor_three_players_diff3
    testGame = Game.new(["Josh", "Fan", "Bin"], 3)
    assert_equal(3,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(3,testGame.difficulty_level)
  end

  # test for constructor with four players and level 1 difficulty
  def test_constructor_four_players_diff1
    testGame = Game.new(["Josh", "Fan", "Bin", "Jeb"], 1)
    assert_equal(4,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(1,testGame.difficulty_level)
  end

  # test for constructor with four players and level 2 difficulty
  def test_constructor_four_players_diff2
    testGame = Game.new(["Josh", "Fan", "Bin", "Jeb"], 2)
    assert_equal(4,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(2,testGame.difficulty_level)
  end

  # test for constructor with four players and level 3 difficulty
  def test_constructor_four_players_diff3
    testGame = Game.new(["Josh", "Fan", "Bin", "Jeb"], 3)
    assert_equal(4,testGame.player_list.size)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealers_hand.length)
    assert_equal(false, testGame.ended?)
    assert_equal(3,testGame.difficulty_level)
  end


  #
  # # test for constructor with one player and level 2 difficulty
  # def test_constructor_one_player_diff2
  #   testGame = Game.new(["Fan"], 2)
  #   assert_equal([{Player.new("Fan",0) => 0}], testGame.player_list)
  #   assert_equal(69, testGame.deck.size)
  #   assert_equal(12, testGame.dealersHand.length)
  #   assert_equal(false, testGame.hasEnded)
  #   assert_equal(nil, testGame.winner)
  # end
  #
  # # test for constructor with one player and level 3 difficulty
  # def test_constructor_one_player_diff3
  #   testGame = Game.new(["Fan", 3])
  #   assert_equal(["Fan"], testGame.listOfPlayers)
  #   assert_equal(69, testGame.deck.size)
  #   assert_equal(12, testGame.dealersHand.length)
  #   assert_equal(false, testGame.hasEnded)
  #   assert_equal(nil, testGame.winner)
  # end
  #
  # # test for constructor with no player
  # def test_constructor_two_players_diff1
  #   testGame = Game.new(["Josh"], 1)
  #   assert_equal([], testGame.listOfPlayers)
  #   assert_equal(69, testGame.deck.size)
  #   assert_equal(12, testGame.dealersHand.length)
  #   assert_equal(false, testGame.hasEnded)
  #   assert_equal(nil, testGame.winner)
  # end
  #
  # # test for constructor with one player
  # def test_constructor_two_player_diff2
  #   testGame = Game.new(["Fan"])
  #   assert_equal(["Fan"], testGame.listOfPlayers)
  #   assert_equal(69, testGame.deck.size)
  #   assert_equal(12, testGame.dealersHand.length)
  #   assert_equal(false, testGame.hasEnded)
  #   assert_equal(nil, testGame.winner)
  # end
  #
  # # Written by: Jeb Alawi
  # # setWinner
  # def test_setWinner
  #   bob = Player.new("Bob")
  #   ross = Player.new("Ross")
  #   game = Game.new([bob, ross])
  #   card1 = Card.new(1,1,1,1)
  #   hand1 = [card1, card1, card1]
  #   bob.addWinningHand(hand1)
  #   winner = game.setWinner
  #   assert_equal("Bob", winner.name)
  # end
  #
  # # winner
  #
  # # Written by: Jeb Alawi
  # # listOfPlayers
  # def test_listOfPlayers
  #   bob = Player.new("Bob")
  #   ross = Player.new("Ross")
  #   game = Game.new([bob, ross])
  #   playerList= game.listOfPlayers
  #   assert_equal(2,playerList.length)
  # end
  #
  # # Written by: Jeb Alawi
  # # resetHand
  # def test_resetHand
  #   bob = Player.new("Bob")
  #   ross = Player.new("Ross")
  #   game = Game.new([bob, ross])
  #   game.replenishHand!
  #   #check that no card is the same in dealers hand
  # end
  #
  # # display_cards??
  #
  #
  # # displayHint??
  #
  #
  # # indexOfCard
  #
  #
  # # hasEnded
  #
  #
  # # get_end
  #
  #
  # # replace_cards
  #
  #
  # # Written by: Jeb Alawi
  # # replenishHand
  # def test_replenishHand
  #   bob = Player.new("Bob")
  #   ross = Player.new("Ross")
  #   game = Game.new([bob, ross])
  #   assert_equal(12,game.getDealersHand.length)
  #   game.replenishHand!
  #   assert_equal(12,game.getDealersHand.length)
  #   #check that no card is the same in dealers hand
  # end
  #
  #
  #
  # # test for getDealersHand
  # def test_getDealersHand
  #   testGame = Game.new([])
  #   testGame.dealers_hand = %w{"test1", "test2"}
  #   assert_equal(2, testGame.dealersHand.length)
  # end
  #
  # # test for setLeftInDealersHand when it is true
  # def test_setLeftInDealersHand_true
  #   testGame = Game.new([])
  #   # set the dealersHand to make it contain a set
  #   testGame.dealersHand = [Card.new(1, 1, 1, 1), Card.new(2, 2, 2, 2), Card.new(3, 3, 3, 3)]
  #   assert_equal(true, testGame.setLeftInDealersHand?)
  # end
  #
  # # test for setLeftInDealersHand when it is false
  # def test_setLeftInDealersHand_false
  #   testGame = Game.new([])
  #   # set the dealersHand to to make it contain no set
  #   testGame.dealersHand = [Card.new(1, 2, 1, 1), Card.new(1, 2, 2, 2), Card.new(3, 3, 3, 3)]
  #   assert_equal(false, testGame.setLeftInDealersHand?)
  # end
  #
  # # test for isSet when it is true
  # def test_isSet_true
  #   testGame = Game.new([])
  #   card1 = Card.new(1,1,1,1)
  #   card2 = Card.new(2,2,2,2)
  #   card3 = Card.new(3,3,3,3)
  #   assert_equal(true,testGame.isSet?([card1,card2,card3]))
  # end
  #
  # # test for isSet when it is false
  # def test_isSet_false
  #   testGame = Game.new([])
  #   card1 = Card.new(1,2,1,1)
  #   card2 = Card.new(1,2,2,2)
  #   card3 = Card.new(3,3,3,3)
  #   assert_equal(false,testGame.isSet?([card1,card2,card3]))
  # end
  #
  # # Another test for isSet when it is true
  # def test_isSet_true2
  #   testGame = Game.new([])
  #   card1 = Card.new(1,1,2,3)
  #   card2 = Card.new(1,2,2,2)
  #   card3 = Card.new(1,3,2,1)
  #   assert_equal(true,testGame.isSet?([card1,card2,card3]))
  # end
  #
  # # test for setColor when it is true
  # def test_setColor_true
  #   testGame = Game.new([])
  #   card1 = Card.new(1,1,2,3)
  #   card2 = Card.new(1,3,1,2)
  #   card3 = Card.new(1,3,2,1)
  #   assert_equal(true, testGame.setColor?(card1,card2,card3))
  # end
  #
  # # test for setColor when it is false
  # def test_setColor_false
  #   testGame = Game.new([])
  #   card1 = Card.new(2,1,2,3)
  #   card2 = Card.new(1,3,1,2)
  #   card3 = Card.new(1,3,2,1)
  #   assert_equal(false, testGame.setColor?(card1,card2,card3))
  # end
  #
  # # test for setSymbol when it is true
  # def test_setSymbol_true
  #   testGame = Game.new([])
  #   card1 = Card.new(2,3,2,3)
  #   card2 = Card.new(1,3,1,2)
  #   card3 = Card.new(1,3,2,1)
  #   assert_equal(true, testGame.setSymbol?(card1,card2,card3))
  # end
  #
  # # test for setSymbol when it is false
  # def test_setSymbol_false
  #   testGame = Game.new([])
  #   card1 = Card.new(2,1,2,3)
  #   card2 = Card.new(1,1,1,2)
  #   card3 = Card.new(1,3,2,1)
  #   assert_equal(false, testGame.setSymbol?(card1,card2,card3))
  # end
  #
  # # test for setShading when it is true
  # def test_setShading_true
  #   testGame = Game.new([])
  #   card1 = Card.new(2,3,2,3)
  #   card2 = Card.new(1,3,2,2)
  #   card3 = Card.new(1,3,2,1)
  #   assert_equal(true, testGame.setShading?(card1,card2,card3))
  # end
  #
  # # test for setShading when it is false
  # def test_setShading_false
  #   testGame = Game.new([])
  #   card1 = Card.new(2,3,2,3)
  #   card2 = Card.new(1,3,2,2)
  #   card3 = Card.new(1,3,3,1)
  #   assert_equal(false, testGame.setShading?(card1,card2,card3))
  # end
  #
  # # test for setNumber when it is true
  # def test_setNumber_true
  #   testGame = Game.new([])
  #   card1 = Card.new(2,3,1,3)
  #   card2 = Card.new(1,3,2,3)
  #   card3 = Card.new(1,3,3,3)
  #   assert_equal(true, testGame.setNumber?(card1,card2,card3))
  # end
  #
  # # test setNumber when it is false
  # def test_setNumber_false
  #   testGame = Game.new([])
  #   card1 = Card.new(2,3,1,2)
  #   card2 = Card.new(1,3,2,2)
  #   card3 = Card.new(1,3,3,3)
  #   assert_equal(false, testGame.setNumber?(card1,card2,card3))
  # end

end