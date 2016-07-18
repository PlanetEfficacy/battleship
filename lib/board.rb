require "./lib/space"
class Board
  attr_reader :length,
              :board

  def initialize(length)
    @length = length
    @board = create_grid
  end

  def get_row_letters
    ("A".."Z").to_a.shift(@length)
  end

  def get_column_numbers
    ("1".."26").to_a.shift(@length)
  end

  def create_space_names
    get_row_letters.map do |letter|
      get_column_numbers.map do |number|
        letter + number
      end
    end.flatten
  end

  def create_spaces
    spaces = {}
    create_space_names.map do |name|
      spaces["#{name}"] = Space.new(name)
    end
    spaces
  end

  def assign_spaces_to_rows
    create_space_names.each_slice(@length).to_a
  end

  def create_grid
    spaces = create_spaces
    assign_spaces_to_rows.map do |row|
      row.each.with_index do |coordinates, index|
        row[index] = {coordinates => spaces[coordinates]}
      end
    end
  end

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

  def get_space(coordinates)
    @board.each do |row|
      row.each do |space_hash|
        return space_hash[coordinates] if space_hash.keys[0] == coordinates
      end
    end
  end

  def contains?(coordinates)
    create_space_names.include?(coordinates)
  end

  def neighbors?(coordinate1, coordinate2)
    neighbors(coordinate1).include?(coordinate2)
  end

  def same_row?(coordinate1, coordinate2)
    get_row(coordinate1) == get_row(coordinate2)
  end

  def same_column?(coordinate1, coordinate2)
    get_column(coordinate1) == get_column(coordinate2)
  end

  def get_inner_spaces(coordinate1, coordinate2)
  end

  def get_row(coordinate)
    coordinate.split("")[0]
  end

  def get_column(coordinate)
    coordinate[1..-1]
  end

end
