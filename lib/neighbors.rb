module Neighbors

  def has_north_neighbor?(coordinate)
    get_row_letters.index(get_row(coordinate)) > 0
  end

  def has_south_neighbor?(coordinate)
    get_row_letters.index(get_row(coordinate)) < @length - 1
  end

  def has_east_neighbor?(coordinate)
    (coordinate[1..-1].to_i > 0) && (coordinate[1..-1].to_i < @length)
  end

  def has_west_neighbor?(coordinate)
    coordinate[1..-1].to_i > 1
  end

  def get_north_neighbor(coordinate)
    get_row_letters[get_row_letters.index(get_row(coordinate)) - 1] + get_column(coordinate)
  end

  def get_south_neighbor(coordinate)
    get_row_letters[get_row_letters.index(get_row(coordinate)) + 1] + get_column(coordinate)
  end

  def get_east_neighbor(coordinate)
    get_row(coordinate) + (get_column(coordinate).to_i + 1).to_s
  end

  def get_west_neighbor(coordinate)
    get_row(coordinate) + (get_column(coordinate).to_i - 1).to_s
  end

  def neighbors(coordinate)
    neighbors = []
    neighbors << get_north_neighbor(coordinate) if has_north_neighbor?(coordinate)
    neighbors << get_east_neighbor(coordinate) if has_east_neighbor?(coordinate)
    neighbors << get_south_neighbor(coordinate) if has_south_neighbor?(coordinate)
    neighbors << get_west_neighbor(coordinate) if has_west_neighbor?(coordinate)
    return neighbors
  end

  def neighbors?(coordinate1, coordinate2)
    neighbors(coordinate1).include?(coordinate2)
  end
  
end
