# Task
# Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

# Input: Integer
# Output: Integer

# Rules:
#   Number will have at least 2 digits
#   Delete the smallest digit
  
# Data structure:
#   Array, so we can sort it to find smallest digit

# Algorithm:
#   convert integer to digits and set a variable to reference it
#   reverse digits
#   delete from digits, the first element of the return value of sort called on the array
#   join array to string, then to_i and return it

# delete the first digit that is less than the digit that follows it

def delete_digits(n)
  num_array = n.digits.reverse
  num_array.each_with_index do |num, i|
    if i == num_array.size - 1
      num_array.pop 
      break
    end
    if num_array[i + 1] > num
      num_array.delete_at(i)
      break
    end

  end
  num_array.join.to_i
end

p delete_digits(378427)
  
# Example
# For n = 152, the output should be 52;

# For n = 1001, the output should be 101.

# Input/Output
# [input] integer n

# Constraints: 10 ≤ n ≤ 1000000.

# [output] an integer