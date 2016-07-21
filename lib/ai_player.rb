require './lib/player'

class AiPlayer < Player
  def pick(board)
    board.create_space_names.sample
  end

  def pick_exhaustive(board)
    pick_history = []
    board_spaces = board.create_space_names
    until all_spaces_have_been_picked(board_spaces) do
      this_pick = pick(board)
      if not_picked_before?(this_pick, pick_history)
        board_spaces.delete(this_pick)
        pick_history << this_pick
      end
    end
    pick_history
  end

  def all_spaces_have_been_picked(board_spaces)
    board_spaces.length == 0
  end

  def not_picked_before?(this_pick, pick_history)
    !pick_history.include?(this_pick)
  end

  def pick_unoccupied(board)
     pick_exhaustive(board).find { |coordinate| !board.space_occupied?(coordinate) }
  end

  def pick_unattacked(board)
    picks = pick_exhaustive(board)
    picks.find { |coordinate| !board.space_attacked?(coordinate) }
  end

  def pick_x_units_vertically(board, coordinate1, distance)
    pick_exhaustive(board).find do |coordinate2|
      !board.space_occupied?(coordinate2) && board.get_vertical_length(coordinate1, coordinate2) == distance
    end
  end

  def pick_x_units_horizontally(board, coordinate1, distance)
    pick_exhaustive(board).find do |coordinate2|
      !board.space_occupied?(coordinate2) && board.get_horizontal_length(coordinate1, coordinate2) == distance
    end
  end

  def pick_x_units(board, coordinate1, distance)
    if [true, false].sample
      pick_x_units_horizontally(board, coordinate1, distance) || pick_x_units_vertically(board, coordinate1, distance)
    else
      pick_x_units_vertically(board, coordinate1, distance) || pick_x_units_horizontally(board, coordinate1, distance)
    end
  end

  def pick_coordinates(board, ship)
    coordinate1 = pick_unoccupied(board)
    coordinate2 = pick_x_units(board, coordinate1, ship.length)
    [coordinate1, coordinate2].include?(nil) ? false : [coordinate1, coordinate2]
  end

end
