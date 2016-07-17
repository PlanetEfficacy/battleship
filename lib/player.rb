class Player
  attr_reader :shots_fired,
              :winner,
              :known_spaces,
              :ships

  def initialize(ship_types)
    @shots_fired = 0
    @winner = false
    @known_spaces = []
    @ships = ship_types
  end

  def fire
    @shots_fired += 1
  end

  def uncover(coordinates)
    @known_spaces << coordinates
  end

  def ship_count
    @ships.length
  end


end
