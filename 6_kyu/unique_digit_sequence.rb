# Consider the following series:

# 0,1,2,3,4,5,6,7,8,9,10,22,11,20..There is nothing special between numbers 0
# and 10. For all other numbers, the next element in the series is the lowest
# number that doesn't contain any digits of the previous one, and is not already
# in the series.

# For instance, the number 10 has digits 1 and 0. The smallest number before or
# after 10 that does not have 1 or 0 and is not already in the series is 22.
# Similarly, the smallest number before or after 22 that has not yet appeared in
# the series and that has no 2 is 11. Next are 20,13,24,.... Once a number
# appers in the series, it cannot appear again.

# You will be given an index number and your task will be return the element at
# that position. See test cases for more examples.

# Note that the test range is n <= 500.

# Input: An integer
# Output: An integer (nth element in series)

# Data Structure:
#   Array to track the series
#   Strings to examine the digits in each number

# Considerations:
#   0-10 input returns 0-10
#   Negative index inputs?
#   Index will not be greater than 500

# Algorithm:
#   Save 0-10 in sequence array

  # loop do
  #   Return array[index] if array.length == index + 1
  #   init a counter to 11
  #   keep incrementing until counter not in sequence array and digits of counter don't match digits of last sequence number
  #     Regexp.new([counter]) ~= last sequence number.to_s
  # end


def find_num(n)
  seq = (0..10).to_a

  loop do
    return seq[n] if seq[n]
    ctr = 10
    ctr += 1 while seq.include?(ctr) || Regexp.new("[#{ctr}]") =~ seq.last.to_s
    seq << ctr
  end
end
