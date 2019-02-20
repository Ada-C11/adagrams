def draw_letters
  letter_pool = { A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W:2, X: 1, Y: 2, Z: 1 }
  letter_array = []
  letter_pool.each do |letter, quantity|
    quantity.times do
      letter_array << letter
    end
  end
  return letter_array.sample(10)
end

def uses_available_letters? (input, letters_in_hand)
  input.split(//).each do |i|
    if letters_in_hand.include?(i)
      return true
    else 
      return false
    end
  end
end

uses_available_letters?('word', draw_letters)