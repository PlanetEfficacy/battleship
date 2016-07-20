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
     picks = pick_exhaustive(board)
     picks.find { |coordinate| !board.space_occupied?(coordinate) }
  end

  def pick_unattacked(board)
    picks = pick_exhaustive(board)
    picks.find { |coordinate| !board.space_attacked?(coordinate)}
  end

end
