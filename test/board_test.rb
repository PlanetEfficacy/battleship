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

end
