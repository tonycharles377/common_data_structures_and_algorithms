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
        start_point = 0
        end_point = arr.length - 1
        mid_point = (start_point + end_point) / 2
        
        return nil if start_point > end_point

        node = Node.new(arr[mid_point])

        node.left_child = build_tree(arr[start_point...mid_point])
        node.right_child = build_tree(arr[(mid_point+1)..end_point])
        
        node
    end
end