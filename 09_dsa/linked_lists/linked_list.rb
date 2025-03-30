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
    #create a new node
    #if this is the first (head is null) set it to head
    #if this is not the first, attach it to tail
    #then this becomes the tail
    new_node = Node.new(value)

    if @head == nil
      @head = new_node 
      @tail = new_node
      puts "Added new node as head: #{new_node.value} #{new_node.next_node}"
    elsif
      @tail.next_node = new_node
      @tail = new_node
      puts "Added new node to tail: #{new_node.value} #{new_node.next_node}"
    end

  end

  def head()
    puts "head node is #{@head.value}"
    puts "head node is connected to #{@head.next_node == nil ? "nil" : @head.next_node}"
  end

  def tail()
    puts "tail node is #{@tail.value}"
    puts "tail node is connected to #{@tail.next_node == nil ? "nil" : @tail.next_node}"
  end

  def info()
    #from the head to the tail, display each node
    #current node becomes the next_node

    if @head == nil
      puts "Empty linked list"
      return
    end

    current_node = @head

    print "( #{current_node.value} ) -> "

    while current_node.next_node != nil
      current_node = current_node.next_node
      print "( #{current_node.value} ) -> #{current_node.next_node == nil ? "nil\n" : ''}"
    end


  end

end


my_list = LinkedList.new
my_list.append("dog")
my_list.head()
my_list.tail()
my_list.append("cat")
my_list.head()
my_list.tail()
my_list.append("bear")
my_list.head()
my_list.tail()

my_list.info()
