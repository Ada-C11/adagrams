letter_quantities = {
  A: 9,
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
  Z: 1,
}
@letter_pool = []
letter_quantities.each do |letter, quantity|
  quantity.times do
    @letter_pool << letter.to_s
  end
end
# p letter_pool
# Wave 1
# def draw_letters
#   letters_in_hand = @letter_pool.sample(10)
#   return letters_in_hand
# end

# p draw_letters

# Wave 2
def uses_available_letters?(input, letters_in_hand)
  input = input.upcase.split("")
  input_copy = []
  input.each do |i|
    input_copy << i.dup
  end

  p input

  # Check if letters in the input are all in the letters_in_hand array
  i = 1
  input.each do |letter|
    puts "Loop count: #{i}"
    if letters_in_hand.include?(letter)
      puts "This letter is: #{letter}"
      puts "Letters in hand before delete are: #{letters_in_hand}"
      letters_in_hand.delete(letter)
      puts "Letters in hand after delete are: #{letters_in_hand}"
      puts "Letters in input_copy before delete are: #{input_copy}"
      input_copy.delete(letter)
      puts "Letters in input_copy after delete are: #{input_copy}"
    end
    i += 1
  end
  if input_copy.length == 0
    return true
  else
    return false
  end
end

letters_in_hand = ["H", "S", "I", "F", "R", "A", "S", "T", "W"]
p uses_available_letters?("starfish", letters_in_hand)
#["H", "S", "I", "F", "R", "A", "S", "T"]
