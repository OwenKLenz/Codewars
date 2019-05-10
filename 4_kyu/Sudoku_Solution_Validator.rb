# This is definitely the most challenging problem I've solved in Ruby so far,
# I'm certain that there are simpler and more elegant ways to do it, but I got
# really bogged down in trying to split the board into an array of nonet arrays 
# (nonets being the name I came up with for those 3 x 3 grids within the larger 
# board that each have to contain the numbers 1-9). 


# ~Sudoku Solution Validator~
# Write a function validSolution() that accepts 
# a 2D array representing a Sudoku board, and returns true if it is a valid 
# solution, or false otherwise. The cells of the sudoku board may also contain 
# 0's, which will represent empty cells. Boards containing one or more zeroes 
# are considered to be invalid solutions.

# The board is always 9 cells by 9 cells, and every cell only contains integers
# from 0 to 9.


ORDERED_ARRAY = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def row_checker(board)
  board.each do |row|
    return false if row.sort != ORDERED_ARRAY
  end
  true
end

def column_checker(board)
  column_array = [[],[],[],[],[],[],[],[],[]]
  board.each_with_index do |column, index|
    column.each_index do |column_index|
      column_array[column_index][index] = column[column_index]
    end
  end
  
  column_array.each do |column|
    return false if column.sort != ORDERED_ARRAY
  end
end

def nonet_checker(board)
  nonet_array = [[],[],[],[],[],[],[],[],[]]
  row = 0 # index in board array
  element = 0 # index in current array of board array
  nonet = 0 # index in the nonet_array
  nonet_row = 0 # current row of nonets (0-2). 

  3.times do # access each of the 3 rows of nonets 
    3.times do # access each noney within each row
      3.times do # access each row withing each nonet
        3.times do # access each element within each nonet row
          nonet_array[nonet] << board[row][element]
          element += 1
          if element == 9
            row += 1
            element = 0 
          end
        end
        nonet += 1
        nonet_row += 1 if nonet % 3 == 0 && row % 3 == 0
        
        # reset nonet so that we're accessing the "left most" nonet in the 
        # current row of nonets in the sudoku grid.
        if nonet % 3 == 0
          case nonet_row
          when 0
            nonet = 0
          when 1
            nonet = 3
          when 2
            nonet = 6
          end
        end
      end
    end
  end
  
  nonet_array.each do |array| # test each array for the values 1-9
    return false if array.sort != ORDERED_ARRAY
  end
  true
end

def validSolution(board) # check columns, rows and nonets
  return false if !column_checker(board)
  return false if !row_checker(board)
  return false if !nonet_checker(board)
  true
end

puts validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
                    [6, 7, 2, 1, 9, 5, 3, 4, 8],
                    [1, 9, 8, 3, 4, 2, 5, 6, 7],
                    [8, 5, 9, 7, 6, 1, 4, 2, 3],
                    [4, 2, 6, 8, 5, 3, 7, 9, 1],
                    [7, 1, 3, 9, 2, 4, 8, 5, 6],
                    [9, 6, 1, 5, 3, 7, 2, 8, 4],
                    [2, 8, 7, 4, 1, 9, 6, 3, 5],
                    [3, 4, 5, 2, 8, 6, 1, 7, 9]])
                         
                         
puts validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
                    [6, 7, 2, 1, 9, 0, 3, 4, 9],
                    [1, 0, 0, 3, 4, 2, 5, 6, 0],
                    [8, 5, 9, 7, 6, 1, 0, 2, 0],
                    [4, 2, 6, 8, 5, 3, 7, 9, 1],
                    [7, 1, 3, 9, 2, 4, 8, 5, 6],
                    [9, 0, 1, 5, 3, 7, 2, 1, 4],
                    [2, 8, 7, 4, 1, 9, 6, 3, 5],
                    [3, 0, 0, 4, 8, 1, 1, 7, 9]])                         