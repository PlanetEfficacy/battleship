require './lib/board'
require './lib/ship'
require './lib/player'

class Rules

  def valid_space?(board, coordinates)
    board.contains?(coordinates)
  end

  def both_coordinates_valid?(board, coordinate1, coordinate2)
    board.contains?(coordinate1) && board.contains?(coordinate2)
  end

  def diagonal_placement_compliance?(board, ship, start_space, end_space)
    board.same_row?(start_space, end_space) || board.same_column?(start_space, end_space)
  end

  def length_compliance?(board, ship, start_space, end_space)
    # will cover wrap compliance because program assumes ships are placed
    # in direction with front of ship on smallest space, end of ship
    # on largest space
    if board.same_row?(start_space, end_space)
      ship.length ==  board.get_horizontal_length(start_space, end_space)
    else
      ship.length == board.get_vertical_length(start_space, end_space)
    end
  end

  def ship_overlap_compliance?(board, ship, start_space, end_space)
    spaces_to_check = board.get_spaces_between(start_space, end_space)
    spaces_to_check.none? { |coordinate| board.space_occupied?(coordinate) }
  end

  def virgin_attack_compliance?(board, coordinate)
    v1 = board.space_attacked?(coordinate)
  end

  def game_is_over?(player1, player2)
    player1.check_if_game_is_lost || player2.check_if_game_is_lost
  end

end
