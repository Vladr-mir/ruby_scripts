# frozen_string_literal: false

def fibs(num)
  arr = [0, 1]
  2.upto(num - 1).each do |i|
    arr << (arr[i - 2] + arr[i - 1])
  end
  arr
end

def fibs_rec(num, index = 2, result = [0, 1])
  return result if index >= num

  result << (result[index - 2] + result[index - 1])
  fibs_rec(num, index + 1, result)
end