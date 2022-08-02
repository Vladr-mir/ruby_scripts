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
    return Node.new(nil, nil) if @head.nil?

    last_node = @head
    last_node = last_node.next_node until last_node.next_node.nil?
    last_node
  end

  def at(index)
    return Node.new(nil, nil) unless index.between?(0, @size - 1)

    last_node = @head
    0.upto(index).each do |pos|
      return last_node if pos == index

      last_node = last_node.next_node
    end
  end

  def to_s
    return '()' if @head.nil?

    str = ''

    last_node = @head
    str << "(#{@head.value})"
    until last_node.next_node.nil?
      last_node = last_node.next_node
      str << " -> (#{last_node.value})"
    end
    str << ' -> nil'
  end

  def pop
    return Node.new(nil, nil) if @head.nil?

    @size -= 1
    at(size - 1).destroy_next
  end

  def find(value)
    index = 0
    return nil if @head.nil?
    return index if @head.value == value

    last_node = @head
    until last_node.next_node.nil?
      index += 1
      last_node = last_node.next_node
      return index if last_node.value == value
    end
    nil
  end

  def contains?(value)
    return false if @head.nil?
    return true if @head.value == value

    last_node = @head
    until last_node.next_node.nil?
      last_node = last_node.next_node
      return true if last_node.value == value
    end
    false
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
