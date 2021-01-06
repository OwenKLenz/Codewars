// Plants and Zombies

// Input: 
//   1. An array of strings representing the "lawn"
//     - The strings will consist of whitespace and plant indicators (numbers and "S"s)
//   2. An array of subarrays representing zombies
//     - Subarrays consist of: 
//       1. moveNumber - The move when a given zombie appears
//       2. rowNumber - The row in which they appear
//       3. hp - The health points of the zombie


// Rules:
//   - A series of moves are taken in which zombies appear/move left and then the shooters fire
//   - If a zombie reaches a shooter, the shooter gets destroyed
//   - If a zombie's health reaches 0, it is immediately removed from the board
//   - When a shooter hits a zombie, decrement its health by the value of the shooter (it's number value or 1 if it's an S shooter) 
//   - Shots are fired first by numbered shooters, then by S shooters
//   - Numbered shooter shots should be fired one at a time, so if a zombie is killed by the first shot, the next shot(s) hit any zombies behind the killed zombie.
//   - Shots keep traveling in a line (or diagonal) until they hit a zombie or reach the edge of the board
  
//   Definitions:
//     Number shooters:
//       - They shoot first along the row in which they are located and they 
//       - The order of firing shouldn't matter (among numbered shooters)
//       - They shoot N consecutive shots, where n is the number of the shooter
//     S shooters:
//       - They shoot second
//       - The rightmost S shooters shoot first from right to left and then top to bottom ie: S shooter at 0, 3 shoots before S shooter at 2, 3 but S shooter at 2, 4 S shooter before the 0, 3 S shooter
//       - They shoot straight ahead, and along the two right facing diagonals (ie: S shooter at 1, 1 shoots to 0, 2 - 1, 2 and 2, 2 and shots carray on until they reach the edge of the board)

//     Move:
//       1. Zombies move to the left and appear
//         - If a zombies move would take it past index 0, (to -1), the game ends
//         - If so, return move number
//       2. Each numbered Shooter fires n times
//         - Track each shot individually as it moves across the board
//         - Shots travel until they hit a zombie or the board edge
//         - If a zombie is hit, decrement its health
//         - If a zombie's health is 0, remove it immediately before the next shot is fired
//       3. S Shooters fire
//         - Right to left then top to to bottom
//         - Same logic regarding zombie interactions
//       4. Check to see if all zombies are gone
//         - If so, return null

// Questions:
//   - Can more than 1 zombie inhabit the same space?

// Data Structures:
//   - Array of plants and an array of zombies
//   - Zombies: 
//     {
//       startMove: 0,
//       currentSpace: 7
//       row: 4,
//       hp: 5,
//       dead: false,
//     }

//   - Plants:
//     {
//       numberedShooters:
//         position: [x, y],
//         Shots: 3,
//         dead: false,
//       sShooters:
//         position: [x, y],
//         dead: false,
//     }

//   - 2 boards:
//       1. A shooter board
//         - Contains the shooters (positions don't change, they just get removed)
//         - During zombie movement, We check each zombie's new position against the shooter board, if shooter exists there, remove it (gets eaten)
//       2. A zombie board
//         - Generated each turn when we iterate over zombies, increment their positions and place them on the board
//         - Increment each zombie's position and place it on the zombie board
//         - plant shot travel across the zombie board and whenever they hit a zombie, decrement its health / remove it when dead.

//   Plant Board:
//     Note: 'P' represents actual plant objects
//   [P, 0, 0, 0, 0, 0, 0, 0],
//   [0, 0, P, 0, 0, 0, 0, 0],
//   [P, P, 0, 0, P, 0, 0, 0],
//   [P, P, 0, 0, 0, 0, 0, 0],
//   [P, 0, P, 0, 0, 0, 0, 0],

//   Zombie Board: (Turn 3 after zombies move)
//     Note: 'Z' represents an actual zombie object
//   [0, 0, 0, 0, 0, 0, Z, 0],
//   [0, 0, 0, 0, 0, Z, 0, 0],
//   [0, 0, 0, 0, 0, 0, 0, Z],
//   [0, 0, 0, 0, 0, 0, 0, Z],
//   [0, 0, 0, 0, Z, 0, Z, 0],
  
