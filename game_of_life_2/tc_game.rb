require 'test/unit'
require 'game'

class TC_Game < Test::Unit::TestCase
	
	# R-pentomino shape
	RULE_TEST_SEED = [
	  [' ', ' ', ' ', ' ', ' '],
	  [' ', ' ', 'o', 'o', ' '],
	  [' ', 'o', 'o', ' ', ' '],
		[' ', ' ', 'o', ' ', ' '],
		[' ', ' ', ' ', ' ', ' ']
	].freeze
	
	# BEFORE_EVOLVE_SEED = [
	# 	Location.new(:x => 2, :y => 1),
	# 	Location.new(:x => 1, :y => 2),
	# 	Location.new(:x => 2, :y => 2),
	# 	Location.new(:x => 3, :y => 2),
	# 	Location.new(:x => 2, :y => 3),
	# 	Location.new(:x => 4, :y => 3)
	# ].freeze
	
	# AFTER_EVOLVE_SEED = [
	# 	Location.new(:x => 2, :y => 1),
	# 	Location.new(:x => 1, :y => 2),
	# 	Location.new(:x => 2, :y => 2),
	# 	Location.new(:x => 3, :y => 2),
	# 	Location.new(:x => 2, :y => 3),
	# 	Location.new(:x => 4, :y => 3)
	# ].freeze
	
	def setup
		@game = Game.new(5)
	end

  def test_state=
    @game.state = RULE_TEST_SEED
  end

	def test_seed
    # assert_equal 6, @game.count_live_cells
	end
	
	def test_under_population_rule_applies?
    # assert_equal false, @game.under_population_rule_applies?(@under)
    # assert_equal false, @game.under_population_rule_applies?(@balanced_alive)
    # assert_equal false, @game.under_population_rule_applies?(@balanced_empty)
    # assert_equal false, @game.under_population_rule_applies?(@over)
	end
	
	def test_over_population_rule_applies?
    # assert_equal true,  @game.over_population_rule_applies?(@over)
    # assert_equal false, @game.over_population_rule_applies?(@under)
    # assert_equal false, @game.over_population_rule_applies?(@balanced_alive)
    # assert_equal false, @game.over_population_rule_applies?(@balanced_empty)
	end

	def test_reproduction_population_rule_applies?
    # assert_equal true,  @game.reproduction_rule_applies?(@balanced_empty)
    # assert_equal false, @game.reproduction_rule_applies?(@over)
    # assert_equal false, @game.reproduction_rule_applies?(@under)
    # assert_equal false, @game.reproduction_rule_applies?(@balanced_alive)
	end
	
	def test_evolve
		# @game.seed(@seed_locations)
		
		# assert_equal seeded_board, @game.board
		
		# assert_equal seeded_board, @game.board
	end

end