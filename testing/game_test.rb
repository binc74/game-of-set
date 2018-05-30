# Created by Josh Wright 5/23/18
# Implemented by Josh Wright 5/23/18 - Test Plan for isSet
# Implemented by Houyi Fan 5/24/18 - Test Plan for other methods except isSet. Add documentation for each test case.
# Edited by Houyi Fan 5/27/18 - Fix a wrong test case
# Edited by Jeb Alawi 5/28/18 - Added test cases

require_relative "../Model/game"
require 'test/unit'

class GameTest < Test::Unit::TestCase

  # Written by: Jeb Alawi
  # setWinner
  def test_setWinner
    bob = Player.new("Bob")
    ross = Player.new("Ross")
    game = Game.new([bob, ross])
    card1 = Card.new(1,1,1,1)
    hand1 = [card1, card1, card1]
    bob.addWinningHand(hand1)
    winner = game.setWinner
    assert_equal("Bob", winner.name)
  end

  # winner

  # Written by: Jeb Alawi
  # listOfPlayers
  def test_listOfPlayers
    bob = Player.new("Bob")
    ross = Player.new("Ross")
    game = Game.new([bob, ross])
    playerList= game.listOfPlayers
    assert_equal(2,playerList.length)
  end

  # Written by: Jeb Alawi
  # resetHand
  def test_resetHand
    bob = Player.new("Bob")
    ross = Player.new("Ross")
    game = Game.new([bob, ross])
    game.replenishHand!
    #check that no card is the same in dealers hand
  end

  # display_cards??


  # displayHint??


  # indexOfCard


  # hasEnded


  # getHint??


  # replace_cards


  # Written by: Jeb Alawi
  # replenishHand
  def test_replenishHand
    bob = Player.new("Bob")
    ross = Player.new("Ross")
    game = Game.new([bob, ross])
    assert_equal(12,game.getDealersHand.length)
    game.replenishHand!
    assert_equal(12,game.getDealersHand.length)
    #check that no card is the same in dealers hand
  end

  # test for constructor with no player
  def test_constructor_empty
    testGame = Game.new([])
    assert_equal([], testGame.listOfPlayers)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealersHand.length)
    assert_equal(false, testGame.hasEnded)
    assert_equal(nil, testGame.winner)
  end

  # test for constructor with one player
  def test_constructor_one_player
    testGame = Game.new(["Fan"])
    assert_equal(["Fan"], testGame.listOfPlayers)
    assert_equal(69, testGame.deck.size)
    assert_equal(12, testGame.dealersHand.length)
    assert_equal(false, testGame.hasEnded)
    assert_equal(nil, testGame.winner)
  end

  # test for getDealersHand
  def test_getDealersHand
    testGame = Game.new([])
    testGame.dealersHand = %w{"test1", "test2"}
    assert_equal(2, testGame.dealersHand.length)
  end

  # test for setLeftInDealersHand when it is true
  def test_setLeftInDealersHand_true
    testGame = Game.new([])
    # set the dealersHand to make it contain a set
    testGame.dealersHand = [Card.new(1, 1, 1, 1), Card.new(2, 2, 2, 2), Card.new(3, 3, 3, 3)]
    assert_equal(true, testGame.setLeftInDealersHand?)
  end

  # test for setLeftInDealersHand when it is false
  def test_setLeftInDealersHand_false
    testGame = Game.new([])
    # set the dealersHand to to make it contain no set
    testGame.dealersHand = [Card.new(1, 2, 1, 1), Card.new(1, 2, 2, 2), Card.new(3, 3, 3, 3)]
    assert_equal(false, testGame.setLeftInDealersHand?)
  end

  # test for isSet when it is true
  def test_isSet_true
    testGame = Game.new([])
    card1 = Card.new(1,1,1,1)
    card2 = Card.new(2,2,2,2)
    card3 = Card.new(3,3,3,3)
    assert_equal(true,testGame.isSet?([card1,card2,card3]))
  end

  # test for isSet when it is false
  def test_isSet_false
    testGame = Game.new([])
    card1 = Card.new(1,2,1,1)
    card2 = Card.new(1,2,2,2)
    card3 = Card.new(3,3,3,3)
    assert_equal(false,testGame.isSet?([card1,card2,card3]))
  end

  # Another test for isSet when it is true
  def test_isSet_true2
    testGame = Game.new([])
    card1 = Card.new(1,1,2,3)
    card2 = Card.new(1,2,2,2)
    card3 = Card.new(1,3,2,1)
    assert_equal(true,testGame.isSet?([card1,card2,card3]))
  end

  # test for setColor when it is true
  def test_setColor_true
    testGame = Game.new([])
    card1 = Card.new(1,1,2,3)
    card2 = Card.new(1,3,1,2)
    card3 = Card.new(1,3,2,1)
    assert_equal(true, testGame.setColor?(card1,card2,card3))
  end

  # test for setColor when it is false
  def test_setColor_false
    testGame = Game.new([])
    card1 = Card.new(2,1,2,3)
    card2 = Card.new(1,3,1,2)
    card3 = Card.new(1,3,2,1)
    assert_equal(false, testGame.setColor?(card1,card2,card3))
  end

  # test for setSymbol when it is true
  def test_setSymbol_true
    testGame = Game.new([])
    card1 = Card.new(2,3,2,3)
    card2 = Card.new(1,3,1,2)
    card3 = Card.new(1,3,2,1)
    assert_equal(true, testGame.setSymbol?(card1,card2,card3))
  end

  # test for setSymbol when it is false
  def test_setSymbol_false
    testGame = Game.new([])
    card1 = Card.new(2,1,2,3)
    card2 = Card.new(1,1,1,2)
    card3 = Card.new(1,3,2,1)
    assert_equal(false, testGame.setSymbol?(card1,card2,card3))
  end

  # test for setShading when it is true
  def test_setShading_true
    testGame = Game.new([])
    card1 = Card.new(2,3,2,3)
    card2 = Card.new(1,3,2,2)
    card3 = Card.new(1,3,2,1)
    assert_equal(true, testGame.setShading?(card1,card2,card3))
  end

  # test for setShading when it is false
  def test_setShading_false
    testGame = Game.new([])
    card1 = Card.new(2,3,2,3)
    card2 = Card.new(1,3,2,2)
    card3 = Card.new(1,3,3,1)
    assert_equal(false, testGame.setShading?(card1,card2,card3))
  end

  # test for setNumber when it is true
  def test_setNumber_true
    testGame = Game.new([])
    card1 = Card.new(2,3,1,3)
    card2 = Card.new(1,3,2,3)
    card3 = Card.new(1,3,3,3)
    assert_equal(true, testGame.setNumber?(card1,card2,card3))
  end

  # test setNumber when it is false
  def test_setNumber_false
    testGame = Game.new([])
    card1 = Card.new(2,3,1,2)
    card2 = Card.new(1,3,2,2)
    card3 = Card.new(1,3,3,3)
    assert_equal(false, testGame.setNumber?(card1,card2,card3))
  end

end