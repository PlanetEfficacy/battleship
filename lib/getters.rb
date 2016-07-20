module Getters
  def get_spaces_between(coordinate1, coordinate2)
    return get_row_spaces_between(coordinate1, coordinate2) if same_row?(coordinate1, coordinate2)
    return get_column_spaces_between(coordinate1, coordinate2) if same_column?(coordinate1, coordinate2)
  end

  def get_row_spaces_between(coordinate1, coordinate2)
    columns = (get_smaller_column(coordinate1, coordinate2)..get_bigger_column(coordinate1, coordinate2)).to_a
    columns.map { |column| get_row(coordinate1) + column }
  end

  def get_column_spaces_between(coordinate1, coordinate2)
    rows = (get_smaller_row(coordinate1, coordinate2)..get_bigger_row(coordinate1, coordinate2)).to_a
    rows.map { |row| row + get_column(coordinate1) }
  end

  def get_bigger_column(coordinate1, coordinate2)
    get_column(coordinate1).to_i > get_column(coordinate2).to_i ? get_column(coordinate1) : get_column(coordinate2)
  end

  def get_smaller_column(coordinate1, coordinate2)
    get_column(coordinate1).to_i < get_column(coordinate2).to_i ? get_column(coordinate1) : get_column(coordinate2)
  end

  def get_bigger_row(coordinate1, coordinate2)
    get_row(coordinate1) > get_row(coordinate2) ? get_row(coordinate1) : get_row(coordinate2)
  end

  def get_smaller_row(coordinate1, coordinate2)
    get_row(coordinate1) < get_row(coordinate2) ? get_row(coordinate1) : get_row(coordinate2)
  end

  def get_row(coordinate)
    coordinate.split("")[0]
  end

  def get_column(coordinate)
    coordinate[1..-1]
  end

  def get_horizontal_length(coordinate1, coordinate2)
    return false if !same_row?(coordinate1, coordinate2)
    column1 = get_column(coordinate1).to_i
    column2 = get_column(coordinate2).to_i
    column1 > column2 ? (column1 - column2) + 1 : (column2 - column1) + 1
  end

  def get_vertical_length(coordinate1, coordinate2)
    return false if !same_column?(coordinate1, coordinate2)
    row1 = get_row_letters.index(get_row(coordinate1))
    row2 = get_row_letters.index(get_row(coordinate2))
    row1 > row2 ? (row1 - row2) + 1 : (row2 - row1) + 1
  end

end
