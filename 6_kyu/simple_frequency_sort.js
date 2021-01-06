// Simple Frequency Sort
// https://www.codewars.com/kata/5a8d2bf60025e9163c0000bc

//Rules:
//  Input: An array of unsorted values (any values are valid)
//  Output: An array of values sorted by frequency of that value
//
//  Steps:
//    1. Find the counts of each unique object in the array
//    2. Place elements with higher counts at the front of the array, lower counts at the end of the array
//    3. Where counts are the same, the smaller of the two elements goes first
//    4. Return this sorted array
//
//Data Structures:
//  - Input array of unsorted elements (all of the same type)
//  - Output "sorted" array
//  - Array of Objects to store the counts of each value in the array
//
//Algorithm:
//  - Intialize a sortedArray to empty array
//  - Initialize a elementCounts array to store the objects
//  - Iterate (for) over elements in the input array
//    - For each element, if an object with that key exists, increment its value
//    - If it doesn't exist, create it and set it to 1;
//  - Sort the elementCounts array based on the count for each element
      // - Convert elementCounts to an array of [key, value]
      //   - Object.keys to get keys, map over that and return the key value pair as a subarray
//    - If the count of the first callback function argument is greater, return -1
//    - If the count of the second is greater return 1
//    - If they're equal:
//      - compare the keys. (will be strings)
//      - If object1's key is greater, return 1
//      - otherwise return -1
//  - map over the sorted objects and return for each object N instances of the key (converted to a number) where N is the value (count)
    // - Flatten the mapped array

function solve(array) {
  let elementsCount = {};

  for (let i = 0; i < array.length; i++) {
    elementsCount[array[i]] ? elementsCount[array[i]] += 1 : elementsCount[array[i]] = 1;
  }

  let elementAndCountArray = Object.keys(elementsCount).map(key => {
    return [Number(key), elementsCount[key]];
  });

  elementAndCountArray.sort((element1, element2) => {
    if (element1[1] > element2[1]) {
      return -1;
    } else if (element2[1] > element1[1]) {
      return 1;
    } else {
      return element1[0] > element2[0] ? 1 : -1;
    }
  });

   let expandedElementAndCountArray = elementAndCountArray.map(elementAndCount => {
    return new Array(elementAndCount[1]).fill(elementAndCount[0]);
  });

  return expandedElementAndCountArray.flat();
}

// Test Cases:
console.log(solve([2,3,5,3,7,9,5,3,7])); // [3,3,3,5,5,7,7,2,9]
console.log(solve(['2','3','5','3','7','9','5','3','7'])); // [3,3,3,5,5,7,7,2,9]

// Edge Cases:
//solve([]); // [];
//solve([1,1,1,1]); // [1,1,1,1];
