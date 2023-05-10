# LinkedList class, which will represent the full list.
class LinkedList

  def initialize(data = nil)
    @node = Node.new(data)
  end

#append(value) adds a new node containing value to the end of the list
  def append(value)
    append_node = Node.new(value)
    current_node = @node
    until current_node.next_node == nil do
      current_node = current_node.next_node
    end
    current_node.next_node = append_node
  end

#prepend(value) adds a new node containing value to the start of the list
  def prepend(value)

    new_node = Node.new(value, @node)
    @node = new_node
  end

#size returns the total number of nodes in the list
  def size
   count = 1
   current_node = @node
   until current_node.next_node == nil do
    count +=1
    current_node = current_node.next_node
   end
   count
  end

#head returns the first node in the list
  def head
    @node.data
  end

#tail returns the last node in the list
  def tail

    last_node = @node
    self.size.times do
      last_node = last_node.next_node
    end

    last_node.data
  end

#at(index) returns the node at the given index
  def at(index)

    current_node = @node
    index.times do
      current_node = current_node.next_node
    end
    current_node.data
  end

#pop removes the last element from the list
  def pop
    last_node = @node
    self.size.times do
      last_node = last_node.next_node
    end

    popped_node = last_node.data
    last_node = nil
    popped_node
  end

#contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    in_list = false
    search_node = @node
    self.size.times do
      in_list = true if search_node.data == value
      search_node = search_node.next_node
    end

    in_list
  end

#find(value) returns the index of the node containing value, or nil if not found.
  def find(value)
    index = 0

    search_node = @node
    self.size.times do

      return index if search_node.data == value
      search_node = search_node.next_node
      index+=1
    end

    "Index not found."
  end


  #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s

    print_node = @node
    self.size.times  do
      print "#{print_node.data} "
      print_node = print_node.next_node
    end
    print "\n"
  end


# Extra Credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.
  def insert_at(value, index)

    at_index = 0

    copy_node = @node
    old_node = copy_node
    insert_node = Node.new(value)
    self.size.times do
      at_index+=1
      half_node_copy = old_node.next_node
      old_node.next_node = insert_node if at_index == index
      old_node.next_node.next_node = half_node_copy if at_index == index

      old_node = old_node.next_node
      return if at_index == index

    end

    @node = old_node
  end


#remove_at(index) that removes the node at the given index.
def remove_at(index)

  at_index = 0

  if index > self.size
    return p "Index not found."
  end

  @node = @node.next_node if at_index == index
  return if at_index == index


  copy_node = @node
  old_node = copy_node

  self.size.times do
    at_index+=1

    left_node_copy = old_node.next_node.next_node
    old_node.next_node = left_node_copy if at_index == index

    old_node = old_node.next_node
    return if at_index == index

  end

  @node = old_node
end
end

class Node
  attr_accessor :data, :next_node
  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

end

test_list = LinkedList.new(3)
test_list.append(4)
test_list.prepend(2)
test_list.append(5)

test_list.append(6)

test_list.insert_at(1, 4)
test_list.remove_at(8)
test_list.to_s
puts test_list.find(1)
