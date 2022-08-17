# spec/spec_fib.rb
# frozen_literal_string: false
require './recursion/fib'

RSpec.describe 'fibs' do
  it 'returns the first five numbers in the fibonacci sequence' do
    result = [0, 1, 1, 2, 3]
    expect(fibs(5)).to eql(result)
  end

  it 'returns the first ten numbers in the fibonacci sequence' do
    result = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    expect(fibs(10)).to eql(result)
  end
end

RSpec.describe 'fibs_rec' do
  it 'returns the first five numbers in the fibonacci sequence' do
    result = [0, 1, 1, 2, 3]
    expect(fibs_rec(5)).to eql(result)
  end

  it 'returns the first ten numbers in the fibonacci sequence' do
    result = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    expect(fibs_rec(10)).to eql(result)
  end
end
