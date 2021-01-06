// Simple Square Numbers

// https://www.codewars.com/kata/5edc8c53d7cede0032eb6029

// Rules:
//   Input: A number
//   Output: A square number, which when added to the input number, results in another perfect square

//   Definitions:
//     - Perfect square
//       - A number that is the product of two matching numbers
//       - ie: 4, 9, 25, etc.
//       - Programatically, a number where Math.sqrt(n) === Math.round(Math.sqrt(n))

//   Considerations:
//     - Input number will be greater than 0
//     - Output number should be greater than 0

//   When do we know that testing increasingly large perfect squares won't result in a new perfect square?
//     - Once the products of the current perfect square is greater than input n
//     - Ie: with 4, we test 1: 1 + 4 is 5, not a PS. we test 4: 4 + 4 is 8, not a PS. we test 9: 4 + 9 is 13
//     - If the gap between each perfect square is greater than n, there can't be a perfect square that fits.

// Steps:
//     - Iterate from 1 until current number squared - previous number squared is greater than n
//     - If we find a number that results in a perfect square when n is added to it, return that number
//     - If we don't find one, return -1

// Data Structures:
//   - Numbers

// Algorithm:
//   - Initialize a currentSquareRoute to 1
//   - Initialize a previousSquareRoute to 1
//   - Iterate until currentSquareRoot - previousSquareRoot is greater than the argument number
//     - if currenSquareRoot ** 2 + n is a perfect square (subprocess), 
//       - return currentSquareRoot **2
//       - Let previousSquareRoot = currentSquareRoot
//   - Once the loop terminates, return -1 

// Subprocess: is perfectSquare - Math.sqrt(n) === Math.round(Math.sqrt(n))

function solve(n) {
  let currentSquareRoot = 1;
  let previousSquareRoot = 1;

  while (currentSquareRoot ** 2 - previousSquareRoot ** 2 < n) {
    if (isPerfectSquare(currentSquareRoot ** 2 + n)) {
      return currentSquareRoot ** 2;
    }

    previousSquareRoot = currentSquareRoot;
    currentSquareRoot += 1;
  }

  return -1;
}

function isPerfectSquare(number) {
  return Math.sqrt(number) === Math.round(Math.sqrt(number));
}

console.log(solve(3)); // = 1 // 3 + 1 = 4, a perfect square
console.log(solve(12)); // = 4 // 12 + 4 = 16, a perfect square
console.log(solve(9)); // = 16 
console.log(solve(4)); // = -1
