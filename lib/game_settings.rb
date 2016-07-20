class GameSettings
  attr_reader :beginner,
              :intermediate,
              :advanced,
              :difficulty

  def initialize(difficulty)
    @beginner = {"length"=>4, "ships"=>[2, 3]}
    @intermediate = {"length"=>8, "ships"=>[2, 3, 4]}
    @advanced = {"length"=>12, "ships"=>[2, 3, 4, 5]}
    user_input = {
      "B" => @beginner,
      "I" => @intermediate,
      "A" => @advanced
    }
    @difficulty = user_input[difficulty]
  end


end
