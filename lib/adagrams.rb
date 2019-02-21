def draw_letters
  alphabet = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "b", "b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "f", "f", "g", "g", "g", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m", "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t", "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "w", "w", "x", "y", "y", "z"]
  letters = []
  letters = alphabet.sample(10)

  return letters
end

def uses_available_letters?(input, letters_in_hand)
  split_word = input.split(//)
  split_word_length = split_word.length
  letters_in_hand_length = letters_in_hand.length

  split_word.each do |l|
    index = letters_in_hand.index(l)
    if letters_in_hand.index(l) != nil
      letters_in_hand.delete_at(index)
      # return true
    else
      return false
    end
  end
  return true
end
