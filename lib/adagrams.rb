def draw_letters
  def create_letter_array(letter, amount)
    letter_array = []
    amount.times do
      letter_array << letter
    end
    return letter_array
  end

  letter_bag = create_letter_array("A", 9) + create_letter_array("B", 2) + create_letter_array("C", 2) + create_letter_array("D", 4) + create_letter_array("E", 12) + create_letter_array("F", 2) + create_letter_array("G", 3) + create_letter_array("H", 2) + create_letter_array("I", 9) + create_letter_array("J", 1) + create_letter_array("K", 1) + create_letter_array("L", 4) + create_letter_array("M", 2) + create_letter_array("N", 6) + create_letter_array("O", 8) + create_letter_array("P", 2) + create_letter_array("Q", 1) + create_letter_array("R", 6) + create_letter_array("S", 4) + create_letter_array("T", 6) + create_letter_array("U", 4) + create_letter_array("V", 2) + create_letter_array("W", 2) + create_letter_array("X", 1) + create_letter_array("Y", 2) + create_letter_array("Z", 1)
  return letter_bag.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  input_to_array = input.split("")
  p input_to_array
  p letters_in_hand
  leftovers = letters_in_hand - input_to_array
  p leftovers
  input_to_array.each do |letter|
    # IT'S NOT WORKING BECAUSE LETTER ISN'T AN ARRAY?????
    if letters_in_hand.include?(letter)
      letters_in_hand = letters_in_hand - letter
    else
      return false
    end
    return true
  end
end

puts uses_available_letters?("dog", ["d", "o", "o", "g"])
# (letters_in_hand.length - input.length) == leftovers.length
