# frozen_string_literal: false

require 'pry-byebug'

def merge(left, right)
  arr = []
  r_pointer = 0
  l_pointer = 0

  loop do
    if l_pointer >= left.length
      arr.concat right[r_pointer..]
      break
    elsif r_pointer >= right.length
      arr.concat left[l_pointer..]
      break
    end

    if left[l_pointer] <= right[r_pointer]
      arr << left[l_pointer]
      l_pointer += 1
    else
      arr << right[r_pointer]
      r_pointer += 1
    end
  end
  arr
end

def merge_sort(arr = [])
  return arr if arr.length <= 1

  left, right = arr.each_slice((arr.size / 2.0).round).to_a
  left = merge_sort(left)
  right = merge_sort(right)

  merge(left, right)
end

p merge_sort([3, 8, 5, 3, 4, 7, 9, 1, 10])
