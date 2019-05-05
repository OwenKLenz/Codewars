# ~Is Prime~
# Define a function isPrime/is_prime() that takes one integer argument and returns true/True or false/False depending on if the integer is a prime.


def is_prime(num)
  i = 2
  return false if num < 2
  while i <= Integer.sqrt(num) 
    return false if num % i == 0
    i += 1
  end
  return true
end

loop do
  puts "Enter a number to test for primeness:"
  puts is_prime(gets.to_i)
end

