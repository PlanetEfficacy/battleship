require './lib/ship'
class Player
  attr_reader :shots_fired,
              :winner,
              :known_spaces,
              :fleet

  def initialize(ship_types)
    @shots_fired = 0
    @winner = false
    @known_spaces = []
    @ships = ship_types
    @fleet = []
    assemble_the_fleet
  end

  def fire
    @shots_fired += 1
  end

  def uncover(coordinates)
    @known_spaces << coordinates
  end

  def ship_count
    @fleet.length
  end

  def assemble_the_fleet
    @fleet = @ships.map { |length| Ship.new(length) }
  end

  def place_ship(ship, start_space, end_space)
    #NEEDS VALIDATION
    ship.place(start_space, end_space)
  end


end
