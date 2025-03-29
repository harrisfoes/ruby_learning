def merge_sort(array)
  return array if array.length <= 1
  
  mid = array.length / 2
  left_half = merge_sort(array[0...mid])
  right_half = merge_sort(array[mid..-1])

  merge(left_half, right_half)
end

def merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    sorted << (left.first <= right.first ? left.shift : right.shift)
  end

  sorted + left + right
end

arr = [4,5,7,6,32,23,1,2,9]
sorted_arr = merge_sort(arr)
puts sorted_arr.inspect
