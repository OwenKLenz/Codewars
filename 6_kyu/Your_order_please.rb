# Your task is to sort a given string. Each word in the string will contain a 
# single number. This number is the position the word should have in the result.
# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).
# If the input string is empty, return an empty string. The words in the input 
# String will only contain valid consecutive numbers.
require 'benchmark'

def order(words)
  ordered_words = []
  words = words.split
  words.length.times do |index|
    words.each do |word|
      ordered_words[index] = word if word.include?((index + 1).to_s)
    end
  end
  ordered_words.join(' ')
end

puts Benchmark.measure {
  10000.times do
    order("is2 Thi1s T4est 3a")
    order("4of Fo1r pe6ople g3ood th5e the2")
  end
}
# Input: A string (with a number in each word)
# Output: A reordered string (based on the numbers in each word)

# Data Structure: 
# Starting with a string, convert to an array, return value is string

# Declarative:
# Split string up into words
# search through each word for number (by sorting?)
# assign number - 1th element of return array to the word
# rejoin the word and return

# Imperative:
  # Initial Vars:
  # return_array = []
  # Split string up into words
    # -initialize words to string.split
  # search through each word for number (by sorting?)
    # -Iterate over words with each
    # -Sort chars of each word
    # -check the character at word.chars.sort[0] (the number)
  # assign (number - 1th) element of return array to the word
    # -assign the word.chars.sort[0] - 1th element of return array to current word
  # rejoin the word and return
    # -return_array.join(' ')
    
def order(string)
  sorted_words = []
  words = string.split
  
  words.each do |word|
    sorted_words[word.chars.sort[0].to_i - 1] = word
  end
  sorted_words.join(' ')
end
puts Benchmark.measure {
  10000.times do
    p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
    p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
  end
}

# What will be displayed and why?

my_var = "Hello"
your_var = ["Bonjour", "Guten Tag", "Hola"]

your_var.each do |my_var|
  puts my_var
end