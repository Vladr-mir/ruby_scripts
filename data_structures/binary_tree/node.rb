# frozen_string_literal: false

# Node implementation
class Node
  attr_accessor :data, :left, :right

  include Comparable

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end
