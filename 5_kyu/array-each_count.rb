# Create a method, Array#each_count, which returns a count of discrete elements
# contained in the form of {element => count}.

# Your method should meet the following criteria:

# When called without arguments or a block, it should iterate over each element 
# of self, returning a count of its unique elements.

# It should accept a method (in symbol or string format) followed by any number 
# of arguments as parameters. It should apply these parameters to each element 
# of self, returning a count of each unique return value.

# It should accept a block, call the block on each element of self, and return 
# a count of each unique return value.

# It should raise an exception if both arguments and a block are provided.

# Examples:

# cities = ["Melbourne", "Dallas", "Taipei", "Toronto", "Dallas", "Kathmandu"]

# describe "each_count" do
#   it "should work without arguments or block" do
#     Test.assert_equals cities.each_count,
#     {"Melbourne"=>1, "Dallas"=>2, "Taipei"=>1, "Toronto"=>1, "Kathmandu"=>1}
#   end

#   it "should work with a method" do
#     Test.assert_equals cities.each_count(:length),
#     {9=>2, 6=>3, 7=>1}
#   end

#   it "should work with a method and arguments" do
#     Test.assert_equals cities.each_count(:gsub, /[aeiou]/, 'x'),
#     {"Mxlbxxrnx"=>1, "Dxllxs"=>2, "Txxpxx"=>1, "Txrxntx"=>1, "Kxthmxndx"=>1}
#   end

#   it "should work with a block" do
#     Test.assert_equals cities.each_count {|city| city.length % 3 == 0},
#     {true=>5, false=>1}
#   end
# end

# Input: An array (the caller) 
#   Optional: Arguments(symbolized method and arguements to it)
#             A block

# Output: A hash of the distinct values returned for each element of the passed in array

# Data Structures:
#   Hash, array

# Considerations:
#   Empty array returns {}
#   Raise exception if both arguments and block are passed

# Algorithm:
#   Simple case (no block or arguments):
#     Each_with_object over the collection with a hash that defaults to 0
#     Increment the value of each element as a key
#     Return the hash
#   Accept a method + arguments:
#     Call that method on each element in each_with_object. How?
#       call el.method(:method_name).call(arguments)
#     If arguments, pass args to method

class Array
  def each_count(method_name=nil, *args, &block)
    raise ArgumentError if block_given? && method_name

    self.each_with_object(Hash.new(0)) do |el, hash|
      if block_given?
        hash[yield(el)] += 1
      elsif method_name
        hash[el.method(method_name).call(*args)] += 1
      else
        hash[el] += 1
      end
    end
  end
end

class Array
  def each_count(method_name=nil, *args, &block)
    raise ArgumentError if block_given? && method_name

    self.each_with_object(Hash.new(0)) do |el, hash|
      hash[block_given? ? yield(el) : (method_name ? el.send(method_name, *args) : el )] += 1 
    end
  end
end

# Test Cases:
p [1, 2, 3, 3, 7, 3, 1].each_count == { 1 => 2, 2 => 1, 3 => 3, 7 => 1 }

p %w(hello goodbye hello hello cheese).each_count ==
  { "hello" => 3, "goodbye" => 1, "cheese" => 1 }

p [1, 2, 3, 3, 7, 3, 1].each_count(:+, 1) == { 2 => 2, 3 => 1, 4 => 3, 8 => 1 }

p %w(hello goodbye hello hello cheese).each_count(:concat, '!') ==
  { "hello!" => 3, "goodbye!" => 1, "cheese!" => 1 }

p %w(hello goodbye hello hello cheese).each_count(:concat, '!') { |el| el + 1 } ==
  { "hello!" => 3, "goodbye!" => 1, "cheese!" => 1 }