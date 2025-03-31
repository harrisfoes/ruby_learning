class Node
  attr_accessor :value, :next_node  

  def initialize(value)
    @value = value
    @next_node = nil
  end

end

class LinkedList
  attr_accessor :head, :tail

  def initialize()
    @head = nil
    @tail = nil
  end


  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node 
      @tail = new_node
    elsif
      @tail.next_node = new_node
      @tail = new_node
    end

  end

  def prepend(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node 
      @tail = new_node
    elsif
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size()

    return 0 if @head.nil?

    count = 1 
    current_node = @head

    while current_node.next_node != nil
      current_node = current_node.next_node
      count += 1
    end

    count
  end

  def head()
    puts "head node is #{@head.value}"
    puts "head node is connected to #{@head.next_node == nil ? "nil" : @head.next_node}"
  end

  def tail()
    puts "tail node is #{@tail.value}"
    puts "tail node is connected to #{@tail.next_node == nil ? "nil" : @tail.next_node}"
  end

  def at(index)

    return "Error: list empty" if @head.nil?
    return "Error: out of bounds" if index + 1 > size()

    current_index = 0
    current = @head

    while current_index < index
      current = current.next_node
      current_index += 1
    end

    current.value
  end

  def to_s
    elements = []

    if @head == nil
      return "Empty linked list" 
    end

    current = @head

    while current
      elements << "( #{current.value} ) "
      current = current.next_node
    end
    elements.join("-> ") + "-> nil"
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      value = @head.value
      @head = nil
      return value
    end

    current = @head
    prev = nil

    while current.next_node
      prev = current
      current = current.next_node
    end

    @tail = prev
    @tail.next_node = nil

    return current.value

  end

  def contains?(value)
    return false if @head.nil?

    current = @head 

    while current.next_node and current.value != value
      current = current.next_node
    end

    return true if current.value == value
    false
  end

  def find(value)
    return nil if @head.nil?
   
    current_index = 0
    current = @head

    while current.next_node and current.value != value
      current = current.next_node
      current_index += 1
    end

    return current_index if current.value == value
    nil
  end

  def insert_at(value, index)

    return "Error: list empty" if @head.nil?
    return "Error: out of bounds" if index + 1 > size()

    current_index = 0
    current = @head
    new_node = Node.new(value)

    #edge cases? if insert at first
    #edge cases? if insert at last
    return prepend(value) if index == 0
    return append(value) if index + 1 == size() 

    while current_index < index 
      prev = current
      current = current.next_node
      current_index += 1
    end

    prev.next_node = new_node 
    new_node.next_node = current 

  end

  def remove_at(index)

    return "Error: list empty" if @head.nil?
    return "Error: out of bounds" if index + 1 > size()

    current_index = 0
    current = @head

    while current_index < index
      prev = current
      current = current.next_node
      current_index += 1
    end

    #connect prev to current
    @head = current.next_node if current == @head
    current.next_node != nil ? prev.next_node = current.next_node : prev.next_node = nil if prev
    current = nil
  end

end


# my_list = LinkedList.new
# puts my_list.size()

# my_list.append("dog")
# puts my_list.size()

# my_list.head()
# my_list.tail()
# my_list.append("cat")
# my_list.head()
# my_list.tail()
# my_list.append("bear")
# my_list.head()
# my_list.tail()

# puts my_list
# puts "size: #{my_list.size()}"

# my_list.prepend("eagle")
# puts my_list
# my_list.head()
# puts "size: #{my_list.size()}"


# puts "index 0: #{my_list.at(0)}"
# puts "index 1: #{my_list.at(1)}"
# puts "index 3: #{my_list.at(3)}"
# puts "index 4: #{my_list.at(4)}"
# puts "index 6: #{my_list.at(6)}"

# list2 = LinkedList.new
# puts "pop while empty: #{list2.pop()}"
# list2.append("fish")
# list2.append("whale")
# list2.append("seal")
# puts list2
# puts "contains fish? #{list2.contains?("fish")}"
# puts "contains dog? #{list2.contains?("dog")}"
# puts "contains whale? #{list2.contains?("whale")}"
# puts "contains seal? #{list2.contains?("seal")}"
# puts "find fish? #{list2.find("fish")}"
# puts "find dog? #{list2.find("dog")}"
# puts "find whale? #{list2.find("whale")}"
# puts "find seal? #{list2.find("seal")}"
# puts "pop1: #{list2.pop()}"
# list2.to_s()
# puts "pop2: #{list2.pop()}"
# list2.to_s()
# puts "pop3: #{list2.pop()}"
# list2.to_s()

# puts list2

# list2.append("fish")
# list2.append("whale")
# list2.append("seal")
# puts list2
# list2.insert_at("turtle", 1)
# puts list2
# list2.insert_at("baba", 0)
# puts list2


# puts "remove index 1"
# list2.remove_at(1)
# puts list2

# puts "remove index 0"
# list2.remove_at(0)
# puts list2

# puts "remove index 3"
# list2.remove_at(3)
# puts list2

# puts "remove index 2"
# list2.remove_at(2)
# puts list2
