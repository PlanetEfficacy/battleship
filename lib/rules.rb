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

  def two_unit_ship_wrap_compliance?(board, ship, start_space, end_space)
    board.neighbors?(start_space, end_space)
  end

  def diagonal_placement_compliance?(board, ship, start_space, end_space)
    board.get_row(start_space) == board.get_row(end_space) || board.get_column(start_space) == board.get_column(end_space)
  end

  def longer_than_two_unit_ship_wrap_compliance?(board, ship, start_space, end_space)
    if board.same_row?(start_space, end_space)
      ship.length == board.get_horizontal_length(start_space, end_space)
    else
      ship.length == board.get_vertical_length(start_space, end_space)
    end
  end

end
