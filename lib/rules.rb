require './lib/board'
require './lib/ship'
require './lib/player'

module Rules

  def self.valid_space?(board, coordinates)
    board.contains?(coordinates)
  end

  def self.both_coordinates_valid?(board, coordinate1, coordinate2)
    board.contains?(coordinate1) && board.contains?(coordinate2) ? true : false
  end

  def self.diagonal_placement_compliance?(board, start_space, end_space)
    board.same_row?(start_space, end_space) || board.same_column?(start_space, end_space)
  end

  def self.length_compliance?(board, ship, start_space, end_space)
    # will cover wrap compliance because program assumes ships are placed
    # in direction with front of ship on smallest space, end of ship
    # on largest space
    if board.same_row?(start_space, end_space)
      ship.length ==  board.get_horizontal_length(start_space, end_space)
    else
      ship.length == board.get_vertical_length(start_space, end_space)
    end
  end

  def self.ship_overlap_compliance?(board, ship, start_space, end_space)
    spaces_to_check = board.get_spaces_between(start_space, end_space)
    spaces_to_check.none? { |coordinate| board.space_occupied?(coordinate) }
  end

  def self.virgin_attack_compliance?(board, coordinate)
    !board.space_attacked?(coordinate)
  end

  def self.game_is_over?(player1, player2)
    player1.check_if_game_is_lost || player2.check_if_game_is_lost
  end

end
