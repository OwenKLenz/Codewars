# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

# Note: If the number is a multiple of both 3 and 5, only count it once.

# Input: An Integer
# Output: An Integer (a sum)

# Rules:
# Find all of the multiples of 3 or 5 between 3 and a number argument
# Only count each valid number once (so 15 only gets included once)
# Up to but NOT including argument num

# Declarative:
# Count up from 3 to n - 1 by 1s
# For each number check it for dvisibleness by 3 or 5
# if divisible by 3 append it to an array of ints
# elsif divisible by 5 append it to an array of ints
# sum the array and return the sum

# Imperative:
  # Initialize counter to 3
  # Initialize array to []
# Count up from 3 to n - 1 by 1s
  # 3.upto(n - 1) with block param
# if n divisible by 3 append it to an array of ints
  # if n % 3 is 0, array << n
# elsif divisible by 5 append it to an array of ints
  # elsif n % 5 is 0, array << n
# After iterating over all possible values
# sum the array and return the sum
  # array.sum
  
def solution(number)
  counter = 3
  nums_arr = []

  3.upto(number - 1) do |n|
    if n % 3 == 0
      nums_arr << n
    elsif n % 5 == 0
      nums_arr << n
    end
  end

  nums_arr.sum
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168
