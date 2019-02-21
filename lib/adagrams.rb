require "pry"

def draw_letters
  letter_pool = { A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 }
  letter_array = []
  letter_pool.each do |letter, quantity|
    quantity.times do
      letter_array << letter.to_s.downcase
    end
  end
  return letter_array.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  size = 0

  input.downcase.split(//).each_with_index do |letter, index|
    if letters_in_hand.include?(letter)
      size += 1
      letters_in_hand.delete(index)
    end
  end

  if size == input.length
    return true
  else
    return false
  end
end

def score_word(word)
  # score_chart = {
  #   ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
  #   ["D", "G"] => 2,
  #   ["B", "C", "M", "P"] => 3,
  #   ["F", "H", "V", "W", "Y"] => 4,
  #   ["K"] 5,
  #   ["J", "X"]: 8,
  #   ["Q", "Z"]: 10
  # }
  points = 0
  word.upcase.split(//).each do |letter|
    case letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      points += 1
    when "D", "G"
      points += 2
    when "B", "C", "M", "P"
      points += 3
    when "F", "H", "V", "W", "Y"
      points += 4
    when "K"
      points += 5
    when "J", "X"
      points += 8
    when "Q", "Z"
      points += 10
    end
  end

  # word.each do |letter|
  #   score_chart.map do |k, v|
  #     if k.include?(letter)
  #       return v
  #     end
  #   end
  # end
  # return points as an array of values
  return points
end

puts score_word("word")
