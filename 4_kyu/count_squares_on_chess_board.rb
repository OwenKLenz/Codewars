# Input: a 2d array representing a chess board (of varying sizes)
# Output: a hash with keys representing the dimensions of the squares, contained
#   in the board (a key of 2 would represent a 2 x 2 square). The value is an
#   integer representing the number of squares of key size.

# Rules: Find all of the squares (2 x 2 or greater) comprised of no chess pieces
# (represented by the number 1 as an array element) and return them in a hash.
# Board will be 2 <= size <= 130

# Ideas:
#   Iterate over all possible subsquares of length 2 to maxlength. If all squares
#   are a 1, increment the hash value for that square size

# Considerations:
  # Don't keep looking at squares originating from a given corner square once an
  # non empty square is found (move to next corner square)

# Algorithm:
#   Create a hash with values defaulting to 0
#   
#   Set counter to 0
#     Look at squares from index 0-1, 0-2, 0-3 up to maxlength - 1
#     If square is empty (all 1s) increment hash on value and continue to 0-2, 0-3, etc.
#     Once a square with a piece is found, you're done with that starting index (0, 0 to begin)
#     incremenet counter
#     Now look at 1-2, 1-3, 1-4, up to max length

#     maxlength needs to be decremented by 1 for every square you move right and
#     every squre you move down.

# Starting simple:
#   Checking a single 2x2 square:
#     create a transposed version of the board and save it
#     init left_corner counter to 0
#     init right corner counter to 1
#     check if board[left_corner..right_corner] includes 0
#       if so break
#     check if transposed_board[left_corner..right_corner] includes 0
#       if so break
# 

# New idea:
  # Grabbing the whole sub matrix that we want to examine for 0s.

#   We want to acquire a submatrix
#     submatrix will be from left_corner_index to left_corner_index + n (until left_corner_index + n == dimensions)
#     in left_corner_index rows


require 'pry'

def count(board)
  squares_hash = Hash.new(0)
  dimensions = board[0].size
  left_corner_index = 0
  right_corner_index = 1
  top_row = 0
  bottom_row = 1

  until top_row == dimensions - 1
    until right_corner_index == dimensions || bottom_row == dimensions
      until right_corner_index == dimensions || bottom_row == dimensions
        # binding.pry
        size = bottom_row - top_row + 1
        break if square_contains_zero?(board, top_row, bottom_row, left_corner_index, right_corner_index)
        squares_hash[size] += 1
        right_corner_index += 1
        bottom_row += 1
      end
      left_corner_index += 1
      right_corner_index = left_corner_index + 1
      bottom_row = top_row + 1
    end
    left_corner_index = 0
    right_corner_index = 1
    top_row += 1
    bottom_row = top_row + 1
  end

  squares_hash
end

def square_contains_zero?(board, top_row, bottom_row, left_corner_index, right_corner_index)
  (top_row).upto(bottom_row) do |row|
    board[row][left_corner_index..right_corner_index].each { |el| return true if el == 0 }
  end
  false
end

# p count([[1, 2, 3, 4], 
#          [5, 6, 7, 8],
#          [9, 10, 11, 12],
#          [13, 14, 15, 16]])


p count(Array.new(130) { Array.new(130) {1} })

p count([
  [0,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0,1,1,0,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0,1,1,0,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0,1,1,0,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0,1,1,0,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0,1,1,0,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0,1,1,0,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0,1,1,0,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0,1,1,0,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0,1,1,0,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1,1,1,1,1,1,1, 1, 1, 1, 1, 1,1 , 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
])
# Keep working left to right until first index([1][3]) + max dimensions == maxlength (5 in case below)
                                     # this one ^

# index 0, 0:
#   2x2 to 5x5
# index 0, 1:
#   2x2 to 4x4
# etc.

# index 1, 0:
#   2x2 to 4x4
# index 1, 1:
#   2x2 to 4x4
# index 1, 2:
#   2x2 to 3x3
#  etc.

# index 2, 0:
#   2x2 to 3x3
# index 2, 1:
#   2x2 to 3x3
# index 2, 2:
#   2x2 to 3x3
# index 2, 3:
#   2x2



chessboard = [
              [0,1,1,1,1],
              [1,1,1,1,1],
              [1,1,1,1,1],
              [0,1,1,0,1],
              [1,1,1,1,1]
             ]

chessboard = [
              [0,1],
              [1,1]
             ]

chessboard = [
              [1,1,1],
              [1,0,1],
              [1,1,1]
             ]

