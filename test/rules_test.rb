require './test/test_helper'
require './lib/rules'

class RulesTest < Minitest::Test
  include Rules
  def test_rules_disallow_invalid_space_selection
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

    valid_spaces.map {|space| Rules.valid_space?(board, space)}.each do |valid|
      assert valid
    end

    refute Rules.valid_space?(board, space1)
    refute Rules.valid_space?(board, space2)
    refute Rules.valid_space?(board, space3)
    refute Rules.valid_space?(board, space4)
    refute Rules.valid_space?(board, space5)
    refute Rules.valid_space?(board, space6)
    refute Rules.valid_space?(board, space7)
    refute Rules.valid_space?(board, space8)
    refute Rules.valid_space?(board, space9)
    refute Rules.valid_space?(board, space10)
    refute Rules.valid_space?(board, space11)

  end

  def test_rules_disallow_diagonal_placement
    board = Board.new(12)
    player = Player.new([2, 3, 4, 5])
    start_space_1 = "A1"
    invalid_end_space_1 = "C3"
    invalid_end_space_2 = "B2"
    valid_end_space_1 = "C1"
    valid_end_space_2 = "A3"
    ship_1 = player.fleet[1]

    refute Rules.diagonal_placement_compliance?(board, start_space_1, invalid_end_space_1)
    refute Rules.diagonal_placement_compliance?(board, start_space_1, invalid_end_space_2)
    assert Rules.diagonal_placement_compliance?(board, start_space_1, valid_end_space_1)
    assert Rules.diagonal_placement_compliance?(board, start_space_1, valid_end_space_2)

  end

  def test_it_knows_if_start_and_end_coordinates_are_valid
    board = Board.new(12)
    invalid_space1 = "!"
    invalid_space2 = "A"
    invalid_space3 = "0"
    invalid_space4 = " "
    invalid_space5 = ""
    invalid_space6 = "A100"
    invalid_space7 = "9B"
    invalid_space8 = "z12"
    valid_spaces = ["A1", "A2", "A3", "A4"]

    refute Rules.both_coordinates_valid?(board, invalid_space1, valid_spaces[0])
    refute Rules.both_coordinates_valid?(board, valid_spaces[1],invalid_space2)
    refute Rules.both_coordinates_valid?(board, invalid_space3, invalid_space4)
    refute Rules.both_coordinates_valid?(board, invalid_space5, invalid_space6)
    refute Rules.both_coordinates_valid?(board, invalid_space7, invalid_space8)
    assert Rules.both_coordinates_valid?(board, valid_spaces[2], valid_spaces[3])
  end

  def test_length_compliance?
    board = Board.new(12)
    ship2 = Ship.new(2)
    ship3 = Ship.new(3)
    ship4 = Ship.new(4)
    ship5 = Ship.new(5)
    start_space_1 = "A1"
    end_space_1 = "A2"
    start_space_2 = "B3"
    end_space_2 = "D3"
    start_space_3 = "C1"
    end_space_3 = "C2"
    start_space_4 = "D4"
    end_space_4 = "F4"
    start_space_5 = "L12"
    end_space_5 = "H12"

    assert Rules.length_compliance?(board, ship2, start_space_1, end_space_1)
    assert Rules.length_compliance?(board, ship3, start_space_2, end_space_2)
    refute Rules.length_compliance?(board, ship4, start_space_3, end_space_3)
    assert Rules.length_compliance?(board, ship3, start_space_4, end_space_4)
    refute Rules.length_compliance?(board, ship4, start_space_4, end_space_4)
    assert Rules.length_compliance?(board, ship5, start_space_5, end_space_5)
  end

  def test_ship_overlap_compliance?
    b1 = Board.new(4)
    p1 = Player.new([2,3])
    s3 = p1.get_ship(3)
    s2 = p1.get_ship(2)
    p1.place_ship(b1, s3, "A1", "A3")


    b2 = Board.new(12)
    p2 = Player.new([2,3,4,5])
    s3 = p2.get_ship(3)
    s4 = p2.get_ship(4)
    s5 = p2.get_ship(5)
    p2.place_ship(b2, s5, "L12", "H12")
    p2.place_ship(b2, s3, "B2", "B4")


    assert_equal false, Rules.ship_overlap_compliance?(b1, s2, "A1", "B1")
    assert_equal false, Rules.ship_overlap_compliance?(b2, s4, "H9", "H12")
    assert_equal false, Rules.ship_overlap_compliance?(b2, s5, "A3", "E3")
    assert_equal true, Rules.ship_overlap_compliance?(b2, s5, "A1", "E1")
  end

  def test_virgin_attack_compliance
    b1 = Board.new(4)
    p1 = Player.new([2,3])
    expected1 = false
    expected2 = true

    actual1 = Rules.virgin_attack_compliance?(b1, "A1")
    p1.attack(b1, "A1")
    actual2 = Rules.virgin_attack_compliance?(b1, "A1")

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_game_is_over
    p1 = Player.new([1])
    p2 = Player.new([1])
    expected1 = false
    expected2 = true

    actual1 = Rules.game_is_over?(p1, p2)
    p1.get_ship(1).hit
    actual2 = Rules.game_is_over?(p1, p2)

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

end
