module Display

  def border(length)
    "".center(3 * length + 4, "=")
  end

  def row(cells)
    cells.map { |cell| parse_blank(cell).ljust(3) }.join.rstrip!
  end

  def parse_blank(cell)
    cell == "" ? "   " : cell
  end

  def header(length)
    start = [".  "]
    length.times { |i| start << (i + 1).to_s.ljust(3) }
    start.join.rstrip!
  end

  def display_grid(length, *rows)
    border(length) + "\n" + header(length) + "\n" + rows.map { |cells| row(cells) + "\n" }.join + border(length)
  end

  def get_rows_data(board)
    grid = board.board
    rows_data = []
    grid.each do |this_row|
      row_data = []
      this_row.each do |this_space|
        space = this_space.values[0]
        row_data << board.get_row(space.coordinates) if board.first_column?(space.coordinates)
        row_data << "H" if board.contains_hit?(space.coordinates)
        row_data << "M" if board.contains_miss?(space.coordinates)
        row_data << "" if !board.space_attacked?(space.coordinates)
      end
      rows_data << row_data
    end
    rows_data
  end

end
