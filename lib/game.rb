require './lib/player'

class Game
  attr_reader :computer_player,
              :human_player

  def initialize(game_settings)
    @computer_player = AiPlayer.new(game_settings["ships"])
    @human_player = Player.new(game_settings["ships"])
    @computer_player_board = Board.new(game_settings["length"])
    @human_player_board = Board.new(game_settings["length"])

  end

  #
  # Ship Placement Module
  #
  # Computer places all ships
    # Pick a first coordinate randomly
    # Pick a second coordinate in the same row / columnn with distance
    # from first coordinate == ship.length
  # Output messages
  # Until all ships placed
    # Prompt Player for coordinates
    # Validate coordinates
      # Both coordinates are on the map
      # Coordinates are vertical || horizontal
      # Distance between coordinates == ship.length
  def ship_placement
    @computer_player.fleet.each do |ship|
      @computer_player.place_ship(@computer_player_board, ship, start_space, end_space)
    end

  end




  # Game Flow Main Module
  # End Game Module
end
