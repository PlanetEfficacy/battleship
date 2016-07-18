require './test/test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def test_board_has_length
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert 4, b1.length
    assert 8, b2.length
    assert 12, b3.length
  end

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

  def test_knows_if_space_has_northern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    refute b1.has_north_neighbor?("A1")
    refute b2.has_north_neighbor?("A1")
    refute b3.has_north_neighbor?("A1")
    assert b1.has_north_neighbor?("B1")
    assert b2.has_north_neighbor?("B1")
    assert b3.has_north_neighbor?("B1")
    assert b1.has_north_neighbor?("D4")
    assert b2.has_north_neighbor?("H8")
    assert b3.has_north_neighbor?("L12")
  end

  def test_knows_if_space_has_southern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert b1.has_south_neighbor?("A1")
    assert b2.has_south_neighbor?("A1")
    assert b3.has_south_neighbor?("A1")
    assert b1.has_south_neighbor?("B1")
    assert b2.has_south_neighbor?("B1")
    assert b3.has_south_neighbor?("B1")
    refute b1.has_south_neighbor?("D4")
    refute b2.has_south_neighbor?("H8")
    refute b3.has_south_neighbor?("L12")
  end

  def test_knows_if_space_has_eastern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert b1.has_east_neighbor?("A1")
    assert b2.has_east_neighbor?("A1")
    assert b3.has_east_neighbor?("A1")
    assert b1.has_east_neighbor?("B1")
    assert b2.has_east_neighbor?("B1")
    assert b3.has_east_neighbor?("B1")
    refute b1.has_east_neighbor?("D4")
    refute b2.has_east_neighbor?("H8")
    refute b3.has_east_neighbor?("L12")
  end

  def test_knows_if_space_has_western_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    refute b1.has_west_neighbor?("A1")
    refute b2.has_west_neighbor?("A1")
    refute b3.has_west_neighbor?("A1")
    refute b1.has_west_neighbor?("B1")
    refute b2.has_west_neighbor?("B1")
    refute b3.has_west_neighbor?("B1")
    assert b1.has_west_neighbor?("D4")
    assert b2.has_west_neighbor?("H8")
    assert b3.has_west_neighbor?("L12")
  end

  def test_board_gets_northern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal "A1", b1.get_north_neighbor("B1")
    assert_equal "A1", b2.get_north_neighbor("B1")
    assert_equal "A1", b3.get_north_neighbor("B1")
    assert_equal "C4", b1.get_north_neighbor("D4")
    assert_equal "G8", b2.get_north_neighbor("H8")
    assert_equal "K12", b3.get_north_neighbor("L12")
  end

  def test_board_gets_southern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal "B1", b1.get_south_neighbor("A1")
    assert_equal "B1", b2.get_south_neighbor("A1")
    assert_equal "B1", b3.get_south_neighbor("A1")
    assert_equal "C1", b1.get_south_neighbor("B1")
    assert_equal "C1", b2.get_south_neighbor("B1")
    assert_equal "C1", b3.get_south_neighbor("B1")
    assert_equal "D4", b1.get_south_neighbor("C4")
    assert_equal "H8", b2.get_south_neighbor("G8")
    assert_equal "L12", b3.get_south_neighbor("K12")
  end

  def test_board_gets_eastern_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal "A2", b1.get_east_neighbor("A1")
    assert_equal "A2", b2.get_east_neighbor("A1")
    assert_equal "A2", b3.get_east_neighbor("A1")
    assert_equal "B2", b1.get_east_neighbor("B1")
    assert_equal "B2", b2.get_east_neighbor("B1")
    assert_equal "B2", b3.get_east_neighbor("B1")
    assert_equal "D4", b1.get_east_neighbor("D3")
    assert_equal "H8", b2.get_east_neighbor("H7")
    assert_equal "L12", b3.get_east_neighbor("L11")
  end

  def test_board_gets_western_neighbor
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal "A1", b1.get_west_neighbor("A2")
    assert_equal "A1", b2.get_west_neighbor("A2")
    assert_equal "A1", b3.get_west_neighbor("A2")
    assert_equal "B2", b1.get_west_neighbor("B3")
    assert_equal "B3", b2.get_west_neighbor("B4")
    assert_equal "B4", b3.get_west_neighbor("B5")
    assert_equal "D3", b1.get_west_neighbor("D4")
    assert_equal "H7", b2.get_west_neighbor("H8")
    assert_equal "L11", b3.get_west_neighbor("L12")
  end

  def test_board_gets_neighbors
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert_equal ["B2", "C3", "D2", "C1"], b1.neighbors("C2")
    assert_equal ["A2", "B1"], b1.neighbors("A1")
    assert_equal ["C3", "D4", "D2"], b1.neighbors("D3")
    assert_equal ["E5", "F6", "G5", "F4"], b2.neighbors("F5")
    assert_equal ["G4", "H5", "H3"], b2.neighbors("H4")
    assert_equal ["G8", "H7"], b2.neighbors("H8")
    assert_equal ["A8", "B7", "A6"], b3.neighbors("A7")
    assert_equal ["I11", "J12", "K11", "J10"], b3.neighbors("J11")
    assert_equal ["K12", "L11"], b3.neighbors("L12")
  end

  def test_board_stores_spaces
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

    actual1 = b1.board.map do |row|
      row.map do |space_hash|
        space_hash.keys[0]
      end
    end
    actual2 = b2.board.map do |row|
      row.map do |space_hash|
        space_hash.keys[0]
      end
    end
    actual3 = b3.board.map do |row|
      row.map do |space_hash|
        space_hash.keys[0]
      end
    end

    assert_equal expected1, actual1
    assert_equal expected2, actual2
    assert_equal expected3, actual3
  end

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

  def test_it_knows_if_two_coordinates_are_neighbors
    b1 = Board.new(4)
    b2 = Board.new(8)
    b3 = Board.new(12)

    assert b1.neighbors?("C2", "C1")
    assert b1.neighbors?("A1", "B1")
    refute b1.neighbors?("A1", "A7")
    assert b2.neighbors?("D3", "E3")
    refute b2.neighbors?("F5", "F3")
    refute b2.neighbors?("F5", "A5")
    assert b3.neighbors?("L12", "K12")
    refute b3.neighbors?("K1", "A1")
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
