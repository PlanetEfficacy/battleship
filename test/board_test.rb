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
end
