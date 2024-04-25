require_relative 'binary_search_tree'

tree = Tree.new(Array.new(15){rand(1..100)})
puts tree.pretty_print
puts "Is tree balanced?"
puts tree.balanced?
puts "\n"
puts "Level order"
p tree.level_order
puts "\n"
puts "Inorder"
p tree.inorder
puts "\n"
puts "Preorder"
p tree.preorder
puts "\n"
puts "Postorder"
p tree.postorder
tree.insert(136)
tree.insert(167)
tree.insert(101)
tree.insert(200)
puts "\n"
puts tree.pretty_print
puts "Is tree balanced?"
puts tree.balanced?
puts "\n"
puts "Rebalance"
tree.rebalance
puts tree.pretty_print
puts "Is tree balanced?"
puts tree.balanced?
puts "\n"
puts "Level order"
p tree.level_order
puts "\n"
puts "Inorder"
p tree.inorder
puts "\n"
puts "Preorder"
p tree.preorder
puts "\n"
puts "Postorder"
p tree.postorder