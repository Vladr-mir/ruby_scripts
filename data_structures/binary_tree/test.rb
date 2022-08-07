# frozen_string_literal: false

require_relative 'binary_tree'

# TEST
tree = BinaryTree.new(Array.new(15) { rand(1..100) })
p tree.balanced?
tree.pretty_print

puts "\n\n"
0.upto(10).each do
  tree.insert(rand(100..150))
end
p tree.balanced?
tree.pretty_print

puts "\n\n"
tree = tree.rebalance
tree.pretty_print
p tree.balanced?
