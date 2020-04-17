# Write a code that receives an array of numbers or strings, goes one by one 
# through it while taking one value out, leaving one value in, taking, leaving, 
# and back again to the beginning until all values are out.
# It's like a circle of people who decide that every second person will leave 
# it, until the last person is there. So if the last element of the array is 
# taken, the first element that's still there, will stay.
# The code returns a new re-arranged array with the taken values by their 
# order. The first value of the initial array is always taken.

# Input: Array of numbers or strings
# Output: Array of numbers or strings

# Description:
#   Iterate across the array removing every even element and appending it to a
#   new array until the array is empty. Return the new array

# Data Structure:
#   Arrays

# Algorithm:
# init old array and new array
#   until array is empty
#     shift an element to new array
#     shift an element and push it back on the end

def yes_no(arr)
  return [] if arr.empty?
  new_array = []
  loop do
    new_array << arr.shift
    return new_array if arr.empty?
    arr.push(arr.shift)
  end
end

def yes_no(arr)
  new_arr = []
  loop do
    return new_arr if arr.empty?
    0.step(by: 1, to: (arr.size - 1) / 2){ |index| new_arr << arr.slice!(index) }
  end
end


# Examples:

p yes_no([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) #==
  [1, 3, 5, 7, 9, 2, 6, 10, 8, 4]

p yes_no(['this', 'code', 'is', 'right', 'the']) #==
  ['this', 'is', 'the', 'right', 'code']