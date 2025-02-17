puts "Give me a number, I will check if it's even or odd"
number = gets.chomp.to_i

if number % 2 == 0
  puts "The number #{number} even!"
else
  puts "The number #{number} is super odd!"
end

