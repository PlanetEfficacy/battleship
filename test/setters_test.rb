require './test/test_helper'
require './lib/board'
require './lib/setters'

class GettersTest < Minitest::Test
  include Setters

  def test_it_can_set_a_space_to_occupied
    b1 = Board.new(4)
    coordinate = "A1"
    coordinate2 = "D4"
    expected_initial = false
    expected_final = true

    actual_initial = b1.space_occupied?(coordinate)
    b1.set_space_occupied(coordinate)
    actual_final = b1.space_occupied?(coordinate)

    actual_initial2 = b1.space_occupied?(coordinate2)
    b1.set_space_occupied(coordinate2)
    actual_final2 = b1.space_occupied?(coordinate2)

    assert_equal expected_initial, actual_initial
    assert_equal expected_final, actual_final
    assert_equal expected_initial, actual_initial2
    assert_equal expected_final, actual_final2
  end

  def test_it_can_set_a_range_of_spaces_to_occupied
    b1 = Board.new(4)
    b2 = Board.new(4)
    coordinate1 = "A1"
    coordinate2 = "A3"
    coordinate3 = "D1"
    coordinate4 = "A1"

    b1.set_spaces_occupied(coordinate1, coordinate2)
    b2.set_spaces_occupied(coordinate3, coordinate4)

    assert_equal true, b1.space_occupied?("A1")
    assert_equal true, b1.space_occupied?("A2")
    assert_equal true, b1.space_occupied?("A3")
    assert_equal false, b1.space_occupied?("A4")
    assert_equal false, b1.space_occupied?("B1")

    assert_equal true, b2.space_occupied?("A1")
    assert_equal true, b2.space_occupied?("B1")
    assert_equal true, b2.space_occupied?("C1")
    assert_equal true, b2.space_occupied?("D1")
    assert_equal false, b2.space_occupied?("A4")
    assert_equal false, b2.space_occupied?("C2")
  end

  def test_it_can_set_a_range_of_spaces_in_the_same_row_to_occupied
    b1 = Board.new(4)
    coordinate1 = "A1"
    coordinate2 = "A3"
    coordinate3 = "D1"
    coordinate4 = "A1"

    b1.set_row_spaces_occupied(coordinate1, coordinate2)
    b1.set_row_spaces_occupied(coordinate3, coordinate4)

    assert_equal true, b1.space_occupied?("A1")
    assert_equal true, b1.space_occupied?("A2")
    assert_equal true, b1.space_occupied?("A3")
    assert_equal false, b1.space_occupied?("A4")
    assert_equal false, b1.space_occupied?("B1")
  end

  def test_it_can_set_a_range_of_spaces_in_the_same_column_to_occupied
    b1 = Board.new(4)
    coordinate1 = "A1"
    coordinate2 = "C1"
    coordinate3 = "C4"
    coordinate4 = "B4"

    b1.set_column_spaces_occupied(coordinate1, coordinate2)
    b1.set_column_spaces_occupied(coordinate3, coordinate4)

    assert_equal true, b1.space_occupied?("A1")
    assert_equal true, b1.space_occupied?("B1")
    assert_equal true, b1.space_occupied?("C1")
    assert_equal true, b1.space_occupied?("C4")
    assert_equal true, b1.space_occupied?("B4")
    assert_equal false, b1.space_occupied?("A4")
    assert_equal false, b1.space_occupied?("D4")
    assert_equal false, b1.space_occupied?("D1")
  end

  def test_it_can_set_a_space_to_attacked
    b1 = Board.new(4)
    coordinate = "A1"
    coordinate2 = "B2"
    expected_initial = false
    expected_final = true

    actual_initial = b1.space_attacked?(coordinate)
    b1.set_space_attacked(coordinate)
    actual_final = b1.space_attacked?(coordinate)

    actual_initial2 = b1.space_attacked?(coordinate2)
    b1.set_space_attacked(coordinate2)
    actual_final2 = b1.space_attacked?(coordinate2)

    assert_equal expected_initial, actual_initial
    assert_equal expected_final, actual_final
    assert_equal expected_initial, actual_initial2
    assert_equal expected_final, actual_final2
  end

end
