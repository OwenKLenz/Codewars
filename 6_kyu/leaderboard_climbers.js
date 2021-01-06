// Leaderboard Climbers

// https://www.codewars.com/kata/5f6d120d40b1c900327b7e22
/*
In this kata you will be given a leaderboard of unique names for example:

['John',
 'Brian',
 'Jim',
 'Dave',
 'Fred']
Then you will be given a list of strings for example:

['Dave +1', 'Fred +4', 'Brian -1']
Then you sort the leaderboard.

  The steps for our example would be:

# Dave up 1
['John',
 'Brian',
 'Dave',
 'Jim',
 'Fred']
# Fred up 4
['Fred',
 'John',
 'Brian',
 'Dave',
 'Jim']
# Brian down 1
['Fred',
 'John',
 'Dave',
 'Brian',
 'Jim']
Then once you have done this you need to return the leaderboard.

  All inputs will be valid. All strings in the second list will never ask to move a name up higher or lower than possible eg. 'John +3' could not be added to the end of the second input list in the example above.

  The strings in the second list will always be something in the leaderboard followed by a space and a + or - sign followed by a number.

Rules:
  Inputs: An array of unique names (strings), and an array of changes
  Output: An array of names, reordered according to the changes.

  Definitions: 
    - Change: A string consisting of a name followed by a space and a + or - sign attached to a number
      - The name should be moved up or down the leaderboard (specified by "+" or "-") by the included number.
    - Leaderboard: An array of names with the top of the list (lower indices) being the highest ranked players
  
  Considerations:
    - The inputs will all be valid
    - We will never be asked to move a name higher than the top of the list.
    - the names in the second list will always be valid names from the first list
    - An increase in position (+N) should be subtracted from the current index of the name

  Questions:
    - Empty leaderboard?
    - Empty moves list? (return the leaderboard in its starting state)
  
  Steps:
    - Look at each change
    - move the specified name up or down the leaderboard the specified amount
    - Repeat with the other changes
    - Return the leaderboard in its finished state

Data Structures:
  - Input arrays of the leaderboard and the changes
  - Output array of the mutated leaderboard
  - Strings representing names and changes which can be parsed with regex

Algorithm:
  - Iterate over each change
    - For each change, capture the direction, the name and the amount (regex capture groups and match?) (subprocess)
    - find the index of the name (nameStartIndex)
    - Splice the name out of the array based on its index
    - subtract the amount from the current name index (where it was splice from)
      - If direction is +, amount = amount. If direction is -, the amount = -amount
    - splice the name back in at that new location
*/

function leaderboardSort(leaderboard, changes) {
  changes.forEach(change => {
    let [name, amount] = parseChange(change);
    let nameIndex = leaderboard.indexOf(name);

    let splicedName = leaderboard.splice(nameIndex, 1)[0];
    let insertionPoint = nameIndex - amount;
    leaderboard.splice(insertionPoint, 0, splicedName); 
  });

  return leaderboard;
}

function parseChange(change) {
  let [name, direction, amount] = change.match(/^[a-z]+\b|\+|-|\d+/ig);
  amount = direction === '+' ? parseInt(amount, 10) : -parseInt(amount, 10);
  return [name, amount];
}

parseChange('fred +123');
parseChange('MoM -9');

// Test Cases:
console.log(leaderboardSort(['dave', 'paul', 'fred', 'steve', 'al'], ['fred +2', 'dave -1'])); // ['fred', 'paul', 'dave', 'steve', 'al']


// multi digit shift
console.log(leaderboardSort(['dave', 'paul', 'fred', 'steve', 'al', 'joe', 'dan', 'greg', 'gregg', 'gregggg', 'ron'], ['ron +10'])); //['ron', 'dave', 'paul', 'fred', 'steve', 'al', 'joe', 'dan', 'greg', 'gregg', 'gregggg']
console.log(leaderboardSort(['dave', 'paul', 'fred', 'steve', 'al'], [])); // ['dave', 'paul', 'fred', 'steve', 'al']
console.log(leaderboardSort([], [])); // [];
