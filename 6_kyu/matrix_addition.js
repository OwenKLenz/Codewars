// Matrix Addition

// https://www.codewars.com/kata/526233aefd4764272800036f/javascript

/*
Write a function that accepts two square matrices (N x N two dimensional arrays), and return the sum of the two. Both matrices being passed into the function will be of size N x N (square), containing only integers.

  How to sum two matrices:

Take each cell [n][m] from the first matrix, and add it with the same [n][m] cell from the second matrix. This will be cell [n][m] of the solution matrix.

  Visualization:

|1 2 3|     |2 2 1|     |1+2 2+2 3+1|     |3 4 4|
|3 2 1|  +  |3 2 3|  =  |3+3 2+2 1+3|  =  |6 4 4|
|1 1 1|     |1 1 3|     |1+1 1+1 1+3|     |2 2 4|
  Example
matrixAddition(
  [ [1, 2, 3],
    [3, 2, 1],
    [1, 1, 1] ],
//      +
  [ [2, 2, 1],
    [3, 2, 3],
    [1, 1, 3] ] )

// returns:
  [ [3, 4, 4],
    [6, 4, 4],
    [2, 2, 4] ])
*/

// Rules:
//   Input: 2 square matrices (2d arrays) 
//   Output: 1 square matrix where each cell is the sum of the cells at the same indexes in the two argument matrixes

//   Definitions:
//     - "Adding Matrixes"
//       - Adding each pair of cells in 2 matrices where the cells being added are at the same location in each matrix
    
//   Considerations:
//     - both matrices will be square (N x N)and will both be the same dimensions
//     - All elements will be numbers

//   Steps:
//     - Create a new matrix with the same number of rows as the argument matrices
//     - Iterate over each pair of elements of the argument matrices
//     - Add the pairs
//     - Put the resulting sum in the appropriate element in the new matrix.

// Data Structures:
//   - Matrices (2d arrays)
//   - Numbers for calculating sums

// Algorithm:
//   - Create an empty summedMatrix to store our sums and then return (subprocess)
//     - Should contain the same number of rows as matrix1;
//     - Iterate over the rows in matrix1 and create a new row array in summedMatrix to hold that value
//   - Iterate by index over the rows of both input matrices
//     - Iterate over the columns of each row of both input matrices
//       For each, sum the current cells in matrix1 and matrix2
//       - Set the cell at the current row and column in summedMatrix to the sum.
//   When done, return summedMatrix

function matrixAddition(matrix1, matrix2) {
  let summedMatrix = createMatrixTemplate(matrix1);
  
  for (let row = 0; row < matrix1.length; row++) {
    for (let column = 0; column < matrix1[0].length; column++) {
      let sum = matrix1[row][column] + matrix2[row][column];
      
      summedMatrix[row][column] = sum;
    }
  }

  console.log(summedMatrix);
}

function createMatrixTemplate(matrix) {
  let newMatrix = [];

  for (let i = 0; i < matrix.length; i++) {
    newMatrix.push([]);
  }

  return newMatrix;
}

// Examples:

matrixAddition(
  [ [1, 2, 3],
    [3, 2, 1],
    [1, 1, 1] ],
//      +
  [ [2, 2, 1],
    [3, 2, 3],
    [1, 1, 3] ] );

// returns:
//  [ [3, 4, 4],
//    [6, 4, 4],
//    [2, 2, 4] ])

matrixAddition(
  [ [1, 2.5, 3],
    [3, 2, 1],
    [1, 1, 1.12] ],
//      +
  [ [2, 2, 1],
    [3, 2, 3],
    [1, 1, 3.1] ] )


matrixAddition([[1]], [[4]]); // [[5]]

// returns:
//  [ [3, 4.5, 4],
//    [6, 4, 4],
//    [2, 2, 4.22] ])
