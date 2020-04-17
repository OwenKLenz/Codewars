# Input: array (result of 5 die rolls)
# output: An integer (score according to rules)

# Rules: Points are awarded thus
# Three 1's => 1000 points
# Three 6's =>  600 points
# Three 5's =>  500 points
# Three 4's =>  400 points
# Three 3's =>  300 points
# Three 2's =>  200 points
# One   1   =>  100 points
# One   5   =>   50 point

# Any die can only be counted towards one scoring set of die iow a set of 3 ones
# only counts as a 1000 points. A 4th 1 would add an additional 100 points

# Can't mutate the input array

# Algorithm:

# get a uniqed array of dice
# iterate over them
# if the number of instances of that die in the original array is 3 or greater
#   if the number is 1, add 1000 to score
#   else add number * 100 to score
# now select all numbers that are not the triplet number and iterate over those


# take two:
# sort the array
# set a counter to 0
# init current num to first element of array
# iterate over sorted array

# if the current num is the current element
#   increment the counter

# if current num is 3, add 1000 if num is 1 or 100 * num

# else if the current num is not the current element
#   if current num is 1, add counter * 100 to score
#   if current num is 5, add 50 * counter to score
#   set current num to current element and reset counter to 1

# Iterate over uniqed array
# for each element
#   create a hash with the key as the elmeent and the value as a count of that element from original array


require 'pry'

def score(dice)
  dice_hash = {}
  score = 0
  binding.pry
  dice.uniq.each { |roll| dice_hash[roll] = dice.count(roll) }

  dice_hash.each do |roll, num|
    if num >= 3
      score += (roll == 1 ? 1000 : roll * 100)
      dice_hash[roll] -= 3
    end

    if roll == 1
      score += dice_hash[roll] * 100
    elsif roll == 5
      score += dice_hash[roll] * 50
    end
  end
  score
end
[2, 2, 3, 4, 6]
p score([2, 3, 4, 6, 2])
p score([2, 2, 2, 3, 3])
p score( [2, 4, 4, 5, 4] )