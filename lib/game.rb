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
  # Computer places all ships
  def computer_ship_placement
    computer_player.fleet.each do |ship|
      coordinates = computer_player.pick_coordinates(computer_player_board, ship)
      computer_player.place_ship(computer_player_board, ship, coordinates[0], coordinates[1])
    end
    puts Messages.ship_placement_message
  end

  # Output messages

  def human_ship_placement
    ouput_difficulty_level_instructions(settings.difficulty_level)
    human_player.ships.each do |ship_type|
      ship = human_player.get_ship(ship_type)
      coordinates = []
      until valid_coordinates?(human_player_board, ship, coordinates)
        puts Messages.prompt_place_ship(ship_type)
        coordinates = HelperMethods.get_user_coordinates
      end
      human_player.place_ship(human_player_board, ship, coordinates[0], coordinates[1])
    end
  end

  def ouput_difficulty_level_instructions(difficulty_level)
    puts Messages.beginner_units + "\n" + Messages.beginner_grid_description if difficulty_level == "Beginner"
    puts Messages.intermediate_units + "\n" + Messages.intermediate_grid_description if difficulty_level == "Intermediate"
    puts Messages.advanced_units + "\n" + Messages.advanced_grid_description if difficulty_level == "Advanced"
    puts "You are running in test mode with on 2-unit ship and a 2x2 board." if difficulty_level == "Test Mode"
  end

  def valid_coordinates?(board, ship, coordinates)
    unless Rules.both_coordinates_valid?(board, coordinates[0], coordinates[1])
      puts Messages.error_invalid_coordinate
      return false
    end

    unless Rules.diagonal_placement_compliance?(board, coordinates[0], coordinates[1])
      puts Messages.error_diagonal_placement
      return false
    end

    unless Rules.length_compliance?(board, ship, coordinates[0], coordinates[1])
      puts Messages.error_length
      return false
    end

    unless Rules.ship_overlap_compliance?(board, ship, coordinates[0], coordinates[1])
      puts Messages.error_overlap
      return false
    end

    return true
  end

  def main_phase
    # Whose turn is it?
    if human_player.shots_fired <= computer_player.shots_fired
      player = human_player
      opponent = computer_player
      board = computer_player_board
    else
      player = computer_player
      opponent = human_player
      board = human_player_board
    end

    if player.class == Player
      coordinate = ""
      until valid_firing_coordinate?(board, coordinate)
        puts Display.render(board)
        puts Messages.prompt_player_for_firing_coordinates
        coordinate = HelperMethods.get_user_coordinate
      end
      player.attack(board, coordinate)
      if AttackAssessment.hit?(board, coordinate)
        puts Messages.message_hit
        ship = AttackAssessment.get_ship_by_coordinate(board, opponent, coordinate)
        ship.hit
        puts Messages.hit_sink_message(ship.length) if ship.is_sunk?
        puts Messages.hit_no_sink_message unless ship.is_sunk?
      else
        puts Messages.message_miss
      end
      unless Rules.game_is_over?(human_player, computer_player)
        puts Messages.player_map_message
        puts Display.render(board)
        user_input = ""
        until user_input.include?"\n"
          puts Messages.prompt_player_to_end_turn
          user_input = gets
        end
      end

    # AI TURN
    else
      coordinate = player.pick_unattacked(board)
      player.attack(board, coordinate)
      if AttackAssessment.hit?(board, coordinate)
        puts Messages.message_computer_hit(coordinate)
        ship = AttackAssessment.get_ship_by_coordinate(board, opponent, coordinate)
        ship.hit
        puts Messages.hit_sink_message(ship.length) if ship.is_sunk?
        puts Messages.hit_no_sink_message unless ship.is_sunk?
      else
        puts Messages.message_computer_miss(coordinate)
      end
      puts Messages.computer_map_message
      puts Display.render(board)
    end
  end

  def valid_firing_coordinate?(board, coordinate)
    unless Rules.valid_space?(board, coordinate)
      puts Messages.error_invalid_coordinate
      return false
    end

    if Rules.virgin_attack_compliance?(board, coordinate)
      puts Messages.error_previously_attacked_coordinate
      return false
    end
    return true
  end

  def end_sequence
    if human_player.check_if_game_is_lost
      puts Messages.condolences
      puts Messages.shots_fired_message(computer_player.shots_fired)
    else
      puts Messages.congratulations
      puts Messages.shots_fired_message(human_player.shots_fired)
    end
    puts Messages.game_clock_message(Time.new - start_time)
  end

end
