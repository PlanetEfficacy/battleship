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

  def has_north_neighbor?(coordinates)
    get_row_letters.index(coordinates.split('')[0]) > 0
  end

  def has_south_neighbor?(coordinates)
    get_row_letters.index(coordinates.split('')[0]) < @length - 1
  end

  def has_east_neighbor?(coordinates)
    (coordinates[1..-1].to_i > 0) && (coordinates[1..-1].to_i < @length)
  end

  def has_west_neighbor?(coordinates)
    coordinates[1..-1].to_i > 1
  end

  def get_north_neighbor(coordinates)
    get_row_letters[get_row_letters.index(coordinates.split('')[0]) - 1] + coordinates[1..-1]
  end

  def get_south_neighbor(coordinates)
    get_row_letters[get_row_letters.index(coordinates.split('')[0]) + 1] + coordinates[1..-1]
  end

  def get_east_neighbor(coordinates)
    coordinates.split('')[0] + (coordinates[1..-1].to_i + 1).to_s
  end

  def get_west_neighbor(coordinates)
    coordinates.split('')[0] + (coordinates[1..-1].to_i - 1).to_s
  end

  def neighbors(coordinates)
    neighbors = []
    neighbors << get_north_neighbor(coordinates) if has_north_neighbor?(coordinates)
    neighbors << get_east_neighbor(coordinates) if has_east_neighbor?(coordinates)
    neighbors << get_south_neighbor(coordinates) if has_south_neighbor?(coordinates)
    neighbors << get_west_neighbor(coordinates) if has_west_neighbor?(coordinates)
    return neighbors
  end

  def get_space(coordinates)
    @board.each do |row|
      row.each do |space_hash|
        return space_hash[coordinates] if space_hash.keys[0] == coordinates
      end
    end
  end

end
