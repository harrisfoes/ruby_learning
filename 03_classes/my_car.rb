module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle  
  attr_accessor :color 
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end
 
  def self.gas_mileage(miles, gallon)
    puts "Our mileage is #{miles/gallon}"
  end

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  def speed_up(number)
    @current_speed += number
    puts "speeding up to #{number} kph"
  end

  def brake(number)
    @current_speed -= number 
    puts "breaking down by #{number} kph"
  end

  def current_speed
    puts "You are now going at #{@speed} kph."
  end

  def shut_off
    @current_speed = 0
    puts "shutting off"
  end

  def spray_paint(color)
    self.color = color 
    puts "Your new #{color} paint job looks great!"
  end

  private

  def years_old
    Time.now.year - self.year
  end

end

class MyCar < Vehicle
  include Towable

  NUMBER_OF_WHEELS = 4

  def to_s
    "This car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_WHEELS = 10

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_off
truck = MyTruck.new(2000, 'bullshit bacon', 'chartreuse')
MyCar.gas_mileage(13, 351)
Vehicle.number_of_vehicles
lumina.spray_paint("red")


puts lumina
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

puts lumina.age
