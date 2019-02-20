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

LETTERS = %W(A A A A A A A A A B B C C D D D D E E E E E E E E E E E E F F G G G H H I 
  I I I I I I I I J K L L L L M M N N N N N N O O O O O O O O P P Q R R R R R R S S S S T T T
  T T T U U U U V V W W X Y Y Z)

def draw_letters
  sample = LETTERS.sample(10)
  letters_in_hand = sample.each_with_object(Hash.new(0)){|key,hash| hash[key] += 1}
end

puts draw_letters