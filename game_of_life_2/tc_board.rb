require 'test/unit'
require 'board'

class TC_Board < Test::Unit::TestCase

	def setup
		@board = Board.new(50)
	end
	
	def test_dimensions
		number_of_columns = @board.cells.length
		number_of_rows 		= @board.cells.first.length
		assert_equal 50, number_of_columns
		assert_equal 50, number_of_rows
	end

  def test_contains_life?
		location = Location.new(:x => 0, :y => 0)
		assert_equal false, @board.contains_life?(location)
  end

	def test_spawn		
		location = Location.new(:x => 0, :y => 0)
		assert_equal false, @board.contains_life?(location)
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

	def test_count_neighbours_for_cell_with_8_neighbours
		location = Location.new(:x => 1, :y => 1)
		@board.spawn(location)
		
		spawn_neighbours_for(location,[:above_left, :above, :above_right])
		assert_equal 3, @board.count_neighbours_for(location)
		
		spawn_neighbours_for(location,[:left, :right])
		assert_equal 5, @board.count_neighbours_for(location)
		
		spawn_neighbours_for(location,[:below_left, :below, :below_right])
		assert_equal 8, @board.count_neighbours_for(location)
	end
	
	def test_count_neighbours_for_edge_cell_with_4_neighbours
		location = Location.new(:x => 0, :y => 0)
		@board.spawn(location)
		
		spawn_neighbours_for(location,[:above_left, :above, :above_right])
		assert_equal 0, @board.count_neighbours_for(location)
		
		spawn_neighbours_for(location,[:left, :right])
		assert_equal 1, @board.count_neighbours_for(location)
		
		spawn_neighbours_for(location,[:below_left, :below, :below_right])
		assert_equal 3, @board.count_neighbours_for(location)
	end
			
	private
		def spawn_neighbours_for(location, positions)
			positions.each do |position|
				neighbour_x = location.x + Board::NEIGHBOUR_OFFSETS[position][:x]
				neighbour_y = location.y + Board::NEIGHBOUR_OFFSETS[position][:y]
				neighbour_location = Location.new(:x => neighbour_x, :y => neighbour_y)				
				@board.spawn(neighbour_location)
			end
		end
	
end