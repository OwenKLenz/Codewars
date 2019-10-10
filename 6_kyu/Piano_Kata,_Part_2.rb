# ~Piano Kata, Part 2~

# loop over the piano keyboard (with 88 keys) pressing successive keys equal to 
# integer argument key_press_count. Which note do you end on? For example
# if you stopped at 5, your left thumb would be on the fifth key of the piano, 
# which is C#. Or if you stopped at 92, you would have gone all the way from
# keys 1 to 88 and then wrapped around, sothat you would be on the fourth key,
# which is C.

# Your function will receive an integer between 1 and 10000 and return one of
# the strings "A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", or 
# "G#" indicating which note you stopped on.


# Solving by mathing
def which_note1(key_press_count)
  notes = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
   
  if key_press_count % 88 == 0 
    keyboard_position = 88
  else
    keyboard_position = key_press_count % 88
  end
  
  return notes[keyboard_position % 12 - 1]
end


# Super refactored version of first solution
def which_note2(key_press_count)
  return ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"][(key_press_count % 88 == 0 ? 88 : key_press_count % 88) % 12 - 1]
end
 
 
# Solving by looping
def which_note3(key_press_count)
  notes = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
  note = -1
  counter = 0
  
  loop do
    note += 1
    counter += 1
    
    note = 0 if note == 12
    note = 0 if (counter - 1) % 88 == 0
    
    return notes[note] if counter == key_press_count
  end
end
 
 
# Testing return values with user input
puts which_note1(gets.to_i)

puts which_note2(gets.to_i)

puts which_note3(gets.to_i)
