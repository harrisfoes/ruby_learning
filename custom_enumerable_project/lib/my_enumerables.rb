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
    #count number of items
    #count number of specified params
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


puts "test"
puts [1,2,3].my_none? {|num| num > 4}
puts [1,2,5].my_none? {|num| num > 4}

# declaring array 
a = [18, 22, 33, nil, 5, 6] 
  
# declaring array 
b = [1, 4, 1, 1, 88, 9] 
  
# declaring array 
c = [18, 22, nil, nil, 50, 6] 
  
# counting total elements 
puts "counting : #{a.my_count}\n\n"
  
# counting 1 
puts "counting : #{b.my_count(1)}\n\n"
  
# counting 'nil' 
puts "counting : #{c.my_count(nil)}\n\n"



puts [1, 2, 3, 2, 2, 4, 5].my_count       # Output: 7
puts [1, 2, 3, 2, 2, 4, 5].my_count(2)    # Output: 3
puts [1, 2, 3, 2, 2, 4, 5].my_count { |n| n.even? }  # Output: 4
