require './test/test_helper'
require './lib/board'

class CreateBoardTest < Minitest::Test
  def test_board_can_get_row_letters
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal ["A", "B", "C", "D"], b1.get_row_letters
    assert_equal ["A", "B", "C", "D", "E", "F", "G", "H"], b2.get_row_letters
    assert_equal ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"], b3.get_row_letters
  end

  def test_board_can_get_column_numbers
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal ["1", "2", "3", "4"], b1.get_column_numbers
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8"], b2.get_column_numbers
    assert_equal ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"], b3.get_column_numbers
  end

  def test_board_can_create_space_names
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)
    expected1 = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]
    expected2 = ["A1", "A2", "A3", "A4", "A5", "A6", "A7","A8",
                "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8",
                "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8",
                "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8",
                "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8",
                "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8",
                "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8",
                "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8"]
    expected3 = ["A1", "A2", "A3", "A4", "A5", "A6", "A7","A8", "A9", "A10", "A11", "A12",
                "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10","B11", "B12",
                "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12",
                "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12",
                "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12",
                "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
                "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12",
                "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                "I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9", "I10", "I11", "I12",
                "J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10", "J11", "J12",
                "K1", "K2", "K3", "K4", "K5", "K6", "K7", "K8", "K9", "K10", "K11", "K12",
                "L1", "L2", "L3", "L4", "L5", "L6", "L7", "L8", "L9", "L10", "L11", "L12"]

    assert_equal expected1, b1.create_space_names
    assert_equal expected2, b2.create_space_names
    assert_equal expected3, b3.create_space_names
  end

  def test_board_creates_spaces
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)
    expected1 = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]
    expected2 = ["A1", "A2", "A3", "A4", "A5", "A6", "A7","A8",
                "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8",
                "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8",
                "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8",
                "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8",
                "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8",
                "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8",
                "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8"]
    expected3 = ["A1", "A2", "A3", "A4", "A5", "A6", "A7","A8", "A9", "A10", "A11", "A12",
                "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10","B11", "B12",
                "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12",
                "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12",
                "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12",
                "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
                "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12",
                "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                "I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9", "I10", "I11", "I12",
                "J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10", "J11", "J12",
                "K1", "K2", "K3", "K4", "K5", "K6", "K7", "K8", "K9", "K10", "K11", "K12",
                "L1", "L2", "L3", "L4", "L5", "L6", "L7", "L8", "L9", "L10", "L11", "L12"]
    b1_spaces = b1.create_spaces
    b2_spaces = b2.create_spaces
    b3_spaces = b3.create_spaces

    b1_actual_coordinates = b1_spaces.values.map do |space|
      space.coordinates
    end
    b2_actual_coordinates = b2_spaces.values.map do |space|
      space.coordinates
    end
    b3_actual_coordinates = b3_spaces.values.map do |space|
      space.coordinates
    end

    actual1_keys = b1_spaces.keys
    actual2_keys = b2_spaces.keys
    actual3_keys = b3_spaces.keys

    assert_equal expected1, actual1_keys
    assert_equal expected2, actual2_keys
    assert_equal expected3, actual3_keys
    assert_equal expected1, b1_actual_coordinates
    assert_equal expected2, b2_actual_coordinates
    assert_equal expected3, b3_actual_coordinates
  end

  def test_assign_spaces_to_rows
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)
    expected1 = [["A1", "A2", "A3", "A4"],
                ["B1", "B2", "B3", "B4"],
                ["C1", "C2", "C3", "C4"],
                ["D1", "D2", "D3", "D4"]]
    expected2 = [["A1", "A2", "A3", "A4", "A5", "A6", "A7","A8"],
                ["B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8"],
                ["C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8"],
                ["D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8"],
                ["E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8"],
                ["F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8"],
                ["G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8"],
                ["H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8"]]
    expected3 = [["A1", "A2", "A3", "A4", "A5", "A6", "A7","A8", "A9", "A10", "A11", "A12"],
                ["B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10","B11", "B12"],
                ["C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12"],
                ["D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12"],
                ["E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12"],
                ["F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12"],
                ["G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12"],
                ["H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12"],
                ["I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9", "I10", "I11", "I12"],
                ["J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10", "J11", "J12"],
                ["K1", "K2", "K3", "K4", "K5", "K6", "K7", "K8", "K9", "K10", "K11", "K12"],
                ["L1", "L2", "L3", "L4", "L5", "L6", "L7", "L8", "L9", "L10", "L11", "L12"]]


    assert_equal expected1, b1.assign_spaces_to_rows
    assert_equal expected2, b2.assign_spaces_to_rows
    assert_equal expected3, b3.assign_spaces_to_rows
  end

  def test_create_grid

    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    expected1 = [["A1", "A2", "A3", "A4"],
                ["B1", "B2", "B3", "B4"],
                ["C1", "C2", "C3", "C4"],
                ["D1", "D2", "D3", "D4"]]
    expected2 = [["A1", "A2", "A3", "A4", "A5", "A6", "A7","A8"],
                ["B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8"],
                ["C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8"],
                ["D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8"],
                ["E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8"],
                ["F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8"],
                ["G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8"],
                ["H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8"]]
    expected3 = [["A1", "A2", "A3", "A4", "A5", "A6", "A7","A8", "A9", "A10", "A11", "A12"],
                ["B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10","B11", "B12"],
                ["C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12"],
                ["D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12"],
                ["E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12"],
                ["F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12"],
                ["G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12"],
                ["H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12"],
                ["I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9", "I10", "I11", "I12"],
                ["J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10", "J11", "J12"],
                ["K1", "K2", "K3", "K4", "K5", "K6", "K7", "K8", "K9", "K10", "K11", "K12"],
                ["L1", "L2", "L3", "L4", "L5", "L6", "L7", "L8", "L9", "L10", "L11", "L12"]]

    grid1 = b1.create_grid
    grid2 = b2.create_grid
    grid3 = b3.create_grid

    actual1 = grid1.map do |row|
      row.map do |space|
        space.keys[0]
      end
    end

    actual2 = grid2.map do |row|
      row.map do |space|
        space.keys[0]
      end
    end

    actual3 = grid3.map do |row|
      row.map do |space|
        space.keys[0]
      end
    end

    assert_equal expected1, actual1
    assert_equal expected2, actual2
    assert_equal expected3, actual3
  end
end
