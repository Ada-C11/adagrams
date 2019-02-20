
def draw_letters
  available_letters = {"a" => 9, "b" => 2, "c" => 2, "d" => 4, "e" => 12, "f" => 2, "g" => 3, "h" => 2,
                       "i" => 9, "j" => 1, "k" => 1, "l" => 4, "m" => 2, "n" => 6, "o" => 8, "p" => 2,
                       "q" => 1, "r" => 6, "s" => 4, "t" => 6, "u" => 4, "v" => 2, "w" => 2, "x" => 1,
                       "y" => 2, "z" => 1}
  drawn_letters = []
  10.times do
    letter = available_letters.keys.sample
    while available_letters[letter] == 0
      letter = available_letters.keys.sample
    end
    drawn_letters.push(letter)
    available_letters[letter] = available_letters[letter] - 1
  end
  return drawn_letters
end

# Method that deletes element in array at its specific index. Prevents deletion of mathcing elements
class Array
  def delete_elements_in_(array)
    array.each do |x|
      if index = index(x)
        delete_at(index)
      end
    end
  end
end

# Checks if user inputs letters from their letter bank
def uses_available_letters?(input, letters_in_hand)
  used_letters = []
  input.each_char do |letter|
    if letters_in_hand.include?(letter) == true
      letters_in_hand.delete_elements_in_([letter])
      used_letters << letter
    else
      letters_in_hand = (letters_in_hand << used_letters).flatten! # Resets letter bank if previous user input included invalid letters
      return false
    end
  end
  return true
end
