require './test/test_helper'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_player_starts_with_no_shots_fired
    p1 = Player.new
    assert_equal 0, p1.shots_fired
  end
end
