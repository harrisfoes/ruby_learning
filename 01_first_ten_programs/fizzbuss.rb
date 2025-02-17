(1..20).each do |i|
  if i % 3 == 0
    puts "Fizz #{i}"
  elsif i % 5 == 0
    puts "Buzz #{i}"
  else
    puts "#{i}"
  end
end
