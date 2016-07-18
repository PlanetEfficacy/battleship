require './lib/board'
require './lib/ship'
require './lib/player'

class Rules

  def valid_space?(board, coordinates)
    board.contains?(coordinates)
  end

  def two_unit_ship_wrap_violation?(board, ship, start_space, end_space)
    return false if !valid_space?(board, start_space) && !valid_space?(board, end_space)
    board.neighbors?(start_space, end_space)
  end
end
