class IntegerStack
  
  def initialize
    @elements = Array.new
  end
  
  def push value
    @elements << value
  end
  
  def pop
    @elements.pop
  end
  
  def count
    @elements.length
  end
  
  def top
    @elements.last
  end
  
  
end