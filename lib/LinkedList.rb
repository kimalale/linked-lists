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
  end


# Extra Credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.

end


class Node
  attr_accessor :data, :next_node
  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

end

test_list = LinkedList.new(2)
test_list.append(3)
test_list.prepend(1)
test_list.append(4)
test_list.prepend(0)
test_list.append(5)


test_list.to_s



# Node class, containing a #value method and a link to the #next_node, set both as nil by default.
# Build the following methods in your linked list class:








#remove_at(index) that removes the node at the given index.
# Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.
