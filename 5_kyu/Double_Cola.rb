# ~Double Cola~

# Sheldon, Leonard, Penny, Rajesh and Howard are in the queue for a "Double 
# Cola" drink vending machine; there are no other people in the queue. The 
# first one in the queue (Sheldon) buys a can, drinks it and doubles! The 
# resulting two Sheldons go to the end of the queue. Then the next in the
# queue (Leonard) buys acan, drinks it and gets to the end of the queue as two
# Leonards, and so on.

# For example, Penny drinks the third can of cola and the queue will look like
# this:

# Rajesh, Howard, Sheldon, Sheldon, Leonard, Leonard, Penny, Penny
# Write a program that will return the name of the person who will drink the
# n-th cola.


names = ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"] # Sample array of names

def who_is_next(names, r)
  size = names.size # Number of names in array
  people = names.size # Starting number of items in array
  drinks = 0 # Drinks taken
  
  return names[r - 1] if r <= size # Handles the case where you never go beyond the original set of 'size' names.
  
  # Calculate the number of drinks and people in the array up to the point where
  # one more pass through the array would excede r drinks.
  loop do
    drinks += people
    people *= 2
    break if r - drinks - people <= 0
  end
  
  remainder = r - drinks # The number of drinks left to consume before r is reached.
  each_person_num = people / size # The number of copies of each person in the original array before the final pass through the array
  
  # Iterate through the list of names and subtract the number of copies of each 
  # person on each iteration until subtracting those copies would exceed the 
  # remainder (IOW: Go beyond 'r', the number of drinks to be taken). The name 
  # that would exceed 'r' is the name of the person (or copy) who will be in line
  # for the 'r'th drink.
  names.each do |name|
    remainder -=  each_person_num
    return name if remainder <= 0
  end
end

# Enter any value for r to test the ouput of who_is_next.
loop do
p who_is_next(names, gets.to_i)
end
