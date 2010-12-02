require 'test/unit'
require 'integer_stack'

class TC_IntegerStack < Test::Unit::TestCase
  
  def setup
    @stack = IntegerStack.new
  end
  
  def test_push
    @stack.push(1)
    @stack.push(2)
    assert_equal 2, @stack.top
  end
  
  def test_pop
    @stack.push(1)
    @stack.push(2)
    assert_equal 2, @stack.pop
    assert_equal 1, @stack.pop
  end
  
  def test_count
    12.times { |n| @stack.push(n) }
    assert_equal 12, @stack.count
  end
  
end