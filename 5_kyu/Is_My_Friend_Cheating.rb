# UNFINISHED

# A friend of mine takes a sequence of numbers from 1 to n (where n > 0).
# Within that sequence, he chooses two numbers, a and b.
# He says that the product of a and b should be equal to the sum of all numbers 
# in the sequence, excluding a and b. Given a number n, could you tell me the 
# numbers he excluded from the sequence?

# 1. Sum all numbers between 1 and n

# 2. nested loop starting at 1 and testing each number against each other number

# 3. the product of a and b should be tested against sum - (a + b)

def removNb(n)
  sum = (1..n).to_a.inject(:+)
  p square_root = Math.sqrt(sum).to_i
  ret_array = []
  
  square_root.times do |num1|
    n.times do |num2|
      break if num1 * num2 > (sum - (num1 + num2))
      if num1 * num2 == (sum - (num1 + num2)) && (num1 != num2)
        ret_array << [num1, num2]
        ret_array << [num2, num1]
      end
    end
  end
  ret_array
end

loop do
  n = gets.to_i
  break if n == 0
  p removNb(n)
end