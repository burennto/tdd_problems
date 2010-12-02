class Player
  
  @@used_symbols = []
  
  def initialize(symbol)
    unless @@used_symbols.include?(symbol)
      @symbol = symbol
      @@used_symbols << symbol
    else
      raise Exception.new("Player symbol already taken!")
    end      
  end
  
  def self.reset
    @@used_symbols = []
  end
    
end
