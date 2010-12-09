require 'test/unit'
require 'board'
require 'location'

class TC_Board < Test::Unit::TestCase
  
  def setup
    @board = Board.new(5)
  end
  
  def test_initialize
    assert_equal 25, @board.number_of_cells
  end
  
  def test_contains_life?
    location = Location.new(:x => 0, :y => 0)
    assert_equal false, @board.contains_life?(location)
  end
  
  def test_spawn
    location = Location.new(:x => 0, :y => 0)
    @board.spawn(location)
    assert_equal true, @board.contains_life?(location)
  end
  
  def test_kill
    location = Location.new(:x => 0, :y => 0)
    @board.spawn(location)
    assert_equal true, @board.contains_life?(location)
    @board.kill(location)
    assert_equal false, @board.contains_life?(location)
  end
  
  
  
end