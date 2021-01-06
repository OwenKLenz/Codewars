# Complete the method which returns the number which is most frequent in the given input array. If there is a tie for most frequent number, return the largest number among them.

# Note: no empty arrays will be given.

# Examples
# [12, 10, 8, 12, 7, 6, 4, 10, 12]              -->  12
# [12, 10, 8, 12, 7, 6, 4, 10, 12, 10]          -->  12
# [12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10]  -->   3

# Input: Array (non empty)
# Output: An integer (largest of the most frequently occurring numbers)

# Data Structures:
# Array of grouped numbers

# Algorithm:
  # Performing a 2 factor sort (first by number of instances, then if needed, by size of number)
#     Group the array by each number's value
#     Grab the values from the resulting hash
#     Sort the values by the length of the sub array. If equal, compare numbers.
#     Return number from largest array

def highest_rank(array)
  sorted_groups = array.group_by { |n| n }.values.sort do |a, b|
    first_compare = b.length <=> a.length
    first_compare == 0 ? b.first <=> a.first : first_compare
  end

  sorted_groups[0][0]
end

def highest_rank(array)
  array.group_by { |n| n }.sort_by { |k, v| [v.size, k] }.last[0]
end

p highest_rank([12, 10, 8, 12, 7, 6, 4, 10, 12]) #== 12
p highest_rank([12, 10, 8, 12, 7, 6, 4, 10, 12, 10]) #== 12
p highest_rank([12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10]) #== 3
