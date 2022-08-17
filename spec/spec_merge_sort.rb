# spec/spec_merge_sort.rb
# frozen_string_literal: false

require './recursion/merge_sort'

RSpec.describe 'merge_sort' do
  it 'Sorts an array of size five' do
    arr = [7, 4, 3, 0, 9, 5]
    expect(merge_sort(arr)).to eql([0, 3, 4, 5, 7, 9])
  end

  it 'Sorts an array of size five with repeating numbers' do
    arr = [7, 4, 3, 3, 7, 5]
    expect(merge_sort(arr)).to eql([3, 3, 4, 5, 7, 7])
  end

  it 'It returns the same array when the array is already sorted' do
    arr = [1, 2, 3, 4, 5, 6]
    expect(merge_sort(arr)).to eql(arr)
  end
end
