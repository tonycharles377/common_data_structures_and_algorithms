# Binary Search Tree implementation
class Node
    # Mixin Comparable module
    include Comparable

    attr_accessor :data, :left_child, :right_child

    def initialize(data=nil, left_child=nil, right_child=nil)
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
        @root = build_tree(arr.uniq.sort)
    end

    def build_tree(arr)
        start_index = 0
        end_index = arr.length - 1
        mid_index = (start_index + end_index) / 2
        
        return nil if start_index > end_index

        node = Node.new(arr[mid_index])

        node.left_child = build_tree(arr[start_index...mid_index])
        node.right_child = build_tree(arr[(mid_index+1)..end_index])

        node
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
    end
end

arr = [1,1,2,2,7,8,4,5,9,0,5,6,7,3]
bst = Tree.new(arr)
p bst.pretty_print