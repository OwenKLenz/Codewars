// Endianness Conversion

// https://www.codewars.com/kata/56f2dd31e40b7042ad001026

// [1][1][1][1][1]
// [1][1][1][0][1]
// [1][1][1][1][1]
// [1][1][1][1][1]
// [1][1][1][1][1]

// Input:
//   - A grid (contains 1s and 0s)
//   - A column and row for the ant 
//   - n, a number of iterations to simulate
//   - dir, the ants cardinal direction (of 0, 1, 2, or 3)

// Output: The state of the grid after n iterations

// Rules:
//   - Iterate n times
//   - For each iteration, move the ant according the white/black space rules
//   - White/black space rules:
//     - If ant is on white space: 
//       - turn right 90 degrees (increment direction value, 0 becomes 1, 3 becomes 0), flip the color of the square and move forward one square
//     - If ant is on black space
//       - turn left 90 degrees (decrement direction value, 1 becomes 0, 0 becomes 3) flip the color of the square
    
//   - If the ant reaches a square that is out of bounds, add a new row/column to the grid

// Data structures:
//   - 2d array for the grid
//   - A way to represent 360 degrees of directions
//     - Circular array: maybe a "compass" object that returns a new direction based on a starting position and "right" or "left"
//   - an ant object that contains the row, columna dn current direction

// Algorithm:
//   - Create an "ant"
//     - Has row and column values, has a direction
//   - For n iterations
//     - Ant turns based on black/white square rules
//     - Swap square color
//     - Ant moves forward
//     - If ant is out of bounds, add a new row/column in the appropriate location (top, bottom, left, right)

function ant(grid, column, row, n, dir=0) {
  let ant = {
    row,
    column,
    dir,
  }

  for (let i = 0; i < n; i++) {
    reorientAntToggleSquare(grid, ant);
    moveAnt(ant);
    if (outOfBounds(ant, grid)) {
      expandGrid(ant, grid);
    }
  }

  return grid;
}

function expandGrid(ant, grid) {
  if (ant.row === grid.length) {
    grid.push(new Array(grid[0].length).fill(0));
  } else if (ant.column === grid[0].length) {
    grid.forEach(row => row.push(0));
  } else if (ant.row < 0) {
    grid.unshift(new Array(grid[0].length).fill(0));
    ant.row = 0;
  } else {
    grid.forEach(row => row.unshift(0));
    ant.column = 0;
  }
}

function outOfBounds(ant, grid) {
  return ant.row < 0 ||
         ant.column < 0 ||
         ant.row >= grid.length ||
         ant.column >= grid[0].length;
}

function moveAnt(ant) {
  switch (ant.dir) {
    case 0:
      ant.row -= 1;
      break;
    case 1:
      ant.column += 1;
      break;
    case 2:
      ant.row += 1;
      break;
    case 3:
      ant.column -= 1
    }
}

function reorientAntToggleSquare(grid, ant) {
  if (grid[ant.row][ant.column] === 1) {
    ant.dir += 1;
    if (ant.dir > 3) {
      ant.dir = 0;
    }  
  } else {
    ant.dir -= 1;
    if (ant.dir < 0) {
      ant.dir = 3;
    }  
  }

  grid[ant.row][ant.column] = grid[ant.row][ant.column] === 0 ? 1 : 0;
}

console.log(ant([[1]], 0, 0, 1, 0)); // should return: [[0, 0]]
console.log(ant([[1, 1], [0, 0]], 1, 1, 2, 0)); // [[1, 1], [1, 1], [0, 0]]
console.log(ant([[0]], 0, 0, 1, )); // [[0, 1]];
console.log(ant([[1]], 0, 0, 3, 0)); // [[0, 1], [0, 1]];
