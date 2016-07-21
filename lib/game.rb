require './lib/ai_player'
require './lib/rules'
require './lib/display'
require './lib/attack_assessment'
require 'pry'

class Game
  attr_reader :computer_player,
              :human_player,
              :computer_player_board,
              :human_player_board,
              :settings,
              :start_time

  def initialize(settings)
    starting_ships = settings.difficulty["ships"]
    length = settings.difficulty["length"]
    @computer_player = AiPlayer.new(starting_ships)
    @human_player = Player.new(starting_ships)
    @computer_player_board = Board.new(length)
    @human_player_board = Board.new(length)
    @settings = settings
    @start_time = Time.new

    ship_placement

    until Rules.game_is_over?(human_player, computer_player)
     main_phase
     Rules.game_is_over?(human_player, computer_player)
    end

    end_sequence

    exit
  end

  def ship_placement
    computer_ship_placement
    human_ship_placement
  end

  def computer_ship_placement
    computer_player.fleet.each do |ship|
      coordinates = computer_player.pick_coordinates(computer_player_board, ship)
      computer_player.place_ship(computer_player_board, ship, coordinates[0], coordinates[1])
    end
    puts Messages.ship_placement_message
  end

  def human_ship_placement
    ouput_difficulty_level_instructions(settings.difficulty_level)
    human_player.ships.each do |ship_type|
      ship = human_player.get_ship(ship_type)
      coordinates = get_valid_ship_coordinates_from_player(ship)
      human_player.place_ship(human_player_board, ship, coordinates[0], coordinates[1])
    end
  end

  def get_valid_ship_coordinates_from_player(ship)
    coordinates_pass_validation = false
    until coordinates_pass_validation
      puts Messages.prompt_place_ship(ship.length)
      coordinates = HelperMethods.get_user_coordinates
      coordinates_pass_validation = valid_coordinates?(human_player_board, ship, coordinates)
    end
    return coordinates
  end

  def ouput_difficulty_level_instructions(difficulty_level)
    puts Messages.beginner_units + "\n" + Messages.beginner_grid_description if difficulty_level == "Beginner"
    puts Messages.intermediate_units + "\n" + Messages.intermediate_grid_description if difficulty_level == "Intermediate"
    puts Messages.advanced_units + "\n" + Messages.advanced_grid_description if difficulty_level == "Advanced"
    puts "You are running in test mode with on 2-unit ship and a 2x2 board." if difficulty_level == "Test Mode"
    puts Display.render(human_player_board)  + "\n"
  end

  def validate_that_coordinates_are_in_bounds(board, coordinates)
    unless coordinates.class != Array || Rules.both_coordinates_valid?(board, coordinates[0], coordinates[1])
      puts Messages.error_invalid_coordinate
      return false
    end
    return true
  end

  def validate_that_coordinates_are_horizontal_or_diagonal(board, coordinates)
    unless Rules.diagonal_placement_compliance?(board, coordinates[0], coordinates[1])
      puts Messages.error_diagonal_placement
      return false
    end
    return true
  end

  def validate_that_coordinates_are_correct_distance_apart(board, ship, coordinates)
    unless Rules.length_compliance?(board, ship, coordinates[0], coordinates[1])
      puts Messages.error_length
      return false
    end
    return true
  end

  def validate_that_coordinates_are_not_already_occupied(board, ship, coordinates)
    unless Rules.ship_overlap_compliance?(board, ship, coordinates[0], coordinates[1])
      puts Messages.error_overlap
      return false
    end
    return true
  end

  def valid_coordinates?(board, ship, coordinates)
    validity_check = false
    valid_coordinates = validate_that_coordinates_are_in_bounds(board, coordinates)
    valid_orientation = validate_that_coordinates_are_horizontal_or_diagonal(board, coordinates) if valid_coordinates
    valid_distance_apart = validate_that_coordinates_are_correct_distance_apart(board, ship, coordinates) if valid_orientation
    validity_check = validate_that_coordinates_are_not_already_occupied(board, ship, coordinates) if valid_distance_apart
    return validity_check
  end

  def whose_turn_is_it_anyway
    if human_player.shots_fired <= computer_player.shots_fired
      puts "\n\nHuman Player's Turn"
      puts "----------------------"
      { "player"=>human_player, "opponent"=>computer_player, "board"=>computer_player_board }
    else
      puts "\n\nComputer Player's Turn"
      puts "----------------------"
      puts "Computer calculating optimal line of fire and projectile trajectory...."
      { "player"=>computer_player, "opponent"=>human_player, "board"=>human_player_board }
    end
  end

  def show_messages_and_board(player)
    if player == human_player
      puts Messages.player_map_message
      puts Display.render(computer_player_board)
    else
      puts Messages.computer_map_message
      puts Display.render(human_player_board)
    end
  end

  def get_firing_coordinate_from_player(player)
    player == computer_player ? player.pick_unattacked(human_player_board) : human_player_firing_coordinate_selection(player, computer_player_board)
  end

  def human_player_firing_coordinate_selection(player, opponent_board)
    valid_firing_coordinates_provided = false
    until valid_firing_coordinates_provided
      show_messages_and_board(player)
      puts Messages.prompt_player_for_firing_coordinates
      coordinate = HelperMethods.get_user_coordinate
      valid_firing_coordinates_provided = valid_firing_coordinate?(opponent_board, coordinate)
    end
    return coordinate
  end

  def display_hit_or_miss_message(board, coordinate, player)
    if AttackAssessment.hit?(board, coordinate) && player == human_player
      puts Messages.message_hit
    elsif AttackAssessment.hit?(board, coordinate) && player == computer_player
      puts Messages.message_computer_hit(coordinate)
    elsif !AttackAssessment.hit?(board, coordinate) && player == human_player
      puts Messages.message_miss
    elsif !AttackAssessment.hit?(board, coordinate) && player == computer_player
      puts Messages.message_computer_miss(coordinate)
    end
  end

  def allocate_damage_to_ship(board, coordinate, opponent)
    ship = AttackAssessment.get_ship_by_coordinate(board, opponent, coordinate)
    puts "Damage assessment:\nShip damage was #{ship.damage}"
    ship.hit
    puts "Ship damage is now #{ship.damage}"
  end

  def display_sink_or_not_sink_message(ship)
    if ship.is_sunk?
      puts Messages.hit_sink_message(ship.length)
    else
      puts Messages.hit_no_sink_message
    end
  end

  def attack_sequence(board, coordinate, player, opponent)
    player.fire
    display_hit_or_miss_message(board, coordinate, player)
    board.set_space_attacked(coordinate)
    if AttackAssessment.hit?(board, coordinate)
      allocate_damage_to_ship(board, coordinate, opponent)
      ship = AttackAssessment.get_ship_by_coordinate(board, opponent, coordinate)
      display_sink_or_not_sink_message(ship)
    end
  end

  def end_turn(player)
    return if player == computer_player
    user_input = ""
    until user_input.include?("\n")
      puts Messages.prompt_player_to_end_turn
      user_input = gets
    end
  end

  def main_phase
    game_lost = false
    until game_lost
      turn = whose_turn_is_it_anyway
      coordinate = get_firing_coordinate_from_player(turn["player"])
      attack_sequence(turn["board"], coordinate, turn["player"], turn["opponent"])
      show_messages_and_board(turn["player"])
      end_turn(turn["player"])
      game_lost = turn["opponent"].check_if_game_is_lost
    end
  end

  def valid_firing_coordinate?(board, coordinate)
    unless Rules.valid_space?(board, coordinate)
      puts Messages.error_invalid_coordinate
      return false
    end
    unless Rules.virgin_attack_compliance?(board, coordinate)
      puts Messages.error_previously_attacked_coordinate
      return false
    end
    return true
  end

  def end_sequence
    if human_player.check_if_game_is_lost
      puts Messages.condolences
      puts "Computer" + Messages.shots_fired_message(computer_player.shots_fired)
    else
      puts Messages.congratulations
      puts "Your" + Messages.shots_fired_message(human_player.shots_fired)
    end
    puts Messages.game_clock_message(player_readable_time)
  end

  def player_readable_time
    time = Time.new - start_time
    seconds = time.round(2)
    minutes = (time/60).round(2)
    hours = (time/60/60).round(2)

    return "#{seconds} seconds" if game_took_seconds?(time)
    return "#{minutes} minutes" if game_took_minutes?(time)
    return "#{hours} hours" if game_took_hours?(time)
  end

  def game_took_seconds?(time)
    time < 60
  end

  def game_took_minutes?(time)
    time >= 60 && time < 60 * 60
  end

  def game_took_hours?(time)
    time >= 60 * 60
  end
end
