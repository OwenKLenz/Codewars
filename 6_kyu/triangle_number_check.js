// Triangle Number Check
// https://www.codewars.com/kata/557e8a141ca1f4caa70000a6

// Rules:
//   Input: an Integer (A potential triangle number)
//   Output: true or false depending on whether or not the input number is a valid triangle number
// 
//   
//   Definitions:
//     - A triangle number is a number, n, which, if you had n items, you could arrange them in an equilateral triangle
//       - ie: 3 items (triangle number 3)
//         1
//        2 3
//     
//   Considerations:
//     - 0 and 1 are triangle numbers
//     - If an input is not an integer (floats, arrays, objects, strings, etc.) it isn't a valid triangle number
// 
//   Steps:
//     - Make sure input is a valid integer (a non-float number input)
//     - If it isn't we can return right away
//     - Determine if input number is a triangle number
//     - Return false if it is, true if it isn't
// 
// Data Structure:
//   - Input number
//   - Output boolean
//   - Numbers for tracking our place in a triangle
// 
// Algorithm:
//   - Check if input isInteger
//     - If it's not, return false
//   - return true if number is 0 or 1
// 
//   - Initialize a rightEdgeValueTracker to 0
//   - Initialize a counter to 1
//   - Loop while rightEdgeValueTracker < potentialTriangleNumber
//     - add counter to rightEdgeValueTracker
//     - Increment counter
//   - After loop ends, if rightEdgeValueTracker is greater than potentialTriangleNumber, return false, otherwise they're equal and we return true

function isTriangleNumber(potentialTriangleNumber) {
  if (!Number.isInteger(potentialTriangleNumber)) {
    return false;
  }

  let rightEdgeValueTracker = 0;

  for (let counter = 1; rightEdgeValueTracker < potentialTriangleNumber; counter++) {
    rightEdgeValueTracker += counter;
  }

  return rightEdgeValueTracker > potentialTriangleNumber ? false : true;
}

// // Test Cases:
isTriangleNumber(100000404505);
// console.log(isTriangleNumber(3)); // true
// console.log(isTriangleNumber(10)); // true
// console.log(isTriangleNumber(8)); // false
// console.log(isTriangleNumber(0)); // true
// console.log(isTriangleNumber(1)); // true
// console.log(isTriangleNumber([])); // false
// console.log(isTriangleNumber('9')); // false
// console.log(isTriangleNumber(1.23)); // false
// console.log(isTriangleNumber(1000000000)); // false

