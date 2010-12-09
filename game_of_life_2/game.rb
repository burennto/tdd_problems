require 'board'

class Game
	
	UNDER_POPULATION_THRESHOLD 		 = 2.freeze
	OVER_POPULATION_THRESHOLD  		 = 3.freeze
	NEIGHBOURS_NEEDED_TO_REPRODUCE = 3.freeze
	
	attr_reader :board
	
	def initialize board_size
		@board = Board.new(board_size)
	end
	
	def seed locations
		locations.each do |location|
			@board.spawn(location)
		end
	end
	
	def count_live_cells
		@board.cells.inject(0) do |count, column|
			live_cells = column.select { |cell| cell == true }
			count += live_cells.length
		end
	end
	
	def state= value
	  value.each_with_index do |rows, i|
	    rows.each_with_index do |cell, j|
	      location = Location.new(i, j)
	      @board.spawn(location)
      end
    end
	end
	
	def under_population_rule_applies? location
		@board.count_neighbours_for(location) < UNDER_POPULATION_THRESHOLD
	end
	
	def over_population_rule_applies? location
		@board.count_neighbours_for(location) > OVER_POPULATION_THRESHOLD
	end

	def reproduction_rule_applies? location
		@board.count_neighbours_for(location) == NEIGHBOURS_NEEDED_TO_REPRODUCE
	end
	
	def evolve
		# @board.each do |column|
		# 	column.each do |cell|
		# end
	end
end
