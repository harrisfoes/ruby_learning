class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info 
    "#{self.name} weights #{self.weight} and is #{self.height} tall"
  end

  def what_is_self
    self
  end

  puts self

end

doober = GoodDog.new("Dooby", 12, 24)
puts doober.info
p doober.what_is_self
