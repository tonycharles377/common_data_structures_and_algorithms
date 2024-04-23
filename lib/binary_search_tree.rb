# Binary Search Tree implementation
class Node
    # Mixin Comparable module
    include Comparable

    attr_accessor :data, :left_child, :right_child

    # When initializing, data must be passed
    # and sets left and right child of node to nil
    def initialize(data, left_child=nil, right_child=nil)
        @data = data
        @left_child = left_child
        @right_child = right_child
    end

    def <=>(other)
        self.data <=> other.data
    end
end

class Tree
    attr_accessor :root

    def initialize(arr)
        @root = build_tree(arr)
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
    end

    def insert(value, node = @root)
        # Base case
        return Node.new(value) if node.nil?

        # Determine whether to insert into the left or right sub-tree
        if value < node.data
            # Recursively insert into the left tree
            node.left_child = insert(value, node.left_child)
        elsif value > node.data
            # Recursively insert into the right tree
            node.right_child = insert(value, node.right_child)
        end
        # Return modified node
        node
    end

    def delete(value, node = @root)
        return nil if node.nil?

        if value < node.data
            node.left_child = delete(value, node.left_child)
        elsif value > node.data
            node.right_child = delete(value, node.right_child)
        else
            # Case 1: Deleting a node with 0 or 1 child
            if node.left_child.nil?
                return node.right_child
            elsif node.right_child.nil?
                return node.left_child
            end

            # Case 2: Deleting a node with 2 children
            successor = find_successor(node.right_child) # Finds the most left child from its right child
            node.data = successor.data
            node.right_child = delete(successor.data ,successor)
        end
        node
    end

    def find(value, node=@root)
        # Base case
        return nil if node.nil?

        # Traverse node
        if value < node.data
            return (find(value, node.left_child))
        elsif value > node.data
            return(find(value, node.right_child))
        end
        return pretty_print(node)
    end

    def level_order
        # Return empty arr when root node is nill
        return [] if @root.nil?

        # Initialize a queue with the root node and an empty arr to store results
        queue = [@root]
        results = []

        # Continue until the queue is empty
        until queue.empty?
            # Get the number of nodes in the current level
            level_size = queue.size

            # Initialize an arr to store values of nodes in the current level
            current_level_values = []

            # Iterate over the nodes in the current level
            level_size.times do
                # Deque a node from the front of the queue
                node = queue.shift

                # If a block is given yield the node to the block
                yield(node) if block_given?

                # Else add the value of the node to current_level_values arr
                current_level_values << node.data

                # Enqueue left and right children of the current node if they exist
                queue << node.left_child if node.left_child
                queue << node.right_child if node.right_child
            end
            # If no block is given add add current_level_values to the results arr
            results << current_level_values
        end
        results
    end

    private

    def find_successor(node)
        current = node
        current = current.left_child until current.left_child.nil?
        current
    end

    # Can only be callsed during init of class Tree
    def build_tree(arr)
        new_arr = arr.uniq.sort
        start_index = 0
        end_index = new_arr.length - 1
        mid_index = (start_index + end_index) / 2
        
        # Base case
        return nil if start_index > end_index

        root_node = Node.new(new_arr[mid_index])

        root_node.left_child = build_tree(new_arr[start_index...mid_index])
        root_node.right_child = build_tree(new_arr[(mid_index+1)..end_index])

        root_node
    end
end

arr = [25,11,33,52,30,40,55,95,82,61,89]
bst = Tree.new(arr)
p bst.pretty_print
bst.insert(10)
p bst.pretty_print
bst.delete(11)
p bst.pretty_print
p bst.find(9)
p bst.level_order