require './test/test_helper'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_player_starts_with_no_shots_fired
    p1 = Player.new
    assert_equal 0, p1.shots_fired
  end

  def test_player_starts_not_winning_the_game
    p1 = Player.new
    refute p1.winner
  end

  def test_player_starts_not_knowing_any_spaces
    p1 = Player.new
    assert_equal [], p1.known_spaces
  end
end
