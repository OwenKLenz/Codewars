# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

# The input is restricted to contain no numerals and only words containing the english alphabet letters.

# Summary:
#   Sort the charaters in string in alphabetical order, ignoring case
#   Make sure to remove all punctuation and whitespace
  
# Input: A string
# Output: A string (with whitespace and non-alpha characters removed)

# Data Structures:
#   Strings
#   Array of characters
  
# Concerns:
#   Empty string should return empty strings
#   All  non-alpha chars should be deleted first!

# Algorithm:
#   delete all non-alpha chars (^a-zA-Z)
#   Split chars into an array
#   iterate over chars (sort_by) and sort by the character, downcased
#   Rejoin the array and return

def alphabetized(string)
  string.delete('^a-zA-Z').chars.sort_by { |char| char.downcase }.join  
end

# Example:

p alphabetized("The Holy Bible") == "BbeehHilloTy"