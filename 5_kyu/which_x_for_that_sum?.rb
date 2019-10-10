# The number 81 has a special property, a certain power of the sum of its digits is equal to 81 (nine squared). Eighty one (81), is the first number in having this property (not considering numbers of one digit). The next one, is 512. Let's see both cases with the details

# 8 + 1 = 9 and 9**2 = 81

# 512 = 5 + 1 + 2 = 8 and 8**3 = 512

# We need to make a function, power_sumDigTerm(), that receives a number n and may output the n-th term of this sequence of numbers. The cases we presented above means that

# power_sumDigTerm(1) == 81

# power_sumDigTerm(2) == 512

# Happy coding!

# FUNDAMENTALS

# Input: Integer (Whichever term in the sequence we're looking for)
# Output: Integer (the value of that term)

# Reframing: Find the nth integer who's whose digits, summed can be raised to a power to equal that integer

# Data structure:

# Concerns: 
#   No negative return values
  
# Algorithm:

# Check powers of digits starting from 2 up to 100
# 2^2, 2^3, 2^4, etc.
# 3^2, etc.

# For each power, check to see if its digits sum to the original number

# Init a base counter, starting at 2
# increment 2
#   for each new number raise num to the 2-100 power
#     loop from 2-100
#     if the digits of num raised to a particular power sum to the num, append it to an array
#   Sort the array and display

def power_sumDigTerm(n)
  (2..200).each_with_object([]) do |base, sequence_array|
    2.upto(30) do |power|
      sequence_array << base ** power if (base ** power).digits.sum == base
    end
  end.sort[n - 1]
end


p power_sumDigTerm(1)
p power_sumDigTerm(2)
p power_sumDigTerm(3)
p power_sumDigTerm(4)
p power_sumDigTerm(7)
p power_sumDigTerm(9)
p power_sumDigTerm(11)
p power_sumDigTerm(12)
p power_sumDigTerm(40)
