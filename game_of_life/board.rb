class Board
  
  def initialize size
    @cells = Array.new(size) { Array.new(size, false) }
  end
  
  def number_of_cells
    @cells.inject(0) do |count, row|
      count += row.length
    end
  end
  
  def contains_life? location
    @cells[location.y][location.x] == true
  end
  
  def spawn location
    @cells[location.y][location.x] = true if location.is_valid?
  end
  
  def kill location
    @cells[location.y][location.x] = false if location.is_valid?
  end
  
end