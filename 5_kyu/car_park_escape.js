// Car Park Escape

// https://www.codewars.com/kata/591eab1d192fe0435e000014

// Rules:
//   Input: An array representing the floors of the carpark
//   Output: an array of directions for the shortest route to exit the car park
// 
//   Definitions:
//     - A floor: A 1d array of 0s, 1s and an optional 2
//       - 1 represents a staircase,
//       - 0 represents an empty parking space
//       - 2 represents your starting space
//     - Directions: A numeric count of the number of spaces moved right "R", left "L" or down "D"
//   
//   Considerations:
//     - Each floor has only 1 staircase
//     - You can start on any level
//     - You won't start on a staircase
//     - The exit is always the farthest right element on the bottom floor
//     - If you descend multi staircases at once, combine those steps into one, ie: descending 1 staircase followed immediately by another results in "D2"
//     - If position is at the bottom right of the garage, return the array
//       - This means descnding a staircase to the bottom right or starting at the bottom right doesn't need another direction
// 
//   Steps:
//     - Find your starting space, indicated by a 2
//     - Move N spaces to the staircase on your current floor
//     - Moving down a staircase moves you down a level
//     - If there is no staircase on a floor, you've reached the bottom floor
//     - Once on the bottom floor, move to the exit, the rightmost space
// 
//   Notes:
//     - Reverse the floors so the indexes count down as you descend floors.
// 
// Data Structures:
//   - A 2d array representing the garage as input
//   - An array of directions as strings for output
// 
// Algorithm:
//   - Initialize a directions array to []
//   - Reverse the input array so that the higher numbered index floors represent higher floors (index 0 is the ground floor);
//   - Iterate over the garage by floor and space until we find the coordinates of our startingPoint (subprocess)
//   - Set starting point to the column index
//   - Remove the top floors of the garage
//     - Capture a slice of the garage from 0 to the current floor
//   - Iterate over the floors from top floor (highest index) to 0
//     - If stairCount is > 0
//       - If currentFloor at currentSpace is a stair, increment stair Count and continue (return from callback)
//       - Otherwise push "D" + stairCount to directions array
//         - Set stairCount to 0
//     - if current floor is 0
//       - If position is at the rightmost point on the floor, return directions array
//       - Otherwise, add the distance from the current position to the end of the floor ("R" + 2) to the array

//     - If it's not 0, find the position of the stair on the current floor (subprocess)
//     - subtract the current position from the stair position
//       - If it's negative we're going left so push a string of "L" + the absolute value of the difference (ie: "L3") to directions array
//       - If it's positive, we're going right so push a string of "R" + difference to directions array
//     - Change your position (subprocess?) to stair position
//       - Set currentPosition to stairPosition 
//       - Set stairCount to 1
//     - Repeat process for new floor

function escape(carpark){
  let directions = [];

  carpark.reverse();

  let [startingFloor, currentSpace] = findStartingLocation(carpark);
  let stairCount = 0;

  carpark.splice(startingFloor + 1);

  for (let floor = carpark.length - 1; floor >= 0; floor--) {
    if (stairCount > 0) {
      if (carpark[floor][currentSpace] === 1) {
        stairCount += 1;
        continue;
      } else {
        directions.push('D' + String(stairCount));
        stairCount = 0;
      }
    }

    if (floor === 0) {
      if (currentSpace === carpark[floor].length - 1) {
        return directions;
      } else {
        directions.push("R" + String(carpark[floor].length - 1 - currentSpace));
        return directions;
      }
    } else {
      let stairPosition = findStairPosition(carpark[floor]);
      let movement = stairPosition - currentSpace;

      if (movement < 0) {
        directions.push('L' + Math.abs(movement));
      } else {
        directions.push('R' + movement);
      }

      currentSpace = stairPosition;
      stairCount += 1;
    }
  }
}

function findStairPosition(floor) {
  return floor.indexOf(1);
}

function findStartingLocation(carpark) {
  for (let floor = 0; floor < carpark.length; floor++) {
    for (let space = 0; space < carpark[floor].length; space++) {
      if (carpark[floor][space] === 2) {
        return [floor, space];
      }
    }
  }
}

// Test Cases:

// carpark = [[1, 0, 0, 0, 2],
//            [0, 0, 0, 0, 0]]
// Working Out
// - You start in the most far right position on level 1
// - You have to move Left 4 places to reach the staircase => "L4"
// - You then go down one flight of stairs => "D1"
// - To escape you have to move Right 4 places => "R4"

// Result
// result = ["L4", "D1", "R4"]

carpark = [[2, 0, 0, 1, 0],
           [0, 0, 0, 1, 0],
           [0, 0, 0, 0, 0]];
console.log(escape(carpark)); // ["R3", "D2", "R1"];
carpark = [[0, 2, 0, 0, 1],
           [0, 0, 0, 0, 1],
           [0, 0, 0, 0, 1],
           [0, 0, 0, 0, 0]];
console.log(escape(carpark)); // ["R3", "D3"];

carpark = [[1, 0, 0, 0, 2],
           [0, 0, 0, 0, 1],
           [1, 0, 0, 0, 0],
           [0, 0, 0, 0, 0]];
console.log(escape(carpark)); // [L4", "D1", "R4", "D1", "L4", "D1", "R4"];
carpark = [[0, 0, 0, 0, 0, 2]];
console.log(escape(carpark)); // [];

// Not starting on the top floor
carpark = [[0, 0, 0],
           [0, 2, 1],
           [0, 0, 0]]
console.log(escape(carpark)); // ["R1", "D1"]
