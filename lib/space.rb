class Space
  attr_reader :coordinates,
              :occupied,
              :attacked

  def initialize(coordinates)
    @coordinates = coordinates
    @occupied = false
    @attacked = false
  end

end
