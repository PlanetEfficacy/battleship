require './test/test_helper'
require './lib/messages'

class MessagesTest < Minitest::Test
  include Messages
  def test_welcome

    assert_equal "Welcome to BATTLESHIP", Messages.welcome #welcome
  end

  def test_prompt_to_play
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", Messages.prompt_to_play
  end

  def test_how_to_play
    actual = "Prepare For Battle\n\nThe computer will place ships and then you will be prompted to place ships. Select the start and end coordinates you wish the ship to occupy.\nRules for placing ships:\nPlace each ship in any horizontal or vertical position, but not diagonally.\nDo not place a ship that any part of it overlaps letters, numbers, the edge of the grid, or another ship.\nHow to Play\n\nOn your turn pick a target space to attack and enter its location by letter and number.\nIf you pick a space occupied by a ship on your opponent's ocean grid, your shot is a hit!\n\nIt's a Miss!\nIf you pick a space that is not occupied by a ship on your opponent's ocean grid, it is a miss.\nAfter a hit or miss, your turn is over.\nPlay continues in this manner, with you and your opponent picking spaces one shot per turn.\n\nSinking a Ship\nOnce all the spaces any one ship occupies have been attacked, it has been sunk.\n\nWinning the Game\nIf you are the first player to sink all of your opponents ships, you win the game!"
    assert_equal actual, Messages.how_to_play
  end

  def test_ship_placement_message
    actual = "I have laid out my ships on the grid\nYou now need to layout your ships\n"
    assert_equal actual, Messages.ship_placement_message
  end

  def test_prompt_to_select_difficulty
    actual = "Select a difficulty level:\n(B)eginner = 4x4 grid, 2-unit boat, 3-unit boat\n(I)ntermediate = 8x8 grid, 2-unit boat, 3-unit boat, 4-unit boat\n(A)dvanced = 12x12 grid, 2-unit boat, 3-unit boat, 4-unit boat, 5-unit boat"
    assert_equal actual, Messages.prompt_select_difficulty
  end

  def test_beginner_units
    actual = "The first is two units long and the\nsecond is three units long."
    assert_equal actual, Messages.beginner_units
  end

  def test_intermediate_units
    actual = "The first is two units long and the\nsecond is three units long\nthird is four units long."
    assert_equal actual, Messages.intermediate_units
  end

  def test_advanced_units
    actual = "The first is two units long and the\nsecond is three units long\nthird is four units long\nfourth is 5 units long and shall be named 'Battle Star Galactica'."
    assert_equal actual, Messages.advanced_units
  end

  def test_beginner_grid_description
    actual = "The grid has A1 at the top left and D4 at the bottom right."
    assert_equal actual, Messages.beginner_grid_description
  end

  def test_intermediate_grid_description
    actual = "The grid has A1 at the top left and H8 at the bottom right."
    assert_equal actual, Messages.intermediate_grid_description
  end

  def test_beginner_grid_description
    actual = "The grid has A1 at the top left and L12 at the bottom right."
    assert_equal actual, Messages.advanced_grid_description
  end

  def test_prompt_to_place_ship
    actual = "\nEnter the squares for the two-unit ship:"
    actual2 = "\nEnter the squares for the three-unit ship:"
    actual3 = "\nEnter the squares for the four-unit ship:"
    actual4 = "\nEnter the squares for the Battle Star Galactica - five-unit ship:"
    assert_equal actual, Messages.prompt_place_ship(2)
  end

  def test_prompt_player_for_firing_coordinates
    actual = "Enter firing coordinates:"
    assert_equal actual, Messages.prompt_player_for_firing_coordinates
  end

  def test_error_invalid_coordinate
    actual = "Those coordinates are not on the grid. Coordinates are defined by row letter and a column number. For example 'A1'."
    assert_equal actual, Messages.error_invalid_coordinate
  end

  def test_error_previously_attacked_coordinate
    actual = "You attacked those coordinates on a previous turn. Select new, unattacked coordinates for maximum destruction."
    assert_equal actual, Messages.error_previously_attacked_coordinate
  end

  def test_message_hit
    actual = "You have hit an enemy ship."
    assert_equal actual, Messages.message_hit[-27..-1]
  end

  def test_message_miss
    actual = "You did not hit an enemy ship."
    assert_equal actual, Messages.message_miss[-30..-1]
  end

  def test_message_computer_hit
    actual = "Incoming fire at A1.... Your opponent has scored a direct hit."
    actual2 = "Incoming fire at B2.... Your opponent has scored a direct hit."
    assert_equal actual, Messages.message_computer_hit("A1")
    assert_equal actual2, Messages.message_computer_hit("B2")
  end

  def test_message_computer_miss
    actual = "Your opponent has fired on space A1 and missed!"
    actual2 = "Your opponent has fired on space B2 and missed!"

    assert_equal actual, Messages.message_computer_miss("A1")[-47..-1]
    assert_equal actual2, Messages.message_computer_miss("B2")[-47..-1]
  end

  def test_prompt_player_to_end_turn
    actual = "Press ENTER to end your turn."
    assert_equal actual, Messages.prompt_player_to_end_turn
  end

  def test_computer_map_message
    actual = "Here is your opponent's progress:"
    assert_equal actual, Messages.computer_map_message
  end

  def test_player_map_message
    actual = "Here is your progress:"
    assert_equal actual, Messages.player_map_message
  end

  def test_hit_no_sink_message
    actual = "The hit did not sink the ship."
    assert_equal actual, Messages.hit_no_sink_message
  end

  def test_hit_sink_message
    actual = "The hit sunk the two-unit ship."
    assert_equal actual, Messages.hit_sink_message(2)
  end

  def test_congratulations
    actual = "Congratulations. You are victorious!"
    assert_equal actual, Messages.congratulations
  end

  def test_shots_fired_message
    actual = "Ammunition stores depleated by 5 shells."
    assert_equal actual, Messages.shots_fired_message(5)
  end

  def test_game_clock_message
    actual = "Total game time: 5 minutes"
    assert_equal actual, Messages.game_clock_message("5 minutes")
  end

end
