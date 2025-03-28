module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for value in self
      yield value, index
      index += 1
    end
  end

  def my_select
    result = []
    for i in self
      result << i if yield i 
    end
    result
  end

  def my_all? 
    for i in self
      return false unless yield i
    end
    true 
  end

  def my_any?
    for i in self
      return true if yield i
    end
    false
  end

  def my_none?
    for i in self
      return false if yield i
    end
    true
  end

  def my_count(arg = nil)
    count = 0

    if block_given?
      for i in self
        count += 1 if yield i
      end
    elsif arg
      for i in self
        count += 1 if i == arg
      end
    else
      for i in self
        count += 1
      end
    end
    count 
  end

  def my_map
    result = []
    for i in self
      result << yield(i)
    end
    result
  end

  def my_inject(initial = nil)
    accum = initial.nil? ? self.first : initial #use first element if no initial provided
    start_index = initial.nil? ? 1 : 0 #skip first element if no initial value

    self[start_index..].each do |item|
      accum = yield(accum, item)
    end

    accum

  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield i
    end
  end
end


# puts "test"

# # declaring array 
# a = [18, 22, 33, 1, 5, 6] 
  
# # declaring array 
# b = [1, 4, 1, 1, 88, 9] 
  
# # declaring array 
# c = [18, 22, 1, 1, 50, 6] 

# puts [1, 2, 3, 4].my_inject(0) { |sum, num| sum + num }  # Output: 10
# puts [1, 2, 3, 4].my_inject { |sum, num| sum + num }      # Output: 10
# puts [1, 2, 3, 4].my_inject(1) { |prod, num| prod * num } # Output: 24
