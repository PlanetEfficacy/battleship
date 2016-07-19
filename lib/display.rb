class Display

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


end
