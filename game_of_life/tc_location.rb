require 'test/unit'
require 'location'

class TC_Location < Test::Unit::TestCase
    
  def setup
    # empty
  end
    
  def test_is_valid?
    valid_location = Location.new(:x => 0, :y => 0)
    assert_equal true, valid_location.is_valid?
    
    invalid_location = Location.new(:x => -1, :y => -1)
    assert_equal false, invalid_location.is_valid?
  end
end