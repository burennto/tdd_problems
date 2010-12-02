class TicTacToe
  
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(3) { Array.new(3, nil) }
  end
  
  def place(cell, symbol)
    case cell
      when 1 then @grid[0][0] = symbol
      when 2 then @grid[0][1] = symbol
      when 3 then @grid[0][2] = symbol
      when 4 then @grid[1][0] = symbol
      when 5 then @grid[1][1] = symbol
      when 6 then @grid[1][2] = symbol
      when 7 then @grid[2][0] = symbol
      when 8 then @grid[2][1] = symbol
      when 9 then @grid[2][2] = symbol
    end
  end
  
  def over?
    if has_winner? || grid_full?
      true
    else
      false
    end
  end
  
  def has_winner?
    horizontal_win || vertical_win || diagonal_win
  end
  
  def grid_full?
    @grid.each do |row|
      return false if row.include?(nil)
    end
    true
  end
  
  def draw
    ascii = @grid.inject('') do |memo, row|
      memo << row.join(' ') << "\n"
    end
    puts ascii
  end
  
  
  private
  
    def horizontal_win
      @grid.each do |row|
        return true if all_symbols_same(row)
      end
      false
    end
  
    def vertical_win
      (0...@grid.length).each do |col_index|
        column = (0...@grid.length).inject([]) do |c, row_index|
          c << @grid[row_index][col_index]
        end
        return true if all_symbols_same(column)
      end
      false
    end
  
    def diagonal_win
      diagonal_1 = [] << @grid[0][0] << @grid[1][1] << @grid[2][2]
      diagonal_2 = [] << @grid[0][2] << @grid[1][1] << @grid[2][0]
      return true if all_symbols_same(diagonal_1)
      return true if all_symbols_same(diagonal_2)
      false
    end
    
    def all_symbols_same(symbols)
      return false if symbols.include?(nil)
      differences = symbols.select { |s| s != symbols[0] }
      differences.length == 0 ? true : false
    end
end