// Algorithm:
//   Keep Track Of:
//     - Current move (starts at 0)
//     - Zombie board
//     - Plant board
//     - Array of plants
//       - Collect from the board (iterate over each string and create a new plant for each S or Number found)
//       - Generate array of S shooters and N shooters
//         - Sorting: Iterate from last index (7) to 0, for each column, check rows from 0 to 4
//         - This should ensure that plants are sorted appropriately (Sshooters fire in the appropriate order).
//       - S shooters should be sorted based on position
//     - Array of zombies
//       - Convert to zombie objects for higher abstraction
//       - Map over zombies argument to create object with desired properties

//   0. Create plant board
//     - All not-dead plants get placed
//     - Iterate over plants and set them on the plant board
//   1. Zombies move to the left / appear
//     - Iterate over zombies, increment position and check against plants / for end of board
//     - If a zombies move would take it past index 0, (to -1), the game ends
//       - If so, return move number
//     - If zombie's new position is on a plant, remove the plant
//   2. Create new zombie board
//     - Iterate over zombies and place each zombie at its coordinates
//   3. Each numbered Shooter fires n times
//     - Track each shot individually as it moves across the board
//     - Shots travel until they hit a zombie or the board edge
//       - From plant coordinate (ie: 2, 2) increment x value (2, 3) up to board width (row.lenght - 1)
//         - if zombie, decrement health / kill it and break
//         - Otherwise, shot keeps moving 
//     - If a zombie is hit, decrement its health
//     - If a zombie's health is 0, remove it immediately before the next shot is fired
//   4. S Shooters fire
//     - Right to left then top to to bottom
//     - Same logic regarding zombie interactions
//   5. Check to see if all zombies are gone
//     - If so, return null

'use strict';

function plantsAndZombies(lawn, zombieSpecs) {
  let currentMove = 0;
  let zombieBoard;
  let plantBoard;
  let plants = collectPlants(lawn);
  let zombies = performNecromancy(zombieSpecs);
  let zombieOverrun = false;

  while (true) {
    plantBoard = generateNewPlantBoard();
    zombiesMove();

    if (zombieOverrun) {
      return currentMove;
    }

    zombieBoard = generateNewZombieBoard();

    plantsFire();

    if (allZombiesDead()) {
      return null;
    }


    currentMove += 1;
  }

  function allZombiesDead() {
    return zombies.every(zombie => zombie.dead);
  }

  function plantsFire() {
    nShootersFire();
    sShootersFire();
  }

  function sShootersFire() {
    plants.sShooters.forEach(plant => {
      if (!plant.dead) {
        upperDiagonalShot(plant);
        lowerDiagonalShot(plant);
        straightShot(plant);
      }
    });


    function upperDiagonalShot(plant) {
      for (let shotRow = plant.row - 1, shotColumn = plant.column + 1;
           shotRow >= 0 && shotColumn < lawn[0].length;
           shotColumn++, shotRow--) {
        if (isZombie(zombieBoard[shotRow][shotColumn])) {
          zombieBoard[shotRow][shotColumn].hp -= 1;
          if (zombieBoard[shotRow][shotColumn].hp === 0) {
            zombieBoard[shotRow][shotColumn].dead = true;
            delete zombieBoard[shotRow][shotColumn];
          }
          return;
        }
      }
    }

    function lowerDiagonalShot(plant) {
      for (let shotRow = plant.row + 1, shotColumn = plant.column + 1;
           shotRow < lawn.length && shotColumn < lawn[0].length;
           shotColumn++, shotRow++) {
        if (isZombie(zombieBoard[shotRow][shotColumn])) {
          zombieBoard[shotRow][shotColumn].hp -= 1;
          if (zombieBoard[shotRow][shotColumn].hp === 0) {
            zombieBoard[shotRow][shotColumn].dead = true;
            delete zombieBoard[shotRow][shotColumn];
          }
          return;
        }
      }
    }
  }

  function straightShot(plant) {
    for (let shotPosition = plant.column + 1; shotPosition < lawn[0].length; shotPosition++) {
      if (isZombie(zombieBoard[plant.row][shotPosition])) {
        zombieBoard[plant.row][shotPosition].hp -= 1;
        if (zombieBoard[plant.row][shotPosition].hp === 0) {
          zombieBoard[plant.row][shotPosition].dead = true;
          delete zombieBoard[plant.row][shotPosition];
        }
        return;
      }
    }
  }

  function nShootersFire() {
    plants.nShooters.forEach(plant => {
      if (!plant.dead) {
        for (let shotNumber = 1; shotNumber <= plant.shots; shotNumber++) {
          straightShot(plant);
        }
      }
    });
  }

  function isZombie(spaceContents) {
    return spaceContents ? spaceContents.hp : spaceContents;
  }

  function generateNewZombieBoard() {
    let newBoard = generateEmptyBoard(lawn.length);

    zombies.forEach(zombie => {
      if (zombie.currentSpace && !zombie.dead) {
        newBoard[zombie.row][zombie.currentSpace] = zombie;
      }
    });

    return newBoard;
  }

  function zombiesMove() {
    zombies.forEach(zombie => {
      if (currentMove < zombie.startMove || zombie.dead) {
        return;
      } else if (currentMove === zombie.startMove) {
        zombie.currentSpace = lawn[0].length - 1;
      } else {
        zombie.currentSpace -= 1;
      }

      if (zombie.currentSpace < 0) {
        zombieOverrun = true;
      }

      if (plantBoard[zombie.row][zombie.currentSpace]) {
        plantBoard[zombie.row][zombie.currentSpace].dead = true;
      }
    }); 
  }

  function generateNewPlantBoard() {
    let newBoard = generateEmptyBoard(lawn.length);

    plants.nShooters.forEach(plant => { 
      if (!plant.dead) {
        newBoard[plant.row][plant.column] = plant;
      }
    });

    plants.sShooters.forEach(plant => { 
      if (!plant.dead) {
        newBoard[plant.row][plant.column] = plant;
      }
    });

    return newBoard;
  }
}


