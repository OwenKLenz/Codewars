# ~Product of consecutive Fib numbers~
#
# Kindof confusing explanation but basically, for a given integer argument 'prod', determine if
# there is a product of 2 consecutive Fibonacci values that is equal to it. Return an array of
# those two numbers and 'true' if so, otherwise return an array of the first two nubmers whose
# product is greater than prod along with 'false'.

def productFib(prod)
  # Start of fib sequence
  fib = [0, 1]

  # Learned the inject method to refactor this code using an array instead of 3 variables to
  # store the values :)

  until fib.inject(:*) > prod # Keep iterating through the fib sequence until product of array
                              # is greater than prod.
    return (fib << true) if fib.inject(:*) == prod # Return array with true if array product
                                                   # equals prod
    # Find next Fibonacci value
    sum = fib.sum
    fib[0]= fib[1]
    fib[1] = sum
  end
  return fib << false # Return array with false if a product greater than prod was reached
end

p productFib(714)
p productFib(100)
