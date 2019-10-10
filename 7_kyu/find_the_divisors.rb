# Create a function named divisors/Divisors that takes an integer n > 1 and returns an array with all of the integer's divisors(except for 1 and the number itself), from smallest to largest. If the number is prime return the string '(integer) is prime' (null in C#) (use Either String a in Haskell and Result<Vec<u32>, String> in Rust).

# Input: Integer
# Output: Array or String

# Summary:
#   Populate an with all of the divisors of a number except 1 and itself
#   If prime return "#{num} is prime"
  
# Data Structure:
#   Array
  
# Algorithm:
#   Iterate from num - 1 down to 2
#   and if num is evenly divisible by the iterator, append iterator to array
   
#   if array is empty, return string, otherwise return array

def divisors(num)
  divisor_array = []
  (2).upto(num - 1) do |i|
    divisor_array << i if num % i == 0
  end
  divisor_array.empty? ? "#{num} is prime" : divisor_array
end

# Example:
p divisors(12) # should return [2,3,4,6]
p divisors(25) # should return [5]
p divisors(13) # should return "13 is prime"