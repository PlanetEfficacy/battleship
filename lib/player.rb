class Player
  attr_reader :shots_fired,
              :winner,
              :known_spaces
              
  def initialize
    @shots_fired = 0
    @winner = false
    @known_spaces = []
  end
end
