class GameSettings
  attr_reader :beginner,
              :intermediate,
              :advanced

  def initialize
    @beginner = {"length"=>4, "ships"=>[2, 3]}
    @intermediate = {"length"=>8, "ships"=>[2, 3, 4]}
    @advanced = {"length"=>12, "ships"=>[2, 3, 4, 5]}
  end
end
