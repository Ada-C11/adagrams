letters = []

def draw_letters
  alphabet = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "b", "b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "f", "f", "g", "g", "g", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m", "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t", "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "w", "w", "x", "y", "y", "z"]
  #   letters = []
  letters = alphabet.sample(10)

  return letters
end

p draw_letters

# puts "Give me word: "
# word = gets.chomp

# def uses_available_letters?(input, letters_in_hand)
#   input_array = input.split(//)
#   if letters_in_hand.include? input_array
#     return true
#   else
#     return false
#   end
# end

# puts uses_available_letters?(word, letters)
