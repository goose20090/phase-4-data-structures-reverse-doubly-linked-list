require_relative './node'
require 'pry'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def reverse!
    return if @head.nil? || @head.next_node.nil? # If the list is empty or has only one node, do nothing.

    current_node = @head

    while current_node
      # Swap prev_node and next_node
      temp = current_node.prev_node
      current_node.prev_node = current_node.next_node
      current_node.next_node = temp

      # Move to the next node (which is the previous node after swapping)
      if current_node.prev_node
        current_node = current_node.prev_node
      else
        break
      end
    end

    # Swap head and tail
    temp = @head
    @head = @tail
    @tail = temp
  end
end

# list = LinkedList.new

# node_1 = Node.new(1)
# node_2 = Node.new(2)
# node_3 = Node.new(3)
  
# list.head = node_1        # h1
# node_1.next_node = node_2 # h1 --> 2
# node_2.prev_node = node_1 # h1 <--> 2
# node_2.next_node = node_3 # h1 <--> 2 --> 3
# node_3.prev_node = node_2 # h1 <--> 2 <--> 3
# list.tail = node_3        # h1 <--> 2 <--> 3t

# list.reverse!
