require './test/test_helper'
require './lib/game_settings'

class GameSettingsTest < Minitest::Test
  def test_it_has_three_difficulty_levels
    settings = GameSettings.new
    expected1 = {"length"=>4, "ships"=>[2, 3]}
    expected2 = {"length"=>8, "ships"=>[2, 3, 4]}
    expected3 = {"length"=>12, "ships"=>[2, 3, 4, 5]}

    actual1 = settings.beginner
    actual2 = settings.intermediate
    actual3 = settings.advanced
  end
end
