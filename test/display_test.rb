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
    actual = display_grid(12, rowa, rowb, rowc, rowd, rowe, rowf, rowg, rowh, rowi, rowj, rowk, rowl)

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
    skip
    b1 = Board.new(4)
    expected = [["A","","","",""],
                ["B","","","",""],
                ["C","","","",""],
                ["D","","","",""]]
    actual = get_rows_data(b1)
    assert_equal expected, actual
  end

  def test_evaluates_attacked_and_occupied_to_H
    b1 = Board.new(4)
    expected = true
    b1.set_space_occupied("A1")
    b1.set_space_attacked("A1")

    actual = contains_hit?(b1, "A1")

    assert_equal expected, actual
  end
end
