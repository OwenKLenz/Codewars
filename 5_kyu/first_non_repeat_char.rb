# Write a function named first_non_repeating_letter that takes a string input, and returns the first character that is not repeated anywhere in the string.

# For example, if given the input 'stress', the function should return 't', since the letter t only occurs once in the string, and occurs first in the string.

# As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input 'sTreSS' should return 'T'.

# If a string contains all repeating characters, it shou\d return an empty string ("") or None -- see sample tests.

# Test Cases:
p first_non_repeating_letter('a') == 'a'
p first_non_repeating_letter('aba') ==  'b'
p first_non_repeating_letter('ookkaayy') == ''
p first_non_repeating_letter('') == ''

# Rules:
#   Find the first character in a given string that isn't repeated elsewhere in the string.
#   upper and lower case instances are considered the same character, but the return should be the original case
# If no such character exists, return ""

# Input: String
# Output: A character (string)

# Data structure: String, array for iterating over chars

# Considerations:
#   Empty string should return ""
#   All repeating chars should return ""
  
# Algorithm:
#   split word into characters
#   iterate over characters
#   if character is contained (count = 1) once in the string, return the character
#   lowercase character and lowercase word, return un lowered char.
    # return '' at end
    
def first_non_repeating_letter(str)
  str.chars.each { |char| return char if str.downcase.count(char.downcase) == 1 }
  ''
end
# Test Cases:
p first_non_repeating_letter('a') == 'a'
p first_non_repeating_letter('aba') ==  'b'
p first_non_repeating_letter('ookkaayy') == ''
p first_non_repeating_letter('') == ''

p first_non_repeating_letter("Test") == 'e'
p first_non_repeating_letter("go")