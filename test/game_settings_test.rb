require './test/test_helper'
require './lib/game_settings'

class GameSettingsTest < Minitest::Test

  def test_it_can_select_a_setting
    settings = GameSettings.new("b")
    expected1 = {"length"=>4, "ships"=>[2, 3]}
    actual1 = settings.difficulty

    assert_equal expected1, actual1
  end

  def test_it_can_get_difficulty_level
    settings_b = GameSettings.new("b")
    settings_i = GameSettings.new("i")
    settings_a = GameSettings.new("a")

    actual1 = settings_b.difficulty_level
    actual2 = settings_i.difficulty_level
    actual3 = settings_a.difficulty_level

    assert_equal "Beginner", actual1
    assert_equal "Intermediate", actual2
    assert_equal "Advanced", actual3
  end

end
