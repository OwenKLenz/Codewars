# Given an array of intgers , Find the minimum sum which is obtained from summing each Two integers product .

# Summary:
#   find the smallest possible sum where pairs of digits in the array will be multiplied first
#   Arrays will all be even in size
#   all numbers will be greater than 0
  
# Input: Array of integers
# Output: Integer (a sum)

# Data structures:
#   Array

# Concerns:

# Algorithm:
#   Init sum to 0
#   Sort the integers
#   Pairs of numbers will then be greatest mult by smallest, 2nd greatest by second smallest, etc.
#   each_with_index (starting from one for negative element reference to get the digits on righ side of sorted array)
  
  
def minSum(array, sum=0)
  array.sort!.each.with_index(1) { |n, i| sum += n * array[-i] }
  sum / 2
end
[2, 3, 4, 5]
p minSum([5,4,2,3]) == 22 #(5 * 2 + 3 * 4)
p minSum([9,2,8,7,5,4,0,6]) == 74 #(9*0 + 8*2 +7*4 +6*5 = 74)
p minSum([12,6,10,26,3,24])