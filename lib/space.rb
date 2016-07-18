class Space
  attr_reader :coordinates

  attr_accessor :occupied,
                :attacked

  def initialize(coordinates)
    @coordinates = coordinates
    @occupied = false
    @attacked = false
  end

end
