secret = rand(1..10)
guess = 0

while guess != secret do
  puts "Give me a guess:"
  guess = gets.to_i

  if guess > secret
    puts "Go lower!"
  elsif guess < secret
    puts "Go higher!"
  end
end

puts "The secret number is #{secret}"
puts "Good job!"
