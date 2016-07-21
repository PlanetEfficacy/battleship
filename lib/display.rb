module Display

  def self.border(length)
    "".center(3 * length + 4, "=")
  end

  def self.row(cells)
    cells.map { |cell| parse_blank(cell).ljust(3) }.join.rstrip!
  end

  def self.parse_blank(cell)
    cell == "" ? "   " : cell
  end

  def self.header(length)
    start = [".  "]
    length.times { |i| start << (i + 1).to_s.ljust(3) }
    start.join.rstrip!
  end

  def self.display_grid(length, rows_data)
    border(length) + "\n" + header(length) + "\n" + make_rows_data_presentable(rows_data) + border(length)
  end

  def self.make_rows_data_presentable(rows_data)
    rows_data.map { |row_data| row(row_data) + "\n" }.join
  end

  def self.get_rows_data(board)
    grid = board.board
    viewable_grid = grid.map do |this_row|
      get_row_data(board, this_row)
    end
  end

  def self.get_row_data(board, grid_row)
    row_data = []
    grid_row.each do |this_space|
      space = this_space.values[0]
      row_data << board.get_row(space.coordinates) if board.first_column?(space.coordinates)
      row_data << "H" if hit?(board, space.coordinates)
      row_data << "M" if miss?(board, space.coordinates)
      row_data << "" if not_attacked?(board, space.coordinates)
    end
    return row_data
  end

  def self.render(board)
    display_grid(board.length, get_rows_data(board))
  end

  private

  def self.hit?(board, coordinate)
    board.contains_hit?(coordinate)
  end

  def self.miss?(board, coordinate)
    board.contains_miss?(coordinate)
  end

  def self.not_attacked?(board, coordinate)
    !board.space_attacked?(coordinate)
  end
end
