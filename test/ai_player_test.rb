require './test/test_helper'
require './lib/ai_player'

class AiPlayerTest < Minitest::Test

  def test_ai_can_pick_random_spot
    skip
    ai = AiPlayer.new([2, 3])
    board = Board.new(4)
    coordinates = ai.pick(board)
    assert board.contains?(coordinates)
  end
# def test_player_can_autopick_spot
#   p1 = Player.new([2, 3])
#   board = Board.new(12)
#
#   assert_equal board.val
# end

end
