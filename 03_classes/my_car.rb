class Vehicle  
  @@num_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def initialize
    @@num_of_vehicles += 1
  end
  
  def gas_mileage(miles, gallon)
    puts "Our mileage is #{miles/gallon}"
  end
end

class MyCar < Vehicle
  attr_accessor :color 
  attr_reader :year

  NUMBER_OF_WHEELS = 4

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(number)
    @speed += number
    puts "speeding up to #{number} kph"
  end

  def brake(number)
    @speed += number 
    puts "breaking down by #{number} kph"
  end

  def current_speed
    puts "You are now going at #{@speed} kph."
  end

  def shut_off
    @speed = 0
    puts "shutting off"
  end

  def spray_paint(color)
    self.color = color 
    puts "Your new #{color} paint job looks great!"
  end


  def what_is_self 
    self
  end

  def to_s
    "This car is a #{color}, #{year}, #{@model}!"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_WHEELS = 10
end

my_car = MyCar.new(1990, "blue", "Civic")

my_car.speed_up(40)
my_car.current_speed
my_car.brake(20)
my_car.current_speed
my_car.shut_off()
my_car.current_speed

my_car.color = "purple"
puts my_car.color

my_car.color = "silver"
puts my_car.color
#my_car.year = 2000
puts my_car.year

my_car.spray_paint("pink")

my_car.gas_mileage(120,4)
p my_car
puts my_car

my_truck = MyTruck.new
my_truck.gas_mileage(200,5)

#TODO: make Vehicle display the num of vehicles how?
#seems convoluted
#vehicle = Vehicle.new
#vehicle.number_of_vehicles
