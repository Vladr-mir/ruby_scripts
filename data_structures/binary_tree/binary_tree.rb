# frozen_string_literal: false

require_relative 'node'

# BinaryTree impolementation
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

  def insert(value, root = @root)
    if root.data < value
      return root.right = Node.new(value) if root.right.nil?

      insert(value, root.right)
    else
      return root.left = Node.new(value) if root.left.nil?

      insert(value, root.left)
    end
  end

  def preorder(root = @root, &operation)
    return if root.nil?

    operation.call(root)
    preorder(root.left, &operation)
    preorder(root.right, &operation)
  end

  def inorder(root = @root, &operation)
    return if root.nil?

    inorder(root.left, &operation) unless root.left.nil?
    operation.call(root)
    inorder(root.right, &operation) unless root.right.nil?
  end

  def postorder(root = @root, &operation)
    return if root.nil?

    postorder(root.left, &operation) unless root.left.nil?
    postorder(root.right, &operation) unless root.right.nil?
    operation.call(root)
  end

  def find(value, root = @root)
    return root if root.data == value

    if root.data < value
      return Node.new(nil) if root.right.nil?

      find(value, root.right)
    else
      return Node.new(nil) if root.left.nil?

      find(value, root.left)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end
end
