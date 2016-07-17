require "./lib/space"
class Board
  attr_reader :length

  def initialize(length)
    @length = length
    # @board = create_spaces
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

end

# get_row_letters.each do |letter|
#   create_spaces.each do |key,value|
#
# end
#
#   row << {key => value} if key.include?(get_row_letters[index])
# end


# grid = create_array_structure
# create_array_structure.each.with_index do |row, index|
#   #binding.pry
#   create_spaces.each do |key,value|
#
#     row << {key => value} if key.include?(get_row_letters[index])
#
#   end
#   grid[index] << row
#   #select { |key| key.to_s.include?(get_row_letters[index])}
# end
#





# create_spaces.each_slice(@length).to_a
# get_row_letters.map do |letter|
#   create_spaces.select { |key| key.to_s.include?(letter) }
# # end
# grid = []
#
# # @length.times do { grid << [] }
#
# create_spaces.each do |space|
#   row << space
# end
# binding.pry
