require_relative './lib/tree'

arr = Array.new(15) { rand(1..100) }
sorted_arr = arr.sort.uniq

bst = Tree.new(sorted_arr)

bst.pretty_print
puts "--------------------"
puts "Balanced?"
puts "===================="
puts bst.balanced?
puts "--------------------"
puts "Order tree"
puts "===================="
puts "Level order:"
bst.level_order { |i| p i }
puts "--------------------"
puts "Inorder:"
bst.inorder { |i| p i.value }
puts "--------------------"
puts "Preorder:"
bst.preorder { |i| p i.value }
puts "--------------------"
puts "Postorder:"
bst.postorder { |i| p i.value }
puts "--------------------"

puts "Unbalanced tree:"
puts "===================="
bst.insert(101)
bst.insert(102)
bst.insert(103)
bst.insert(104)
bst.pretty_print
puts "Balanced?"
puts "===================="
puts bst.balanced?
puts "--------------------"
puts "Balance tree"
puts "===================="
bst.rebalance
bst.pretty_print
puts "--------------------"
puts "Balanced?"
puts "===================="
puts bst.balanced?
puts "--------------------"
puts "Order tree"
puts "===================="
puts "Level order:"
bst.level_order { |i| p i }
puts "--------------------"
puts "Inorder:"
bst.inorder { |i| p i.value }
puts "--------------------"
puts "Preorder:"
bst.preorder { |i| p i.value }
puts "--------------------"
puts "Postorder:"
bst.postorder { |i| p i.value }
puts "--------------------"

#testing
=begin
arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
clean_arr = arr.sort.uniq

bst = Tree.new(clean_arr)

puts "Original tree:"
puts "===================="
bst.pretty_print
puts "--------------------"

puts "Insert into tree:"
puts "===================="
bst.insert(6)
bst.insert(10)
bst.pretty_print
puts "--------------------"

puts "Delete from tree:"
puts "===================="
bst.delete(23)
bst.delete(9)
bst.delete(7)
bst.insert(300)
bst.pretty_print
puts "--------------------"

puts "Find node in tree:"
puts "===================="
bst.find(67)
puts "--------------------"
bst.pretty_print
puts "--------------------"

puts "Order tree"
puts "===================="
puts "Level order:"
bst.level_order { |i| p i }
puts "--------------------"
puts "Inorder:"
bst.inorder { |i| p i.value }
puts "--------------------"
puts "Preorder:"
bst.preorder { |i| p i.value }
puts "--------------------"
puts "Postorder:"
bst.postorder { |i| p i.value }
puts "--------------------"

puts "Tree depth:"
puts "===================="
bst.pretty_print
puts "--------------------"
puts bst.depth(1)
puts "--------------------"
puts "Tree height:"
puts "===================="
puts bst.height
puts "--------------------"

puts "Balanced?"
puts "===================="
puts bst.balanced?
puts "--------------------"
puts "Rebalanced:"
puts "===================="
puts bst.rebalance
puts "--------------------"
=end



