class Grid
  
  GRID_SIZE = 3.freeze
  CELL_SIZE = 3.freeze
  
  GRID_CHAR = '*'.freeze
  
  def initialize(size=GRID_SIZE)
    @size = size
    @grid = Array.new(size, Array.new(size, ''))
    
  end
  
  def draw
    display = ''
    @grid.each do |row|
      display << render_line
      display << render_row(row)
    end
    display << render_line
    puts display
  end
  
  
  private
  
  def render_line  
    GRID_CHAR + (GRID_CHAR * (CELL_SIZE+1)) * @size + "\n"
  end
  
  def render_row(row)
    GRID_CHAR + (' ' * (CELL_SIZE) + GRID_CHAR) * @size + "\n"
  end
  
end
