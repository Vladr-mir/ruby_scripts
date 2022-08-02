# frozen_string_literal: false

# LinkedList implementation
class LinkedList
  attr_reader :size, :head

  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    @size += 1
    return @head = Node.new(value, nil) if @head.nil?

    last_node = @head
    last_node = last_node.next_node until last_node.next_node.nil?
    last_node.next_node = Node.new(value, nil)
  end

  def prepend(value)
    @size += 1
    return @head = Node.new(value, nil) if @head.nil?
    @head = Node.new(value, @head)
  end

  def tail
    return @head = Node.new(value, nil) if @head.nil?

    last_node = @head
    last_node = last_node.next_node until last_node.next_node.nil?
    last_node
  end

  def at(index)
    return Node.new(nil, nil) if index >= @size

    last_node = @head
    0.upto(index).each do |pos|
      return last_node if pos == index
      last_node = last_node.next_node
    end
  end

  def pop
    return @head = Node.new(value, nil) if @head.nil?

    @size -= 1
    self.at(size - 1).destroy_next
  end
end

# Value node for LinkedList
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end

  def destroy_next
    @next_node = nil
  end
end
