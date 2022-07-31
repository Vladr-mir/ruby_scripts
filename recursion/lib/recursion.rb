def fibs(num)
  arr = [0, 1]
  for i in 2.upto(num - 1)
    arr << arr[i - 2] + arr[i - 1]
  end
  arr
end

def fibs_rec(num, i = 2, result = [0, 1])
  return result if i >= num
  result << result[i - 2] + result[i - 1]
  fibs_rec(num, i + 1, result)
end

p fibs(8)
p fibs_rec(8)
