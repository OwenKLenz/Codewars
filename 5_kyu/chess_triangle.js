// Chess Fun #7: Chess Triangle
// https://www.codewars.com/kata/5897eebff3d21495a70000df

// Input: 2 numbers representing the board dimensions
// Output: A number, the number of "chess triangles" on a board of that size

// Rules:
//   - Chess Triangle:
//     - A configuration of 1 rook, 1 bishop and 1 knight such that each piece is attacking and being attacked by another piece
//   - The board will be at least 1 x 3 or 3 x 1 and up to 40 x 40

// Data Structures:
//   - Counter to track the triangles
//   - The board 2d array
//   - An array of knight positions generated at each possible square on the board

// Algorithm:
//   - Place the knight at each position on the board
//   - For each knight position, calculate its attackable positions
//   - place a bishop at each attackable position by the knight
//   - For each bishop position, place a rook in a position where it can attack the knight and is being attacked by the bishop
//     - test each square cardinal to the knight
//     - If the square is diagonal to the bishop position, it's a triangle 
  
//   - Repeat with a rook in each knight attackable position
//     - For each rook position, test every square that is cardinal to that position
//       - Test each square diagonal to the knight
//       - If the square is in the same row or column as the rook position, it's a triangle

// For Knight attacks Bishop
//   - Rook will be at knight row and at knight column +/- 1 and 3
//   - Rook will be at Knight column and at knight row +/- 1 and 3

// For Knight attacks Rook
//   - Bishop at knight row +/- 1, knight column +/- 1
//   - Bishop at knight row +- 2, knight column +- 2

// If the above positions are on the board, it's a triangle

function chessTriangle(n, m) {
  let board = createBoard(n, m);
  let triangles = 0;

  let knightPositions = findAllSquareCoordinates(n, m);

  knightPositions.forEach(knightPosition => {
    let knightAttackableSquares = findKnightAttackableSquares(knightPosition, board);

    knightAttackableSquares.forEach(bishopPosition => {
      checkPossibleRookPositions(bishopPosition, knightPosition, board);
    });

  //   knightAttackableSquares.forEach(rookPosition = > {
  //     checkPossibleBishopPositions(rookPosition, knightPositon, board); 
  //   });
  });

  checkPossibleBishopPositions([1, 2], [3, 3], board);
  console.log(triangles);


  function checkPossibleBishopPositions(bishopPosition, knightPosition, board) {
    let knightRow = knightPosition[0];
    let knightColumn = knightPosition[1];

    [1, 3].forEach(offset => {
      let rookUpRow = knightRow - offset;
      let rookDownRow = knightRow + offset;
      let rookRightColumn = knightColumn + offset;
      let rookLeftColumn = knightColumn - offset;

      if (board[rookUpRow][knightColumn] && bishopAttacksRook(bishopPosition, [[rookUpRow],[knightColumn]]) ||
          board[knightColumn][rookUpRow] && bishopAttacksRook(bishopPosition, [[rookDownRow],[knightColumn]]) ||
          board[knightColumn][rookUpRow] && bishopAttacksRook(bishopPosition, [[knightRow],[rookLeftColumn]]) ||
          board[rookUpRow][knightColumn] && bishopAttacksRook(bishopPosition, [[knightRow],[rookRightColumn]])) {
            triangles += 1;
      }
    });

    // While checking all possible rook positions
    // if rook position row - bishop position row is equal to rook position column - bishop position column
      
  }

  function bishopAttacksRook(bishopPosition, rookPosition) {
    return bishopPosition[0] - rookPosition[0] === bishopPosition[1] - rookPosition[1];
  }
}


function checkPossibleRookPositions(rookPosition, knightPosition, board) {
// For Knight attacks Rook
//   - Bishop at knight row +/- 1, knight column +/- 1
//   - Bishop at knight row +- 2, knight column +- 2

}
function findKnightAttackableSquares(knightPosition, board) {
  let knightAttackableSquares = [];

  [2, -2].forEach(longDir => {
    [1, -1].forEach(shortDir => {
      let pos1 = [knightPosition[0] + longDir, knightPosition[1] + shortDir];
      let pos2 = [knightPosition[0] + shortDir, knightPosition[1] + longDir];

      if (board[pos1[0]] && board[pos1[0]][pos1[1]]) {
        knightAttackableSquares.push(pos1);
      }

      if (board[pos2[0]] && board[pos2[0]][pos2[1]]) {
        knightAttackableSquares.push(pos2);
      }
    });
  });

  return knightAttackableSquares;
}

function findAllSquareCoordinates(n, m) {
  let squareCoords = [];

  for (let row = 0; row < n; row++) {
    for (let column = 0; column < m; column++) {
      squareCoords.push([row, column]);
    }
  }

  return squareCoords;
}

function createBoard(n, m) {
  let board = [];
  for (let rowNum = 0; rowNum < n; rowNum++) {
    board.push(new Array(m).fill(1));
  }

  return board;
}


// Test Cases:
console.log(chessTriangle(7,7)); // 8
// console.log(chessTriangle(2,3)); // 8
// console.log(chessTriangle(1,30)); // 0
// console.log(chessTriangle(3,3)); // 48
// console.log(chessTriangle(2,2)); // 0
// console.log(chessTriangle(5,2)); // 40
// console.log(chessTriangle(40,40)); // 92400

