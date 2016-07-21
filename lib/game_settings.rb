class GameSettings
  attr_reader :difficulty

  def initialize(difficulty)
    dificulty_levels = {
      "b" => {"length"=>4, "ships"=>[2, 3]},
      "i" => {"length"=>8, "ships"=>[2, 3, 4]},
      "a" => {"length"=>12, "ships"=>[2, 3, 4, 5]},
      "t" => {"length"=>2, "ships"=>[2]}
    }
    @difficulty = dificulty_levels[difficulty]
  end

  def difficulty_level
    return "Beginner" if @difficulty == {"length"=>4, "ships"=>[2, 3]}
    return "Intermediate" if @difficulty == {"length"=>8, "ships"=>[2, 3, 4]}
    return "Advanced" if @difficulty == {"length"=>12, "ships"=>[2, 3, 4, 5]}
    return "Test Mode" if @difficulty == {"length"=>2, "ships"=>[2]}
  end

end
