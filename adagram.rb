# No parameters
# Returns an array of ten strings
# Each string should contain exactly one letter
# These represent the hand of letters that the player has drawn
# The letters should be randomly drawn from a pool of letters
# This letter pool should reflect the distribution of letters as described in the table below
# There are only 2 available C letters, so draw_letters cannot ever return more than 2 Cs
# Since there are 12 Es but only 1 Z, it should be 12 times as likely for the user to draw an E as a Z
# Invoking this method should not change the pool of letters
# Imagine that the user returns their hand to the pool before drawing new letters

require 'set'

LETTERS = Set["A" "A" "A" "A" "A" "A" "A" "A" "A" "B" "B" "C" "C" "D" "D" D D E E E E E E E E E E E E F F G G G H H I 
  I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P Q R R R R R R S S S S T T T
  T T T U U U U V V W W X Y Y Z)

# def draw_letters
#   sample = Set["A", "S", "D", "E"]
#   puts sample
#   # letters_in_hand = sample.each_with_object(Hash.new(0)){|key,hash| hash[key] += 1}
# end

# print draw_letters


# def uses_available_letters? (input, letters_in_hand)
#   draw_letters.subset?(input)
#   # returns true if letters in hand = input
#   # returns false if 1 letter in input is not present in the letters in hand
#   # OR more letters in hand than there is in the input
#   print user_input
# end

# puts uses_available_letters?(Set["A","S","W","E","D","S"], draw_letters)


# # Use sets. Then you can use set.subset?. Example:

require 'set'

a1 = Set['A','B','C']
a2 = Set['A','B','C','S','W','S']

puts a1.subset?(a2)