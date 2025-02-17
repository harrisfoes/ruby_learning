puts "Enter first number: "
num1 = gets.chomp.to_i
puts "Enter second number: "
num2 = gets.chomp.to_i
puts "Enter third number: "
num3 = gets.chomp.to_i

lrg = [num1, num2, num3].max

puts "The largest number is #{lrg}"
