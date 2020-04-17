# The rgb() method is incomplete. Complete the method so that passing in RGB 
# decimal values will result in a hexadecimal representation being returned. 
# The valid decimal values for RGB are 0 - 255. Any (r,g,b) argument values 
# that fall out of that range should be rounded to the closest valid value.

# Input: A set of 3 integers (rgb values)
# Output: A string of 6 characters (Hex characters)

# Data Structure:
#   A hash mapping integer values 0..15 to hex numbers
#   A return string

# Considerations:
#   Round numbers > 255 to 255 and less than 0 to 0

# Algorithm:
#   map over numbers and if number > 255 set to 255, < 0 to 0

# dec_to_hex = { 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F' }

# if number > 15
#   subtract 16 from number and add one to 2nd digit counter
# else
#   SET 1st digit to dec_to_hex[number] if number > 9 otherwise set second digit to number.to_s 

require 'minitest/autorun'

class RGBToHex
  attr_accessor :rgb_values

  def initialize(*values)
    @rgb_values = values
  end

  def to_rgb
    dec_to_hex = { 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F' }
    hex_number = ''
    rgb_values.map! do |val|
      if val > 255
        255
      elsif val < 0
        0
      else
        val
      end
    end
    
    rgb_values.each do |num|
      second_digit = 0
      while num > 15
        second_digit += 1
        num -= 16
      end
      hex_number += second_digit > 9 ? dec_to_hex[second_digit] : second_digit.to_s
      hex_number += num > 9 ? dec_to_hex[num] : num.to_s
    end
    hex_number
  end
end

class RGBToHexTest < MiniTest::Test
  def test_white
    assert_equal('FFFFFF', RGBToHex.new(255, 255, 255).to_rgb)
  end

  def test_greater_than_255
    assert_equal('FFFFFF', RGBToHex.new(255, 255, 300).to_rgb)
  end

  def test_black
    assert_equal('000000',  RGBToHex.new(0, 0, 0).to_rgb)
  end

  def test_assorted_values
    assert_equal("9400D3",  RGBToHex.new(148, 0, 211).to_rgb)
  end
end

# Test Cases:

p RGBToHex.new(255, 255, 255).to_rgb == "FFFFFF"
p rgb(255, 255, 300) == "FFFFFF"
p rgb(0,0,0) == "000000"
p rgb(148, 0, 211) == "9400D3"