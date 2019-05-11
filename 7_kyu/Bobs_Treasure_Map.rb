# ~Bob's Treasure Map~

# Bob found a map with directions to lead him to a magnificient treasure, but he
# is kind of dumb and need your help to find the treasure!

# Actual usefull information
# Your task is to return the coordinate of the treasure so Bob can easily find 
# it, or, if the map is fake, return nil since there is no treasure to be found.

# Directions are given by the means of a string like this: "WWSSNNEE" where:

# N = North (Up)
# S = South (Down)
# E = East (Right)
# W = West (Left)
# Anything else that could be in the String is just there to confuse Bob.
# If a map is not a String or is one with no valid direction, it means it's fake.

# The coordinates must be return in an array like so: [x,y]


# First attempt
def treasure_finder1(map)
  position = [0, 0]
  fake_chars = 0
  
  map.to_s.split('').each do |char|
    case char
    when 'W'
      position[0] -= 1
    when 'E'
      position[0] += 1
    when 'N'
      position[1] += 1
    when 'S'
      position[1] -= 1
    else
      fake_chars += 1
    end
  end
  return nil if fake_chars == map.to_s.length
  position
end


# After looking at other people's solutions I incorporated some of their ideas
# and came up with this.
def treasure_finder2(map)
  [map.count('E') - map.count('W'), map.count('N') - map.count('S')] if map.count('ESNW') > 0
end


p treasure_finder1("NNNN")
p treasure_finder2("NNNN")
p treasure_finder1("QWERTYUIOPLKJHGFDSAZXCVBNMMCAWEWYOIHFNMSFAWFWFGHYJILONNNFHTHDEEEASDSDSWFRHDFNDHR")
p treasure_finder2("QWERTYUIOPLKJHGFDSAZXCVBNMMCAWEWYOIHFNMSFAWFWFGHYJILONNNFHTHDEEEASDSDSWFRHDFNDHR")