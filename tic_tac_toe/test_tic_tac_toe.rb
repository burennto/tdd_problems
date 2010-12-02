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
    [1, 2, 6, 7, 8].each { |square| @game.place(square, 'o') }
    [3, 4, 5, 9].each    { |square| @game.place(square, 'x') }
    
    assert_equal true,  @game.over?
    assert_equal false, @game.has_winner?
  end
  
  def test_horizontal_win
    [1, 2, 3].each { |square| @game.place(square, 'o') }
    assert_equal true, @game.has_winner?
  end
  
  def test_vertical_win
    [1, 4, 7].each { |square| @game.place(square, 'o') }
    assert_equal true, @game.has_winner?
  end
  
  def test_diagonal_win
    [1, 5, 9].each { |square| @game.place(square, 'o') }
    assert_equal true, @game.has_winner?
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