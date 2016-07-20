require "./lib/space"
require "./lib/neighbors"
require "./lib/create_board"
require "./lib/board_evaluation"
require "./lib/getters"
require "./lib/setters"

class Board
  attr_reader :length,
              :board

  def initialize(length)
    @length = length
    @board = create_grid
  end

  include Neighbors
  include CreateBoard
  include BoardEvaluation
  include Getters
  include Setters

end
