require './test/test_helper'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_player_starts_with_no_shots_fired
    p1 = Player.new([2, 3])
    assert_equal 0, p1.shots_fired
  end

  def test_player_starts_not_winning_the_game
    p1 = Player.new([2, 3])
    refute p1.winner
  end

  def test_player_starts_not_knowing_any_spaces
    p1 = Player.new([2, 3])
    assert_equal [], p1.known_spaces
  end

  def test_play_can_fire_shots
    p1 = Player.new([2, 3])
    initial = p1.shots_fired
    p1.fire
    one_shot_fired = p1.shots_fired
    p1.fire
    two_shots_fired = p1.shots_fired
    p1.fire
    three_shots_fired = p1.shots_fired

    assert_equal 0, initial
    assert_equal 1, one_shot_fired
    assert_equal 2, two_shots_fired
    assert_equal 3, three_shots_fired
  end

  def test_player_can_learn_new_spaces
    p1 = Player.new([2, 3])
    expected = []
    expected1 = ["A1"]
    expected2 = ["A1", "B4"]
    expected3 = ["A1", "B4", "D2"]
    expected4 = ["A1", "B4", "D2", "K12"]

    actual = p1.known_spaces
    assert_equal expected, actual

    p1.uncover("A1")
    actual1 = p1.known_spaces
    assert_equal expected1, actual1

    p1.uncover("B4")
    actual2 = p1.known_spaces
    assert_equal expected2, actual2

    p1.uncover("D2")
    actual3 = p1.known_spaces
    assert_equal expected3, actual3

    p1.uncover("K12")
    actual4 = p1.known_spaces
    assert_equal expected4, actual4
  end

  def test_player_starts_with_given_number_of_ships
    p1 = Player.new([2, 3])
    p2 = Player.new([2, 3, 4])
    p3 = Player.new([2, 3, 4, 5])

    assert_equal 2, p1.ship_count
    assert_equal 3, p2.ship_count
    assert_equal 4, p3.ship_count
  end

  def test_player_starts_with_given_type_of_ships
    p1 = Player.new([2, 3])
    p2 = Player.new([2, 3, 4])
    p3 = Player.new([2, 3, 4, 5])

    assert_equal [2, 3], p1.ships
    assert_equal [2, 3, 4], p2.ships
    assert_equal [2, 3, 4, 5], p3.ships
  end
  # def test_player_can_place_ship
  #   p1 = Player.new
  #
  # end
  #
  # @beginner = {"length"=>4, "ships"=>[2, 3]}
  # @intermediate = {"length"=>8, "ships"=>[2, 3, 4]}
  # @advanced = {"length"=>12, "ships"=>[2, 3, 4, 5]}

end
