require './test/test_helper'
require './lib/board'
require './lib/getters'

class GettersTest < Minitest::Test
  include Getters
  
  def test_board_can_get_space
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_instance_of Space, b1.get_space("A1")
    assert_instance_of Space, b1.get_space("D4")
    assert_instance_of Space, b2.get_space("A1")
    assert_instance_of Space, b2.get_space("H8")
    assert_instance_of Space, b3.get_space("J9")
    assert_instance_of Space, b3.get_space("K12")
  end

  def test_it_knows_the_spaces_between_two_coordinates_in_the_same_row_or_column
    b3 = Board.new(12)
    expected1 = ["A1", "A2"]
    expected2 = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12"]
    expected3 = ["B1", "C1"]
    expected4 = ["A5", "B5", "C5", "D5", "E5", "F5", "G5", "H5", "I5", "J5", "K5", "L5"]
    expected5 = ["H8"]

    actual1 = b3.get_spaces_between("A1", "A2")
    actual1a = b3.get_spaces_between("A2", "A1")
    actual2 = b3.get_spaces_between("A1", "A12")
    actual2a = b3.get_spaces_between("A12", "A1")
    actual3 = b3.get_spaces_between("B1", "C1")
    actual3a = b3.get_spaces_between("C1", "B1")
    actual4 = b3.get_spaces_between("A5", "L5")
    actual4a = b3.get_spaces_between("L5", "A5")
    actual5 = b3.get_spaces_between("H8", "H8")

    assert_equal expected1, actual1
    assert_equal expected1, actual1a
    assert_equal expected2, actual2
    assert_equal expected2, actual2a
    assert_equal expected3, actual3
    assert_equal expected3, actual3a
    assert_equal expected4, actual4
    assert_equal expected4, actual4a
    assert_equal expected5, actual5

  end

  def test_it_knows_the_bigger_column_between_two_coordinates
    b3 = Board.new(12)
    expected1 = "2"
    expected2 = "2"
    expected3 = "12"
    expected4 = "12"
    expected5 = "8"

    actual1 = b3.get_bigger_column("A1", "A2")
    actual1a = b3.get_bigger_column("A2", "A1")
    actual2 = b3.get_bigger_column("A1", "A12")
    actual2a = b3.get_bigger_column("A12", "A1")
    actual3 = b3.get_bigger_column("H8", "H8")

    assert_equal expected1, actual1
    assert_equal expected2, actual1a
    assert_equal expected3, actual2
    assert_equal expected4, actual2a
    assert_equal expected5, actual3
  end

  def test_it_knows_the_smaller_column_between_two_coordinates
    b3 = Board.new(12)
    expected1 = "1"
    expected2 = "1"
    expected3 = "2"
    expected4 = "2"
    expected5 = "8"

    actual1 = b3.get_smaller_column("A1", "A2")
    actual1a = b3.get_smaller_column("A2", "A1")
    actual2 = b3.get_smaller_column("D2", "D12")
    actual2a = b3.get_smaller_column("E12", "E2")
    actual3 = b3.get_smaller_column("H8", "H8")

    assert_equal expected1, actual1
    assert_equal expected2, actual1a
    assert_equal expected3, actual2
    assert_equal expected4, actual2a
    assert_equal expected5, actual3
  end

  def test_it_knows_the_spaces_between_two_coordinates_in_the_same_row
    b3 = Board.new(12)
    expected1 = ["A1", "A2"]
    expected2 = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12"]
    expected3 = ["H8"]

    actual1 = b3.get_row_spaces_between("A1", "A2")
    actual1a = b3.get_row_spaces_between("A2", "A1")
    actual2 = b3.get_row_spaces_between("A1", "A12")
    actual2a = b3.get_row_spaces_between("A12", "A1")
    actual3 = b3.get_row_spaces_between("H8", "H8")

    assert_equal expected1, actual1
    assert_equal expected1, actual1a
    assert_equal expected2, actual2
    assert_equal expected2, actual2a
    assert_equal expected3, actual3
  end

  def test_it_knows_the_smaller_row_between_two_coordinates
    b3 = Board.new(12)
    expected1 = "A"
    expected2 = "A"
    expected3 = "C"
    expected4 = "C"
    expected5 = "H"

    actual1 = b3.get_smaller_row("A1", "B1")
    actual1a = b3.get_smaller_row("B1", "A1")
    actual2 = b3.get_smaller_row("C2", "K2")
    actual2a = b3.get_smaller_row("K2", "C2")
    actual3 = b3.get_smaller_row("H8", "H8")

    assert_equal expected1, actual1
    assert_equal expected2, actual1a
    assert_equal expected3, actual2
    assert_equal expected4, actual2a
    assert_equal expected5, actual3
  end

  def test_it_knows_the_bigger_row_between_two_coordinates
    b3 = Board.new(12)
    expected1 = "B"
    expected2 = "B"
    expected3 = "K"
    expected4 = "K"
    expected5 = "H"

    actual1 = b3.get_bigger_row("A1", "B1")
    actual1a = b3.get_bigger_row("B1", "A1")
    actual2 = b3.get_bigger_row("C2", "K2")
    actual2a = b3.get_bigger_row("K2", "C2")
    actual3 = b3.get_bigger_row("H8", "H8")

    assert_equal expected1, actual1
    assert_equal expected2, actual1a
    assert_equal expected3, actual2
    assert_equal expected4, actual2a
    assert_equal expected5, actual3
  end

  def test_it_knows_the_spaces_between_two_coordinates_in_the_same_column
    b3 = Board.new(12)
    expected1 = ["B1", "C1"]
    expected2 = ["A5", "B5", "C5", "D5", "E5", "F5", "G5", "H5", "I5", "J5", "K5", "L5"]
    expected3 = ["I9"]

    actual1 = b3.get_column_spaces_between("B1", "C1")
    actual1a = b3.get_column_spaces_between("C1", "B1")
    actual2 = b3.get_column_spaces_between("A5", "L5")
    actual2a = b3.get_column_spaces_between("L5", "A5")
    actual3 = b3.get_column_spaces_between("I9", "I9")

    assert_equal expected1, actual1
    assert_equal expected1, actual1a
    assert_equal expected2, actual2
    assert_equal expected2, actual2a
    assert_equal expected3, actual3

  end

  def test_it_knows_a_coordinates_row
    b1 = Board.new(4)
    assert_equal "A", b1.get_row("A1")
    assert_equal "B", b1.get_row("B2")
    assert_equal "C", b1.get_row("C3")
    assert_equal "D", b1.get_row("D4")
  end

  def test_it_knows_a_coordinates_column
    b1 = Board.new(4)
    assert_equal "1", b1.get_column("A1")
    assert_equal "2", b1.get_column("B2")
    assert_equal "3", b1.get_column("C3")
    assert_equal "4", b1.get_column("D4")
  end

  def test_it_knows_the_distance_between_two_coordinates_in_the_same_row
    b3 = Board.new(12)

    assert_equal 12, b3.get_horizontal_length("K1", "K12")
    assert_equal 2, b3.get_horizontal_length("A1", "A2")
    assert_equal 5, b3.get_horizontal_length("H8", "H4")
    assert_equal false, b3.get_horizontal_length("K1", "L12")
    assert_equal 1, b3.get_horizontal_length("K1", "K1")
  end

  def test_it_knows_the_distance_between_two_coordinates_in_the_same_column
    b3 = Board.new(12)

    assert_equal 12, b3.get_vertical_length("A12", "L12")
    assert_equal 2, b3.get_vertical_length("C2", "B2")
    assert_equal 5, b3.get_vertical_length("D4", "H4")
    assert_equal false, b3.get_vertical_length("K1", "L12")
    assert_equal 1, b3.get_vertical_length("K1", "K1")
  end
end
