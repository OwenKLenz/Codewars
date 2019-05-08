# Your task is to sort a given string. Each word in the string will contain a 
# single number. This number is the position the word should have in the result.
# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).
# If the input string is empty, return an empty string. The words in the input 
# String will only contain valid consecutive numbers.

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

puts order("is2 Thi1s T4est 3a")
puts order("4of Fo1r pe6ople g3ood th5e the2")