# Unfinished

# Jon and Joe have received equal marks in the school examination. But, they
# won't reconcile in peace when equated with each other. To prove his might,
# Jon challenges Joe to write a program to find all possible number combos that
# sum to a given number. While unsure whether he would be able to accomplish
# this feat or not, Joe accpets the challenge. Being Joe's friend, your task is
# to help him out.

# Task
# Create a function combos, that accepts a single positive integer num 
# (30 > num > 0) and returns an array of arrays of positive integers that sum 
# to num.

# Notes
# Sub-arrays may or may not have their elements sorted.
# The order of sub-arrays inside the main array does not matter.
# For an optimal solution, the following operation should complete within 6000ms.

# Input: An integer
# Output: 2D array

# Data Structure:
#   An array

# Considerations:
#   No sorting
#   30 > n > 0
#   Don't forget the number itself.

# Algorithm:
# add [n]
# copy most recent subarray, subtract 1 from last digit and shift one onto front of copy
# Rinse and repeat
# new subarry with [n], subtract 2 from n and shift 2 to subarray
require 'pry'

def combos(n)
  result = [[n]]
  counter = n
  new_arr = result.first.dup
  # binding.pry

  (m - 1).times do
    new_arr[0] -= 1
    new_arr << 1
    result.unshift(new_arr.dup)
  end
  subtract 2 from n for [(n - 2), 2]
  Then continue with 1s [(n - 2 - 1), 2, 1 ]
                        [(n - 2 - 1 - 1), 2, 1, 1 ]
  Do this n - 2 times


  result
end

p combos(5)

[1, 1, 1, 1],
[1, 1, 2],
[1, 3],
[2, 2]
[4]

1,1,1,1,1
1,1,1,2
1,1,3
1,4

2, 2,1
2, 3
5
Only need to work through possbilities up to n / 2 (floored), after that they're repeating

1 and 1 and all ones
1 and 2 and...
2 and 2 and all ones
2 and 3 ...
...
n/2 and n/2 and all ones (one 1)

2 2 and all 2s and nec. 1s


# Sample
  combos(3) == [ [ 3 ], [ 1, 1, 1 ], [ 1, 2 ] ]
  combos(10) == [ [ 10 ],
    [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ],
      [ 1, 1, 1, 1, 1, 1, 1, 1, 2 ],
      [ 1, 1, 1, 1, 1, 1, 1, 3 ],
      [ 1, 1, 1, 1, 1, 1, 4 ],
      [ 1, 1, 1, 1, 1, 5 ],
      [ 1, 1, 1, 1, 6 ],
      [ 1, 1, 1, 7 ],
      [ 1, 1, 8 ],
      [ 1, 9 ],
      [ 1, 1, 1, 1, 1, 1, 2, 2 ],
      [ 1, 1, 1, 1, 1, 2, 3 ],
      [ 1, 1, 1, 1, 2, 4 ],
      [ 1, 1, 1, 1, 2, 2, 2 ],
      [ 1, 1, 1, 1, 3, 3 ],
      [ 1, 1, 1, 2, 5 ],
      [ 1, 1, 1, 2, 2, 3 ],
      [ 1, 1, 1, 3, 4 ],
      [ 1, 1, 2, 6 ],
      [ 1, 1, 2, 2, 4 ],
      [ 1, 1, 2, 2, 2, 2 ],
      [ 1, 1, 2, 3, 3 ],
      [ 1, 1, 3, 5 ],
      [ 1, 1, 4, 4 ],
      [ 1, 2, 7 ],
      [ 1, 2, 2, 5 ],
      [ 1, 2, 2, 2, 3 ],
      [ 1, 2, 3, 4 ],
      [ 1, 3, 6 ],
      [ 1, 3, 3, 3 ],
      [ 1, 4, 5 ],
      [ 2, 8 ],
      [ 2, 2, 6 ],
      [ 2, 2, 2, 4 ],
      [ 2, 2, 2, 2, 2 ],
      [ 2, 2, 3, 3 ],
      [ 2, 3, 5 ],
      [ 2, 4, 4 ],
      [ 3, 7 ],
      [ 3, 3, 4 ],
      [ 4, 6 ],
      [ 5, 5 ] ]