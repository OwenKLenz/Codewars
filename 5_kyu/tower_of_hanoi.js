// Tower of Hanoi

// https://www.codewars.com/kata/527f782024b930114700076e/javascript

// Input: A board object that gives us access to the rod tops,
//        A visual of the board output via a log,
//        The number of discs in the game,
//        A visual of the current game state via a log

// Output: An array of move pairs 
//           Move pair:
//             - Each consecutive pair of array elements where the first element is the starting tower and the 2nd is the ending tower for a move

// Rules:
//   - Goal: move all pieces from the starting tower to another tower.
//   - Move one top piece at a time from one tower to the another
//   - A larger piece can never be placed on a smaller piece
//   - Once all pieces are stacked on a new tower, return the order of moves taken

// Data Structures:
//   - An array of move pairs
//   - An array of towers (3 elements which are pushed and popped from)

// Algorithm:
//   - Capturing the board
//     - Get the difficulty
//     - Set startingRod to the rod containing all elements. Use getRodTops to find the index of the starting rod
//     - Create an array of 3 subarrays where the array at startingRod index contains the numbers from difficulty to 1

//   - Playing the game:
//     - Initalize moves array
//     - Initialize stepByOne to the starting tower index
//     - Initialize stepByTwo to startingTowerIndex

//     - pop top disc off of stepByOne indexedTower and hold it
//     - Push stepByOne index onto the moves array
//     - Increment stepByOne
//       - Subprocess: stepByOne += 1, if >= 3 subtract 3 from it
//     - Push the popped disc onto new stepByOne indexed tower
//     - Push stepByOne index onto the moves array
  
//       - Check stepByONe indexed tower to see if it is full (game over)
//     - pop top disc off of stepByTwo and hold it
//     - Push stepByTwo index onto the moves array
//     - Add 2 to StepByTwo
//       - Subprocess: stepByTwo += 2, if >= 3 subtract 3
//     - push current disc onto stepByTwo indexed tower
//     - Push stepByTwo index onto the moves array
//   - Repeat until done


function getMoves(board) {
  let [towersArray, startingRod] = acquireBoardAndStartingRod(board);
  let towerSize = towersArray[startingRod].length;
  let moves = [];
  let stepByOne = startingRod;
  let currentDisc;

  let counter = 0;

  while(true) {
    currentDisc = towersArray[stepByOne].pop();
    moves.push(stepByOne);
    increment();
    towersArray[stepByOne].push(currentDisc);
    moves.push(stepByOne);
    if (towersArray[stepByOne].length === towerSize) {
      return moves;
    }

    let greaterTops = findAndSortGreaterTowerTops(towersArray, stepByOne);

    moves = moves.concat(greaterTops);
    currentDisc = towersArray[greaterTops[0]].pop();
    towersArray[greaterTops[1]].push(currentDisc);
  }

  return moves;

  function increment() {
    stepByOne += 1;

    if (stepByOne >= 3) {
      stepByOne -= 3;
    }
  }
}

function findAndSortGreaterTowerTops(towersArray, stepByOne) {
  let greaterTowerTops = Object.keys(towersArray).map(idx => Number(idx)).filter((index) => {
    return index !== stepByOne;
  });

  return greaterTowerTops.sort((index1, index2) => {
    let towerTop1 = towersArray[index1][towersArray[index1].length - 1];
    let towerTop2 = towersArray[index2][towersArray[index2].length - 1];

    return towerTop1 === undefined || towerTop1 > towerTop2 ? 1 : -1;
  });
}

function acquireBoardAndStartingRod(board) {
  let numOfDiscs = board.getDifficulty();
  let rodTops = board.getRodTops();
  let startingRod = 0;
  let towerArray = [[],[],[]];
  while (!board.getRodTops()[startingRod]) {
    startingRod += 1;
  }

  for (let i = numOfDiscs; i > 0; i--) {
    towerArray[startingRod].push(i); 
  }

  return [towerArray, startingRod];
}
