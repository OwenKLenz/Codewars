# Complete the function that takes 3 numbers x, y and k (where x ≤ y), and 
# returns the number of integers within the range [x..y] (both ends included) 
# that are divisible by k.

# More scientifically: { i : x ≤ i ≤ y, i mod k = 0 }

# Example
# Given x = 6, y = 11, k = 2 the function should return 3, because there are 
# three numbers divisible by 2 between 6 and 11: 6, 8, 10

# input: 3 integers?
# output: an integer (number of numbers in range divisible by k)

# requirements:
#   x and y create an inclusive range. Find all numbers in the range that are
#   evenly divisible (% == 0) by k

# Considerations:
#   k > 0?
#   x and y greater than or equal to zero?

# algorithm:
#   iterate over all numbers with count
#   if number mod k is zero, return true, else return false
#   count should return the total number

# Find first number evenly divisible by k
# Then add k until range is exceeded.

# init counter to start of range
# init total to 0
# while the counter is not evenly divisble by k, increment by 1
# once it is, increment total and break
# now subtract that first evenly div. number from the end of range, divide end 
# by k and add quotient to total to be returned

def divisible_count(x, y, k)
  x += 1 until x % k == 0
  (y - x) / k + 1
end

divisibleCount(6, 11, 2) == 3
