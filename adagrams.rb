# letter_pool = [
#   {A: 9},
#   {B: 2},
#   {C: 2},
#   {D: 4},
#   {E: 12},
#   {F: 2},
#   {G: 3},
#   {H: 2},
#   {I: 9},
#   {J: 1},
#   {K: 1},
#   {L: 4},
#   {M: 2},
#   {N: 6},
#   {O: 8},
#   {P: 2},
#   {Q: 1},
#   {R: 6},
#   {S: 4},
#   {T: 6},
#   {U: 4},
#   {V: 2},
#   {W: 2},
#   {X: 1},
#   {Y: 2},
#   {Z: 1},
# ]
letter_pool =
  {A: 9,
   B: 2,
   C: 2,
   D: 4,
   E: 12,
   F: 2,
   G: 3,
   H: 2,
   I: 9,
   J: 1,
   K: 1,
   L: 4,
   M: 2,
   N: 6,
   O: 8,
   P: 2,
   Q: 1,
   R: 6,
   S: 4,
   T: 6,
   U: 4,
   V: 2,
   W: 2,
   X: 1,
   Y: 2,
   Z: 1}

def draw_letters(letter_pool)
  letters_hash = {}
  letters_array = []
  i = 0
  until i == 10
    # char = letter_pool.sample.keys[0]
    char = letter_pool.to_a.sample[0]

    # letters_hash.has_key?(char) ? letters_hash.merge!({char => letters_hash[char] + 1}) : letters_hash.merge!({char => 1})
    if letters_hash.has_key?(char)
      if letters_hash[char] < letter_pool[char].to_i
        letters_hash.merge!({char => letters_hash[char] + 1})
        letters_array << char.to_s
        i += 1
      end
    else
      letters_hash.merge!({char => 1})
      letters_array << char.to_s
      i += 1
    end
  end
  return letters_array
end

def uses_available_letters?(input, letters_in_hand)
  puts input.split("")
  return letters_in_hand.include?(input.split("")[0])
end

hand = draw_letters(letter_pool)

print hand
print "Enter an anagram: "
anagram = gets.chomp.upcase

puts "#{uses_available_letters?(anagram, hand)}"
