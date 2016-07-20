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
  # For each ship in the player's fleet
    # Prompt Player for coordinates
    # Validate coordinates
      # Both coordinates are on the map
      # Coordinates are vertical || horizontal
      # Distance between coordinates == ship.length
    # Place ship on board
  #
  # Main Phase Module
  #
  # Turn = Player1
  # Until rules.game_is_over?
    # Display board
    # Prompt for firing coordinates
    # Validate coordinates
      # Coordinate is on map
      # Coordinate has not been attacked
    # Fire on coordinate
    # Assess attack
    # Hit?
      # put ship hit message
      # Get ship by coordinate
      # Apply damage to ship - Ship.hit
      # Ship.is_sunk?
        # True
          # put ship sunk message
    # !Hit?
      # put ship miss message
      # Change Player Turn
  #
  # End Game Module
  #
  # Congratulations || condolences
  # Shots Fired Message
  # Time Played Message


  
  def ship_placement
    @computer_player.fleet.each do |ship|
      @computer_player.place_ship(@computer_player_board, ship, start_space, end_space)
    end

  end




  # Game Flow Main Module
  # End Game Module
end
