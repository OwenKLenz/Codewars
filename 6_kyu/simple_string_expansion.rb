# Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string. Empty strings should return an empty string.

def int?(char)
  char.to_i.to_s == char
end

def char?(char)
  !int?(char)
end



def string_expansion(str)
  chars = str.chars
  int_array = []
  chars_array = []
  chars_buffer = ''
  
  counter = 0
  
  if char?(chars[0])
    int_array << 1
  end
  
  loop do
    break if counter >= chars.size
    # binding.pry
    if int?(chars[counter]) && char?(chars[counter + 1])
      int_array << chars[counter].to_i
    elsif char?(chars[counter])
      chars_buffer << chars[counter]
    end
    
    if char?(chars[counter]) && int?(chars[counter + 1])
      chars_array << chars_buffer
      chars_buffer = ''
    end
    
    counter += 1

  end
  
  if chars_buffer.size > 0
    chars_array << chars_buffer
  end
  
  counter = 0
  return_str = ''
  p chars_array
  p int_array
  
  loop do
    break if counter >= chars_array.size
    if int_array[counter] != nil
      chars_array[counter].chars.each do |char|
        return_str << char * int_array[counter]
      end
    else
      return_str << chars_array[counter]
    end
    counter += 1
  end
  p return_str
end




# The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears.

p string_expansion('3D2a5d2f') == 'DDDaadddddff'
p string_expansion('3abc') == 'aaabbbccc'       # correct
p string_expansion('3abc') != 'aaabc'           # wrong
p string_expansion('3abc') != 'abcabcabc'       # wrong
# If there are two consecutive numeric characters the first one is ignored.

p string_expansion('3d332f2a') == 'dddffaa'
# If there are two consecutive alphabetic characters then the first character has no effect on the one after it.

p string_expansion('abcde') == 'abcde'
# Your code should be able to work for both lower and capital case letters.

p string_expansion('') == ''
