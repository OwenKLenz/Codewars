# The Problem:
#   - Create a class, Num
#     - it should contain instance methods for each digit (0-9).
#     - Instances of the class call any digit method which appends that digit to the current @number and returns either itself (mutated) or a new instance of the class so that methods can be chained.
#     - a to_i method should return the actual numeric value of the instance (or the class?)
# 
# Input:
#   A series of chained methods representing a @number (Num.one.two.three == 123)
# Output: 
#   The resulting @number (when to_i is called)
# 
# Data Structures:
#   Integers
# 
# Considerations:
#   - What does Num.to_i return (default starting value?). 0? An error? Is that even a valid input?
# 
# Algorithm:
#   - Create a class variable to store the @number (since these appear to be class methods)
#   - Each class method multiplies the current class variable by 10 and then adds itself.
#     - ie: Class Variable = 3. Num.two: 3 * 10 + 2 == 32
#   - To allow chaining: Each class method should return self
#   - to_i simply returns the current value of the class variable.
#   - class variable starting value:
#     - If 0: Num.two: 0 * 10 + 2

module NumMod
  def initialize(num)
    @number = num
  end

  def to_i
    @number 
  end

  def zero
    Num.new((@number || 0) * 10 + 0)
  end

  def one
    Num.new((@number || 0) * 10 + 1)
  end

  def two
    Num.new((@number || 0) * 10 + 2)
  end

  def three
    Num.new((@number || 0) * 10 + 3)
  end

  def four
    Num.new((@number || 0) * 10 + 4)
  end

  def five
    Num.new((@number || 0) * 10 + 5)
  end

  def six
    Num.new((@number || 0) * 10 + 6)
  end

  def seven
    Num.new((@number || 0) * 10 + 7)
  end

  def eight
    Num.new((@number || 0) * 10 + 8)
  end

  def nine
    Num.new((@number || 0) * 10 + 9)
  end
end

class Num
  include NumMod
  extend NumMod
end

puts Num.one.two.three.to_i
puts Num.two.one.four.seven.three.eight.three.nine.two.seven.to_i
