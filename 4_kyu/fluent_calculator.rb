# Fluent Calculator


  # The goal is to implement simple calculator which uses fluent syntax:

  # Calc.new.one.plus.two             # Should return 3
# Calc.new.five.minus.six           # Should return -1
# Calc.new.seven.times.two          # Should return 14
# Calc.new.nine.divided_by.three     # Should return 3
# There are only four operations that are supported (plus, minus, times, divided_by) and 10 digits (zero, one, two, three, four, five, six, seven, eight, nine).

  # Each calculation consists of one operation only.

# Rules
#   Input: 
#     - A series of method invocations involving alternating number methods and operator methods
#     - Methods are called by Calc instances  
#   Output:
#     A number, the result of the operations

#   Definitions:
#     - Operators: plus, minus, times, divided_by. The operation to be performed on a value

#   Considerations:
#     - Numbers are 0 to 9
#     - Operators are as above.
#     - Operations will consist of Number - Operator - Number always
#     - Dividing by 0?

  
#   Steps
#     - Create a new Calc instance
#     - Instance should have a "value" instance variable
#     - For each number method
#       - If "value" is unset, value becomes method number 
#       - otherwise, apply operator to value with current operator
#     - For operators
#       - Store operator as a symbol along with the current Calc object

# Data Structures:
#   - Array of values
#   - Operator symbol
#   - A method that invokes another method with it's value as an argument and the other method examines the argument value and returns an appropriate value (the object or the result) depending on the argument/number of values received.

# Algorithm:
#   - Create a Calc class
#     - Instances get a "values" array and operator value intialized to nil
#   - Create an orchestration method that receives an operator/number
#     - If argument is a number, push it to the numbers array instance variable
#     - If the argument is a symbol, set operator to it
#   - Create instance methods for 3-9 and each operator
#     - Each instance method calls the orchestrator method with its value (0, 1,2 :+, :-, etc.) and returns the return value of the orchestrator 

class Calc
  def initialize
    @values = []
    @operator = nil
  end
  
  def add_value(value)
    @values.push(value)
    return self if @values.length == 1

    if @operator == :/
      if @values[1] == 0 
        raise ZeroDivisionError.new "Mustn't divide by zero, precious!"
      else
        @values[0].to_f.send(@operator, @values[1])
      end
    else
      @values[0].send(@operator, @values[1])
    end

  end

  def set_operator(operator)
    @operator = operator
    self
  end

  def one
    add_value(1)
  end

  def two
    add_value(2)
  end

  def three
    add_value(3)
  end

  def four
    add_value(4)
  end

  def five
    add_value(5)
  end

  def six
    add_value(6)
  end

  def seven
    add_value(7)
  end

  def eight
    add_value(8)
  end

  def nine
    add_value(9)
  end

  def zero
    add_value(0)
  end

  def plus
    set_operator(:+)
  end

  def minus
    set_operator(:-)
  end

  def times
    set_operator(:*)
  end

  def divided_by
    set_operator(:/)
  end
end

# Test Cases:
puts Calc.new.one.plus.one
puts Calc.new.four.plus.five 
puts Calc.new.five.plus.four 
puts Calc.new.five.times.four
puts Calc.new.five.divided_by.four
puts Calc.new.five.minus.six
puts Calc.new.five.divided_by.zero == nil # ZeroDivisionError

