module BoardEvaluation
  def contains?(coordinates)
    create_space_names.include?(coordinates)
  end

  def same_row?(coordinate1, coordinate2)
    get_row(coordinate1) == get_row(coordinate2)
  end

  def same_column?(coordinate1, coordinate2)
    get_column(coordinate1) == get_column(coordinate2)
  end

  def space_occupied?(coordinate)
     get_space(coordinate).occupied
  end

  def space_attacked?(coordinate)
    get_space(coordinate).attacked
  end

  def contains_hit?(coordinate)
    space_attacked?(coordinate) && space_occupied?(coordinate)
  end

  def contains_miss?(coordinate)
    space_attacked?(coordinate) && !space_occupied?(coordinate)
  end

  def first_column?(coordinate)
    get_column(coordinate) == "1"
  end

end
