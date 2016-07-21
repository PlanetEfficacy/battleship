require './test/test_helper'
require './lib/game'
require './lib/game_settings'
require './lib/messages'
require './lib/helper_methods'
require './lib/board'
require './lib/rules'

class GameTest < Minitest::Test
  def test_Game_has_players
    g = Game.new(GameSettings.new("t"))

    assert_instance_of AiPlayer, g.computer_player
    assert_instance_of Player, g.human_player
    assert_instance_of Board, g.computer_player_board
    assert_instance_of Board, g.human_player_board
  end

  def test_computer_can_place_all_of_its_ships
    g = Game.new(GameSettings.new("b"))
    g.computer_ship_placement

    # check ships have start / end spaces
    ai_fleet = g.computer_player.fleet
    fleet_check = ai_fleet.map do |ship|
      ship.start_space != nil && ship.end_space != nil
    end

    assert_equal [true, true], fleet_check

    fleet_location = ai_fleet.map do |ship|
      [ship.start_space, ship.end_space]
    end

    # spaces on board with ships are occupied
    fleet_location_is_occupied = fleet_location.map do |coordinate_pair|
      this_ships_spaces = g.computer_player_board.get_spaces_between(coordinate_pair[0], coordinate_pair[1])
      this_ships_spaces.map do |ship_space|
        g.computer_player_board.space_occupied?(ship_space)
      end
    end.flatten

    assert_equal [true,true,true,true,true], fleet_location_is_occupied
  end

  def test_can_evaluate_a_players_ship_placement_coordinates
    skip
    game = Game.new(GameSettings.new("b"))
    human_player_board = Board.new(2)
    ship = Ship.new(2)
    coordinates = ["A1", "B1"]

    assert game.valid_coordinates?(human_player_board, ship, coordinates[0], coordinates[1])

  end
end
