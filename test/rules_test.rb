require './test/test_helper'
require './lib/rules'

class RulesTest < Minitest::Test
  def test_rules_disallow_invalid_space_selection
    rules = Rules.new
    board = Board.new(12)
    space1 = "!"
    space2 = "A"
    space3 = "0"
    space4 = " "
    space5 = ""
    space6 = "A100"
    space7 = "9B"
    space8 = "z12"
    space9 = "hello world"
    space10 = "A,1"
    space11 = "[A1]"
    valid_spaces = ["A1", "A2", "A3", "A4", "A5", "A6", "A7","A8", "A9", "A10", "A11", "A12",
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

    valid_spaces.map {|space| rules.valid_space?(board, space)}.each do |valid|
      assert valid
    end

    refute rules.valid_space?(board, space1)
    refute rules.valid_space?(board, space2)
    refute rules.valid_space?(board, space3)
    refute rules.valid_space?(board, space4)
    refute rules.valid_space?(board, space5)
    refute rules.valid_space?(board, space6)
    refute rules.valid_space?(board, space7)
    refute rules.valid_space?(board, space8)
    refute rules.valid_space?(board, space9)
    refute rules.valid_space?(board, space10)
    refute rules.valid_space?(board, space11)

  end

  def test_rules_disallow_ship_wrap_for_two_unit_ship
    rules = Rules.new
    board = Board.new(12)
    player = Player.new([2, 3, 4, 5])
    start_space_1 = "A1"
    end_space_1 = "A12"
    end_space_2 = "A2"
    ship_1 = player.fleet[0]

    refute rules.two_unit_ship_wrap_violation?(board, ship_1, start_space_1, end_space_1)
    assert rules.two_unit_ship_wrap_violation?(board, ship_1, start_space_1, end_space_2)
  end

  def test_rules_disallow_ship_wrap_for_more_than_two_unit_ship
    
  end

end
