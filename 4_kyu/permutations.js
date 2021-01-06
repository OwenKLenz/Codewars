// In this kata you have to create all permutations of an input string and remove duplicates, if present. This means, you have to shuffle all letters from the input in all possible orders.

// Input: String
// Output: An array (contain all possible unique combinations of the letters in the string)
// 
// Rules:
//   - Permutation:
//     - string containing all of the characters in the argument sring in a particular order
//   - Find all permutations (must be unique)
//     - 'abab', 'baba' (first b at beginning) and 'baba' (2nd b at beginning) those are the same permutation
//   - Find all possible combinations of characters
//   - Remove duplicates
// 
// Data Structures:
//   - Array of permutations
//   - Strings (the permutations)
// 
// Algorithm:
//  - Create a permutation array
//  - Generate our permutations
//  - Remove duplicates
//  - Return the array
    

function permutations(string, startOfString='', permutationArray=[]) {
  if (string.length === 1) {
    let newPermutation = string + startOfString;
    if (!permutationArray.includes(newPermutation)) {
      permutationArray.push(newPermutation);
    }
  }
  
  for (let i = 0; i < string.length; i++) {
      let stringArray = [...string];
      let startChar = stringArray.splice(i, 1);
      permutations(stringArray.join(''), startOfString + startChar, permutationArray);
    } 
  
  
  return permutationArray;
}
  
  
// c   b c   a b   a
//  b c   a c   a b 
//   a     b    c
  
  // Permutations of 'abcd' characters is a combination of the permutations of each character + permtuations of that string wihotut that characters 

    

// Examples:

// permutations(''); // []
// permutations('a'); // ['a']
console.log(permutations('ab')); // ['ab', 'ba']
console.log(permutations('abc')); // [abc, acb, bac, bca, bab, cba]
console.log(console.log(permutations('abcd'))); // 12 permutations
console.log(permutations('aabb')); // ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']
console.log(permutations('aabb')); // ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']
console.log(permutations('abcde')); // ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']
// The order of the permutations doesn't matter.
