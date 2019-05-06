# ~Simple Pig Latin~
# Move the first letter of each word to the end of it, then add "ay" to 
# the end of the word. Leave punctuation marks untouched.

def pig_it text
  # Array of possible punctuation to compare each character to (Should 
  # probably be more comprehensive).
  puncs = ['.', ',', '!', '?', ':', ';', ')', '(']

  # Split the string argument up into an array of arrays of characters
  words = text.split.map{ |word| word.split('') }

  # Iterate over each word, skip it if it's only punctuation, if the last
  # character is punctuation store it in punc, then shift the first character
  # and append it to word along with 'ay' and any punctuation.
  words.each do |word|
    next if word.length == 1 and puncs.include?(word[0])  
    punc = (puncs.include?(word.last) ? word.pop : '')
    word.push(word.shift + 'ay'+ punc)
  end
  # Rejoin all of the characters into words first and then the words into the 
  # return string.
  words.map{ |word| word.join }.join(' ')  
end
