# The year of 2013 is the first year after the old 1987 with only distinct digits.

# Now your task is to solve the following problem: given a year number, find the minimum year number which is strictly larger than the given one and has only distinct digits.

# Input/Output
# [input] integer year

# 1000 ≤ year ≤ 9000

# [output] an integer

# the minimum year number that is strictly larger than the input number year and all its digits are distinct.

# Input: Integer(year)
# Output: Integer(next largest year with distinct digits)

# Summary:
#   Brute Force - iterate incrementally from year argument until we find a year that has all distinct digits (uniq?)
  
# Data Structures:
#   Array of digits
  
# Concerns:

# Algorithm:
#   count from year argument + 1 upto 9000
#   return current year if year's digits are all 'uniq'

def distinct_digit_year(year)
  (year + 1).upto(9000) do |current_year|
    return current_year if current_year.digits.uniq == current_year.digits
  end
end

def distinct_digit_year(year)
  year += 1
  year += 1 until year.digits.uniq  == year.digits
end
# Test Cases:
p distinct_digit_year(1987)
p distinct_digit_year(2013)
p distinct_digit_year(2229)