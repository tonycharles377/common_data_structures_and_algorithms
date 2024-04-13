# class Node
class Node
    attr_accessor :value, :next_node

    def initialize(value)
        @value = value
    end
end

# class LinkedList
class LinkedList
    attr_accessor :first_node

    def initialize(first_node)
        @first_node = first_node
    end

    # Methods
    # Add new node to the end of list
    def append(value)
        # Create new node
        new_node = Node.new(value)

        # Find the last node
        current_node = first_node
        
        while current_node.next_node != nil
            current_node = current_node.next_node
        end

        # Append new node
        current_node.next_node = new_node
    end
end

node1 = Node.new('once')
node2 = Node.new('upon')
node3 = Node.new('a')
node4 = Node.new('time')

node1.next_node = node2
node2.next_node = node3
node3.next_node = node4

list = LinkedList.new(node1)

list.append('in Africa')

p list