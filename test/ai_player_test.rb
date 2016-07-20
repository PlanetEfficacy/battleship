require './test/test_helper'
require './lib/ai_player'

class AiPlayerTest < Minitest::Test

  def test_ai_can_pick_random_space
    ai = AiPlayer.new([2, 3])
    board = Board.new(4)
    coordinates = ai.pick(board)
    assert board.contains?(coordinates)
  end

  def test_ai_can_pick_all_spaces_on_board_without_repeating
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

  def test_ai_can_pick_random_unoccupied_space_on_trivial_board
    ai = AiPlayer.new([2,3])
    board = Board.new(1)
    expected = "A1"
    actual = ai.pick_unoccupied(board)

    assert_equal expected, actual
  end

  def test_ai_can_pick_random_unoccupied_space
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

  def test_ai_can_pick_random_unoccupied_space_x_units_vertically
    ai = AiPlayer.new([2,3])
    board = Board.new(4)
    expected = ["A1","C1"]
    expected2 = "D1"
    actual = ai.pick_x_units_vertically(board, "B1", 2)
    actual2 = ai.pick_x_units_vertically(board,"A1", 4)

    assert expected.include?(actual)
    assert expected2, actual2
  end

  def test_ai_can_pick_random_unoccupied_space_x_units_horizontally
    ai = AiPlayer.new([2,3])
    board = Board.new(4)
    expected = ["B1","B3"]
    expected2 = "C1"
    actual = ai.pick_x_units_horizontally(board, "B2", 2)
    actual2 = ai.pick_x_units_horizontally(board, "C4", 4)

    assert expected.include?(actual)
    assert expected2, actual2
  end

  def test_ai_can_pick_random_unoccupied_space_x_units_from_coordinate
    ai = AiPlayer.new([2,3])
    board = Board.new(4)
    expected1 = ["A2", "B3", "C2", "B1"]
    actual1 = ai.pick_x_units(board, "B2", 2)
    expected2 = ["C1", "D2"]
    actual2 = ai.pick_x_units(board, "D1", 2)
    expected3 = ["C4"]
    actual3 = ai.pick_x_units(board, "C1", 4)
    board.set_space_occupied("C4")
    actual4 = ai.pick_x_units(board, "C1", 4)

    assert expected1.include?(actual1)
    assert expected2.include?(actual2)
    assert expected3.include?(actual3)
    assert_equal nil, actual4
  end

  def test_ai_can_pick_random_unattacked_space
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
