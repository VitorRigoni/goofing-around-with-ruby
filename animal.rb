class Animal
  attr_accessor :name

  def initialize
    
  end
end

module ICat
  def meow
    raise "Not implemented"
  end
end

class Cat < Animal
  include ICat
  
  def initialize
    @name = "Boby"
  end

  def meow
    "meow"
  end
end
