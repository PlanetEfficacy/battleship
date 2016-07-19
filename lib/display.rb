class Display
  def border(length)
    border = ""
    (length * 2).times { border += "=" }
    border += "==="
  end

  def row(cells)
    cells.map { |cell| cell == "" ? " " : cell }.join(" ")
  end

  def display_grid(length, *rows)
    border(length) + "\n" + rows.map { |cells| row(cells) + "\n" }.join + border(length)
  end
end
