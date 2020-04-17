# Story
# Carol's boss Bob thinks he is very smart. He says he made an app which renders
# messages unreadable without changing any letters, only by adding some new
# ones, while preserving message integrity (i. e. the original message can
# still be retrieved).

# He gave some limited access to his app to Carol to challenge her, and hinted
# that if Carol cannot crack this simple task, she might be fired.

# Carol was trying to crack this code herself, but got too tired, so she came
# to you for help. However, she succeeded to hack Bob's app and found a data
# field called 'marker'. She thinks it can be helpful for cracking Bob's app.

# Help Carol keep her job!

# Arguments:
  # encoded - the encoded string which we are trying to revert to its original form.
  # marker - a short string used in the encoding process somehow.
# Expected value:
  # Your function must decode and return the original string.


# Input: Coded string and a marker character
# Output: Decoded string

# Considerations:
#   What happens if the marker exists in the original string?
#   Is the marker always a '-' or can it change?

# Data Structure:
#   A string

# Algorithm:
  # It looks like the marker indicates the location afer which the rest of the string
  # is reversed

#   Split coded string on marker
#   reverse the 2nd half and rejoin

# indexwise:
# split into odds and evens
# evens get joined in order at beginning
# odds array gets reversed, strings get reversed then joined
# then push odds to evens

def decoder(encoded, marker)
  sections = encoded.split(marker)

  result = sections.each_with_object({even: [], odd: []}).with_index do |(chunk, hash), index|
    index.even? ? hash[:even] << chunk : hash[:odd].unshift(chunk.reverse)
  end
  result.values.join
end

p decoder("Lor-.tile gnicsipida rutetcesnoc ,tema tis rolod muspi me", '-')


# Test Cases:
decoder("Lor-.tile gnicsipida rutetcesnoc ,tema tis rolod muspi me", '-') ==
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit."

decoder("Dq.silucaiqonec mollq odommoc qis ipsum qlsin lev", 'q') ==
  "Donec mollis ipsum vel nisl commodo iaculis."

decoder("Proinq.tile sitrobol rotittrop ,non muspi siu dnefiele ,sutcel neipas ", 'q') == 
  "Proin sapien lectus, eleifend uis ipsum non, porttitor lobortis elit."

decoder("Aenean lobortis poym.eauqilaymrtym rymtymoymit", "ym") ==
  "Aenean lobortis porttitor aliquae."

decoder("Donr.silucai odorec mormmocrllis ir lsin lrpsum ve", "r") ==
  "Donec mollis ipsum vel nisl commodo iaculis."

decoder("Sed eget vestibuluem-.euspi reproceallu non ,rotrot ", "m-") ==
  "Sed eget vestibulue tortor, non ullaecorper ipsue."

decoder("Peaesr,k.taeer,kent oenaee in elit nec plac", "r,k") == 
  "Peaesent oenaee in elit nec placeeat."

decoder("Praesent ultrice@.t@s mauri@idnal@s e@b@g@ taig@e@uef sucal t", "@") == 
  "Praesent ultrices mauris eget lacus feugiat blandit."