function generateEmptyBoard(size) {
  let newBoard = [];
  for (let i = 0; i < size; i++) {
    newBoard.push([]);
  }

  return newBoard;
}


function performNecromancy(zombieSpecs) {
  return zombieSpecs.map(zombie => {
    return {
      startMove: zombie[0],
      row: zombie[1],
      currentSpace: undefined,
      hp: zombie[2],
      dead: false,
    };
  });
}

function collectPlants(lawn) {
  let plantCollection = { nShooters: [], sShooters: [] };

  for (let column = lawn[0].length - 1; column >= 0; column--) {
    for (let row = 0; row < lawn.length; row++) {
      if (lawn[row][column] === 'S') {
        let newSShooter = {
                            row,
                            column,
                            dead: false,
                          };

        plantCollection.sShooters.push(newSShooter)
      } else if (/[0-9]/.test(lawn[row][column])) {
        let newNShooter = {
                            row,
                            column,
                            shots: Number.parseInt(lawn[row][column]),
                            dead: false,
                          };

        plantCollection.nShooters.push(newNShooter);
      }
    }
  }

  return plantCollection;
}

let sampleGame = [
                    [
                      '2       ',
                      '  S     ',
                      '21  S   ',
                      '13      ',
                      '2 3     '
                    ],
                     [[0,4,28],[1,1,6],[2,0,10],[2,4,15],[3,2,16],[3,3,13]]
                  ]

console.log(plantsAndZombies(...sampleGame));

// const exampleTests = [
//   [
//     [
//       '2       ',
//       '  S     ',
//       '21  S   ',
//       '13      ',
//       '2 3     '],
//     [[0,4,28],[1,1,6],[2,0,10],[2,4,15],[3,2,16],[3,3,13]]],
//   [
//     [
//       '11      ',
//       ' 2S     ',
//       '11S     ',
//       '3       ',
//       '13      '],
//     [[0,3,16],[2,2,15],[2,1,16],[4,4,30],[4,2,12],[5,0,14],[7,3,16],[7,0,13]]],
//   [
//     [
//       '12        ',
//       '3S        ',
//       '2S        ',
//       '1S        ',
//       '2         ',
//       '3         '],
//           [[0,0,18],[2,3,12],[2,5,25],[4,2,21],[6,1,35],[6,4,9],[8,0,22],[8,1,8],[8,2,17],[10,3,18],[11,0,15],[12,4,21]]],
//   [
//     [
//       '12      ',
//       '2S      ',
//       '1S      ',
//       '2S      ',
//       '3       '],
//     [[0,0,15],[1,1,18],[2,2,14],[3,3,15],[4,4,13],[5,0,12],[6,1,19],[7,2,11],[8,3,17],[9,4,18],[10,0,15],[11,4,14]]],
// ]

