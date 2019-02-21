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

# def uses_available_letters?(input, letters_in_hand)
#   input_to_array = input.upcase.split("")
#   puts "Letters in hand1: #{letters_in_hand}"

#   deleted_letters = []

#   input_to_array.each do |letter|
#     if letters_in_hand.include?(letter)
#       deleted_letters << letter
#       p deleted_letters
#       letters_in_hand.delete_at(letters_in_hand.index(letter))
#     else
#       repopulated_letters_in_hand = letters_in_hand + deleted_letters
#       letters_in_hand = repopulated_letters_in_hand
#       puts "Repop: #{repopulated_letters_in_hand}"
#       puts "Letters in hand: #{letters_in_hand}"
#       return false
#     end
#   end
#   return true
# end

def uses_available_letters?(input, letters_in_hand)
  new_array = letters_in_hand.clone
  input_to_array = input.upcase.split("")

  input_to_array.each do |letter|
    if new_array.include?(letter)
      new_array.delete_at(new_array.index(letter))
    else
      return false
    end
  end
  return true
end

# #input_to_array
# puts uses_available_letters?("DOG", ["D", "O", "O", "G"])
# # (letters_in_hand.length - input.length) == leftovers.length
