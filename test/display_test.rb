require './test/test_helper'
require './lib/display'
require './lib/board'

class DisplayTest < Minitest::Test
  include Display
  def test_it_creates_a_row
    assert_equal "A  M  M  M  M  M  M  M  M  M  M  M  M", row(["A","M","M","M","M","M","M","M","M","M","M","M","M"])
    assert_equal "B  M     M     M     M     M     M", row(["B","M","","M","","M","","M","","M","","M",""])
    assert_equal "C     M     M     M     M     M     M", row(["C","","M","","M","","M","","M","","M","","M"])
    assert_equal "D", row(["D","","","","","","","","","","","",""])
  end

  def test_blank_cells_converted_to_space
    assert_equal "   ", parse_blank("")
  end

  def test_it_displays_header
    assert_equal ".  1  2  3  4", header(4)
    assert_equal ".  1  2  3  4  5  6  7  8", header(8)
    assert_equal ".  1  2  3  4  5  6  7  8  9  10 11 12", header(12)
  end

  def test_it_displays_grid
    expected = "========================================\n"
    expected += ".  1  2  3  4  5  6  7  8  9  10 11 12\n"
    expected += "A     M     M     M     M     M     M\n"
    expected += "B  M     M     M     M     M     M\n"
    expected += "C     M     M     M     M     M     M\n"
    expected += "D  M     M     M     M     M     M\n"
    expected += "E     M     M     M     M     M     M\n"
    expected += "F  M     M     M     M     M     M\n"
    expected += "G     M     M     M     M     M     M\n"
    expected += "H  M     M     M     M     M     M\n"
    expected += "I     M     M     M     M     M     M\n"
    expected += "J  M     M     M     M     M     M\n"
    expected += "K     M     M     M     M     M     M\n"
    expected += "L  M     M     M     M     M     M\n"
    expected += "========================================"

    rowa = ["A","","M","","M","","M","","M","","M","","M"]
    rowb = ["B","M","","M","","M","","M","","M","","M",""]
    rowc = ["C","","M","","M","","M","","M","","M","","M"]
    rowd = ["D","M","","M","","M","","M","","M","","M",""]
    rowe = ["E","","M","","M","","M","","M","","M","","M"]
    rowf = ["F","M","","M","","M","","M","","M","","M",""]
    rowg = ["G","","M","","M","","M","","M","","M","","M"]
    rowh = ["H","M","","M","","M","","M","","M","","M",""]
    rowi = ["I","","M","","M","","M","","M","","M","","M"]
    rowj = ["J","M","","M","","M","","M","","M","","M",""]
    rowk = ["K","","M","","M","","M","","M","","M","","M"]
    rowl = ["L","M","","M","","M","","M","","M","","M",""]
    actual = display_grid(12, [rowa, rowb, rowc, rowd, rowe, rowf, rowg, rowh, rowi, rowj, rowk, rowl])

    assert_equal expected, actual
  end

  def test_it_can_make_rows_data_presentable
    rowa = ["A","","M","","M","","M","","M","","M","","M"]
    rowb = ["B","M","","M","","M","","M","","M","","M",""]
    rowc = ["C","","M","","M","","M","","M","","M","","M"]
    rowd = ["D","M","","M","","M","","M","","M","","M",""]
    rowe = ["E","","M","","M","","M","","M","","M","","M"]
    rowf = ["F","M","","M","","M","","M","","M","","M",""]
    rowg = ["G","","M","","M","","M","","M","","M","","M"]
    rowh = ["H","M","","M","","M","","M","","M","","M",""]
    rowi = ["I","","M","","M","","M","","M","","M","","M"]
    rowj = ["J","M","","M","","M","","M","","M","","M",""]
    rowk = ["K","","M","","M","","M","","M","","M","","M"]
    rowl = ["L","M","","M","","M","","M","","M","","M",""]
    rows_data = [rowa, rowb, rowc, rowd, rowe, rowf, rowg, rowh, rowi, rowj, rowk, rowl]
    expected = "A     M     M     M     M     M     M\n"
    expected += "B  M     M     M     M     M     M\n"
    expected += "C     M     M     M     M     M     M\n"
    expected += "D  M     M     M     M     M     M\n"
    expected += "E     M     M     M     M     M     M\n"
    expected += "F  M     M     M     M     M     M\n"
    expected += "G     M     M     M     M     M     M\n"
    expected += "H  M     M     M     M     M     M\n"
    expected += "I     M     M     M     M     M     M\n"
    expected += "J  M     M     M     M     M     M\n"
    expected += "K     M     M     M     M     M     M\n"
    expected += "L  M     M     M     M     M     M\n"

    actual = make_rows_data_presentable(rows_data)

    assert_equal expected, actual
  end

  def test_it_can_make_a_short_border
    assert_equal "================", border(4)
    assert_equal "============================", border(8)
  end

  def test_it_can_make_a_long_border
    assert_equal "========================================", border(12)
  end

  def test_it_can_get_row_data
    b1 = Board.new(4)
    b2 = Board.new(4)
    expected1 = ["A","","","",""]
    expected2 = ["A","H","M","",""]
    b2.set_space_occupied("A1")
    b2.set_space_attacked("A1")
    b2.set_space_attacked("A2")

    row1 = b1.board[0]
    row2 = b2.board[0]

    actual1 = get_row_data(b1, row1)
    actual2 = get_row_data(b2, row2)

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_it_can_get_rows_data
    b1 = Board.new(4)
    b2 = Board.new(4)
    expected1 = [["A","","","",""],
                ["B","","","",""],
                ["C","","","",""],
                ["D","","","",""]]
    expected2 =[["A","H","M","",""],
                ["B","H","","M",""],
                ["C","","H","M",""],
                ["D","","","",""]]
    b2.set_space_occupied("A1")
    b2.set_space_occupied("B1")
    b2.set_space_occupied("C2")
    b2.set_space_attacked("A1")
    b2.set_space_attacked("B1")
    b2.set_space_attacked("C2")
    b2.set_space_attacked("A2")
    b2.set_space_attacked("B3")
    b2.set_space_attacked("C3")

    actual1 = get_rows_data(b1)
    actual2 = get_rows_data(b2)

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_it_can_render
    big_board = Board.new(12)
    expected = "========================================\n"
    expected += ".  1  2  3  4  5  6  7  8  9  10 11 12\n"
    expected += "A     M     M     M     M     M     M\n"
    expected += "B  H     M     M     M     M     M\n"
    expected += "C     H     M     M     M     M     M\n"
    expected += "D  M     H     M     M     M     M\n"
    expected += "E     M     H     M     M     M     M\n"
    expected += "F  M     M     H     M     M     M\n"
    expected += "G     M     M     H     M     M     M\n"
    expected += "H  M     M     M     H     M     M\n"
    expected += "I     M     M     M     H     M     M\n"
    expected += "J  M     M     M     M     H     M\n"
    expected += "K     M     M     M     M     H     M\n"
    expected += "L  M     M     M     M     M     H\n"
    expected += "========================================"
    big_board.set_space_occupied("B1")
    big_board.set_space_occupied("C2")
    big_board.set_space_occupied("D3")
    big_board.set_space_occupied("E4")
    big_board.set_space_occupied("F5")
    big_board.set_space_occupied("G6")
    big_board.set_space_occupied("H7")
    big_board.set_space_occupied("I8")
    big_board.set_space_occupied("J9")
    big_board.set_space_occupied("K10")
    big_board.set_space_occupied("L11")
    big_board.set_space_attacked("A2")
    big_board.set_space_attacked("A4")
    big_board.set_space_attacked("A6")
    big_board.set_space_attacked("A8")
    big_board.set_space_attacked("A10")
    big_board.set_space_attacked("A12")
    big_board.set_space_attacked("C2")
    big_board.set_space_attacked("C4")
    big_board.set_space_attacked("C6")
    big_board.set_space_attacked("C8")
    big_board.set_space_attacked("C10")
    big_board.set_space_attacked("C12")
    big_board.set_space_attacked("E2")
    big_board.set_space_attacked("E4")
    big_board.set_space_attacked("E6")
    big_board.set_space_attacked("E8")
    big_board.set_space_attacked("E10")
    big_board.set_space_attacked("E12")
    big_board.set_space_attacked("G2")
    big_board.set_space_attacked("G4")
    big_board.set_space_attacked("G6")
    big_board.set_space_attacked("G8")
    big_board.set_space_attacked("G10")
    big_board.set_space_attacked("G12")
    big_board.set_space_attacked("I2")
    big_board.set_space_attacked("I4")
    big_board.set_space_attacked("I6")
    big_board.set_space_attacked("I8")
    big_board.set_space_attacked("I10")
    big_board.set_space_attacked("I12")
    big_board.set_space_attacked("K2")
    big_board.set_space_attacked("K4")
    big_board.set_space_attacked("K6")
    big_board.set_space_attacked("K8")
    big_board.set_space_attacked("K10")
    big_board.set_space_attacked("K12")
    big_board.set_space_attacked("B1")
    big_board.set_space_attacked("B3")
    big_board.set_space_attacked("B5")
    big_board.set_space_attacked("B7")
    big_board.set_space_attacked("B9")
    big_board.set_space_attacked("B11")
    big_board.set_space_attacked("D1")
    big_board.set_space_attacked("D3")
    big_board.set_space_attacked("D5")
    big_board.set_space_attacked("D7")
    big_board.set_space_attacked("D9")
    big_board.set_space_attacked("D11")
    big_board.set_space_attacked("F1")
    big_board.set_space_attacked("F3")
    big_board.set_space_attacked("F5")
    big_board.set_space_attacked("F7")
    big_board.set_space_attacked("F9")
    big_board.set_space_attacked("F11")
    big_board.set_space_attacked("H1")
    big_board.set_space_attacked("H3")
    big_board.set_space_attacked("H5")
    big_board.set_space_attacked("H7")
    big_board.set_space_attacked("H9")
    big_board.set_space_attacked("H11")
    big_board.set_space_attacked("J1")
    big_board.set_space_attacked("J3")
    big_board.set_space_attacked("J5")
    big_board.set_space_attacked("J7")
    big_board.set_space_attacked("J9")
    big_board.set_space_attacked("J11")
    big_board.set_space_attacked("L1")
    big_board.set_space_attacked("L3")
    big_board.set_space_attacked("L5")
    big_board.set_space_attacked("L7")
    big_board.set_space_attacked("L9")
    big_board.set_space_attacked("L11")

    assert_equal expected, render(big_board)
  end

  # def test_remove_outer_array
  #   input = [["A", "", "M", "", "M", "", "M", "", "M", "", "M", "", "M"],
  #            ["B", "H", "", "M", "", "M", "", "M", "", "M", "", "M", ""],
  #            ["C", "", "H", "", "M", "", "M", "", "M", "", "M", "", "M"],
  #            ["D", "M", "", "H", "", "M", "", "M", "", "M", "", "M", ""],
  #            ["E", "", "M", "", "H", "", "M", "", "M", "", "M", "", "M"],
  #            ["F", "M", "", "M", "", "H", "", "M", "", "M", "", "M", ""],
  #            ["G", "", "M", "", "M", "", "H", "", "M", "", "M", "", "M"],
  #            ["H", "M", "", "M", "", "M", "", "H", "", "M", "", "M", ""],
  #            ["I", "", "M", "", "M", "", "M", "", "H", "", "M", "", "M"],
  #            ["J", "M", "", "M", "", "M", "", "M", "", "H", "", "M", ""],
  #            ["K", "", "M", "", "M", "", "M", "", "M", "", "H", "", "M"],
  #            ["L", "M", "", "M", "", "M", "", "M", "", "M", "", "H", ""]]
  #   expected =
  #
  #
  # end

end
