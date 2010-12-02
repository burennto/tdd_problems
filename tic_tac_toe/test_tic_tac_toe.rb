require 'test/unit'
require 'tic_tac_toe'
require 'player'

class TC_TicTacToe < Test::Unit::TestCase
  
  def setup
    @game = TicTacToe.new
    Player.reset
  end
  
  def test_empty_grid
    assert_equal false, @game.over?
  end
  
  def test_full_grid_draw
    (1..9).each do |cell|
      symbol = cell.odd? ? 'X' : 'O'
      @game.place(cell, symbol)
    end
    assert_equal true, @game.over?
  end
  
  # def test_unique_symbol
  #     assert_nothing_raised do
  #       @p1 = Player.new('O')
  #       @p2 = Player.new('X')
  #     end
  #   end
  # 
  #   def test_duplicate_symbol
  #     assert_raise Exception do
  #       @p1 = Player.new('O')
  #       @p2 = Player.new('O')
  #     end
  #   end
    
end