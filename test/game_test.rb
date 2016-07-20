require './test/test_helper'
require './lib/game'

class GameTest < Minitest::Test
  def test_Game_has_players
    g = Game.new({"length"=>4, "ships"=>[2, 3]})

    assert_instance_of Player, g.computer_player
    assert_instance_of Player, g.human_player
  end
end
