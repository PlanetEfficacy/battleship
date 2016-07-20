require './test/test_helper'
require './lib/game_settings'

class GameSettingsTest < Minitest::Test
  def test_it_has_three_difficulty_levels
    settings = GameSettings.new("A")
    expected1 = {"length"=>4, "ships"=>[2, 3]}
    expected2 = {"length"=>8, "ships"=>[2, 3, 4]}
    expected3 = {"length"=>12, "ships"=>[2, 3, 4, 5]}

    actual1 = settings.beginner
    actual2 = settings.intermediate
    actual3 = settings.advanced

    assert_equal expected1, actual1
    assert_equal expected2, actual2
    assert_equal expected3, actual3
  end

  def test_it_can_select_a_setting
    settings = GameSettings.new("B")
    expected1 = {"length"=>4, "ships"=>[2, 3]}
    actual1 = settings.difficulty

    assert_equal expected1, actual1
  end
end
