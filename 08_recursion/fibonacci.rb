def fibs(n)
  if n < 2
    return n
  else
    return (fibs(n-1) + fibs(n-2)) 
  end
end

# puts fibs(1)
# puts fibs(2)
# puts fibs(3)
# puts fibs(4)
# puts fibs(5)
# puts fibs(5)
# puts fibs(5)


(1..20).each {|n| puts fibs(n)}
