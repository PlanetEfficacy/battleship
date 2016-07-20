require './lib/player'

class Game
  attr_reader :computer_player,
              :human_player

  def initialize(game_settings)
    @computer_player = Player.new(game_settings["ships"])
    @human_player = Player.new(game_settings["ships"])
    @computer_player_board = Board.new(game_settings["length"])
    @human_player_board = Board.new(game_settings["length"])

  end


  # Ship Placement Module
  def ship_placement
    @computer_player.fleet.each do |ship|
      @computer_player.place_ship(@computer_player_board, ship, start_space, end_space)
    end

  end




  # Game Flow Main Module
  # End Game Module
end
