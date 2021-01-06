require 'minitest/autorun'

# The objective is to return all pairs of integers from a given collection of integers that have a difference of 2.

# The result should be sorted in ascending order.

# The input will consist of unique values. The order of the integers in the input collection should not matter.

# Examples
# [1, 2, 3, 4]      -->  [[1, 3], [2, 4]]
# [4, 1, 2, 3]      -->  [[1, 3], [2, 4]]
# [1, 23, 3, 4, 7]  -->  [[1, 3]]
# [4, 3, 1, 5, 6]   -->  [[1, 3], [3, 5], [4, 6]]

# PEDAC

# Input: An 1d Array of integers
# Output: A 2d array of integer pairs where the two numbers have a difference of 2

# Data Structures:
#   Arrays for IO.

# Considerations:
#   No pairs that are two apart? ie: [1, 4, 7]
#     Should return []
#   Empty input array
#     Returns []

# Algorithm:
#   Gather all permutations of pairs of 2 numbers
#   if the difference between numbers is 2 and sorted pair not already in return array
#     append number to return array

def twos_difference(lst)
  result = lst.permutation(2).to_a.each_with_object([]) do |pair, array|
    array << pair if pair[1] - pair[0] == 2
  end
  
  result.sort
end

def twos_difference(lst)
  lst.sort.combination(2).to_a.select { |pair| pair[1] - pair[0]== 2 }
end 

p twos_difference([1, 3, 5, 6, 8, 10, 15, 32, 12, 14, 56])
p twos_difference([0, 3, 1, 4])
class TwosTest < MiniTest::Test
  def test_method
    assert_equal(twos_difference([1, 2, 3, 4]), [[1, 3], [2, 4]])
    assert_equal(twos_difference([1, 3, 4, 6]), [[1, 3], [4, 6]])
    assert_equal(twos_difference([0, 3, 1, 4]), [[1, 3]])
    assert_equal(twos_difference([4, 1, 2, 3]), [[1, 3], [2, 4]])
    assert_equal(twos_difference([6, 3, 4, 1, 5]), [[1, 3], [3, 5], [4, 6]])
    assert_equal(twos_difference([3, 1, 6, 4]), [[1, 3], [4, 6]])
    assert_equal(twos_difference([1, 3, 5, 6, 8, 10, 15, 32, 12, 14, 56]), [[1, 3], [3, 5], [6, 8], [8, 10], [10, 12], [12, 14]])
    assert_equal(twos_difference([1, 4, 7, 10]), [])
    assert_equal(twos_difference([]), [])
  end
end
