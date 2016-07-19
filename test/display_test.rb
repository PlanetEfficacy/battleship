require './test/test_helper'
require './lib/display'

class DisplayTest < Minitest::Test
  def test_it_creates_border
    d = Display.new
    assert_equal "===========", d.border(4)
    assert_equal "===================", d.border(8)
    assert_equal "===========================", d.border(12)
  end

  def test_it_creates_a_row
    d = Display.new
    assert_equal "A H M", d.row(["A","H","M"])
    assert_equal "B H   M", d.row(["B","H","","M"])
    assert_equal "C   H M", d.row(["C","","H","M"])
    assert_equal "D", d.row(["D"])
  end

  def test_it_displays_grid
    d = Display.new
    expected = "===========\nA H M\nB H   M\nC   H M\nD\n==========="
    actual = d.display_grid(4, ["A","H","M"], ["B","H","","M"], ["C","","H","M"], ["D"])

    assert_equal expected, actual
  end
end
