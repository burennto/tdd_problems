class Location
  
  attr_reader :x, :y
  
  def initialize coordinates
    @x = coordinates[:x]
    @y = coordinates[:y]
  end
  
  def is_valid?
    @x >= 0 && @y >= 0
  end
  
end