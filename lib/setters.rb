module Setters
  def set_space_occupied(coordinate)
    get_space(coordinate).occupied = true
  end

  def set_spaces_occupied(coordinate1, coordinate2)
    same_row?(coordinate1, coordinate2) ? set_row_spaces_occupied(coordinate1, coordinate2) : set_column_spaces_occupied(coordinate1, coordinate2)
  end

  def set_row_spaces_occupied(coordinate1, coordinate2)
    get_row_spaces_between(coordinate1, coordinate2).each do |coordinate|
      set_space_occupied(coordinate)
    end
  end

  def set_column_spaces_occupied(coordinate1, coordinate2)
    get_column_spaces_between(coordinate1, coordinate2).each do |coordinate|
      set_space_occupied(coordinate)
    end
  end

  def set_space_attacked(coordinate)
    get_space(coordinate).attacked = true
  end
end
