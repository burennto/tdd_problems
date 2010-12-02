class TicTacToe
  
  def initialize
    @grid = Array.new(3, Array.new(3, ''))
  end
  
  def place(cell, symbol)
    
    
  end
  
  def over?
    if has_winner? || grid_full?
      true
    else
      false
    end
  end
  
  def has_winner?
    false
  end
  
  def grid_full?
    @grid.each do |row|
      return false if row.include?('')
    end
    true
  end
  
end