# frozen_string_literal: false

require_relative 'node'

# BinaryTree implementation
class BinaryTree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2
    root = Node.new(arr[mid])

    root.left = build_tree(arr[0...mid])
    root.right = build_tree(arr[(mid + 1)..])
    root
  end

  def insert(value, node = @root)
    return if node.data == value

    if node.data < value
      return node.right = Node.new(value) if node.right.nil?

      insert(value, node.right)
    else
      return node.left = Node.new(value) if node.left.nil?

      insert(value, node.left)
    end
  end

  def level_order(node = @root, &operation)
    return if node.nil?

    queue = [node]
    until queue.empty?
      current = queue[0]
      operation.call(current)
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
      queue.shift
    end
  end

  def preorder(node = @root, &operation)
    return if node.nil?

    operation.call(node)
    preorder(node.left, &operation)
    preorder(node.right, &operation)
  end

  def inorder(node = @root, &operation)
    return if node.nil?

    inorder(node.left, &operation) unless node.left.nil?
    operation.call(node)
    inorder(node.right, &operation) unless node.right.nil?
  end

  def postorder(node = @root, &operation)
    return if node.nil?

    postorder(node.left, &operation) unless node.left.nil?
    postorder(node.right, &operation) unless node.right.nil?
    operation.call(node)
  end

  def find(value)
    preorder { |node| return node if node.data == value }
  end

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      leftmost_node = leftmost(node.right)
      node.data = leftmost_node.data
      node.right = delete(leftmost_node.data, node.right)
    end
    node
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end

  def get_parent(value)
    preorder do |node|
      return node if !node.right.nil? && (node.right.data == value)
      return node if !node.left.nil? && (node.left.data == value)
    end
  end

  def height(node = @root)
    return 0 if node.nil?

    right_height = height(node.right)
    left_height = height(node.left)

    [right_height, left_height].max + 1
  end

  def depth(target_node = @root, node = @root)
    return 0 if node.nil?
    return 0 if node == target_node

    if target_node.data < node.data
      left_height = depth(target_node, node.left)
      right_height = 0
    else
      right_height = depth(target_node, node.right)
      left_height = 0
    end
    [right_height, left_height].max + 1
  end

  def balanced?
    return true if @root.nil?
    return true if @root.right.nil? && @root.left.nil?

    right = height(@root.right)
    left = height(@root.left)

    right == left
  end

  private

  def leftmost(node = @root)
    return node if node.left.nil? && node.right.nil?

    node = node.left until node.left.nil?
    node
  end
end
