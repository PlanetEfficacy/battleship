require './test/test_helper'
require './lib/board'
require './lib/board_evaluation'

class BoardTest < Minitest::Test
  include BoardEvaluation

  def test_board_knows_if_it_does_not_contain_space
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert b1.contains?("A1")
    assert b1.contains?("D4")
    refute b1.contains?("D5")
    refute b1.contains?("A0")
    refute b1.contains?("B9")
    refute b1.contains?("F9")

    assert b2.contains?("A1")
    assert b2.contains?("H8")
    refute b2.contains?("H9")
    refute b2.contains?("A0")
    refute b2.contains?("C9")
    refute b2.contains?("I9")

    assert b3.contains?("A1")
    assert b3.contains?("K12")
    refute b3.contains?("K13")
    refute b3.contains?("A0")
    refute b3.contains?("E13")
    refute b3.contains?("X4")

  end

  def test_it_knows_if_two_coordinates_are_in_the_same_row
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert b1.same_row?("A1", "A4")
    refute b1.same_row?("B1", "C4")
    assert b2.same_row?("E5", "E2")
    refute b2.same_row?("H1", "D1")
    assert b3.same_row?("K12", "K1")
    refute b3.same_row?("L1", "A1")
  end

  def test_it_knows_if_two_coordinates_are_in_the_same_column
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert b1.same_column?("A1", "D1")
    refute b1.same_column?("B1", "C4")
    assert b2.same_column?("E5", "D5")
    refute b2.same_column?("H1", "H4")
    assert b3.same_column?("A12", "K12")
    refute b3.same_column?("L2", "A1")
  end

  def test_it_knows_if_a_space_is_not_occupied
    b1 = Board.new(4)

    assert_equal false, b1.space_occupied?("A1")
    assert_equal false, b1.space_occupied?("A2")
    assert_equal false, b1.space_occupied?("A3")
    assert_equal false, b1.space_occupied?("A4")
    assert_equal false, b1.space_occupied?("B1")
    assert_equal false, b1.space_occupied?("B2")
    assert_equal false, b1.space_occupied?("B3")
    assert_equal false, b1.space_occupied?("B4")
    assert_equal false, b1.space_occupied?("C1")
    assert_equal false, b1.space_occupied?("C2")
    assert_equal false, b1.space_occupied?("C3")
    assert_equal false, b1.space_occupied?("C4")
    assert_equal false, b1.space_occupied?("D1")
    assert_equal false, b1.space_occupied?("D2")
    assert_equal false, b1.space_occupied?("D3")
    assert_equal false, b1.space_occupied?("D4")
  end

  def test_it_knows_if_a_space_is_not_attacked
    b1 = Board.new(4)

    assert_equal false, b1.space_attacked?("A1")
    assert_equal false, b1.space_attacked?("A2")
    assert_equal false, b1.space_attacked?("A3")
    assert_equal false, b1.space_attacked?("A4")
    assert_equal false, b1.space_attacked?("B1")
    assert_equal false, b1.space_attacked?("B2")
    assert_equal false, b1.space_attacked?("B3")
    assert_equal false, b1.space_attacked?("B4")
    assert_equal false, b1.space_attacked?("C1")
    assert_equal false, b1.space_attacked?("C2")
    assert_equal false, b1.space_attacked?("C3")
    assert_equal false, b1.space_attacked?("C4")
    assert_equal false, b1.space_attacked?("D1")
    assert_equal false, b1.space_attacked?("D2")
    assert_equal false, b1.space_attacked?("D3")
    assert_equal false, b1.space_attacked?("D4")
  end

  def test_it_knows_if_coordinate_contains_hit
    b1 = Board.new(4)
    coordinate = "A1"
    coordinate2 = "B2"
    coordinate3 = "A2"

    b1.set_space_attacked(coordinate)
    b1.set_space_occupied(coordinate)
    b1.set_space_attacked(coordinate2)

    assert b1.contains_hit?(coordinate)
    refute b1.contains_hit?(coordinate2)
    refute b1.contains_hit?(coordinate3)
  end

  def test_it_knows_if_coordinate_contains_miss
    b1 = Board.new(4)
    coordinate = "A1"
    coordinate2 = "B2"
    coordinate3 = "A2"

    b1.set_space_attacked(coordinate)
    b1.set_space_occupied(coordinate)
    b1.set_space_attacked(coordinate2)

    refute b1.contains_miss?(coordinate)
    assert b1.contains_miss?(coordinate2)
    refute b1.contains_miss?(coordinate3)
  end

  def test_it_knows_if_coordinate_is_in_column_1
    b1 = Board.new(4)

    assert b1.first_column?("A1")
    assert b1.first_column?("B1")
    assert b1.first_column?("C1")
    assert b1.first_column?("D1")
    refute b1.first_column?("D4")
  end


end
