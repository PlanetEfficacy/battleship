require './test/test_helper'
require './lib/messages'

class MessagesTest < Minitest::Test
  include Messages
  def test_welcome
    assert_equal "\n\nWelcome to BATTLESHIP", Messages.welcome #welcome
  end

  def test_prompt_to_play
    assert_equal "\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?", Messages.prompt_to_play
  end

  def test_how_to_play
    actual = "\n\nPrepare For Battle\n\nThe computer will place ships and then you will be prompted to place ships.\nSelect the start and end coordinates you wish the ship to occupy.\n\nRules for placing ships:\n\nPlace each ship in any horizontal or vertical position, but not diagonally.\nDo not place a ship that any part of it overlaps letters, numbers, the edge of the grid, or another ship.\n\nHow to Play\n\nOn your turn pick a target space to attack and enter its location by letter and number.\nIf you pick a space occupied by a ship on your opponent's ocean grid, your shot is a hit!\n\nIt's a Miss!\n\nIf you pick a space that is not occupied by a ship on your opponent's ocean grid, it is a miss.\nAfter a hit or miss, your turn is over.\nPlay continues in this manner, with you and your opponent picking spaces one shot per turn.\n\nSinking a Ship\n\nOnce all the spaces any one ship occupies have been attacked, it has been sunk.\n\nWinning the Game\n\nIf you are the first player to sink all of your opponents ships, you win the game!\n\n\n\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    assert_equal actual, Messages.how_to_play
  end

  def test_ship_placement_message
    actual = "\n\nI have laid out my ships on the grid.\n\nYou now need to layout your ships."
    assert_equal actual, Messages.ship_placement_message
  end

  def test_prompt_to_select_difficulty
    actual = "\n\nSelect a difficulty level:\n\n(B)eginner = 4x4 grid, 2-unit boat, 3-unit boat\n(I)ntermediate = 8x8 grid, 2-unit boat, 3-unit boat, 4-unit boat\n(A)dvanced = 12x12 grid, 2-unit boat, 3-unit boat, 4-unit boat, 5-unit boat\n\n"
    assert_equal actual, Messages.prompt_select_difficulty
  end

  def test_beginner_units
    actual = "\nThe first is two units long and the\nsecond is three units long."
    assert_equal actual, Messages.beginner_units
  end

  def test_intermediate_units
    actual = "\nThe first is two units long, the\nsecond is three units long,\nand the third is four units long."
    assert_equal actual, Messages.intermediate_units
  end

  def test_advanced_units
    actual = "\nThe first is two units long, the\nsecond is three units long,\nthe third is four units long,\nand the fourth is 5 units long.\nYour fourth ship shall be named 'Battle Star Galactica'."
    assert_equal actual, Messages.advanced_units
  end

  def test_beginner_grid_description
    actual = "\nThe grid has A1 at the top left and D4 at the bottom right.\n"
    assert_equal actual, Messages.beginner_grid_description
  end

  def test_intermediate_grid_description
    actual = "\nThe grid has A1 at the top left and H8 at the bottom right.\n"
    assert_equal actual, Messages.intermediate_grid_description
  end

  def test_advanced_grid_description
    actual = "\nThe grid has A1 at the top left and L12 at the bottom right.\n"
    assert_equal actual, Messages.advanced_grid_description
  end

  def test_prompt_to_place_ship
    actual = "\n\nEnter the squares for the two-unit ship. For example:\n\nA1 A2\n\nEnter desired attack coordinates:"
    actual2 = "\n\nEnter the squares for the three-unit ship. For example:\n\nB1 B3\n\nEnter desired attack coordinates:"
    actual3 = "\n\nEnter the squares for the four-unit ship. For example:\n\nC1 C4\n\nEnter desired attack coordinates:"
    actual4 = "\n\nEnter the squares for the Battle Star Galactica - five-unit ship. For example:\n\nD1 D5\n\nEnter desired attack coordinates:"
    assert_equal actual, Messages.prompt_place_ship(2)
  end

  def test_prompt_player_for_firing_coordinates
    actual = "\n\nEnter firing coordinates:"
    assert_equal actual, Messages.prompt_player_for_firing_coordinates
  end

  def test_error_invalid_coordinate
    actual = "\n\nThose coordinates are not on the grid.\nCoordinates are defined by row letter\nand a column number. For example 'A1'."
    assert_equal actual, Messages.error_invalid_coordinate
  end

  def test_error_previously_attacked_coordinate
    actual = "\n\nYou attacked those coordinates on a previous turn.\nSelect new, unattacked coordinates for maximum destruction."
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
    actual = "\n\nIncoming fire at A1.... Your opponent has scored a direct hit."
    actual2 = "\n\nIncoming fire at B2.... Your opponent has scored a direct hit."
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
    actual = "\n\nPress ENTER to end your turn."
    assert_equal actual, Messages.prompt_player_to_end_turn
  end

  def test_computer_map_message
    actual = "\n\nHere is your opponent's progress:"
    assert_equal actual, Messages.computer_map_message
  end

  def test_player_map_message
    actual = "\n\nHere is your progress:"
    assert_equal actual, Messages.player_map_message
  end

  def test_hit_no_sink_message
    actual = "\n\nThe hit did not sink the ship."
    assert_equal actual, Messages.hit_no_sink_message
  end

  def test_hit_sink_message
    actual = "\n\nThe hit sunk the two-unit ship."
    assert_equal actual, Messages.hit_sink_message(2)
  end

  def test_congratulations
    actual = "\n\nCongratulations. You are victorious!"
    assert_equal actual, Messages.congratulations
  end

  def test_shots_fired_message
    actual = " ammunition stores depleated by 5 shells."
    assert_equal actual, Messages.shots_fired_message(5)
  end

  def test_game_clock_message
    actual = "\n\nTotal game time: 5 minutes\n\nThank you for playing battleship.\n\nGame Over.\n\n\n\n\n\n"
    assert_equal actual, Messages.game_clock_message("5 minutes")
  end

end
