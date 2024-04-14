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

    def display_list
        list = []
        current_node = first_node

        while current_node
            next_node = current_node.next_node ? current_node.next_node.value : nil
            list << "(#{current_node.value}, #{next_node})"
            current_node = current_node.next_node
        end
        return list.join(' -> ')
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
        display_list
    end

    # Add new node at the start of list
    def prepend(value)
        # create new node
        new_node = Node.new(value)

        # link new node to what is the first node in list
        new_node.next_node = first_node

        # Establish new node to be the first node in list
        self.first_node = new_node
    end

    # Return total number of nodes in list
    def size
        current_node = first_node
        count = 0

        while current_node.next_node != nil
            count += 1
            current_node = current_node.next_node
        end
        return count+1
    end

    # Return first node
    def head
        new_list = display_list.split('->')
        new_list[0]
    end

    # Return last node
    def tail
        new_list = display_list.split('->')
        new_list[-1]
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
list.prepend('tudoom!')

puts list.display_list
puts "\n"
puts list.head
puts "\n"
puts list.tail
puts "\n"
p list.size