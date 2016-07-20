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
      this_row.each do |this_space|
        space = this_space.values[0]
        rows_data << board.get_row(space.coordinates) if board.get_column(space.coordinates) == "1"
        rows_data << board.space_attacked?(space.coordinates) && board.space_occupied?(space.coordinates) ? "H" : board.space_attacked?(space.coordinates) ? "M" : ""
        binding.pry
        # rows_data << board.get_row(this_row[0][coordinates])
      end
    end
  end

  def contains_hit?(board, coordinate)
    board.space_attacked?(coordinate) && board.space_occupied?(coordinate)
  end

end
