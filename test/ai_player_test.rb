require './test/test_helper'
require './lib/ai_player'

class AiPlayerTest < Minitest::Test

  def test_ai_can_pick_random_spot

    ai = AiPlayer.new([2, 3])
    board = Board.new(4)
    coordinates = ai.pick(board)
    assert board.contains?(coordinates)
  end

  def test_ai_can_pick_all_spots_on_board_without_repeating
    ai = AiPlayer.new([2,3])
    board = Board.new(4)
    pick_history = ai.pick_exhaustive(board).sort
    coordinates = board.create_space_names.sort

    assert_equal coordinates, pick_history
  end

  def test_it_knows_if_all_spaces_have_been_picked
    ai = AiPlayer.new([2,3])
    board = Board.new(4)
    board_spaces = board.create_space_names

    assert ai.all_spaces_have_been_picked([])
    refute ai.all_spaces_have_been_picked(board_spaces)
  end

  def test_it_knows_if_a_space_has_been_picked_before
    ai = AiPlayer.new([2,3])
    pick_history = ["A1","A2","A3"]

    refute ai.not_picked_before?("A1", pick_history)
    assert ai.not_picked_before?("B1", pick_history)
  end

  def test_ai_can_pick_random_unoccupied_spot_on_trivial_board
    ai = AiPlayer.new([2,3])
    board = Board.new(1)
    expected = "A1"
    actual = ai.pick_unoccupied(board)

    assert_equal expected, actual
  end

  def test_ai_can_pick_random_unoccupied_spot
    ai = AiPlayer.new([2,3])
    board = Board.new(4)
    expected = "D4"
    board.set_spaces_occupied("A1", "A4")
    board.set_spaces_occupied("B1", "B4")
    board.set_spaces_occupied("C1", "C4")
    board.set_spaces_occupied("D1", "D3")
    actual = ai.pick_unoccupied(board)

    assert_equal expected, actual
  end

  def test_ai_can_pick_random_unattacked_spot
    ai = AiPlayer.new([2,3])
    board = Board.new(4)
    expected = "C2"
    board.set_space_attacked("A1")
    board.set_space_attacked("A2")
    board.set_space_attacked("A3")
    board.set_space_attacked("A4")
    board.set_space_attacked("B1")
    board.set_space_attacked("B2")
    board.set_space_attacked("B3")
    board.set_space_attacked("B4")
    board.set_space_attacked("C1")
    board.set_space_attacked("C3")
    board.set_space_attacked("C4")
    board.set_space_attacked("D1")
    board.set_space_attacked("D2")
    board.set_space_attacked("D3")
    board.set_space_attacked("D4")

    actual = ai.pick_unattacked(board)

    assert_equal expected, actual
  end
  
end
