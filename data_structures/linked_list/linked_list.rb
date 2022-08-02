# frozen_string_literal: false

# LinkedList implementation
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    @size += 1

    if @head.nil?
      @head = Node.new(value, nil)
    else
      last_node = @head
      last_node = last_node.next_node until last_node.next_node.nil?
      last_node.next_node = Node.new(value, nil)
    end
  end

  def prepend(value); end

  def size; end

  def tail; end

  def at(index)
    return Node.new(nil, nil) if index > @size

    last_node = @head
    0.upto(index).each do |pos|
      return last_node if pos == index - 1

      last_node = last_node.next_node
    end
  end

  def pop; end
end

# Value node for LinkedList
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end
