require 'location'

class Board

	NEIGHBOUR_OFFSETS = {
		:above_left  => { :x => -1, :y => -1 },
		:above 			 => { :x => 0,  :y => -1 },
		:above_right => { :x => 1,  :y => -1 },
		:left  			 => { :x => -1, :y => 0 },
		:right 			 => { :x => 1,  :y => 0 },
		:below_left  => { :x => -1, :y => 1 },
		:below 			 => { :x => 0,  :y => 1 },
		:below_right => { :x => 1,  :y => 1 }
	}.freeze
	
	attr_reader :cells

	def initialize size
		@cells = Array.new(size) { Array.new(size, false) }
	end
	
	def contains_life? location
		if location.is_valid?
			@cells[location.y][location.x] == true
		else
			nil
		end
	end
	
	def spawn location
		@cells[location.y][location.x] = true if location.is_valid?
	end
	
	def kill location
		@cells[location.y][location.x] = false if location.is_valid?
	end

	def count_neighbours_for location
		neighbour_count = NEIGHBOUR_OFFSETS.inject(0) do |count, (position, offset)|		
			neighbour_x = location.x + offset[:x]
			neighbour_y = location.y + offset[:y]
			neighbour_location = Location.new(:x => neighbour_x, :y => neighbour_y)			
			count += 1 if contains_life?(neighbour_location)
			count
		end
		neighbour_count
	end

	def == another_board
		@cells == another_board.cells
	end
end